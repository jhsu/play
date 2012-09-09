$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "rubygems"

require "bundler"
Bundler.require

require "mustache/sinatra"

require "logger"

require "json"

require "play"

require "models/player"
require "models/song"
require "decorators/song_decorator"

require "app"
require "views/layout"
