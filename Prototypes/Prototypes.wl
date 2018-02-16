PrintTemporary["Loading Prototypes paclet"];

BeginPackage["Prototypes`", {"PacletManager`"}];

InformationDataset::usage = "InformationDataset[ pattern ] gives usage information for functions matching the string pattern";
ImportFiles::usage = "ImportFiles[files, ...] evaluates as Map[Import, files]";
ImportDirectory::usage = "ImportDirectory[dir] imports all files in 'dir'. ImportDirectory[dir,patt] imports all files that match string pattern 'patt'";
GetFiles::usage = "GetFiles[files] evaluates as Map[Get, files]";
DirectoryFileList::usage = "DirectoryFileList[dir] returns all files under directory 'dir' and all its subdirectories";
DirectoryByteCount::usage = "DirectoryByteCount[dir] returns the byte count for directory 'dir'";
DirectorySize::usage = "DirectorySize[dir] returns the byte count for 'dir' as a quantity";
ToStringFileName::usage = "ToStringFileName[file] rewrites file as a classical string filename";
URLHash::usage = "URLHash[url] gives the hash for the content stored at the url";
$InputDirectoryName::usage = "$InputDirectoryName is the directory name for the current value of $InputFileName";
$ExtensionToFormat::usage = "$ExtensionToFormat associates file extensions with their format name";
$FormatToExtension::usage = "$FormatToExtension associates a file format with its list of supported file extensions";
SystemStringOpen::usage = "SystemStringOpen[string] determines the file format for 'string' and opens it with the default application";
(* animation *)
CreateGIFAnimation::usage = "CreateGIFAnimation[name,list] creates a GIF from 'list' and saves it in the Wolfram Cloud";
(* patterns *)
UnmatchQ::usage = "UnmatchQ[expr,form] is the same as Not[MatchQ[expr,form]]";
(* general language *)
By::usage = "By[head, data, func] evaluates as head[Map[func,data]]";
(* statistics *)
MeanBy::usage = "MeanBy[data, func] computes the mean of 'data' by using 'func'";
StandardDeviationBy::usage = "StandardDeviationBy[data, func] computes the standard deviation of 'data' by using 'func'";
MedianBy::usage = "MedianBy[data, func] computes the median of 'data' by using 'func'";
VarianceBy::usage = "VarianceBy[data, func] computes the variance of 'data' by using 'func'";
CommonestBy::usage = "CommonestBy[data, func] computes the commonest value of 'data' by using 'func'";
MinBy::usage = "MinBy[data, func] computes the minimum value of 'data' by using 'func'";
MaxBy::usage = "MaxBy[data, func] computes the maximum value of 'data' by using 'func'";
RarestBy::usage = "RarestBy[data, func] computes the rarest (least common) values of 'data' by using 'func'";
Rarest::usage = "Rarest[data] computes the rarest (least common) values of 'data'";
(* data science *)
DatasetMap::usage = "DatasetMap[func, expr] evaluates as Dataset[AssociationMap[func, expr]]";
DatasetImport::usage = "DatasetImport[file, ...] evaluates as Dataset[Import[ file, ...]]";
DatasetImportFiles::usage = "DatasetImportFiles[files, ...] evaluates as Map[Dataset, ImportFiles[files, ...]]";
(* strings *)
MakeString::usage = "MakeString[expr] turns the unevaluated form of 'expr' into an InputForm string";
StringFirst::usage = "StringFirst[string] returns the first character of 'string'";
StringLast::usage = "StringLast[string] returns the last character of 'string'";
StringRest::usage = "StringRest[string] returns string with the first character removed";
StringMost::usage = "StringMost[string] returns string with the last character removed";
(* geographics *)
RandomGeoPosition::usage = "RandomGeoPosition[] picks a random geo position";
(* image processing *)
ImageStrictlyPortraitQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is less than the image height";
ImagePortraitQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is less than or equal to the image height";
ImageStrictlyLandscapeQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is greater than the image height";
ImageLandscapeQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is greater than or equal to the image height";
ImageSquareQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is equal to the image height";
Image3DCubeQ::usage = "Image3DCubeQ[image] returns True if the image width, height, and depth are all equal";
ImageCropResize::usage = "ImageCropResize[image, dims] crops and resize an image to the specified dimensions";
AlphaChannelQ::usage = "AlphaChannelQ[image] returns True if the image has an alpha channel";
(* typesetting *)
Uniconize::usage = "Uniconize[icon] turns IconizedObject icon and returns the associated expression";
BoxSyntaxQ::usage = "BoxSyntaxQ[boxes] returns True if the gives boxes can be transformed into an expression without errors, and False otherwise";
(* paclet build utilities *)
PacletInformationDataset::usage = "PacletInformationDataset[paclet] returns paclet information as a dataset";
(* github utilities *)
BuildWikiDocumentation::usage = "BuildWikiDocumentation[directory,context] creates wiki pages for the symbols in the given context";
$BuildInfo::usage = "$BuildInfo gives build and version information as a textual string";
BuildInfo::usage = "BuildInfo[] copies build information to the clipboard and returns a button which does the same copy operation";
(* dock *)
DockButton::usage = "DockButton[name] represents a button that can be added to the Prototype dock";
$DockButtons::usage = "$DockButtons is a list of defined dock buttons";
(* server *)
ExpressionServer::usage = "ExpressionServer[host,port] starts a Wolfram expression server on host:port";
ExpressionEvaluate::usage = "ExpressionEvaluate[host,port,expr] evaluates 'expr' on the kernel listening at host:port";
(* resources *)
$LocalResourceObjects::usage = "$LocalResourceObjects gives the current local resource objects on your machine";
ResourceObjectManager::usage = "ResourceObjectManager[objects] gives an interface to manage resource objects";
ResourceObjectDataset::usage = "ResourceObjectDataset[objects] gives resource 'objects' as a dataset";

