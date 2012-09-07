class Song
  attr_accessor :id, :pos
  attr_accessor :artist, :album, :name
  # Take MPD song from librmpd and wrap
  # @param [MPD::Song] song
  def initialize(mpd_song)
    @artist = mpd_song.artist
    @name = mpd_song.title
    @album = mpd_song.album

    @id = mpd_song.id
    @pos = mpd_song.pos
  end
end
