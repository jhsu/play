module Play
  class Queue

    def self.playlist
      Player.app.playlists[name].get
    end

    def self.songs
      Player.app.playlist.map {|song| Song.new(song) }
    end
  end
end
