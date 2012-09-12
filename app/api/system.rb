module Play
  class App < Sinatra::Base
    get "/streaming_info" do
      streaming_data = {:stream_url => Play.config.stream_url}
      streaming_data.to_json
    end

    get "/stream_url" do
      {:stream_url => Play.config.stream_url}.to_json
    end

    post "/upload" do
      params[:files].each do |file|
        tmpfile = file[:tempfile]
        name    = file[:filename].chomp.delete("\000")
        file_with_name = File.join(Play::Player.music_directory, name)
        FileUtils.mv(tmpfile.path, file_with_name)
        FileUtils.chmod(0644, file_with_name)
        Play::Player.update
      end
      "{}"
    end
  end
end

