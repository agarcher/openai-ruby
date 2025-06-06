# typed: strong

module OpenAI
  module Models
    module Uploads
      class PartCreateParams < OpenAI::Internal::Type::BaseModel
        extend OpenAI::Internal::Type::RequestParameters::Converter
        include OpenAI::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(OpenAI::Uploads::PartCreateParams, OpenAI::Internal::AnyHash)
          end

        # The chunk of bytes for this Part.
        sig { returns(OpenAI::Internal::FileInput) }
        attr_accessor :data

        sig do
          params(
            data: OpenAI::Internal::FileInput,
            request_options: OpenAI::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The chunk of bytes for this Part.
          data:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              data: OpenAI::Internal::FileInput,
              request_options: OpenAI::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
