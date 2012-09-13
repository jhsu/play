module Play
  class App < Sinatra::Base

    get "/now_playing" do
      if Player.playing?
        song = SongDecorator.new(Player.now_playing)
        song.to_json
      else
        nil
      end
    end

    put "/play" do
      # pusher
      Player.play
    end

    put "/pause" do
      # pusher
      Player.pause
    end

    put "/next" do
      # pusher
      SongDecorator.new(Player.play_next).to_json
    end

    put "/previous" do
      # pusher
      SongDecorator.new(Player.play_previous).to_json
    end

  end
end
