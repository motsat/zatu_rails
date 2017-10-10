class User < ApplicationRecord
  searchkick settings: {
    index: {
      analysis: {
        analyzer: {
          ja_analyzer: { type: :custom, 
                         char_filter: [ :icu_normalizer ], # Unicode正規化ウ゛ェ → ヴェ ＡＢＣ → ABC ① → 1 ㊤ → 上 Ⅲ → III ㌶ → ヘクタールとか
                         tokenizer: :ja_tokenizer,
                         filter: [ :cjk_width,  # 半角・全角などの統一
                                   :part_of_speech, 
                                   :kuromoji_baseform, # 日本語の動詞と形容詞を原型に戻すfilter
                                   ]
          }
        },
        filter:{
          #part_of_speech:{ type: :kuromoji_part_of_speech, stoptags: [ "副詞-助詞類接続" ] },
          # stoptagsはデフォでいいかも（全部やってくれる？）
          part_of_speech:{ type: :kuromoji_part_of_speech  # 品詞を除外。stoptags設定で個別に除外対象を選択できる。デフォは全て？
          },
          #synonym:{
          #  type: :synonym,
          #  synonyms_path: :synonyms.txt
          #}
        },
        tokenizer: {
          ja_tokenizer:{ type: :kuromoji_tokenizer, mode: :search, #user_dictionary: :user_dictionary.txt }
          }
        }
      }
    }
  }
end 
