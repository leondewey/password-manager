
  Passwords.directive('clippy', function($timeout, dateFilter) {
    return function(scope, element, attrs) {
      var password, update;
      password = '';
      update = function() {
        return element.html("<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\"\n          width=\"110\"\n          height=\"14\"\n          id=\"clippy\" >\n  <param name=\"movie\" value=\"/flash/clippy.swf\"/>\n  <param name=\"allowScriptAccess\" value=\"always\" />\n  <param name=\"quality\" value=\"high\" />\n  <param name=\"scale\" value=\"noscale\" />\n  <param NAME=\"FlashVars\" value=\"text=" + password + "\">\n  <param name=\"bgcolor\" value=\"transparent\">\n  <embed src=\"/vendor/clippy.swf\"\n         width=\"110\"\n         height=\"14\"\n         name=\"clippy\"\n         quality=\"high\"\n         allowScriptAccess=\"always\"\n         type=\"application/x-shockwave-flash\"\n         pluginspage=\"http://www.macromedia.com/go/getflashplayer\"\n         FlashVars=\"text=" + password + "\"\n         bgcolor=\"transparent\"\n         wmode=\"transparent\"\n  />\n</object>");
      };
      return attrs.$observe('clippy', function(value) {
        password = value;
        return update();
      });
    };
  });
