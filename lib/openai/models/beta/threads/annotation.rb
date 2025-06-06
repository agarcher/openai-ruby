# frozen_string_literal: true

module OpenAI
  module Models
    module Beta
      module Threads
        # A citation within the message that points to a specific quote from a specific
        # File associated with the assistant or the message. Generated when the assistant
        # uses the "file_search" tool to search files.
        module Annotation
          extend OpenAI::Internal::Type::Union

          discriminator :type

          # A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "file_search" tool to search files.
          variant :file_citation, -> { OpenAI::Beta::Threads::FileCitationAnnotation }

          # A URL for the file that's generated when the assistant used the `code_interpreter` tool to generate a file.
          variant :file_path, -> { OpenAI::Beta::Threads::FilePathAnnotation }

          # @!method self.variants
          #   @return [Array(OpenAI::Models::Beta::Threads::FileCitationAnnotation, OpenAI::Models::Beta::Threads::FilePathAnnotation)]
        end
      end
    end
  end
end
