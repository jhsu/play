module Play
  class Queue

    # List the songs in the playlist.
    #
    # @return [Array] list of songs
    def self.songs
      Player.app.playlist.map {|song| Song.new(song) }
    end

    # Add a song to the playlist.
    #
    # @param [Song] song instance
    # @return [true, false] Boolean whether song was added
    def self.add_song(song)
      Player.app.add(song.path)
      true
    rescue RuntimeError
      false
    end

    # Remove a song to the playlist.
    #
    # @param [Song] song instance
    # @return [true, false] Boolean whether song was removed
    def self.remove_song(song)
      Player.app.delete(song.pos)
      true
    rescue RuntimeError
      false
    end

  end
end
