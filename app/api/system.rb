module Play
  class App < Sinatra::Base
    get "/streaming_info" do
      streaming_data = {:stream_url => Play.config.stream_url, :pusher_key => Play.config.pusher_key}
      streaming_data.to_json
    end
  end
end

