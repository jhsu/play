require File.expand_path("../test_helper", __FILE__)

describe "Player" do
  before do
    @song = Play::Song.new(
      "id" => "0",
      "pos" => "0",
      "artist" => "something",
      "title" => "title of song"
    )
  end

  it "knows now_playing" do
    Play::Player.stub :now_playing, @song do
      current_song = Play::Player.now_playing
      assert current_song.queued?
      current_song.artist.must_equal @song.artist
    end
  end

end
