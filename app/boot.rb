$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "rubygems"

require "bundler"
Bundler.require

require "mustache/sinatra"

require "logger"

require "json"

require "play"

require "models/notification"
require "models/player"
require "models/queue"
require "models/song"
require "models/user"

require "decorators/song_decorator"

require "app"
require "views/layout"
