# frozen_string_literal: true

module OpenAI
  module Models
    # The chunking strategy used to chunk the file(s). If not set, will use the `auto`
    # strategy. Only applicable if `file_ids` is non-empty.
    module FileChunkingStrategyParam
      extend OpenAI::Internal::Type::Union

      discriminator :type

      # The default strategy. This strategy currently uses a `max_chunk_size_tokens` of `800` and `chunk_overlap_tokens` of `400`.
      variant :auto, -> { OpenAI::AutoFileChunkingStrategyParam }

      # Customize your own chunking strategy by setting chunk size and chunk overlap.
      variant :static, -> { OpenAI::StaticFileChunkingStrategyObjectParam }

      # @!method self.variants
      #   @return [Array(OpenAI::Models::AutoFileChunkingStrategyParam, OpenAI::Models::StaticFileChunkingStrategyObjectParam)]
    end
  end
end
