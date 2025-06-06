# frozen_string_literal: true

module OpenAI
  module Models
    # @see OpenAI::Resources::VectorStores#create
    class VectorStore < OpenAI::Internal::Type::BaseModel
      # @!attribute id
      #   The identifier, which can be referenced in API endpoints.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The Unix timestamp (in seconds) for when the vector store was created.
      #
      #   @return [Integer]
      required :created_at, Integer

      # @!attribute file_counts
      #
      #   @return [OpenAI::Models::VectorStore::FileCounts]
      required :file_counts, -> { OpenAI::VectorStore::FileCounts }

      # @!attribute last_active_at
      #   The Unix timestamp (in seconds) for when the vector store was last active.
      #
      #   @return [Integer, nil]
      required :last_active_at, Integer, nil?: true

      # @!attribute metadata
      #   Set of 16 key-value pairs that can be attached to an object. This can be useful
      #   for storing additional information about the object in a structured format, and
      #   querying for objects via API or the dashboard.
      #
      #   Keys are strings with a maximum length of 64 characters. Values are strings with
      #   a maximum length of 512 characters.
      #
      #   @return [Hash{Symbol=>String}, nil]
      required :metadata, OpenAI::Internal::Type::HashOf[String], nil?: true

      # @!attribute name
      #   The name of the vector store.
      #
      #   @return [String]
      required :name, String

      # @!attribute object
      #   The object type, which is always `vector_store`.
      #
      #   @return [Symbol, :vector_store]
      required :object, const: :vector_store

      # @!attribute status
      #   The status of the vector store, which can be either `expired`, `in_progress`, or
      #   `completed`. A status of `completed` indicates that the vector store is ready
      #   for use.
      #
      #   @return [Symbol, OpenAI::Models::VectorStore::Status]
      required :status, enum: -> { OpenAI::VectorStore::Status }

      # @!attribute usage_bytes
      #   The total number of bytes used by the files in the vector store.
      #
      #   @return [Integer]
      required :usage_bytes, Integer

      # @!attribute expires_after
      #   The expiration policy for a vector store.
      #
      #   @return [OpenAI::Models::VectorStore::ExpiresAfter, nil]
      optional :expires_after, -> { OpenAI::VectorStore::ExpiresAfter }

      # @!attribute expires_at
      #   The Unix timestamp (in seconds) for when the vector store will expire.
      #
      #   @return [Integer, nil]
      optional :expires_at, Integer, nil?: true

      # @!method initialize(id:, created_at:, file_counts:, last_active_at:, metadata:, name:, status:, usage_bytes:, expires_after: nil, expires_at: nil, object: :vector_store)
      #   Some parameter documentations has been truncated, see
      #   {OpenAI::Models::VectorStore} for more details.
      #
      #   A vector store is a collection of processed files can be used by the
      #   `file_search` tool.
      #
      #   @param id [String] The identifier, which can be referenced in API endpoints.
      #
      #   @param created_at [Integer] The Unix timestamp (in seconds) for when the vector store was created.
      #
      #   @param file_counts [OpenAI::Models::VectorStore::FileCounts]
      #
      #   @param last_active_at [Integer, nil] The Unix timestamp (in seconds) for when the vector store was last active.
      #
      #   @param metadata [Hash{Symbol=>String}, nil] Set of 16 key-value pairs that can be attached to an object. This can be
      #
      #   @param name [String] The name of the vector store.
      #
      #   @param status [Symbol, OpenAI::Models::VectorStore::Status] The status of the vector store, which can be either `expired`, `in_progress`, or
      #
      #   @param usage_bytes [Integer] The total number of bytes used by the files in the vector store.
      #
      #   @param expires_after [OpenAI::Models::VectorStore::ExpiresAfter] The expiration policy for a vector store.
      #
      #   @param expires_at [Integer, nil] The Unix timestamp (in seconds) for when the vector store will expire.
      #
      #   @param object [Symbol, :vector_store] The object type, which is always `vector_store`.

      # @see OpenAI::Models::VectorStore#file_counts
      class FileCounts < OpenAI::Internal::Type::BaseModel
        # @!attribute cancelled
        #   The number of files that were cancelled.
        #
        #   @return [Integer]
        required :cancelled, Integer

        # @!attribute completed
        #   The number of files that have been successfully processed.
        #
        #   @return [Integer]
        required :completed, Integer

        # @!attribute failed
        #   The number of files that have failed to process.
        #
        #   @return [Integer]
        required :failed, Integer

        # @!attribute in_progress
        #   The number of files that are currently being processed.
        #
        #   @return [Integer]
        required :in_progress, Integer

        # @!attribute total
        #   The total number of files.
        #
        #   @return [Integer]
        required :total, Integer

        # @!method initialize(cancelled:, completed:, failed:, in_progress:, total:)
        #   @param cancelled [Integer] The number of files that were cancelled.
        #
        #   @param completed [Integer] The number of files that have been successfully processed.
        #
        #   @param failed [Integer] The number of files that have failed to process.
        #
        #   @param in_progress [Integer] The number of files that are currently being processed.
        #
        #   @param total [Integer] The total number of files.
      end

      # The status of the vector store, which can be either `expired`, `in_progress`, or
      # `completed`. A status of `completed` indicates that the vector store is ready
      # for use.
      #
      # @see OpenAI::Models::VectorStore#status
      module Status
        extend OpenAI::Internal::Type::Enum

        EXPIRED = :expired
        IN_PROGRESS = :in_progress
        COMPLETED = :completed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see OpenAI::Models::VectorStore#expires_after
      class ExpiresAfter < OpenAI::Internal::Type::BaseModel
        # @!attribute anchor
        #   Anchor timestamp after which the expiration policy applies. Supported anchors:
        #   `last_active_at`.
        #
        #   @return [Symbol, :last_active_at]
        required :anchor, const: :last_active_at

        # @!attribute days
        #   The number of days after the anchor time that the vector store will expire.
        #
        #   @return [Integer]
        required :days, Integer

        # @!method initialize(days:, anchor: :last_active_at)
        #   Some parameter documentations has been truncated, see
        #   {OpenAI::Models::VectorStore::ExpiresAfter} for more details.
        #
        #   The expiration policy for a vector store.
        #
        #   @param days [Integer] The number of days after the anchor time that the vector store will expire.
        #
        #   @param anchor [Symbol, :last_active_at] Anchor timestamp after which the expiration policy applies. Supported anchors: `
      end
    end
  end
end
