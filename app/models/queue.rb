module Play
  class Queue

    def self.songs
      Player.app.playlist.map {|song| Song.new(song) }
    end
  end
end
