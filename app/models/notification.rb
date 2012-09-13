module Play
  class Notification
    def self.push(packet)
      now_playing_updates(packet)
    end

    private

    def self.now_playing_updates(packet)
      Pusher['now_playing_updates'].trigger('update_now_playing', packet.to_json)
    rescue Pusher::ConfigurationError
      false
    end
  end
end
