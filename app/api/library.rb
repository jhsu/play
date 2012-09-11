module Play
  class App < Sinatra::Base
    get "/search" do
      songs = Player.search(params[:q])
      {:songs => songs.map {|s| SongDecorator.new(s) }}.to_json
    end
  end
end
