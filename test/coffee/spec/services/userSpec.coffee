define ["angularMocks", "services/services", "services/user"], ->
  describe "User Service", ->
    beforeEach module("services")
    user = undefined
    beforeEach inject((User) ->
      user = User
    )
    it "should have user", ->
      expect(user.get()).toEqual "Test User"

    it "should not equal to user", ->
      expect(user.get() + "-test").not.toEqual "Test User 2"

    it "should be equal to changed user", ->
      expect(user.get() + " -test").toEqual "Test User -test"