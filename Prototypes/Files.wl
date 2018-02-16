(* file extensions *)

$InputDirectoryName := DirectoryName[$InputFileName];

ImportFiles[ files_List, a___ ] := Map[ Function[ Import[ #, a ] ], files ];

ImportDirectory[ dir_ /; DirectoryQ[dir], patt_:True ] := Module[{files},
  files = Select[ FileNames["*",dir], Function[ TrueQ[patt] || StringMatchQ[ #, patt ] ] ];
  ImportFiles[ files ]
  ];

GetFiles[ files_List ] := Map[ Get, files ];

DirectoryByteCount = Internal`DirectoryByteCount;

DirectorySize[ dir_ /; DirectoryQ[dir] ] := Quantity[ DirectoryByteCount[dir], "Bytes" ];

ToStringFileName[file_] := FileNameJoin[DeleteCases[FileNameSplit[file], "file:" | ""]];

URLHash[url : (_String | _URL), args___] := Module[{file, result},
  file = CreateTemporary[];
  URLDownload[url, file];
  result = FileHash[file, args];
  DeleteFile[file];
  result
  ];

$ExtensionToFormat = GroupBy[MapAt[StringDrop[#, 1] &, System`ConvertersDump`$extensionMappings, {All, 1}], First, #[[All, 2]] &];

$FormatToExtension = GroupBy[Reverse /@ MapAt[StringDrop[#, 1] &, System`ConvertersDump`$extensionMappings, {All, 1}], First, #[[All, 2]] &];

SystemStringOpen[s_?StringQ] := With[ {filename = FileNameJoin[{$TemporaryDirectory, CreateUUID[] <> First[$FormatToExtension[StringFormat[s]]] } ]},
    WriteString[filename, s];
    SystemOpen[File[filename]]
  ];

DirectoryFileList[dir_] := FileNames["*",ToStringFileName[dir],Infinity];
