module.exports = (karma) ->
  "use strict"
  karma.set
    frameworks: ["jasmine", "requirejs"]
    files: [
      pattern: "app/vendors/**/*.js"
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
      "test/tests/spec/test-unit-main.js"
    ]
    basePath: ""
    exclude: []
    reporters: ["progress"]
    port: 8080
    runnerPort: 9100
    colors: true
    logLevel: karma.LOG_INFO
    autoWatch: true
    browsers: ["PhantomJS"]
    captureTimeout: 5000
    singleRun: false
    plugins: [
      "karma-jasmine"
      "karma-requirejs"
      "karma-chrome-launcher"
      "karma-firefox-launcher"
      "karma-phantomjs-launcher"
    ]