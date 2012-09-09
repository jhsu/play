module Play
  class App < Sinatra::Base
    get "/queue" do
      songs = Queue.songs.map {|s| SongDecorator.new(s) }
      {:songs => songs}.to_json
    end
  end
end
