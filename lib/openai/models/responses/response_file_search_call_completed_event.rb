# frozen_string_literal: true

module OpenAI
  module Models
    module Responses
      class ResponseFileSearchCallCompletedEvent < OpenAI::Internal::Type::BaseModel
        # @!attribute item_id
        #   The ID of the output item that the file search call is initiated.
        #
        #   @return [String]
        required :item_id, String

        # @!attribute output_index
        #   The index of the output item that the file search call is initiated.
        #
        #   @return [Integer]
        required :output_index, Integer

        # @!attribute sequence_number
        #   The sequence number of this event.
        #
        #   @return [Integer]
        required :sequence_number, Integer

        # @!attribute type
        #   The type of the event. Always `response.file_search_call.completed`.
        #
        #   @return [Symbol, :"response.file_search_call.completed"]
        required :type, const: :"response.file_search_call.completed"

        # @!method initialize(item_id:, output_index:, sequence_number:, type: :"response.file_search_call.completed")
        #   Some parameter documentations has been truncated, see
        #   {OpenAI::Models::Responses::ResponseFileSearchCallCompletedEvent} for more
        #   details.
        #
        #   Emitted when a file search call is completed (results found).
        #
        #   @param item_id [String] The ID of the output item that the file search call is initiated.
        #
        #   @param output_index [Integer] The index of the output item that the file search call is initiated.
        #
        #   @param sequence_number [Integer] The sequence number of this event.
        #
        #   @param type [Symbol, :"response.file_search_call.completed"] The type of the event. Always `response.file_search_call.completed`.
      end
    end
  end
end
