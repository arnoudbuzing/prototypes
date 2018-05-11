WolframBeta[ input_String, "SpokenResult", args___ ] := Module[{language, translation,result},
  language = LanguageIdentify[input];
  translation = If[language =!= Entity["Language", "English"], TextTranslation[input, language -> "English"], input];
  result = WolframAlpha[translation, "SpokenResult", args];
  If[language =!= Entity["Language", "English"], TextTranslation[result, "English" -> language], result]
]


WolframBeta[ input_String, args___ ] := Module[{language, translation},
  language = LanguageIdentify[input];
  translation = If[language =!= Entity["Language", "English"], TextTranslation[input, language -> "English"], input];
  WolframAlpha[translation, args]
]
