(function() {
  define(["directives/directives"], function(directives) {
    "use strict";
    return directives.directive("appVersion", [
      "version", function(version) {
        return function(scope, elm, attrs) {
          return elm.text(version);
        };
      }
    ]);
  });

}).call(this);

/*
//@ sourceMappingURL=appVersion.js.map
*/