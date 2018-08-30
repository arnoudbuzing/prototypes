FileTranslate[ file:(_String|_File|_URL), opts___ ] := Module[ {text,sentences,translation},
 text = Import[file,"Text"];
 sentences = TextSentences[text];
 translation = TextTranslation[#,opts]& /@ sentences;
 translation
 ]
