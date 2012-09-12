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

    post '/pause' do
      params.inspect
    end

    put "/play" do
      Player.play
    end

    put "/pause" do
      Player.pause
    end

    put "/next" do
      SongDecorator.new(Player.play_next).to_json
    end

    put "/previous" do
      SongDecorator.new(Player.play_previous).to_json
    end

  end
end
