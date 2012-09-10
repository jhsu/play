require File.expand_path("../../test_helper", __FILE__)


describe "api/system" do

  it "should get something" do
    get '/streaming_info', {"Accepts" => "application/json"}
    assert last_response.ok?
  end

end
