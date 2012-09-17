Passwords.directive('clippy', ($timeout, dateFilter) ->
  (scope, element, attrs) ->
    password = ''
    update = ->
      element.html """
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
                  width="110"
                  height="14"
                  id="clippy" >
          <param name="movie" value="/flash/clippy.swf"/>
          <param name="allowScriptAccess" value="always" />
          <param name="quality" value="high" />
          <param name="scale" value="noscale" />
          <param NAME="FlashVars" value="text=#{password}">
          <param name="bgcolor" value="transparent">
          <embed src="/vendor/clippy.swf"
                 width="110"
                 height="14"
                 name="clippy"
                 quality="high"
                 allowScriptAccess="always"
                 type="application/x-shockwave-flash"
                 pluginspage="http://www.macromedia.com/go/getflashplayer"
                 FlashVars="text=#{password}"
                 bgcolor="transparent"
                 wmode="transparent"
          />
        </object>
      """
    attrs.$observe 'clippy', (value) ->
      password = value
      update()
)