(function() {
  define(["controllers/controllers", "services/user"], function(controllers) {
    "use strict";
    return controllers.controller("partial1", [
      "$scope", "User", function($scope, User) {
        return $scope.name = User.get();
      }
    ]);
  });

}).call(this);

/*
//@ sourceMappingURL=partial1.js.map
*/