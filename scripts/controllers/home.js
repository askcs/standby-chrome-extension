(function() {
  define(["controllers/controllers", "config"], function(controllers, config) {
    "use strict";
    return controllers.controller("home", [
      "$scope", function($scope) {
        return $scope.naming = "Cengiz";
      }
    ]);
  });

}).call(this);

/*
//@ sourceMappingURL=home.js.map
*/