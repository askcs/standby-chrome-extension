define ["angularMocks", "directives/directives", "directives/appVersion"], ->
  describe "App Version Directive", ->
    beforeEach module("directives")
    it "should print current version", ->
      ###
      module ($provide) ->
        $provide.value "version", "TEST_VER"

      inject ($compile, $rootScope) ->
        element = $compile("<span app-version></span>")($rootScope)
        expect(element.text()).toEqual "TEST_VER"
      ###