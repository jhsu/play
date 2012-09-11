module Play
  class App < Sinatra::Base
    get "/streaming_info" do
      streaming_data = {:stream_url => Play.config.stream_url}
      streaming_data.to_json
    end

    get "/stream_url" do
      {:stream_url => Play.config.stream_url}.to_json
    end
  end
end

