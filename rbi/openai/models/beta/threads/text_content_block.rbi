# typed: strong

module OpenAI
  module Models
    module Beta
      module Threads
        class TextContentBlock < OpenAI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                OpenAI::Beta::Threads::TextContentBlock,
                OpenAI::Internal::AnyHash
              )
            end

          sig { returns(OpenAI::Beta::Threads::Text) }
          attr_reader :text

          sig { params(text: OpenAI::Beta::Threads::Text::OrHash).void }
          attr_writer :text

          # Always `text`.
          sig { returns(Symbol) }
          attr_accessor :type

          # The text content that is part of a message.
          sig do
            params(
              text: OpenAI::Beta::Threads::Text::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            text:,
            # Always `text`.
            type: :text
          )
          end

          sig do
            override.returns(
              { text: OpenAI::Beta::Threads::Text, type: Symbol }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
