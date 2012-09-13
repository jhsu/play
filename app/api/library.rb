module Play
  class App < Sinatra::Base
    get "/search" do
      songs = Player.search(params[:q])
      {:songs => SongDecorator.decorate(songs)}.to_json
    end
  end
end
