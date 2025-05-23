# frozen_string_literal: true

module OpenAI
  module Models
    module Responses
      class ResponseFailedEvent < OpenAI::Internal::Type::BaseModel
        # @!attribute response
        #   The response that failed.
        #
        #   @return [OpenAI::Models::Responses::Response]
        required :response, -> { OpenAI::Responses::Response }

        # @!attribute sequence_number
        #   The sequence number of this event.
        #
        #   @return [Integer]
        required :sequence_number, Integer

        # @!attribute type
        #   The type of the event. Always `response.failed`.
        #
        #   @return [Symbol, :"response.failed"]
        required :type, const: :"response.failed"

        # @!method initialize(response:, sequence_number:, type: :"response.failed")
        #   Some parameter documentations has been truncated, see
        #   {OpenAI::Models::Responses::ResponseFailedEvent} for more details.
        #
        #   An event that is emitted when a response fails.
        #
        #   @param response [OpenAI::Models::Responses::Response] The response that failed.
        #
        #   @param sequence_number [Integer] The sequence number of this event.
        #
        #   @param type [Symbol, :"response.failed"] The type of the event. Always `response.failed`.
      end
    end
  end
end
