# frozen_string_literal: true

module OpenAI
  module Models
    module Beta
      module Threads
        # References an image [File](https://platform.openai.com/docs/api-reference/files)
        # in the content of a message.
        module MessageContentPartParam
          extend OpenAI::Internal::Type::Union

          discriminator :type

          # References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
          variant :image_file, -> { OpenAI::Beta::Threads::ImageFileContentBlock }

          # References an image URL in the content of a message.
          variant :image_url, -> { OpenAI::Beta::Threads::ImageURLContentBlock }

          # The text content that is part of a message.
          variant :text, -> { OpenAI::Beta::Threads::TextContentBlockParam }

          # @!method self.variants
          #   @return [Array(OpenAI::Models::Beta::Threads::ImageFileContentBlock, OpenAI::Models::Beta::Threads::ImageURLContentBlock, OpenAI::Models::Beta::Threads::TextContentBlockParam)]
        end
      end
    end
  end
end
