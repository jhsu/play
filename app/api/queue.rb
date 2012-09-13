module Play
  class App < Sinatra::Base
    get "/queue" do
      songs = SongDecorator.decorate(Queue.songs)
      {:songs => songs}.to_json
    end

    post "/queue" do
      if params[:path] && song = Song.new("file" => params[:path])
        if Queue.add_song(song)
          packet = {
            :now_playing => SongDecorator.new(Player.now_playing),
            :songs => SongDecorator.decorate(Queue.songs)}
          Notification.push(packet)

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
          packet = {
            :now_playing => SongDecorator.new(Player.now_playing),
            :songs => SongDecorator.decorate(Queue.songs)}
          Notification.push(packet)

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
