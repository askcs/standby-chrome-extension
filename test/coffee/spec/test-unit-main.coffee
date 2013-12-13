tests = Object.keys(window.__karma__.files).filter((file) ->
  /Spec\.js$/.test file
)

requirejs.config
  baseUrl: "http://localhost:9000/scripts"
  paths:
    angular: "../vendors/angular/angular.min"
    jquery: "../vendors/jquery/jquery.min"
    domReady: "../vendors/requirejs-domready/domReady"
    angularMocks: "../vendors/angular-mocks/angular-mocks"
    unitTest: "../../test/spec"
  shim:
    angular:
      exports: "angular"
      deps: ["jquery"]

    angularMocks:
      deps: ["angular"]
  deps: tests
  callback: window.__karma__.start