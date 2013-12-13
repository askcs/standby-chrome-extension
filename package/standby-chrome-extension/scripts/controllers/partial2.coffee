define ["controllers/controllers"], (controllers) ->
  "use strict"
  controllers.controller "partial2", ["$scope", ($scope) ->
    $scope.contact =
      name: null
      email: null
      message: null
      confirmed: false

    $scope.send = ->
      $scope.sending = $scope.contact
  ]
