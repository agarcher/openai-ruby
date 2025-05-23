# frozen_string_literal: true

require_relative "../test_helper"

class OpenAI::Test::Resources::ModelsTest < OpenAI::Test::ResourceTest
  def test_retrieve
    response = @openai.models.retrieve("gpt-4o-mini")

    assert_pattern do
      response => OpenAI::Model
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer,
        object: Symbol,
        owned_by: String
      }
    end
  end

  def test_list
    response = @openai.models.list

    assert_pattern do
      response => OpenAI::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => OpenAI::Model
    end

    assert_pattern do
      row => {
        id: String,
        created: Integer,
        object: Symbol,
        owned_by: String
      }
    end
  end

  def test_delete
    response = @openai.models.delete("ft:gpt-4o-mini:acemeco:suffix:abc123")

    assert_pattern do
      response => OpenAI::ModelDeleted
    end

    assert_pattern do
      response => {
        id: String,
        deleted: OpenAI::Internal::Type::Boolean,
        object: String
      }
    end
  end
end
