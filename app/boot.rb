$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "rubygems"

require "bundler"
Bundler.require


require "logger"

require "json"

require "models/player"
require "models/song"
require "decorators/song_decorator"

require "app"
