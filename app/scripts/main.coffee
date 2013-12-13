document.getElementsByTagName("html")[0].setAttribute "ng-app"  if window.location.port is "8080"

require.config
  paths:
    angular: "../vendors/angular/angular.min"
    jquery: "../vendors/jquery/jquery.min"
    domReady: "../vendors/requirejs-domready/domReady"
    "angular-resource": "../vendors/angular-resource/angular-resource.min"
    "angular-route": "../vendors/angular-route/angular-route.min"
    bootstrap: "../vendors/sass-bootstrap/dist/js/bootstrap.min"
  shim:
    angular:
      deps: ["jquery"]
      exports: "angular"
    "angular-resource":
      deps: ["angular"]
    "angular-route":
      deps: ["angular"]
    bootstrap:
      deps: ["jquery"]
      exports: "bootstrap"

require [
  "angular"
  "app"
  "domReady"
  "bootstrap"
  "angular-resource"
  "angular-route"
  "config"
  "app"
  "routes"
  "run"
  "controllers/home"
  "controllers/partial1"
  "controllers/partial2"
  "directives/appVersion"
  "filters/interpolate"
  "services/version"
  "services/user"
], (angular, app, domReady) ->
  "use strict"
  domReady ->
    angular.bootstrap document, ["MyApp"]

