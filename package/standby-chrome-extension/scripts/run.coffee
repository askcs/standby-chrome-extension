define ["app"], (app) ->
  "use strict"

#  document.getElementsByTagName("html")[0].setAttribute "ng-app"

  app.run ["$rootScope", "$location", ($rootScope, $location) ->

    # TODO: Move these functions to a directive
    $rootScope.$on "$routeChangeStart", (event, next, current) ->
      # Remove this lines on production, eye-candy purple background for the home/splash page
      (if ($location.path() is "/home") then $("body").addClass("bs-docs-home") else $("body").removeClass("bs-docs-home"))

    $rootScope.$on "$routeChangeSuccess", (event, current, previous) ->
      console.log "Changing route sucessfully"

    $rootScope.$on "$routeChangeError", (event, current, previous, rejection) ->
      console.error "Error: changing routes!"

  ]