(* ordinal parts *)
Second::usage = "Second[expr] gives Part[expr,2]";
Third::usage = "Third[expr] gives Part[expr,3]";
Fourth::usage = "Fourth[expr] gives Part[expr,4]";
Fifth::usage = "Fifth[expr] gives Part[expr,5]";
Sixth::usage = "Sixth[expr] gives Part[expr,6]";
Seventh::usage = "Seventh[expr] gives Part[expr,7]";
Eighth::usage = "Eighth[expr] gives Part[expr,8]";
Ninth::usage = "Ninth[expr] gives Part[expr,9]";
Tenth::usage = "Tenth[expr] gives Part[expr,10]";
NextToLast::usage = "NextToLast[expr] gives Part[expr,-2]";
Ultimate::usage = "Ultimate[expr] gives Part[expr,-1]";
Penultimate::usage = "Penultimate[expr] gives Part[expr,-2]";
Antepenultimate::usage = "Antepenultimate[expr] gives Part[expr,-3]";
ElapsedTime::usage = "ElapsedTime[unit,expr] evaluates 'expr' and returns the elapsed time in the specified unit";
CreateNotebookIndex::usage = "CreateNotebookIndex[] creates a SearchIndexObject of all notebooks located in $InstallationDirectory";
QuickSearch::usage = "QuickSearch[] provides a quick interactive way to search all notebooks under $InstallationDirectory. You need to run CreateNotebookIndex[] once before using this function";

Begin["`Private`"];

(* general extensions *)

