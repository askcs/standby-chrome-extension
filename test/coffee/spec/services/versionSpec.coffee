define ["angularMocks", "services/services", "services/version"], ->
  describe "Version Service", ->
    beforeEach module("services")
    it "should return current version", inject((version) ->
      expect(version).toEqual "@@version"
    )