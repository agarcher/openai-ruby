# typed: strong

module OpenAI
  module Models
    module Beta
      module Threads
        module Runs
          class ToolCallDeltaObject < OpenAI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  OpenAI::Beta::Threads::Runs::ToolCallDeltaObject,
                  OpenAI::Internal::AnyHash
                )
              end

            # Always `tool_calls`.
            sig { returns(Symbol) }
            attr_accessor :type

            # An array of tool calls the run step was involved in. These can be associated
            # with one of three types of tools: `code_interpreter`, `file_search`, or
            # `function`.
            sig do
              returns(
                T.nilable(
                  T::Array[OpenAI::Beta::Threads::Runs::ToolCallDelta::Variants]
                )
              )
            end
            attr_reader :tool_calls

            sig do
              params(
                tool_calls:
                  T::Array[
                    T.any(
                      OpenAI::Beta::Threads::Runs::CodeInterpreterToolCallDelta::OrHash,
                      OpenAI::Beta::Threads::Runs::FileSearchToolCallDelta::OrHash,
                      OpenAI::Beta::Threads::Runs::FunctionToolCallDelta::OrHash
                    )
                  ]
              ).void
            end
            attr_writer :tool_calls

            # Details of the tool call.
            sig do
              params(
                tool_calls:
                  T::Array[
                    T.any(
                      OpenAI::Beta::Threads::Runs::CodeInterpreterToolCallDelta::OrHash,
                      OpenAI::Beta::Threads::Runs::FileSearchToolCallDelta::OrHash,
                      OpenAI::Beta::Threads::Runs::FunctionToolCallDelta::OrHash
                    )
                  ],
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # An array of tool calls the run step was involved in. These can be associated
              # with one of three types of tools: `code_interpreter`, `file_search`, or
              # `function`.
              tool_calls: nil,
              # Always `tool_calls`.
              type: :tool_calls
            )
            end

            sig do
              override.returns(
                {
                  type: Symbol,
                  tool_calls:
                    T::Array[
                      OpenAI::Beta::Threads::Runs::ToolCallDelta::Variants
                    ]
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