InformationDataset[pattern_] :=  Dataset[Association[ Map[ Function[ # -> ToExpression[# <> "::usage"] ],  Names[pattern]]]];

(* load dataset prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Files.wl"}] ];


(* animations *)

CreateGIFAnimation[
  name_String /; StringEndsQ[name, ".gif"],
  list_List] := Module[{object},
  object = CloudObject["animations/" <> name];
  Export[object, list, "GIF"];
  SetPermissions[object, "Public"];
  object
  ];

(* patterns *)

UnmatchQ[expr___] := Not[MatchQ[expr]];

(* language *)

By[head_, data_, func_] := head[ Map[func,data] ];

(* statistics *)

MeanBy[ data_, func_ ] := By[ Mean, data, func];
MedianBy[ data_, func_ ] := By[ Median, data, func];
StandardDeviationBy[ data_, func_ ] := By[ StandardDeviation, data, func ];
VarianceBy[ data_, func_ ] := By[ Variance, data, func ];
CommonestBy[ data_, func_ ] := By[ Commonest, data, func ];
MaxBy[ data_, func_ ] := By[ Max, data, func ];
MinBy[ data_, func_ ] := By[ Min, data, func ];

Rarest[ data_ ] := MinimalBy[Tally[data], Last][[All, 1]];
RarestBy[ data_, func_ ] := By[ Rarest, data, func];

(* load dataset prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Dataset.wl"}] ];

(* load string prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "String.wl"}] ];

(* load image processing prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Image.wl"}] ];

(* load paclet prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Paclet.wl"}] ];

If[ Head[$FrontEnd] === FrontEndObject ,
  (* load dock prototype functions *)
  Get[ FileNameJoin[{DirectoryName[$InputFileName], "Dock.wl"}] ];
  (* load frontend prototype functions *)
  Get[ FileNameJoin[{DirectoryName[$InputFileName], "FrontEnd.wl"}] ];
]

Get[ FileNameJoin[{DirectoryName[$InputFileName], "Server.wl"}] ];
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Client.wl"}] ];

(* load resource prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Resources.wl"}] ];

(* load search utilities *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Search.wl"}] ];

(* random extensions *)
RandomGeoPosition[] := GeoPosition[{RandomReal[{-90, 90}], RandomReal[{-180, 180}]}];

(* date *)

(*
Prototypes::warning = "Warning: Changing function definition for ``.";
Message[Prototypes::warning,"DateObject"];
Message[Prototypes::warning,"Quantity"];

Unprotect[DateObject];
Unprotect[Quantity];
Round[d_DateObject, q_Quantity] ^:=  DateObject[  Round[AbsoluteTime[d], QuantityMagnitude@UnitConvert[q, "Seconds"]]]
*)

(* typesetting *)

Uniconize[icon_IconizedObject] := First[icon];

(* github utilities *)

BuildWikiDocumentation[directory_String, context_String] :=
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
  ];

$BuildInfo := "Kernel:\n\tSystem id - " <> SystemInformation["Kernel", "SystemID"] <>
"\n\tRelease id - " <> SystemInformation["Kernel", "ReleaseID"] <>
"\n\tCreation date - " <> TextString[SystemInformation["Kernel", "CreationDate"]] <>
"\nFrontEnd:\n\tOperating system - " <> SystemInformation["FrontEnd", "OperatingSystem"] <>
"\n\tRelease id - " <> SystemInformation["FrontEnd", "ReleaseID"] <>
"\n\tCreation date - " <> TextString[SystemInformation["FrontEnd", "CreationDate"]];

BuildInfo[] := Module[ {},
  CopyToClipboard[$BuildInfo];
  Button[ Dataset[SystemInformation["Small"] //. {List[a : Repeated[_String -> _]] :> Association[a]}],CopyToClipboard[$BuildInfo]]
  ];

(* more parts *)
Second[expr_] := Part[expr,2];
Third[expr_] := Part[expr,3];
Fourth[expr_] := Part[expr,4];
Fifth[expr_] := Part[expr,5];
Sixth[expr_] := Part[expr,6];
Seventh[expr_] := Part[expr,7];
Eighth[expr_] := Part[expr,8];
Ninth[expr_] := Part[expr,9];
Tenth[expr_] := Part[expr,10];
NextToLast[expr_] := Part[expr,-2];
Ultimate[expr_] := Part[expr,-1];
Penultimate[expr_] := Part[expr,-2];
Antepenultimate[expr_] := Part[expr,-3];

Attributes[ElapsedTime] = {HoldRest};
ElapsedTime[unit_,expr_] := UnitConvert[ Quantity[First[AbsoluteTiming[expr]], "Seconds"], unit];

End[];
EndPackage[];
