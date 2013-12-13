"use strict"

define [
  "angular"
  "controllers/controllers"
  "services/services"
  "filters/filters"
  "directives/directives"
  "angular-resource"
  "angular-route"
], (angular) ->
  angular.module "MyApp", [
    "controllers"
    "services"
    "filters"
    "directives"
    "ngResource"
    "ngRoute"
  ]

  # 1. Apart directive for route changers
  # 2. Implement an interceptor
  # 3. Route resolvers
  # 4. Test files to coffeescript
  # 5.
