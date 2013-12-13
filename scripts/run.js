(function() {
  define(["app"], function(app) {
    "use strict";
    return app.run([
      "$rootScope", "$location", function($rootScope, $location) {
        $rootScope.$on("$routeChangeStart", function(event, next, current) {
          if ($location.path() === "/home") {
            return $("body").addClass("bs-docs-home");
          } else {
            return $("body").removeClass("bs-docs-home");
          }
        });
        $rootScope.$on("$routeChangeSuccess", function(event, current, previous) {
          return console.log("Changing route sucessfully");
        });
        return $rootScope.$on("$routeChangeError", function(event, current, previous, rejection) {
          return console.error("Error: changing routes!");
        });
      }
    ]);
  });

}).call(this);

/*
//@ sourceMappingURL=run.js.map
*/