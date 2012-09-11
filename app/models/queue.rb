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
    # @param [Song#path] song instance
    # @return [true, false] Boolean whether song was added
    def self.add_song(song)
      add_song_by_path(song.path)
    end

    # Add song basd on file path. Ensure that it is a file and not a directory.
    #
    # @param [String] path to the song
    # @return [true, false] Boolean whether song was added
    def self.add_song_by_path(path)
      if path =~ /\.\w{2,3}/
        !!Player.app.add(path)
      else
        false
      end
    rescue RuntimeError
      false
    end

    # Remove a song from the playlist.
    #
    # @param [Song#id] song instance
    # @return [true, false] Boolean whether song was removed
    def self.remove_song(song)
      Player.app.deleteid(song.id)
      true
    rescue RuntimeError
      false
    end

    # Remove a song from the playlist by position.
    #
    # @param [Object#to_s] song instance
    # @return [true, false] Boolean whether song was removed
    def self.remove_song_by_pos(pos)
      Player.app.delete(pos.to_s)
      true
    rescue RuntimeError
      false
    end

  end
end
