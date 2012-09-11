require File.expand_path("../test_helper", __FILE__)

describe "Queue" do
  it "should be able to return a list of songs" do
    Play::Queue.must_respond_to :songs
  end

  it "should be able to add a song" do
    Play::Queue.must_respond_to :add_song
  end

  it "should be able to remove a song" do
    Play::Queue.must_respond_to :remove_song
  end
end
