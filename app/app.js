
  this.Passwords = angular.module('Passwords', []);

  window.addEventListener("keyup", function(e) {
    if (e.keyCode === 27) return window.location.reload();
  });
