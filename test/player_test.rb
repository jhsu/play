require File.expand_path("../test_helper", __FILE__)

describe "Player" do

  it "knows now_playing" do
    Play::Player.must_respond_to :now_playing
  end

end
