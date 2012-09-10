module Play
  class Song
    attr_accessor :id, :pos
    attr_accessor :artist, :album, :name
    # Take MPD song from librmpd and wrap
    # @param [MPD::Song] song
    def initialize(mpd_song)
      @artist = mpd_song['artist']
      @name = mpd_song['title'] || song_name_from_file(mpd_song['file'])
      @album = mpd_song['album']

      @id = mpd_song['id']
      @pos = mpd_song['pos']
    end

    private

    def song_name_from_file(file)
      if file
        file.split("/").last[/(.*)\.\w+/]
        $1
      end
    end
  end
end
