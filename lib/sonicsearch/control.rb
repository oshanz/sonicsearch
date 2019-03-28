# frozen_string_literal: true

module Sonicsearch
  class Control
    def connection
      ChannelFactory.new.control_channel
    end

    def trigger(action)
      tcp_client = connection.connect do |peer|
        peer.write("TRIGGER #{action}")
        message = peer.read(512)

        puts "Sent #{data}, got response: #{message}"
      end
    end
  end
end
