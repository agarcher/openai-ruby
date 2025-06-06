# typed: strong

module OpenAI
  module Models
    module Responses
      class ResponseFileSearchCallCompletedEvent < OpenAI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              OpenAI::Responses::ResponseFileSearchCallCompletedEvent,
              OpenAI::Internal::AnyHash
            )
          end

        # The ID of the output item that the file search call is initiated.
        sig { returns(String) }
        attr_accessor :item_id

        # The index of the output item that the file search call is initiated.
        sig { returns(Integer) }
        attr_accessor :output_index

        # The sequence number of this event.
        sig { returns(Integer) }
        attr_accessor :sequence_number

        # The type of the event. Always `response.file_search_call.completed`.
        sig { returns(Symbol) }
        attr_accessor :type

        # Emitted when a file search call is completed (results found).
        sig do
          params(
            item_id: String,
            output_index: Integer,
            sequence_number: Integer,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the output item that the file search call is initiated.
          item_id:,
          # The index of the output item that the file search call is initiated.
          output_index:,
          # The sequence number of this event.
          sequence_number:,
          # The type of the event. Always `response.file_search_call.completed`.
          type: :"response.file_search_call.completed"
        )
        end

        sig do
          override.returns(
            {
              item_id: String,
              output_index: Integer,
              sequence_number: Integer,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
