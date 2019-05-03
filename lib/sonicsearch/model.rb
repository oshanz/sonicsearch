# frozen_string_literal: true

module Sonicsearch
  module Model
    def sonicsearch(**options)
      options = Sonicsearch.model_options.merge(options)
    end

    class_eval do
      class << self
        def search_data
          data = to_hash
          data.delete('id')
          data.delete('_id')
          data.delete('_type')
          data.values.join(' ')
        end

        def reindex
          Sonicsearch::Ingest.new.flusho(self.class, 'all', id.to_s)
          Sonicsearch::Ingest.new.push(self.class, 'all', id.to_s, search_data)
        end

        if respond_to?(:after_commit)
          after_commit :reindex, if: -> { Sonicsearch.callbacks?(default: callbacks) }
        elsif respond_to?(:after_save)
          after_save :reindex, if: -> { Sonicsearch.callbacks?(default: callbacks) }
          after_destroy :reindex, if: -> { Sonicsearch.callbacks?(default: callbacks) }
        end
      end
    end
  end
end
