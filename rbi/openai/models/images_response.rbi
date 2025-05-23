# typed: strong

module OpenAI
  module Models
    class ImagesResponse < OpenAI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(OpenAI::ImagesResponse, OpenAI::Internal::AnyHash)
        end

      # The Unix timestamp (in seconds) of when the image was created.
      sig { returns(Integer) }
      attr_accessor :created

      # The list of generated images.
      sig { returns(T.nilable(T::Array[OpenAI::Image])) }
      attr_reader :data

      sig { params(data: T::Array[OpenAI::Image::OrHash]).void }
      attr_writer :data

      # For `gpt-image-1` only, the token usage information for the image generation.
      sig { returns(T.nilable(OpenAI::ImagesResponse::Usage)) }
      attr_reader :usage

      sig { params(usage: OpenAI::ImagesResponse::Usage::OrHash).void }
      attr_writer :usage

      # The response from the image generation endpoint.
      sig do
        params(
          created: Integer,
          data: T::Array[OpenAI::Image::OrHash],
          usage: OpenAI::ImagesResponse::Usage::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Unix timestamp (in seconds) of when the image was created.
        created:,
        # The list of generated images.
        data: nil,
        # For `gpt-image-1` only, the token usage information for the image generation.
        usage: nil
      )
      end

      sig do
        override.returns(
          {
            created: Integer,
            data: T::Array[OpenAI::Image],
            usage: OpenAI::ImagesResponse::Usage
          }
        )
      end
      def to_hash
      end

      class Usage < OpenAI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(OpenAI::ImagesResponse::Usage, OpenAI::Internal::AnyHash)
          end

        # The number of tokens (images and text) in the input prompt.
        sig { returns(Integer) }
        attr_accessor :input_tokens

        # The input tokens detailed information for the image generation.
        sig { returns(OpenAI::ImagesResponse::Usage::InputTokensDetails) }
        attr_reader :input_tokens_details

        sig do
          params(
            input_tokens_details:
              OpenAI::ImagesResponse::Usage::InputTokensDetails::OrHash
          ).void
        end
        attr_writer :input_tokens_details

        # The number of image tokens in the output image.
        sig { returns(Integer) }
        attr_accessor :output_tokens

        # The total number of tokens (images and text) used for the image generation.
        sig { returns(Integer) }
        attr_accessor :total_tokens

        # For `gpt-image-1` only, the token usage information for the image generation.
        sig do
          params(
            input_tokens: Integer,
            input_tokens_details:
              OpenAI::ImagesResponse::Usage::InputTokensDetails::OrHash,
            output_tokens: Integer,
            total_tokens: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The number of tokens (images and text) in the input prompt.
          input_tokens:,
          # The input tokens detailed information for the image generation.
          input_tokens_details:,
          # The number of image tokens in the output image.
          output_tokens:,
          # The total number of tokens (images and text) used for the image generation.
          total_tokens:
        )
        end

        sig do
          override.returns(
            {
              input_tokens: Integer,
              input_tokens_details:
                OpenAI::ImagesResponse::Usage::InputTokensDetails,
              output_tokens: Integer,
              total_tokens: Integer
            }
          )
        end
        def to_hash
        end

        class InputTokensDetails < OpenAI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                OpenAI::ImagesResponse::Usage::InputTokensDetails,
                OpenAI::Internal::AnyHash
              )
            end

          # The number of image tokens in the input prompt.
          sig { returns(Integer) }
          attr_accessor :image_tokens

          # The number of text tokens in the input prompt.
          sig { returns(Integer) }
          attr_accessor :text_tokens

          # The input tokens detailed information for the image generation.
          sig do
            params(image_tokens: Integer, text_tokens: Integer).returns(
              T.attached_class
            )
          end
          def self.new(
            # The number of image tokens in the input prompt.
            image_tokens:,
            # The number of text tokens in the input prompt.
            text_tokens:
          )
          end

          sig do
            override.returns({ image_tokens: Integer, text_tokens: Integer })
          end
          def to_hash
          end
        end
      end
    end
  end
end
