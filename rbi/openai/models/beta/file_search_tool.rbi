# typed: strong

module OpenAI
  module Models
    module Beta
      class FileSearchTool < OpenAI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(OpenAI::Beta::FileSearchTool, OpenAI::Internal::AnyHash)
          end

        # The type of tool being defined: `file_search`
        sig { returns(Symbol) }
        attr_accessor :type

        # Overrides for the file search tool.
        sig { returns(T.nilable(OpenAI::Beta::FileSearchTool::FileSearch)) }
        attr_reader :file_search

        sig do
          params(
            file_search: OpenAI::Beta::FileSearchTool::FileSearch::OrHash
          ).void
        end
        attr_writer :file_search

        sig do
          params(
            file_search: OpenAI::Beta::FileSearchTool::FileSearch::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Overrides for the file search tool.
          file_search: nil,
          # The type of tool being defined: `file_search`
          type: :file_search
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              file_search: OpenAI::Beta::FileSearchTool::FileSearch
            }
          )
        end
        def to_hash
        end

        class FileSearch < OpenAI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                OpenAI::Beta::FileSearchTool::FileSearch,
                OpenAI::Internal::AnyHash
              )
            end

          # The maximum number of results the file search tool should output. The default is
          # 20 for `gpt-4*` models and 5 for `gpt-3.5-turbo`. This number should be between
          # 1 and 50 inclusive.
          #
          # Note that the file search tool may output fewer than `max_num_results` results.
          # See the
          # [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings)
          # for more information.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_num_results

          sig { params(max_num_results: Integer).void }
          attr_writer :max_num_results

          # The ranking options for the file search. If not specified, the file search tool
          # will use the `auto` ranker and a score_threshold of 0.
          #
          # See the
          # [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings)
          # for more information.
          sig do
            returns(
              T.nilable(
                OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions
              )
            )
          end
          attr_reader :ranking_options

          sig do
            params(
              ranking_options:
                OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::OrHash
            ).void
          end
          attr_writer :ranking_options

          # Overrides for the file search tool.
          sig do
            params(
              max_num_results: Integer,
              ranking_options:
                OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The maximum number of results the file search tool should output. The default is
            # 20 for `gpt-4*` models and 5 for `gpt-3.5-turbo`. This number should be between
            # 1 and 50 inclusive.
            #
            # Note that the file search tool may output fewer than `max_num_results` results.
            # See the
            # [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings)
            # for more information.
            max_num_results: nil,
            # The ranking options for the file search. If not specified, the file search tool
            # will use the `auto` ranker and a score_threshold of 0.
            #
            # See the
            # [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings)
            # for more information.
            ranking_options: nil
          )
          end

          sig do
            override.returns(
              {
                max_num_results: Integer,
                ranking_options:
                  OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions
              }
            )
          end
          def to_hash
          end

          class RankingOptions < OpenAI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions,
                  OpenAI::Internal::AnyHash
                )
              end

            # The score threshold for the file search. All values must be a floating point
            # number between 0 and 1.
            sig { returns(Float) }
            attr_accessor :score_threshold

            # The ranker to use for the file search. If not specified will use the `auto`
            # ranker.
            sig do
              returns(
                T.nilable(
                  OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::Ranker::OrSymbol
                )
              )
            end
            attr_reader :ranker

            sig do
              params(
                ranker:
                  OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::Ranker::OrSymbol
              ).void
            end
            attr_writer :ranker

            # The ranking options for the file search. If not specified, the file search tool
            # will use the `auto` ranker and a score_threshold of 0.
            #
            # See the
            # [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings)
            # for more information.
            sig do
              params(
                score_threshold: Float,
                ranker:
                  OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::Ranker::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The score threshold for the file search. All values must be a floating point
              # number between 0 and 1.
              score_threshold:,
              # The ranker to use for the file search. If not specified will use the `auto`
              # ranker.
              ranker: nil
            )
            end

            sig do
              override.returns(
                {
                  score_threshold: Float,
                  ranker:
                    OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::Ranker::OrSymbol
                }
              )
            end
            def to_hash
            end

            # The ranker to use for the file search. If not specified will use the `auto`
            # ranker.
            module Ranker
              extend OpenAI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::Ranker
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AUTO =
                T.let(
                  :auto,
                  OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::Ranker::TaggedSymbol
                )
              DEFAULT_2024_08_21 =
                T.let(
                  :default_2024_08_21,
                  OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::Ranker::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    OpenAI::Beta::FileSearchTool::FileSearch::RankingOptions::Ranker::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
