require File.expand_path("../../test_helper", __FILE__)

describe "api/library" do
  before do
    @song = Play::Song.new(
      "artist" => "Justin Bieber",
      "title" => "Believe"
    )
  end

  it "should be able search" do
    Play::Player.stub :search, [@song] do
      keyword = "justin bieber"
      response = json_request :get, "/search", {"q" => keyword}, {"Accepts" => "application/json"}
      response["songs"].first["name"].must_equal @song.name
    end
  end

end
