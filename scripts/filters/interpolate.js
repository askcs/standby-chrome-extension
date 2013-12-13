(function() {
  define(["filters/filters", "config"], function(filters, config) {
    "use strict";
    return filters.filter("interpolate", [
      function() {
        return function(text) {
          text = String(text).replace(/\%RELEASED\%/g, config.app.released);
          return String(text).replace(/\%VERSION\%/g, config.app.version);
        };
      }
    ]);
  });

}).call(this);

/*
//@ sourceMappingURL=interpolate.js.map
*/