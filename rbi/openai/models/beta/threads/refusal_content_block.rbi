# typed: strong

module OpenAI
  module Models
    module Beta
      module Threads
        class RefusalContentBlock < OpenAI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                OpenAI::Beta::Threads::RefusalContentBlock,
                OpenAI::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :refusal

          # Always `refusal`.
          sig { returns(Symbol) }
          attr_accessor :type

          # The refusal content generated by the assistant.
          sig do
            params(refusal: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            refusal:,
            # Always `refusal`.
            type: :refusal
          )
          end

          sig { override.returns({ refusal: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
