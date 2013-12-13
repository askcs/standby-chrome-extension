(function() {
  if (window.location.port === "8080") {
    document.getElementsByTagName("html")[0].setAttribute("ng-app");
  }

  require.config({
    paths: {
      angular: "../vendors/angular/angular.min",
      jquery: "../vendors/jquery/jquery.min",
      domReady: "../vendors/requirejs-domready/domReady",
      "angular-resource": "../vendors/angular-resource/angular-resource.min",
      "angular-route": "../vendors/angular-route/angular-route.min",
      bootstrap: "../vendors/sass-bootstrap/dist/js/bootstrap.min"
    },
    shim: {
      angular: {
        deps: ["jquery"],
        exports: "angular"
      },
      "angular-resource": {
        deps: ["angular"]
      },
      "angular-route": {
        deps: ["angular"]
      },
      bootstrap: {
        deps: ["jquery"],
        exports: "bootstrap"
      }
    }
  });

  require(["angular", "app", "domReady", "bootstrap", "angular-resource", "angular-route", "config", "app", "routes", "run", "controllers/home", "controllers/partial1", "controllers/partial2", "directives/appVersion", "filters/interpolate", "services/version", "services/user"], function(angular, app, domReady) {
    "use strict";
    return domReady(function() {
      return angular.bootstrap(document, ["MyApp"]);
    });
  });

}).call(this);

/*
//@ sourceMappingURL=main.js.map
*/