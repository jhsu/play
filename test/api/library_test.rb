require File.expand_path("../../test_helper", __FILE__)

describe "api/library" do

  it "should be able to search" do
    keyword = "blah"
    response = json_request :get, '/search', {"q" => keyword}, {"Accepts" => "application/json"}
    response.must_equal []
  end

end
