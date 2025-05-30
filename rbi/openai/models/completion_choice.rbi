# typed: strong

module OpenAI
  module Models
    class CompletionChoice < OpenAI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(OpenAI::CompletionChoice, OpenAI::Internal::AnyHash)
        end

      # The reason the model stopped generating tokens. This will be `stop` if the model
      # hit a natural stop point or a provided stop sequence, `length` if the maximum
      # number of tokens specified in the request was reached, or `content_filter` if
      # content was omitted due to a flag from our content filters.
      sig { returns(OpenAI::CompletionChoice::FinishReason::TaggedSymbol) }
      attr_accessor :finish_reason

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(T.nilable(OpenAI::CompletionChoice::Logprobs)) }
      attr_reader :logprobs

      sig do
        params(
          logprobs: T.nilable(OpenAI::CompletionChoice::Logprobs::OrHash)
        ).void
      end
      attr_writer :logprobs

      sig { returns(String) }
      attr_accessor :text

      sig do
        params(
          finish_reason: OpenAI::CompletionChoice::FinishReason::OrSymbol,
          index: Integer,
          logprobs: T.nilable(OpenAI::CompletionChoice::Logprobs::OrHash),
          text: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The reason the model stopped generating tokens. This will be `stop` if the model
        # hit a natural stop point or a provided stop sequence, `length` if the maximum
        # number of tokens specified in the request was reached, or `content_filter` if
        # content was omitted due to a flag from our content filters.
        finish_reason:,
        index:,
        logprobs:,
        text:
      )
      end

      sig do
        override.returns(
          {
            finish_reason: OpenAI::CompletionChoice::FinishReason::TaggedSymbol,
            index: Integer,
            logprobs: T.nilable(OpenAI::CompletionChoice::Logprobs),
            text: String
          }
        )
      end
      def to_hash
      end

      # The reason the model stopped generating tokens. This will be `stop` if the model
      # hit a natural stop point or a provided stop sequence, `length` if the maximum
      # number of tokens specified in the request was reached, or `content_filter` if
      # content was omitted due to a flag from our content filters.
      module FinishReason
        extend OpenAI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, OpenAI::CompletionChoice::FinishReason) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STOP =
          T.let(:stop, OpenAI::CompletionChoice::FinishReason::TaggedSymbol)
        LENGTH =
          T.let(:length, OpenAI::CompletionChoice::FinishReason::TaggedSymbol)
        CONTENT_FILTER =
          T.let(
            :content_filter,
            OpenAI::CompletionChoice::FinishReason::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[OpenAI::CompletionChoice::FinishReason::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Logprobs < OpenAI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(OpenAI::CompletionChoice::Logprobs, OpenAI::Internal::AnyHash)
          end

        sig { returns(T.nilable(T::Array[Integer])) }
        attr_reader :text_offset

        sig { params(text_offset: T::Array[Integer]).void }
        attr_writer :text_offset

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :token_logprobs

        sig { params(token_logprobs: T::Array[Float]).void }
        attr_writer :token_logprobs

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tokens

        sig { params(tokens: T::Array[String]).void }
        attr_writer :tokens

        sig { returns(T.nilable(T::Array[T::Hash[Symbol, Float]])) }
        attr_reader :top_logprobs

        sig { params(top_logprobs: T::Array[T::Hash[Symbol, Float]]).void }
        attr_writer :top_logprobs

        sig do
          params(
            text_offset: T::Array[Integer],
            token_logprobs: T::Array[Float],
            tokens: T::Array[String],
            top_logprobs: T::Array[T::Hash[Symbol, Float]]
          ).returns(T.attached_class)
        end
        def self.new(
          text_offset: nil,
          token_logprobs: nil,
          tokens: nil,
          top_logprobs: nil
        )
        end

        sig do
          override.returns(
            {
              text_offset: T::Array[Integer],
              token_logprobs: T::Array[Float],
              tokens: T::Array[String],
              top_logprobs: T::Array[T::Hash[Symbol, Float]]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
