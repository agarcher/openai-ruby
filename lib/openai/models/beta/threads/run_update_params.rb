# frozen_string_literal: true

module OpenAI
  module Models
    module Beta
      module Threads
        # @see OpenAI::Resources::Beta::Threads::Runs#update
        class RunUpdateParams < OpenAI::Internal::Type::BaseModel
          extend OpenAI::Internal::Type::RequestParameters::Converter
          include OpenAI::Internal::Type::RequestParameters

          # @!attribute thread_id
          #
          #   @return [String]
          required :thread_id, String

          # @!attribute metadata
          #   Set of 16 key-value pairs that can be attached to an object. This can be useful
          #   for storing additional information about the object in a structured format, and
          #   querying for objects via API or the dashboard.
          #
          #   Keys are strings with a maximum length of 64 characters. Values are strings with
          #   a maximum length of 512 characters.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :metadata, OpenAI::Internal::Type::HashOf[String], nil?: true

          # @!method initialize(thread_id:, metadata: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {OpenAI::Models::Beta::Threads::RunUpdateParams} for more details.
          #
          #   @param thread_id [String]
          #
          #   @param metadata [Hash{Symbol=>String}, nil] Set of 16 key-value pairs that can be attached to an object. This can be
          #
          #   @param request_options [OpenAI::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
