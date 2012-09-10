require 'minitest/spec'
require 'minitest/autorun'

begin
  require 'rubygems'
  require 'redgreen'
  require 'leftright'
rescue LoadError
end

require 'rack/test'
class MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    @app ||= Play::App.new
  end
end

ENV['RACK_ENV'] = 'test'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))

require 'boot'
