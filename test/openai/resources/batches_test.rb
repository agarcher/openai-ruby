# frozen_string_literal: true

require_relative "../test_helper"

class OpenAI::Test::Resources::BatchesTest < OpenAI::Test::ResourceTest
  def test_create_required_params
    response =
      @openai.batches.create(
        completion_window: :"24h",
        endpoint: :"/v1/responses",
        input_file_id: "input_file_id"
      )

    assert_pattern do
      response => OpenAI::Batch
    end

    assert_pattern do
      response => {
        id: String,
        completion_window: String,
        created_at: Integer,
        endpoint: String,
        input_file_id: String,
        object: Symbol,
        status: OpenAI::Batch::Status,
        cancelled_at: Integer | nil,
        cancelling_at: Integer | nil,
        completed_at: Integer | nil,
        error_file_id: String | nil,
        errors: OpenAI::Batch::Errors | nil,
        expired_at: Integer | nil,
        expires_at: Integer | nil,
        failed_at: Integer | nil,
        finalizing_at: Integer | nil,
        in_progress_at: Integer | nil,
        metadata: ^(OpenAI::Internal::Type::HashOf[String]) | nil,
        output_file_id: String | nil,
        request_counts: OpenAI::BatchRequestCounts | nil
      }
    end
  end

  def test_retrieve
    response = @openai.batches.retrieve("batch_id")

    assert_pattern do
      response => OpenAI::Batch
    end

    assert_pattern do
      response => {
        id: String,
        completion_window: String,
        created_at: Integer,
        endpoint: String,
        input_file_id: String,
        object: Symbol,
        status: OpenAI::Batch::Status,
        cancelled_at: Integer | nil,
        cancelling_at: Integer | nil,
        completed_at: Integer | nil,
        error_file_id: String | nil,
        errors: OpenAI::Batch::Errors | nil,
        expired_at: Integer | nil,
        expires_at: Integer | nil,
        failed_at: Integer | nil,
        finalizing_at: Integer | nil,
        in_progress_at: Integer | nil,
        metadata: ^(OpenAI::Internal::Type::HashOf[String]) | nil,
        output_file_id: String | nil,
        request_counts: OpenAI::BatchRequestCounts | nil
      }
    end
  end

  def test_list
    response = @openai.batches.list

    assert_pattern do
      response => OpenAI::Internal::CursorPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => OpenAI::Batch
    end

    assert_pattern do
      row => {
        id: String,
        completion_window: String,
        created_at: Integer,
        endpoint: String,
        input_file_id: String,
        object: Symbol,
        status: OpenAI::Batch::Status,
        cancelled_at: Integer | nil,
        cancelling_at: Integer | nil,
        completed_at: Integer | nil,
        error_file_id: String | nil,
        errors: OpenAI::Batch::Errors | nil,
        expired_at: Integer | nil,
        expires_at: Integer | nil,
        failed_at: Integer | nil,
        finalizing_at: Integer | nil,
        in_progress_at: Integer | nil,
        metadata: ^(OpenAI::Internal::Type::HashOf[String]) | nil,
        output_file_id: String | nil,
        request_counts: OpenAI::BatchRequestCounts | nil
      }
    end
  end

  def test_cancel
    response = @openai.batches.cancel("batch_id")

    assert_pattern do
      response => OpenAI::Batch
    end

    assert_pattern do
      response => {
        id: String,
        completion_window: String,
        created_at: Integer,
        endpoint: String,
        input_file_id: String,
        object: Symbol,
        status: OpenAI::Batch::Status,
        cancelled_at: Integer | nil,
        cancelling_at: Integer | nil,
        completed_at: Integer | nil,
        error_file_id: String | nil,
        errors: OpenAI::Batch::Errors | nil,
        expired_at: Integer | nil,
        expires_at: Integer | nil,
        failed_at: Integer | nil,
        finalizing_at: Integer | nil,
        in_progress_at: Integer | nil,
        metadata: ^(OpenAI::Internal::Type::HashOf[String]) | nil,
        output_file_id: String | nil,
        request_counts: OpenAI::BatchRequestCounts | nil
      }
    end
  end
end
