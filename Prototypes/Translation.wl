FileTranslate[ file_String, opts___ ] := Module[ {text},
 text = Import[file,"Text"];
 translation = TextTranslation[text,opts];
 translation
 ]
