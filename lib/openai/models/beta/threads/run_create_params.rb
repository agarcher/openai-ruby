# frozen_string_literal: true

module OpenAI
  module Models
    module Beta
      module Threads
        # @see OpenAI::Resources::Beta::Threads::Runs#create
        #
        # @see OpenAI::Resources::Beta::Threads::Runs#create_stream_raw
        class RunCreateParams < OpenAI::Internal::Type::BaseModel
          extend OpenAI::Internal::Type::RequestParameters::Converter
          include OpenAI::Internal::Type::RequestParameters

          # @!attribute assistant_id
          #   The ID of the
          #   [assistant](https://platform.openai.com/docs/api-reference/assistants) to use to
          #   execute this run.
          #
          #   @return [String]
          required :assistant_id, String

          # @!attribute include
          #   A list of additional fields to include in the response. Currently the only
          #   supported value is `step_details.tool_calls[*].file_search.results[*].content`
          #   to fetch the file search result content.
          #
          #   See the
          #   [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings)
          #   for more information.
          #
          #   @return [Array<Symbol, OpenAI::Models::Beta::Threads::Runs::RunStepInclude>, nil]
          optional :include,
                   -> { OpenAI::Internal::Type::ArrayOf[enum: OpenAI::Beta::Threads::Runs::RunStepInclude] }

          # @!attribute additional_instructions
          #   Appends additional instructions at the end of the instructions for the run. This
          #   is useful for modifying the behavior on a per-run basis without overriding other
          #   instructions.
          #
          #   @return [String, nil]
          optional :additional_instructions, String, nil?: true

          # @!attribute additional_messages
          #   Adds additional messages to the thread before creating the run.
          #
          #   @return [Array<OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage>, nil]
          optional :additional_messages,
                   -> {
                     OpenAI::Internal::Type::ArrayOf[OpenAI::Beta::Threads::RunCreateParams::AdditionalMessage]
                   },
                   nil?: true

          # @!attribute instructions
          #   Overrides the
          #   [instructions](https://platform.openai.com/docs/api-reference/assistants/createAssistant)
          #   of the assistant. This is useful for modifying the behavior on a per-run basis.
          #
          #   @return [String, nil]
          optional :instructions, String, nil?: true

          # @!attribute max_completion_tokens
          #   The maximum number of completion tokens that may be used over the course of the
          #   run. The run will make a best effort to use only the number of completion tokens
          #   specified, across multiple turns of the run. If the run exceeds the number of
          #   completion tokens specified, the run will end with status `incomplete`. See
          #   `incomplete_details` for more info.
          #
          #   @return [Integer, nil]
          optional :max_completion_tokens, Integer, nil?: true

          # @!attribute max_prompt_tokens
          #   The maximum number of prompt tokens that may be used over the course of the run.
          #   The run will make a best effort to use only the number of prompt tokens
          #   specified, across multiple turns of the run. If the run exceeds the number of
          #   prompt tokens specified, the run will end with status `incomplete`. See
          #   `incomplete_details` for more info.
          #
          #   @return [Integer, nil]
          optional :max_prompt_tokens, Integer, nil?: true

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

          # @!attribute model
          #   The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to
          #   be used to execute this run. If a value is provided here, it will override the
          #   model associated with the assistant. If not, the model associated with the
          #   assistant will be used.
          #
          #   @return [String, Symbol, OpenAI::Models::ChatModel, nil]
          optional :model, union: -> { OpenAI::Beta::Threads::RunCreateParams::Model }, nil?: true

          # @!attribute parallel_tool_calls
          #   Whether to enable
          #   [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling)
          #   during tool use.
          #
          #   @return [Boolean, nil]
          optional :parallel_tool_calls, OpenAI::Internal::Type::Boolean

          # @!attribute reasoning_effort
          #   **o-series models only**
          #
          #   Constrains effort on reasoning for
          #   [reasoning models](https://platform.openai.com/docs/guides/reasoning). Currently
          #   supported values are `low`, `medium`, and `high`. Reducing reasoning effort can
          #   result in faster responses and fewer tokens used on reasoning in a response.
          #
          #   @return [Symbol, OpenAI::Models::ReasoningEffort, nil]
          optional :reasoning_effort, enum: -> { OpenAI::ReasoningEffort }, nil?: true

          # @!attribute response_format
          #   Specifies the format that the model must output. Compatible with
          #   [GPT-4o](https://platform.openai.com/docs/models#gpt-4o),
          #   [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4),
          #   and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
          #
          #   Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured
          #   Outputs which ensures the model will match your supplied JSON schema. Learn more
          #   in the
          #   [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
          #
          #   Setting to `{ "type": "json_object" }` enables JSON mode, which ensures the
          #   message the model generates is valid JSON.
          #
          #   **Important:** when using JSON mode, you **must** also instruct the model to
          #   produce JSON yourself via a system or user message. Without this, the model may
          #   generate an unending stream of whitespace until the generation reaches the token
          #   limit, resulting in a long-running and seemingly "stuck" request. Also note that
          #   the message content may be partially cut off if `finish_reason="length"`, which
          #   indicates the generation exceeded `max_tokens` or the conversation exceeded the
          #   max context length.
          #
          #   @return [Symbol, :auto, OpenAI::Models::ResponseFormatText, OpenAI::Models::ResponseFormatJSONObject, OpenAI::Models::ResponseFormatJSONSchema, nil]
          optional :response_format, union: -> { OpenAI::Beta::AssistantResponseFormatOption }, nil?: true

          # @!attribute temperature
          #   What sampling temperature to use, between 0 and 2. Higher values like 0.8 will
          #   make the output more random, while lower values like 0.2 will make it more
          #   focused and deterministic.
          #
          #   @return [Float, nil]
          optional :temperature, Float, nil?: true

          # @!attribute tool_choice
          #   Controls which (if any) tool is called by the model. `none` means the model will
          #   not call any tools and instead generates a message. `auto` is the default value
          #   and means the model can pick between generating a message or calling one or more
          #   tools. `required` means the model must call one or more tools before responding
          #   to the user. Specifying a particular tool like `{"type": "file_search"}` or
          #   `{"type": "function", "function": {"name": "my_function"}}` forces the model to
          #   call that tool.
          #
          #   @return [Symbol, OpenAI::Models::Beta::AssistantToolChoiceOption::Auto, OpenAI::Models::Beta::AssistantToolChoice, nil]
          optional :tool_choice, union: -> { OpenAI::Beta::AssistantToolChoiceOption }, nil?: true

          # @!attribute tools
          #   Override the tools the assistant can use for this run. This is useful for
          #   modifying the behavior on a per-run basis.
          #
          #   @return [Array<OpenAI::Models::Beta::CodeInterpreterTool, OpenAI::Models::Beta::FileSearchTool, OpenAI::Models::Beta::FunctionTool>, nil]
          optional :tools,
                   -> {
                     OpenAI::Internal::Type::ArrayOf[union: OpenAI::Beta::AssistantTool]
                   },
                   nil?: true

          # @!attribute top_p
          #   An alternative to sampling with temperature, called nucleus sampling, where the
          #   model considers the results of the tokens with top_p probability mass. So 0.1
          #   means only the tokens comprising the top 10% probability mass are considered.
          #
          #   We generally recommend altering this or temperature but not both.
          #
          #   @return [Float, nil]
          optional :top_p, Float, nil?: true

          # @!attribute truncation_strategy
          #   Controls for how a thread will be truncated prior to the run. Use this to
          #   control the intial context window of the run.
          #
          #   @return [OpenAI::Models::Beta::Threads::RunCreateParams::TruncationStrategy, nil]
          optional :truncation_strategy,
                   -> { OpenAI::Beta::Threads::RunCreateParams::TruncationStrategy },
                   nil?: true

          # @!method initialize(assistant_id:, include: nil, additional_instructions: nil, additional_messages: nil, instructions: nil, max_completion_tokens: nil, max_prompt_tokens: nil, metadata: nil, model: nil, parallel_tool_calls: nil, reasoning_effort: nil, response_format: nil, temperature: nil, tool_choice: nil, tools: nil, top_p: nil, truncation_strategy: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {OpenAI::Models::Beta::Threads::RunCreateParams} for more details.
          #
          #   @param assistant_id [String] The ID of the [assistant](https://platform.openai.com/docs/api-reference/assista
          #
          #   @param include [Array<Symbol, OpenAI::Models::Beta::Threads::Runs::RunStepInclude>] A list of additional fields to include in the response. Currently the only suppo
          #
          #   @param additional_instructions [String, nil] Appends additional instructions at the end of the instructions for the run. This
          #
          #   @param additional_messages [Array<OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage>, nil] Adds additional messages to the thread before creating the run.
          #
          #   @param instructions [String, nil] Overrides the [instructions](https://platform.openai.com/docs/api-reference/assi
          #
          #   @param max_completion_tokens [Integer, nil] The maximum number of completion tokens that may be used over the course of the
          #
          #   @param max_prompt_tokens [Integer, nil] The maximum number of prompt tokens that may be used over the course of the run.
          #
          #   @param metadata [Hash{Symbol=>String}, nil] Set of 16 key-value pairs that can be attached to an object. This can be
          #
          #   @param model [String, Symbol, OpenAI::Models::ChatModel, nil] The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to
          #
          #   @param parallel_tool_calls [Boolean] Whether to enable [parallel function calling](https://platform.openai.com/docs/g
          #
          #   @param reasoning_effort [Symbol, OpenAI::Models::ReasoningEffort, nil] **o-series models only**
          #
          #   @param response_format [Symbol, :auto, OpenAI::Models::ResponseFormatText, OpenAI::Models::ResponseFormatJSONObject, OpenAI::Models::ResponseFormatJSONSchema, nil] Specifies the format that the model must output. Compatible with [GPT-4o](https:
          #
          #   @param temperature [Float, nil] What sampling temperature to use, between 0 and 2. Higher values like 0.8 will m
          #
          #   @param tool_choice [Symbol, OpenAI::Models::Beta::AssistantToolChoiceOption::Auto, OpenAI::Models::Beta::AssistantToolChoice, nil] Controls which (if any) tool is called by the model.
          #
          #   @param tools [Array<OpenAI::Models::Beta::CodeInterpreterTool, OpenAI::Models::Beta::FileSearchTool, OpenAI::Models::Beta::FunctionTool>, nil] Override the tools the assistant can use for this run. This is useful for modify
          #
          #   @param top_p [Float, nil] An alternative to sampling with temperature, called nucleus sampling, where the
          #
          #   @param truncation_strategy [OpenAI::Models::Beta::Threads::RunCreateParams::TruncationStrategy, nil] Controls for how a thread will be truncated prior to the run. Use this to contro
          #
          #   @param request_options [OpenAI::RequestOptions, Hash{Symbol=>Object}]

          class AdditionalMessage < OpenAI::Internal::Type::BaseModel
            # @!attribute content
            #   The text contents of the message.
            #
            #   @return [String, Array<OpenAI::Models::Beta::Threads::ImageFileContentBlock, OpenAI::Models::Beta::Threads::ImageURLContentBlock, OpenAI::Models::Beta::Threads::TextContentBlockParam>]
            required :content,
                     union: -> {
                       OpenAI::Beta::Threads::RunCreateParams::AdditionalMessage::Content
                     }

            # @!attribute role
            #   The role of the entity that is creating the message. Allowed values include:
            #
            #   - `user`: Indicates the message is sent by an actual user and should be used in
            #     most cases to represent user-generated messages.
            #   - `assistant`: Indicates the message is generated by the assistant. Use this
            #     value to insert messages from the assistant into the conversation.
            #
            #   @return [Symbol, OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage::Role]
            required :role, enum: -> { OpenAI::Beta::Threads::RunCreateParams::AdditionalMessage::Role }

            # @!attribute attachments
            #   A list of files attached to the message, and the tools they should be added to.
            #
            #   @return [Array<OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage::Attachment>, nil]
            optional :attachments,
                     -> {
                       OpenAI::Internal::Type::ArrayOf[OpenAI::Beta::Threads::RunCreateParams::AdditionalMessage::Attachment]
                     },
                     nil?: true

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

            # @!method initialize(content:, role:, attachments: nil, metadata: nil)
            #   Some parameter documentations has been truncated, see
            #   {OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage} for more
            #   details.
            #
            #   @param content [String, Array<OpenAI::Models::Beta::Threads::ImageFileContentBlock, OpenAI::Models::Beta::Threads::ImageURLContentBlock, OpenAI::Models::Beta::Threads::TextContentBlockParam>] The text contents of the message.
            #
            #   @param role [Symbol, OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage::Role] The role of the entity that is creating the message. Allowed values include:
            #
            #   @param attachments [Array<OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage::Attachment>, nil] A list of files attached to the message, and the tools they should be added to.
            #
            #   @param metadata [Hash{Symbol=>String}, nil] Set of 16 key-value pairs that can be attached to an object. This can be

            # The text contents of the message.
            #
            # @see OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage#content
            module Content
              extend OpenAI::Internal::Type::Union

              # The text contents of the message.
              variant String

              # An array of content parts with a defined type, each can be of type `text` or images can be passed with `image_url` or `image_file`. Image types are only supported on [Vision-compatible models](https://platform.openai.com/docs/models).
              variant -> { OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage::Content::MessageContentPartParamArray }

              # @!method self.variants
              #   @return [Array(String, Array<OpenAI::Models::Beta::Threads::ImageFileContentBlock, OpenAI::Models::Beta::Threads::ImageURLContentBlock, OpenAI::Models::Beta::Threads::TextContentBlockParam>)]

              # @type [OpenAI::Internal::Type::Converter]
              MessageContentPartParamArray =
                OpenAI::Internal::Type::ArrayOf[union: -> { OpenAI::Beta::Threads::MessageContentPartParam }]
            end

            # The role of the entity that is creating the message. Allowed values include:
            #
            # - `user`: Indicates the message is sent by an actual user and should be used in
            #   most cases to represent user-generated messages.
            # - `assistant`: Indicates the message is generated by the assistant. Use this
            #   value to insert messages from the assistant into the conversation.
            #
            # @see OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage#role
            module Role
              extend OpenAI::Internal::Type::Enum

              USER = :user
              ASSISTANT = :assistant

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            class Attachment < OpenAI::Internal::Type::BaseModel
              # @!attribute file_id
              #   The ID of the file to attach to the message.
              #
              #   @return [String, nil]
              optional :file_id, String

              # @!attribute tools
              #   The tools to add this file to.
              #
              #   @return [Array<OpenAI::Models::Beta::CodeInterpreterTool, OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage::Attachment::Tool::FileSearch>, nil]
              optional :tools,
                       -> {
                         OpenAI::Internal::Type::ArrayOf[union: OpenAI::Beta::Threads::RunCreateParams::AdditionalMessage::Attachment::Tool]
                       }

              # @!method initialize(file_id: nil, tools: nil)
              #   @param file_id [String] The ID of the file to attach to the message.
              #
              #   @param tools [Array<OpenAI::Models::Beta::CodeInterpreterTool, OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage::Attachment::Tool::FileSearch>] The tools to add this file to.

              module Tool
                extend OpenAI::Internal::Type::Union

                discriminator :type

                variant :code_interpreter, -> { OpenAI::Beta::CodeInterpreterTool }

                variant :file_search,
                        -> {
                          OpenAI::Beta::Threads::RunCreateParams::AdditionalMessage::Attachment::Tool::FileSearch
                        }

                class FileSearch < OpenAI::Internal::Type::BaseModel
                  # @!attribute type
                  #   The type of tool being defined: `file_search`
                  #
                  #   @return [Symbol, :file_search]
                  required :type, const: :file_search

                  # @!method initialize(type: :file_search)
                  #   @param type [Symbol, :file_search] The type of tool being defined: `file_search`
                end

                # @!method self.variants
                #   @return [Array(OpenAI::Models::Beta::CodeInterpreterTool, OpenAI::Models::Beta::Threads::RunCreateParams::AdditionalMessage::Attachment::Tool::FileSearch)]
              end
            end
          end

          # The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to
          # be used to execute this run. If a value is provided here, it will override the
          # model associated with the assistant. If not, the model associated with the
          # assistant will be used.
          module Model
            extend OpenAI::Internal::Type::Union

            variant String

            # The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
            variant enum: -> { OpenAI::ChatModel }

            # @!method self.variants
            #   @return [Array(String, Symbol, OpenAI::Models::ChatModel)]
          end

          class TruncationStrategy < OpenAI::Internal::Type::BaseModel
            # @!attribute type
            #   The truncation strategy to use for the thread. The default is `auto`. If set to
            #   `last_messages`, the thread will be truncated to the n most recent messages in
            #   the thread. When set to `auto`, messages in the middle of the thread will be
            #   dropped to fit the context length of the model, `max_prompt_tokens`.
            #
            #   @return [Symbol, OpenAI::Models::Beta::Threads::RunCreateParams::TruncationStrategy::Type]
            required :type, enum: -> { OpenAI::Beta::Threads::RunCreateParams::TruncationStrategy::Type }

            # @!attribute last_messages
            #   The number of most recent messages from the thread when constructing the context
            #   for the run.
            #
            #   @return [Integer, nil]
            optional :last_messages, Integer, nil?: true

            # @!method initialize(type:, last_messages: nil)
            #   Some parameter documentations has been truncated, see
            #   {OpenAI::Models::Beta::Threads::RunCreateParams::TruncationStrategy} for more
            #   details.
            #
            #   Controls for how a thread will be truncated prior to the run. Use this to
            #   control the intial context window of the run.
            #
            #   @param type [Symbol, OpenAI::Models::Beta::Threads::RunCreateParams::TruncationStrategy::Type] The truncation strategy to use for the thread. The default is `auto`. If set to
            #
            #   @param last_messages [Integer, nil] The number of most recent messages from the thread when constructing the context

            # The truncation strategy to use for the thread. The default is `auto`. If set to
            # `last_messages`, the thread will be truncated to the n most recent messages in
            # the thread. When set to `auto`, messages in the middle of the thread will be
            # dropped to fit the context length of the model, `max_prompt_tokens`.
            #
            # @see OpenAI::Models::Beta::Threads::RunCreateParams::TruncationStrategy#type
            module Type
              extend OpenAI::Internal::Type::Enum

              AUTO = :auto
              LAST_MESSAGES = :last_messages

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
