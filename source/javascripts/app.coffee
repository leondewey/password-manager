#= require_tree ./vendor
#= require_self
#= require ./services.coffee
#= require ./directives.coffee
#= require ./controllers.coffee

window.Passwords = angular.module 'Passwords', []

window.addEventListener "keyup", (e) ->
  window.location.reload() if (e.keyCode == 27)
