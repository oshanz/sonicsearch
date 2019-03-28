# frozen_string_literal: true

module Sonicsearch
  class Ingest
    def push(collection_id, bucket_id, object_id, text)
      cmd = "PUSH #{collection_id} #{bucket_id} #{object_id} #{text}"
      connection.connect do |peer|
        peer.write(cmd)
      end
    end

    def pop(collection_id, bucket_id, object_id, text)
      cmd = "POP #{collection_id} #{bucket_id} #{object_id} #{text}"
      connection.connect do |peer|
        peer.write(cmd)
      end
    end

    def count(collection_id, bucket_id, object_id)
      cmd = "COUNT #{collection_id} #{bucket_id} #{object_id} #{text}"
      connection.connect do |peer|
        peer.write(cmd)
      end
    end

    def flushc(collection_id)
      cmd = "FLUSHC #{collection_id}"
      connection.connect do |peer|
        peer.write(cmd)
      end
    end

    def flushb(collection_id, _bucket_id)
      cmd = "FLUSHB #{collection_id}"
      connection.connect do |peer|
        peer.write(cmd)
      end
    end

    def flusho(collection_id, _bucket_id, _object_id)
      cmd = "FLUSHO #{collection_id}"
      connection.connect do |peer|
        peer.write(cmd)
      end
    end

    def connection
      ChannelFactory.new.ingest_channel
    end
  end
end
