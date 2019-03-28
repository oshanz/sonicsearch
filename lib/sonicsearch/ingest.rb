module Sonicsearch
  class Ingest
    def push(collection_id, bucket_id, object_id, text); end

    def pop(collection_id, bucket_id, object_id, text); end

    def count(collection_id, bucket_id, object_id); end

    def flushc(collection_id); end

    def flushb(collection_id, bucket_id); end

    def flusho(collection_id, bucket_id, object_id); end

    def close; end
  end
end
