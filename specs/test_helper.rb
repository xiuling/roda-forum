require 'minitest/autorun'
require 'rack/test'
require_relative '../app'

ENV['RACK_ENV'] = 'test'
include Rack::Test::Methods
def app
  Forum.freeze.app
end
