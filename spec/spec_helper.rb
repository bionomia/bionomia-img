require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require_relative '../application.rb'

module RSpecMixin
  include Rack::Test::Methods
  def app() BIONOMIAIMG end
end

RSpec.configure { |c| c.include RSpecMixin }
