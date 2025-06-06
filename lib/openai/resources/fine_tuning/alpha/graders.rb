# frozen_string_literal: true

module OpenAI
  module Resources
    class FineTuning
      class Alpha
        class Graders
          # Some parameter documentations has been truncated, see
          # {OpenAI::Models::FineTuning::Alpha::GraderRunParams} for more details.
          #
          # Run a grader.
          #
          # @overload run(grader:, model_sample:, item: nil, request_options: {})
          #
          # @param grader [OpenAI::Models::Graders::StringCheckGrader, OpenAI::Models::Graders::TextSimilarityGrader, OpenAI::Models::Graders::PythonGrader, OpenAI::Models::Graders::ScoreModelGrader, OpenAI::Models::Graders::MultiGrader] The grader used for the fine-tuning job.
          #
          # @param model_sample [String] The model sample to be evaluated. This value will be used to populate
          #
          # @param item [Object] The dataset item provided to the grader. This will be used to populate
          #
          # @param request_options [OpenAI::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [OpenAI::Models::FineTuning::Alpha::GraderRunResponse]
          #
          # @see OpenAI::Models::FineTuning::Alpha::GraderRunParams
          def run(params)
            parsed, options = OpenAI::FineTuning::Alpha::GraderRunParams.dump_request(params)
            @client.request(
              method: :post,
              path: "fine_tuning/alpha/graders/run",
              body: parsed,
              model: OpenAI::Models::FineTuning::Alpha::GraderRunResponse,
              options: options
            )
          end

          # Validate a grader.
          #
          # @overload validate(grader:, request_options: {})
          #
          # @param grader [OpenAI::Models::Graders::StringCheckGrader, OpenAI::Models::Graders::TextSimilarityGrader, OpenAI::Models::Graders::PythonGrader, OpenAI::Models::Graders::ScoreModelGrader, OpenAI::Models::Graders::MultiGrader] The grader used for the fine-tuning job.
          #
          # @param request_options [OpenAI::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [OpenAI::Models::FineTuning::Alpha::GraderValidateResponse]
          #
          # @see OpenAI::Models::FineTuning::Alpha::GraderValidateParams
          def validate(params)
            parsed, options = OpenAI::FineTuning::Alpha::GraderValidateParams.dump_request(params)
            @client.request(
              method: :post,
              path: "fine_tuning/alpha/graders/validate",
              body: parsed,
              model: OpenAI::Models::FineTuning::Alpha::GraderValidateResponse,
              options: options
            )
          end

          # @api private
          #
          # @param client [OpenAI::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
