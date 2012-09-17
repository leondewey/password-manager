
  this.Session = (function() {

    function Session() {}

    Session.prototype.write = function(name, value, days) {
      var date, expires;
      date = void 0;
      expires = void 0;
      if (days) {
        date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toGMTString();
      } else {
        expires = "";
      }
      document.cookie = name + "=" + value + expires + "; path=/";
      return value;
    };

    Session.prototype.read = function(name) {
      var c, ca, i, nameEQ;
      i = void 0;
      c = void 0;
      ca = void 0;
      nameEQ = name + "=";
      ca = document.cookie.split(";");
      i = 0;
      while (i < ca.length) {
        c = ca[i];
        while (c.charAt(0) === " ") {
          c = c.substring(1, c.length);
        }
        if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
        i++;
      }
      return;
    };

    return Session;

  })();
