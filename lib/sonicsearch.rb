# frozen_string_literal: true

require 'sonicsearch/version'
require 'async/io'
module Sonicsearch
  class Error < StandardError; end

  class ChannelFactory
    def search_channel
      connect(mode: 'search')
    end

    def ingest_channel
      connect(mode: 'ingest')
    end

    def control_channel
      connect(mode: 'control')
    end

    def connect(mode: nil)
      client = Async::IO::Endpoint.tcp('localhost', 1491)
      client.connect do |peer|
        result = peer.write("START #{mode} password")
        message = peer.read(512)
        puts "Sent #{data}, got response: #{message}"
      end
    end

    def close
      # tcp_clien.send('QUIT')
    end
  end
end
