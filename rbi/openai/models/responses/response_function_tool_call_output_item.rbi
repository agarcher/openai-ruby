# typed: strong

module OpenAI
  module Models
    module Responses
      class ResponseFunctionToolCallOutputItem < OpenAI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              OpenAI::Responses::ResponseFunctionToolCallOutputItem,
              OpenAI::Internal::AnyHash
            )
          end

        # The unique ID of the function call tool output.
        sig { returns(String) }
        attr_accessor :id

        # The unique ID of the function tool call generated by the model.
        sig { returns(String) }
        attr_accessor :call_id

        # A JSON string of the output of the function tool call.
        sig { returns(String) }
        attr_accessor :output

        # The type of the function tool call output. Always `function_call_output`.
        sig { returns(Symbol) }
        attr_accessor :type

        # The status of the item. One of `in_progress`, `completed`, or `incomplete`.
        # Populated when items are returned via API.
        sig do
          returns(
            T.nilable(
              OpenAI::Responses::ResponseFunctionToolCallOutputItem::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              OpenAI::Responses::ResponseFunctionToolCallOutputItem::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig do
          params(
            id: String,
            call_id: String,
            output: String,
            status:
              OpenAI::Responses::ResponseFunctionToolCallOutputItem::Status::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique ID of the function call tool output.
          id:,
          # The unique ID of the function tool call generated by the model.
          call_id:,
          # A JSON string of the output of the function tool call.
          output:,
          # The status of the item. One of `in_progress`, `completed`, or `incomplete`.
          # Populated when items are returned via API.
          status: nil,
          # The type of the function tool call output. Always `function_call_output`.
          type: :function_call_output
        )
        end

        sig do
          override.returns(
            {
              id: String,
              call_id: String,
              output: String,
              type: Symbol,
              status:
                OpenAI::Responses::ResponseFunctionToolCallOutputItem::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The status of the item. One of `in_progress`, `completed`, or `incomplete`.
        # Populated when items are returned via API.
        module Status
          extend OpenAI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                OpenAI::Responses::ResponseFunctionToolCallOutputItem::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IN_PROGRESS =
            T.let(
              :in_progress,
              OpenAI::Responses::ResponseFunctionToolCallOutputItem::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              OpenAI::Responses::ResponseFunctionToolCallOutputItem::Status::TaggedSymbol
            )
          INCOMPLETE =
            T.let(
              :incomplete,
              OpenAI::Responses::ResponseFunctionToolCallOutputItem::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                OpenAI::Responses::ResponseFunctionToolCallOutputItem::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
