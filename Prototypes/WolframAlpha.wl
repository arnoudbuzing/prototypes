WolframBeta[ input_String, args___ ] := Module[{language, translation},
  language = LanguageIdentify[input];
  translation = If[language =!= Entity["Language", "English"], TextTranslation[input, language -> "English"], input];
  WolframAlpha[translation, args]
]
