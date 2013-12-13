define ["services/services"], (services) ->
  "use strict"
  services.factory "User", [->
    get: ->
      "Test User"
  ]