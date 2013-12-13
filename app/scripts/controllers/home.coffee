define ["controllers/controllers", "config"], (controllers, config) ->
  "use strict"
  controllers.controller "home", ["$scope", ($scope) ->

    # console.log('config ->', config);
    $scope.naming = "Cengiz"
  ]
