(function() {
  define(["services/services"], function(services) {
    "use strict";
    return services.factory("User", [
      function() {
        return {
          get: function() {
            return "Test User";
          }
        };
      }
    ]);
  });

}).call(this);

/*
//@ sourceMappingURL=user.js.map
*/