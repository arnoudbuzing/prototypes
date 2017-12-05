BeginPackage["Prototypes`", {"PacletManager`"}]

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
Image3DCubeQ::usage = "Image3DCubeQ[image] returns True if the image width, height, and depth are all equal";
AlphaChannelQ::usage = "AlphaChannelQ[image] returns True if the image has an alpha channel";

(* paclet build utilities *)

PacletInformationDataset::usage = "PacletInformationDataset[paclet] returns paclet information as a dataset";
BuildPaclet::usage = "BuildPaclet[directory,context] builds a new version of the paclet in directory";

(* github utilities *)
BuildWikiDocumentation::usage = "BuildWikiDocumentation[directory,context] creates wiki pages for the symbols in the given context";

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

ImageStrictlyPortraitQ[image_Image] := Less @@ ImageDimensions[image]
ImageStrictlyPortraitQ[___] := False

ImagePortraitQ[image_Image] := LessEqual @@ ImageDimensions[image]
ImagePortraitQ[___] := False

ImageStrictlyLandscapeQ[image_Image] := Greater @@ ImageDimensions[image]
ImageStrictlyLandscapeQ[___] := False

ImageLandscapeQ[image_Image] := GreaterEqual @@ ImageDimensions[image]
ImageLandscapeQ[___] := False

ImageSquareQ[image_Image] := Equal @@ ImageDimensions[image]
ImageSquareQ[___] := False

Image3DCubeQ[image_Image3D] := Equal @@ ImageDimensions[image]
Image3DCubeQ[___] := False

AlphaChannelQ[image_Image] := If[RemoveAlphaChannel[image] == image, False, True]
AlphaChannelQ[image_Image3D] := If[RemoveAlphaChannel[image] == image, False, True]
AlphaChannelQ[___] := False

(* date *)

Prototypes::warning = "Warning: Changing function definition for ``.";
Message[Prototypes::warning,"DateObject"];
Message[Prototypes::warning,"Quantity"];

Unprotect[DateObject];
Unprotect[Quantity];
Round[d_DateObject, q_Quantity] ^:=  DateObject[  Round[AbsoluteTime[d], QuantityMagnitude@UnitConvert[q, "Seconds"]]]

(* paclet build utilities *)

PacletInformationDataset[paclet_String] := Dataset @ Association @ PacletInformation[paclet]

BuildPaclet[directory_, context_String] := Module[{paclet},
    Scan[ DeleteFile, FileNames["*.paclet",directory] ];
    paclet=PackPaclet[FileNameJoin[{directory,context}]];
    Scan[ PacletUninstall, PacletFind[context] ];
    paclet=Last@Sort@FileNames["*.paclet",directory];
    PacletInstall[paclet]
    ]

(* gihub utilities *)

BuildWikiDocumentation[directory_String, context_String] :=
 Module[{names, file},
  names = Names[context <> "`*"];
  (* write the index page *)
  file = OpenWrite[FileNameJoin[{directory, context <> ".md"}]];
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
