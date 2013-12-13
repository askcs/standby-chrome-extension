(function() {
  define(["services/services", "config"], function(services, config) {
    "use strict";
    return services.value("version", config.app.version);
  });

}).call(this);

/*
//@ sourceMappingURL=version.js.map
*/