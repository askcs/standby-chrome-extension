define ["angularMocks", "filters/filters", "filters/interpolate"], ->
  describe "Interpolate Filter", ->
    ###
    beforeEach module("filters")
    beforeEach module(($provide) ->
      $provide.value "version", "@@version"
    )
    it "should replace VERSION", inject((interpolateFilter) ->
      expect(interpolateFilter("before %VERSION% after")).toEqual "before @@version after"
    )
    ###