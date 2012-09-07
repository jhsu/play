class Player
  # Connect to mpd server
  def self.app
    # [TODO]: read connection info from config
    @app ||= MPD.new('localhost', 6600)
    @app.connect unless @app.connected?
    @app
  end

  # Currently playing song
  def self.now_playing
    Song.new(app.current_song)
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
end
