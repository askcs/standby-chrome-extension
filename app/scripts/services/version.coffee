define ["services/services", "config"], (services, config) ->
  "use strict"
  services.value "version", config.app.version
