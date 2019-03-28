# frozen_string_literal: true

require 'async/io'

module Sonicsearch
  class Search
    def connection
      ChannelFactory.new.search_channel
    end

    def query(collection_id, bucket_id, terms_text, limit, offset)
      cmd = "QUERY #{collection_id} #{bucket_id} #{terms_text}"
      cmd += " LIMIT(#{limit})" unless limit.nil?
      cmd += " OFFSET(#{limit})" unless offset.nil?
      connection.connect do |peer|
        peer.write(cmd)
        message = peer.read(512) # PENDING CjPvE5t9
        puts "Sent #{data}, got response: #{message}"
      end
      search_done = false
      while search_done
        Async do |_task|
          endpoint.connect do |peer|
            message = peer.read(512) # received EVENT QUERY CjPvE5t9
            puts "Sent #{data}, got response: #{message}"
            search_done = true
          end
        end
      end
    end

    def suggest(collection_id, bucket_id, word_text, limit, offset)
      cmd = "SUGGEST #{collection_id} #{bucket_id} #{word_text}"
      cmd += " LIMIT(#{limit})" unless limit.nil?
      cmd += " OFFSET(#{limit})" unless offset.nil?
      connection.connect do |peer|
        peer.write(cmd)
        message = peer.read(512) # PENDING CjPvE5t9
        puts "Sent #{data}, got response: #{message}"
      end
      search_done = false
      while search_done
        Async do |_task|
          endpoint.connect do |peer|
            message = peer.read(512) # received EVENT SUGGEST CjPvE5t9
            puts "Sent #{data}, got response: #{message}"
            search_done = true
          end
        end
      end
    end
  end
end
