module.exports = (karma) ->
  "use strict"
  karma.set
    frameworks: ["ng-scenario"]
    files: [
      pattern: "app/vendors/**/*.js"
      included: false
    ,
      pattern: ".tmp/**/*.html"
      included: false
    ,
      pattern: ".tmp/scripts/*.js"
      included: false
    ,
      pattern: ".tmp/scripts/**/*.js"
      included: false
    ,
      pattern: "test/tests/spec/controllers/*.js"
      included: false
    ,
      pattern: "test/tests/spec/directives/*.js"
      included: false
    ,
      pattern: "test/tests/spec/filters/*.js"
      included: false
    ,
      pattern: "test/tests/spec/services/*.js"
      included: false
    ,
      "test/tests/e2e/scenarios/*.js"
    ]
    basePath: ""
    exclude: []
    reporters: ["progress"]
    port: 8080
    runnerPort: 9100
    colors: true
    logLevel: karma.LOG_INFO
    autoWatch: true
    browsers: ["Chrome"]
    captureTimeout: 5000
    singleRun: false
    proxies:
      "/": "http://localhost:9000/"
    urlRoot: "/__karma__/"
    plugins: [
      "karma-ng-scenario"
      "karma-chrome-launcher"
      "karma-firefox-launcher"
      "karma-phantomjs-launcher"
    ]
