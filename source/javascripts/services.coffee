@Passwords.factory 'data', ->

  showError = (error) ->
    console.error error if window.console
    switch error.status
      when 401 then alert 401
      when 404 then alert 404
      when 507 then alert 507
      when 503 then alert 503
      when 400, 403, 405 then alert [400, 403, 405]
      else alert 'some kind of error'

  dropbox = new Dropbox.Client
    key: "dYZw3kwz8UA=|8bQeUn//eab5d0wA1ET2X8AstaJFtzqZ8ObXTbNhnw=="
    sandbox: true
  dropbox.authDriver new Dropbox.Drivers.Redirect(rememberUser: true)
  dropbox.authenticate (error, client) ->
    return showError(error) if (error)


  setPassword: (password) ->
    @password = password

  write: (data, callback) ->
    encryptedData = sjcl.encrypt @password, JSON.stringify(data)
    dropbox.writeFile "password.json", encryptedData, (error, stat) ->
      return showError error if error
      callback stat if callback

  read: (callback) ->
    dropbox.readFile "password.json", (error, data) =>
      return showError error if error
      decryptData = sjcl.decrypt @password, JSON.stringify(data)
      callback JSON.parse(decryptData)

  checkIfCreated: ->
    dropbox.readdir "/", (error, entries) =>
      return showError error if error
      unless _.include entries, 'password.json'
        @password = prompt "new password"
        @write [], ->
          alert "New password created."
          window.location.reload()