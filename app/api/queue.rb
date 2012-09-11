module Play
  class App < Sinatra::Base
    get "/queue" do
      songs = Queue.songs.map {|s| SongDecorator.new(s) }
      {:songs => songs}.to_json
    end

    post "/queue" do
      if params[:id] && song = Queue.songs.detect {|s| s.id == params[:id].to_s  }
        Queue.add_song(song)
      end
      "{}"
    end

    delete "/queue" do
      if params[:id] && song = Queue.songs.detect {|s| s.id == params[:id].to_s  }
        Queue.remove_song(song)
      end
      "{}"
    end
  end
end
