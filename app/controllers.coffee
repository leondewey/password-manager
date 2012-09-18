@Passwords = ($scope, data) ->

  $scope.write = (callback) ->
    try
      data.write $scope.data, callback
    catch error
      console.log error

  $scope.read = ->
    try
      data.read (data) ->
        $scope.$apply (s) ->
          s.data = data
          s.encrypted = false
    catch error
      $scope.encrypted = true

  $scope.add = ->
    $scope.data.push
      name: $scope.addName
      password: $scope.addPassword
    $scope.addName = $scope.addPassword = ''
    $scope.write()

  $scope.delete = (toDelete) ->
    if confirm "Are you sure you want to delete this?"
      $scope.data = _.reject $scope.data, (pwd) -> pwd == toDelete
      $scope.write()

  $scope.filterdPasswords = ->
    if $scope.search
      query = new RegExp "^#{$scope.search}", "i"
      _.filter $scope.data, (password) -> password.name.search(query) != -1
    else
      $scope.data

  $scope.setPassword = ->
    data.setPassword $scope.password
    $scope.read()

  $scope.changePassword = ->
    if newPassword = prompt "new password"
      data.setPassword newPassword
      $scope.write -> window.location.reload()

  $scope.logout = ->
    window.location.reload()

  data.checkIfCreated()
  $scope.encrypted = true
  $scope.data = false

  #testing...
  #$scope.password = 'password'
  #$scope.setPassword()
