(function() {
  define(["controllers/controllers"], function(controllers) {
    "use strict";
    return controllers.controller("partial2", [
      "$scope", function($scope) {
        $scope.contact = {
          name: null,
          email: null,
          message: null,
          confirmed: false
        };
        return $scope.send = function() {
          return $scope.sending = $scope.contact;
        };
      }
    ]);
  });

}).call(this);

/*
//@ sourceMappingURL=partial2.js.map
*/