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

If[ $SystemID === "Windows-x86-64",
  $AppDataDirectory = FileNameJoin[{$HomeDirectory, "AppData"}];
  $LocalAppDataDirectory = FileNameJoin[{$AppDataDirectory, "Local"}];
  $RoamingAppDataDirectory = FileNameJoin[{$AppDataDirectory, "Roaming"}];
]


FilePartition[file_String, size_] :=
 Module[{n, dir, filesize, count, in, uuid, partdir, out, bytes, done},
  count =
   If[IntegerQ[size], size,
    QuantityMagnitude[UnitConvert[size, "Bytes"]]];
  dir = DirectoryName[file];
  in = OpenRead[file, BinaryFormat -> True];
  uuid = CreateUUID[];
  partdir = CreateDirectory[FileNameJoin[{dir, uuid}]];
  i = 0;
  While[Length[bytes = BinaryReadList[in, "Byte", count]] > 0,
   out = OpenWrite[
     FileNameJoin[{partdir,
       "part-" <> IntegerString[(i++), 10, 16] <> ".data"}],
     BinaryFormat -> True];
   BinaryWrite[out, bytes, "Byte"];
   ];
  Close[out];
  Close[in];
  partdir
  ]

Options[FileJoin] = {FilePattern -> Automatic}

FileJoin[ parts_List, file_String, OptionsPattern[] ] :=  Module[{out, in, bytes},
out = OpenWrite[file, BinaryFormat -> True];
Map[
  Function[{f},
    in = OpenRead[f, BinaryFormat -> True];
    bytes = BinaryReadList[in, "Byte"];
    BinaryWrite[out, bytes, "Byte"];
    Close[in];
  ], parts];
  Close[out];
  file
]



FileJoin[partdir_String, name_String, OptionsPattern[] ] := Module[{parts, dir, file, out, in, bytes,pattern},
  pattern = OptionValue[FilePattern];
  If[ pattern === Automatic, pattern = "part-*.data"];
  parts = Sort[FileNames[pattern, partdir]];
  dir = DirectoryName[partdir];
  file = FileNameJoin[{dir, name}];
  FileJoin[parts,file]
  ]
