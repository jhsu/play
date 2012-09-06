require 'minitest/spec'
require 'minitest/autorun'

begin
  require 'rubygems'
  require 'redgreen'
  require 'leftright'
rescue LoadError
end

require 'rack/test'

ENV['RACK_ENV'] = 'test'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))

require 'boot'
