# typed: strong

module OpenAI
  module Models
    class VectorStoreListParams < OpenAI::Internal::Type::BaseModel
      extend OpenAI::Internal::Type::RequestParameters::Converter
      include OpenAI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(OpenAI::VectorStoreListParams, OpenAI::Internal::AnyHash)
        end

      # A cursor for use in pagination. `after` is an object ID that defines your place
      # in the list. For instance, if you make a list request and receive 100 objects,
      # ending with obj_foo, your subsequent call can include after=obj_foo in order to
      # fetch the next page of the list.
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      # A cursor for use in pagination. `before` is an object ID that defines your place
      # in the list. For instance, if you make a list request and receive 100 objects,
      # starting with obj_foo, your subsequent call can include before=obj_foo in order
      # to fetch the previous page of the list.
      sig { returns(T.nilable(String)) }
      attr_reader :before

      sig { params(before: String).void }
      attr_writer :before

      # A limit on the number of objects to be returned. Limit can range between 1 and
      # 100, and the default is 20.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Sort order by the `created_at` timestamp of the objects. `asc` for ascending
      # order and `desc` for descending order.
      sig { returns(T.nilable(OpenAI::VectorStoreListParams::Order::OrSymbol)) }
      attr_reader :order

      sig { params(order: OpenAI::VectorStoreListParams::Order::OrSymbol).void }
      attr_writer :order

      sig do
        params(
          after: String,
          before: String,
          limit: Integer,
          order: OpenAI::VectorStoreListParams::Order::OrSymbol,
          request_options: OpenAI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A cursor for use in pagination. `after` is an object ID that defines your place
        # in the list. For instance, if you make a list request and receive 100 objects,
        # ending with obj_foo, your subsequent call can include after=obj_foo in order to
        # fetch the next page of the list.
        after: nil,
        # A cursor for use in pagination. `before` is an object ID that defines your place
        # in the list. For instance, if you make a list request and receive 100 objects,
        # starting with obj_foo, your subsequent call can include before=obj_foo in order
        # to fetch the previous page of the list.
        before: nil,
        # A limit on the number of objects to be returned. Limit can range between 1 and
        # 100, and the default is 20.
        limit: nil,
        # Sort order by the `created_at` timestamp of the objects. `asc` for ascending
        # order and `desc` for descending order.
        order: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            before: String,
            limit: Integer,
            order: OpenAI::VectorStoreListParams::Order::OrSymbol,
            request_options: OpenAI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Sort order by the `created_at` timestamp of the objects. `asc` for ascending
      # order and `desc` for descending order.
      module Order
        extend OpenAI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, OpenAI::VectorStoreListParams::Order) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC = T.let(:asc, OpenAI::VectorStoreListParams::Order::TaggedSymbol)
        DESC = T.let(:desc, OpenAI::VectorStoreListParams::Order::TaggedSymbol)

        sig do
          override.returns(
            T::Array[OpenAI::VectorStoreListParams::Order::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
