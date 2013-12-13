define ["controllers/controllers", "services/user"], (controllers) ->
  "use strict"
  controllers.controller "partial1", ["$scope", "User", ($scope, User) ->
    $scope.name = User.get()
  ]
