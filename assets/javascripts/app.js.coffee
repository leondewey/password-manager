@Passwords = angular.module 'Passwords', []

window.addEventListener "keyup", (e) ->
  window.location.reload() if (e.keyCode == 27)
