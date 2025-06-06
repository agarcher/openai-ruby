# typed: strong

module OpenAI
  module Models
    module ChatModel
      extend OpenAI::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, OpenAI::ChatModel) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      GPT_4_1 = T.let(:"gpt-4.1", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_1_MINI = T.let(:"gpt-4.1-mini", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_1_NANO = T.let(:"gpt-4.1-nano", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_1_2025_04_14 =
        T.let(:"gpt-4.1-2025-04-14", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_1_MINI_2025_04_14 =
        T.let(:"gpt-4.1-mini-2025-04-14", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_1_NANO_2025_04_14 =
        T.let(:"gpt-4.1-nano-2025-04-14", OpenAI::ChatModel::TaggedSymbol)
      O4_MINI = T.let(:"o4-mini", OpenAI::ChatModel::TaggedSymbol)
      O4_MINI_2025_04_16 =
        T.let(:"o4-mini-2025-04-16", OpenAI::ChatModel::TaggedSymbol)
      O3 = T.let(:o3, OpenAI::ChatModel::TaggedSymbol)
      O3_2025_04_16 = T.let(:"o3-2025-04-16", OpenAI::ChatModel::TaggedSymbol)
      O3_MINI = T.let(:"o3-mini", OpenAI::ChatModel::TaggedSymbol)
      O3_MINI_2025_01_31 =
        T.let(:"o3-mini-2025-01-31", OpenAI::ChatModel::TaggedSymbol)
      O1 = T.let(:o1, OpenAI::ChatModel::TaggedSymbol)
      O1_2024_12_17 = T.let(:"o1-2024-12-17", OpenAI::ChatModel::TaggedSymbol)
      O1_PREVIEW = T.let(:"o1-preview", OpenAI::ChatModel::TaggedSymbol)
      O1_PREVIEW_2024_09_12 =
        T.let(:"o1-preview-2024-09-12", OpenAI::ChatModel::TaggedSymbol)
      O1_MINI = T.let(:"o1-mini", OpenAI::ChatModel::TaggedSymbol)
      O1_MINI_2024_09_12 =
        T.let(:"o1-mini-2024-09-12", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O = T.let(:"gpt-4o", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_2024_11_20 =
        T.let(:"gpt-4o-2024-11-20", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_2024_08_06 =
        T.let(:"gpt-4o-2024-08-06", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_2024_05_13 =
        T.let(:"gpt-4o-2024-05-13", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_AUDIO_PREVIEW =
        T.let(:"gpt-4o-audio-preview", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_AUDIO_PREVIEW_2024_10_01 =
        T.let(
          :"gpt-4o-audio-preview-2024-10-01",
          OpenAI::ChatModel::TaggedSymbol
        )
      GPT_4O_AUDIO_PREVIEW_2024_12_17 =
        T.let(
          :"gpt-4o-audio-preview-2024-12-17",
          OpenAI::ChatModel::TaggedSymbol
        )
      GPT_4O_AUDIO_PREVIEW_2025_06_03 =
        T.let(
          :"gpt-4o-audio-preview-2025-06-03",
          OpenAI::ChatModel::TaggedSymbol
        )
      GPT_4O_MINI_AUDIO_PREVIEW =
        T.let(:"gpt-4o-mini-audio-preview", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_MINI_AUDIO_PREVIEW_2024_12_17 =
        T.let(
          :"gpt-4o-mini-audio-preview-2024-12-17",
          OpenAI::ChatModel::TaggedSymbol
        )
      GPT_4O_SEARCH_PREVIEW =
        T.let(:"gpt-4o-search-preview", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_MINI_SEARCH_PREVIEW =
        T.let(:"gpt-4o-mini-search-preview", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_SEARCH_PREVIEW_2025_03_11 =
        T.let(
          :"gpt-4o-search-preview-2025-03-11",
          OpenAI::ChatModel::TaggedSymbol
        )
      GPT_4O_MINI_SEARCH_PREVIEW_2025_03_11 =
        T.let(
          :"gpt-4o-mini-search-preview-2025-03-11",
          OpenAI::ChatModel::TaggedSymbol
        )
      CHATGPT_4O_LATEST =
        T.let(:"chatgpt-4o-latest", OpenAI::ChatModel::TaggedSymbol)
      CODEX_MINI_LATEST =
        T.let(:"codex-mini-latest", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_MINI = T.let(:"gpt-4o-mini", OpenAI::ChatModel::TaggedSymbol)
      GPT_4O_MINI_2024_07_18 =
        T.let(:"gpt-4o-mini-2024-07-18", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_TURBO = T.let(:"gpt-4-turbo", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_TURBO_2024_04_09 =
        T.let(:"gpt-4-turbo-2024-04-09", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_0125_PREVIEW =
        T.let(:"gpt-4-0125-preview", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_TURBO_PREVIEW =
        T.let(:"gpt-4-turbo-preview", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_1106_PREVIEW =
        T.let(:"gpt-4-1106-preview", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_VISION_PREVIEW =
        T.let(:"gpt-4-vision-preview", OpenAI::ChatModel::TaggedSymbol)
      GPT_4 = T.let(:"gpt-4", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_0314 = T.let(:"gpt-4-0314", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_0613 = T.let(:"gpt-4-0613", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_32K = T.let(:"gpt-4-32k", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_32K_0314 = T.let(:"gpt-4-32k-0314", OpenAI::ChatModel::TaggedSymbol)
      GPT_4_32K_0613 = T.let(:"gpt-4-32k-0613", OpenAI::ChatModel::TaggedSymbol)
      GPT_3_5_TURBO = T.let(:"gpt-3.5-turbo", OpenAI::ChatModel::TaggedSymbol)
      GPT_3_5_TURBO_16K =
        T.let(:"gpt-3.5-turbo-16k", OpenAI::ChatModel::TaggedSymbol)
      GPT_3_5_TURBO_0301 =
        T.let(:"gpt-3.5-turbo-0301", OpenAI::ChatModel::TaggedSymbol)
      GPT_3_5_TURBO_0613 =
        T.let(:"gpt-3.5-turbo-0613", OpenAI::ChatModel::TaggedSymbol)
      GPT_3_5_TURBO_1106 =
        T.let(:"gpt-3.5-turbo-1106", OpenAI::ChatModel::TaggedSymbol)
      GPT_3_5_TURBO_0125 =
        T.let(:"gpt-3.5-turbo-0125", OpenAI::ChatModel::TaggedSymbol)
      GPT_3_5_TURBO_16K_0613 =
        T.let(:"gpt-3.5-turbo-16k-0613", OpenAI::ChatModel::TaggedSymbol)

      sig { override.returns(T::Array[OpenAI::ChatModel::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
