require File.expand_path("../../test_helper", __FILE__)

describe "api/queue" do
  it "should be able to add a song" do
    Play::Queue.stub :add_song, true do
      post("/queue", {:path => "Some/path.mp3"})
      assert last_response.ok?
    end
  end

  it "should be able to remove a song" do
    Play::Queue.stub :remove_song, true do
      delete("/queue", {:id => "0"})
      assert last_response.ok?
    end
  end
end
