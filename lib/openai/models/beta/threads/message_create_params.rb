# frozen_string_literal: true

module OpenAI
  module Models
    module Beta
      module Threads
        # @see OpenAI::Resources::Beta::Threads::Messages#create
        class MessageCreateParams < OpenAI::Internal::Type::BaseModel
          extend OpenAI::Internal::Type::RequestParameters::Converter
          include OpenAI::Internal::Type::RequestParameters

          # @!attribute content
          #   The text contents of the message.
          #
          #   @return [String, Array<OpenAI::Models::Beta::Threads::ImageFileContentBlock, OpenAI::Models::Beta::Threads::ImageURLContentBlock, OpenAI::Models::Beta::Threads::TextContentBlockParam>]
          required :content, union: -> { OpenAI::Beta::Threads::MessageCreateParams::Content }

          # @!attribute role
          #   The role of the entity that is creating the message. Allowed values include:
          #
          #   - `user`: Indicates the message is sent by an actual user and should be used in
          #     most cases to represent user-generated messages.
          #   - `assistant`: Indicates the message is generated by the assistant. Use this
          #     value to insert messages from the assistant into the conversation.
          #
          #   @return [Symbol, OpenAI::Models::Beta::Threads::MessageCreateParams::Role]
          required :role, enum: -> { OpenAI::Beta::Threads::MessageCreateParams::Role }

          # @!attribute attachments
          #   A list of files attached to the message, and the tools they should be added to.
          #
          #   @return [Array<OpenAI::Models::Beta::Threads::MessageCreateParams::Attachment>, nil]
          optional :attachments,
                   -> {
                     OpenAI::Internal::Type::ArrayOf[OpenAI::Beta::Threads::MessageCreateParams::Attachment]
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

          # @!method initialize(content:, role:, attachments: nil, metadata: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {OpenAI::Models::Beta::Threads::MessageCreateParams} for more details.
          #
          #   @param content [String, Array<OpenAI::Models::Beta::Threads::ImageFileContentBlock, OpenAI::Models::Beta::Threads::ImageURLContentBlock, OpenAI::Models::Beta::Threads::TextContentBlockParam>] The text contents of the message.
          #
          #   @param role [Symbol, OpenAI::Models::Beta::Threads::MessageCreateParams::Role] The role of the entity that is creating the message. Allowed values include:
          #
          #   @param attachments [Array<OpenAI::Models::Beta::Threads::MessageCreateParams::Attachment>, nil] A list of files attached to the message, and the tools they should be added to.
          #
          #   @param metadata [Hash{Symbol=>String}, nil] Set of 16 key-value pairs that can be attached to an object. This can be
          #
          #   @param request_options [OpenAI::RequestOptions, Hash{Symbol=>Object}]

          # The text contents of the message.
          module Content
            extend OpenAI::Internal::Type::Union

            # The text contents of the message.
            variant String

            # An array of content parts with a defined type, each can be of type `text` or images can be passed with `image_url` or `image_file`. Image types are only supported on [Vision-compatible models](https://platform.openai.com/docs/models).
            variant -> { OpenAI::Models::Beta::Threads::MessageCreateParams::Content::MessageContentPartParamArray }

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
            #   @return [Array<OpenAI::Models::Beta::CodeInterpreterTool, OpenAI::Models::Beta::Threads::MessageCreateParams::Attachment::Tool::FileSearch>, nil]
            optional :tools,
                     -> {
                       OpenAI::Internal::Type::ArrayOf[union: OpenAI::Beta::Threads::MessageCreateParams::Attachment::Tool]
                     }

            # @!method initialize(file_id: nil, tools: nil)
            #   @param file_id [String] The ID of the file to attach to the message.
            #
            #   @param tools [Array<OpenAI::Models::Beta::CodeInterpreterTool, OpenAI::Models::Beta::Threads::MessageCreateParams::Attachment::Tool::FileSearch>] The tools to add this file to.

            module Tool
              extend OpenAI::Internal::Type::Union

              discriminator :type

              variant :code_interpreter, -> { OpenAI::Beta::CodeInterpreterTool }

              variant :file_search,
                      -> {
                        OpenAI::Beta::Threads::MessageCreateParams::Attachment::Tool::FileSearch
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
              #   @return [Array(OpenAI::Models::Beta::CodeInterpreterTool, OpenAI::Models::Beta::Threads::MessageCreateParams::Attachment::Tool::FileSearch)]
            end
          end
        end
      end
    end
  end
end
