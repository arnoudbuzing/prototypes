BeginPackage["Sugar`"]

InformationDataset::usage = "InformationDataset[ pattern ] gives usage information for functions matching the string pattern";

ImportFiles::usage = "ImportFiles[files, ...] evaluates as Map[Import, files]";
ImportDirectory::usage = "ImportDirectory[dir] imports all files in 'dir'. ImportDirectory[dir,patt] imports all files that match string pattern 'patt'";
GetFiles::usage = "GetFiles[files] evaluates as Map[Get, files]";
DirectoryByteCount::usage = "DirectoryByteCount[dir] returns the byte count for directory 'dir'";
DirectorySize::usage = "DirectorySize[dir] returns the byte count for 'dir' as a quantity";

$InputDirectoryName::usage = "$InputDirectoryName is the directory name for the current value of $InputFileName";
$ExtensionToFormat::usage = "$ExtensionToFormat associates file extensions with their format name";
$FormatToExtension::usage = "$FormatToExtension associates a file format with its list of supported file extensions";

SystemStringOpen::usage = "SystemStringOpen[string] determines the file format for 'string' and opens it with the default application"

DatasetMap::usage = "DatasetMap[func, expr] evaluates as Dataset[AssociationMap[func, expr]]";
DatasetImport::usage = "DatasetImport[file, ...] evaluates as Dataset[Import[ file, ...]]";
DatasetImportFiles::usage = "DatasetImportFiles[files, ...] evaluates as Map[Dataset, ImportFiles[files, ...]]";

RandomGeoPosition::usage = "RandomGeoPosition[] picks a random geo position";

ImageStrictlyPortraitQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is less than the image height";
ImagePortraitQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is less than or equal to the image height";
ImageStrictlyLandscapeQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is greater than the image height";
ImageLandscapeQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is greater than or equal to the image height";
ImageSquareQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is equal to the image height";

CreateWikiDocumentation::usage = "CreateWikiDocumentation[directory,context] creates wiki pages for the symbols in the given context"
Begin["`Private`"]

(* general extensions *)

InformationDataset[pattern_] :=  Dataset[Association[ Map[ Function[ # -> ToExpression[# <> "::usage"] ],  Names[pattern]]]]

(* file extensions *)

$InputDirectoryName := DirectoryName[$InputDirectoryName];

ImportFiles[ files_List, a___ ] := Map[ Function[ Import[ #, a ] ], files ]

ImportDirectory[ dir_ /; DirectoryQ[dir], patt_:True ] := Module[{files},
  files = Select[ FileNames["*",dir], Function[ TrueQ[patt] || StringMatchQ[ #, patt ] ] ];
  ImportFiles[ files ]
  ]

GetFiles[ files_List ] := Map[ Get, files ]

DirectoryByteCount = Internal`DirectoryByteCount;

DirectorySize[ dir_ /; DirectoryQ[dir] ] := Quantity[ DirectoryByteCount[dir], "Bytes" ];

$ExtensionToFormat = GroupBy[MapAt[StringDrop[#, 1] &, System`ConvertersDump`$extensionMappings, {All, 1}], First, #[[All, 2]] &]

$FormatToExtension = GroupBy[Reverse /@ MapAt[StringDrop[#, 1] &, System`ConvertersDump`$extensionMappings, {All, 1}], First, #[[All, 2]] &]

SystemStringOpen[s_?StringQ] := With[ {filename = FileNameJoin[{$TemporaryDirectory, CreateUUID[] <> First[$FormatToExtension[StringFormat[s]]] } ]},
    WriteString[filename, s];
    SystemOpen[File[filename]]
  ]
(* dataset extensions *)

DatasetMap[ func_ , expr_ ] := Dataset[ AssociationMap[ func, expr ] ]

DatasetImport[ file_, a___] := Dataset[ Import[ file, a ] ]

DatasetImportFiles[ files_, a___] := Map[ Dataset, ImportFiles[ files, a]]

(* random extensions *)
RandomGeoPosition[] := GeoPosition[{RandomReal[{-90, 90}], RandomReal[{-180, 180}]}]

(* image extensions *)

ImageStrictlyPortraitQ[image_] := Less @@ ImageDimensions[image]

ImagePortraitQ[image_] := LessEqual @@ ImageDimensions[image]

ImageStrictlyLandscapeQ[image_] := Greater @@ ImageDimensions[image]

ImageLandscapeQ[image_] := GreaterEqual @@ ImageDimensions[image]

ImageSquareQ[image_] := Equal @@ ImageDimensions[image]

(* date *)

Sugar::warning = "Warning: Changing function definition for ``.";
Message[Sugar::warning,"DateObject"];
Message[Sugar::warning,"Quantity"];

Unprotect[DateObject];
Unprotect[Quantity];
Round[d_DateObject, q_Quantity] ^:=  DateObject[  Round[AbsoluteTime[d], QuantityMagnitude@UnitConvert[q, "Seconds"]]]


CreateWikiDocumentation[directory_String, context_String] :=
 Module[{names, file},
  names = Names[context <> "`*"];
  (* write the index page *)
  file = OpenWrite[FileNameJoin[{directory, "Home.md"}]];
  Scan[
   Function[{name},
    WriteString[file, "[`" <> name <> "`](" <> name <> ")\n\n"];
    WriteString[file, ToExpression[name <> "::usage"]];
    WriteString[file, "\n\n"]
    ], names];
  Close[file];
  (* write the function pages *)
  Scan[
   Function[{name},
    file = OpenWrite[FileNameJoin[{directory, name <> ".md"}]];
    WriteString[file, "# " <> name <> "\n\n"];
    WriteString[file, ToExpression[name <> "::usage"]];
    WriteString[file, "\n\n"];
    Close[file]
    ],
   names
   ]
  ]


End[]

EndPackage[]
