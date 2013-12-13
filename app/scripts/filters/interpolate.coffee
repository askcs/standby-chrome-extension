define ["filters/filters", "config"], (filters, config) ->
  "use strict"
  filters.filter "interpolate", [->
    (text) ->
      text = String(text).replace(/\%RELEASED\%/g, config.app.released)
      String(text).replace /\%VERSION\%/g, config.app.version
  ]
