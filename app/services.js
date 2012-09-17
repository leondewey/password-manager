
  this.Passwords.factory('data', function() {
    var dropbox, session, showError;
    session = new Session;
    showError = function(error) {
      if (window.console) console.error(error);
      switch (error.status) {
        case 401:
          return alert(401);
        case 404:
          return alert(404);
        case 507:
          return alert(507);
        case 503:
          return alert(503);
        case 400:
        case 403:
        case 405:
          return alert([400, 403, 405]);
        default:
          return alert('some kind of error');
      }
    };
    dropbox = new Dropbox.Client({
      key: "dYZw3kwz8UA=|8bQeUn//eab5d0wA1ET2X8AstaJFtzqZ8ObXTbNhnw==",
      sandbox: true
    });
    dropbox.authDriver(new Dropbox.Drivers.Redirect({
      rememberUser: true
    }));
    dropbox.authenticate(function(error, client) {
      if (error) return showError(error);
    });
    return {
      setPassword: function(password) {
        return this.password = password;
      },
      write: function(data, callback) {
        var encryptedData;
        encryptedData = sjcl.encrypt(this.password, JSON.stringify(data));
        return dropbox.writeFile("password.json", encryptedData, function(error, stat) {
          if (error) return showError(error);
          if (callback) return callback(stat);
        });
      },
      read: function(callback) {
        var _this = this;
        return dropbox.readFile("password.json", function(error, data) {
          var decryptData;
          if (error) return showError(error);
          decryptData = sjcl.decrypt(_this.password, data);
          return callback(JSON.parse(decryptData));
        });
      }
    };
  });
