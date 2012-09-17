
  this.Passwords = function($scope, data) {
    $scope.write = function(callback) {
      try {
        return data.write($scope.data, callback);
      } catch (error) {
        return console.log(error);
      }
    };
    $scope.read = function() {
      try {
        return data.read(function(data) {
          return $scope.$apply(function(s) {
            s.data = data;
            return s.encrypted = false;
          });
        });
      } catch (error) {
        return $scope.encrypted = true;
      }
    };
    $scope.add = function() {
      $scope.data.push({
        name: $scope.addName,
        password: $scope.addPassword
      });
      $scope.addName = $scope.addPassword = '';
      return $scope.write();
    };
    $scope["delete"] = function(toDelete) {
      if (confirm("Are you sure you want to delete this?")) {
        $scope.data = _.reject($scope.data, function(pwd) {
          return pwd === toDelete;
        });
        return $scope.write();
      }
    };
    $scope.filterdPasswords = function() {
      var query;
      if ($scope.search) {
        query = new RegExp("^" + $scope.search, "i");
        return _.filter($scope.data, function(password) {
          return password.name.search(query) !== -1;
        });
      } else {
        return $scope.data;
      }
    };
    $scope.setPassword = function() {
      data.setPassword($scope.password);
      return $scope.read();
    };
    $scope.changePassword = function() {
      var newPassword;
      if (newPassword = prompt("new password")) {
        data.setPassword(newPassword);
        return $scope.write(function() {
          return window.location.reload();
        });
      }
    };
    $scope.logout = function() {
      return window.location.reload();
    };
    $scope.encrypted = true;
    return $scope.data = false;
  };
