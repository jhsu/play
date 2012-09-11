module Play
  def self.config
    OpenStruct.new \
      :secret        => yaml['gh_secret'],
      :client_id     => yaml['gh_key'],
      :gh_org        => yaml['gh_org'],
      :stream_url    => yaml['stream_url'],
      :auth_token    => yaml['auth_token'],
      :mpd_host      => yaml['mpd_host'],
      :mpd_port      => yaml['mpd_port']
  end

private

  # Load the config YAML.
  #
  # Returns a memoized Hash.
  def self.yaml
    if File.exist?('config/play.yml')
      @yaml ||= YAML.load_file('config/play.yml')
    else
      {}
    end
  end
end
