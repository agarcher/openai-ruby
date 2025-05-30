# frozen_string_literal: true

module OpenAI
  module Models
    module Beta
      module Threads
        class RequiredActionFunctionToolCall < OpenAI::Internal::Type::BaseModel
          # @!attribute id
          #   The ID of the tool call. This ID must be referenced when you submit the tool
          #   outputs in using the
          #   [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs)
          #   endpoint.
          #
          #   @return [String]
          required :id, String

          # @!attribute function
          #   The function definition.
          #
          #   @return [OpenAI::Models::Beta::Threads::RequiredActionFunctionToolCall::Function]
          required :function, -> { OpenAI::Beta::Threads::RequiredActionFunctionToolCall::Function }

          # @!attribute type
          #   The type of tool call the output is required for. For now, this is always
          #   `function`.
          #
          #   @return [Symbol, :function]
          required :type, const: :function

          # @!method initialize(id:, function:, type: :function)
          #   Some parameter documentations has been truncated, see
          #   {OpenAI::Models::Beta::Threads::RequiredActionFunctionToolCall} for more
          #   details.
          #
          #   Tool call objects
          #
          #   @param id [String] The ID of the tool call. This ID must be referenced when you submit the tool out
          #
          #   @param function [OpenAI::Models::Beta::Threads::RequiredActionFunctionToolCall::Function] The function definition.
          #
          #   @param type [Symbol, :function] The type of tool call the output is required for. For now, this is always `funct

          # @see OpenAI::Models::Beta::Threads::RequiredActionFunctionToolCall#function
          class Function < OpenAI::Internal::Type::BaseModel
            # @!attribute arguments
            #   The arguments that the model expects you to pass to the function.
            #
            #   @return [String]
            required :arguments, String

            # @!attribute name
            #   The name of the function.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(arguments:, name:)
            #   The function definition.
            #
            #   @param arguments [String] The arguments that the model expects you to pass to the function.
            #
            #   @param name [String] The name of the function.
          end
        end
      end
    end
  end
end
