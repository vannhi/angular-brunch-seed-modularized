'use strict'

expect = chai.expect

# jasmine specs for services go here

describe "service", ->

  beforeEach(module "app.services")

  describe "version", ->
    it "should return current version", inject((version) ->
      expect(version).to.equal "0.1"
    )
