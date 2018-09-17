Attributes[Antonyms] = {Listable};
Antonyms[word_String] := Flatten[WordData[word, "Antonyms"][[All, 2]]];

Attributes[Synonyms] = {Listable};
Synonyms[word_String] := Flatten[WordData[word, "Synonyms"][[All, 2]]];

NounQ[word_String] := MemberQ[Union[WordData[word][[All, 2]]], "Noun"];
VerbQ[word_String] := MemberQ[Union[WordData[word][[All, 2]]], "Verb"];
AdjectiveQ[word_String] := MemberQ[Union[WordData[word][[All, 2]]], "Adjective"];
AdverbQ[word_String] := MemberQ[Union[WordData[word][[All, 2]]], "Adverb"];



$EnglishWords := Module[ {file,words},
  file = FileNameJoin[{$UserBaseDirectory, "ApplicationData", "Prototypes", "EnglishWords.mx"}];
  If[ FileType[file] === None,
    $EnglishWords = Import["https://github.com/dwyl/english-words/blob/master/words.txt?raw=true", "Lines"];
    DumpSave[file,$EnglishWords]
    ,
    Get[file]
  ];
  $EnglishWords
]
