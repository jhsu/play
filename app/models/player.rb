module Play
  class Player
    # Connect to mpd server
    def self.app
      @app ||= MPD.new(Play.config.mpd_host || 'localhost', Play.config.mpd_port || 6600)
      @app.connect unless @app.connected?
      @app
    end

    # Currently playing song
    def self.now_playing
      Play::Song.new(app.current_song)
    # rescue
    #   nil
    end

    # Check if player is playing
    def self.playing?
      app.playing?
    end

    # Skip to next track
    def self.play_next
      app.next
      now_playing
    end

    # Jump to previous track
    def self.play_previous
      app.previous
      now_playing
    end

    # Play playlist
    def self.play
      app.play
    end

    # Stop playback
    def self.stop
      app.stop
    end

    # Pause playback
    def self.pause
      app.pause = true unless paused?
    end

    # Check if paused
    def self.paused?
      app.paused?
    end

    # Search songs by artist name, song name or album name
    #
    # @param [String] keyword to search by
    def self.search(keyword)
      songs = []
      songs += app.songs.map {|s| Song.new(s) }
      songs.select {|song|
        song.name =~ /#{keyword}/i ||
        song.artist =~ /#{keyword}/i ||
        song.album =~ /#{keyword}/i
      }
    end

  end
end
