module Play
  class App < Sinatra::Base
    get "/queue" do
      songs = Queue.songs.map {|s| SongDecorator.new(s) }
      {:songs => songs}.to_json
    end

    post "/queue" do
      if params[:path] && song = Song.new("file" => params[:path])
        if Queue.add_song(song)
          status 200
        else
          status 404
        end
        "{}"
      else
        status 400
        {:error => params.inspect}.to_json
      end
    end

    delete "/queue" do
      if params[:id] && song = Song.new("id" => params[:id])
        if Queue.remove_song(song)
          status 200
        else
          status 404
        end
        "{}"
      else
        status 400
        {:error => params.inspect}.to_json
      end
    end

  end
end
