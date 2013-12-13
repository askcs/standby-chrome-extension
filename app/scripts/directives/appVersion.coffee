define ["directives/directives"], (directives) ->
  "use strict"
  directives.directive "appVersion", ["version", (version) ->
    (scope, elm, attrs) ->
      elm.text version
  ]