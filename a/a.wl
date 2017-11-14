BeginPackage["a`"]

InformationDataset::usage = "InformationDataset[ pattern ] gives usage information for functions matching the string pattern";

ImportFiles::usage = "ImportFiles[files, ...] evaluates as Map[Import, files]";
ExportFiles::usage = "ExportFiles files, ...] evaluates as Map[Export, files]";
GetFiles::usage = "GetFiles[files] evaluates as Map[Get, files]";
DirectoryByteCount::usage = "DirectoryByteCount[dir] returns the byte count for directory 'dir'";
DirectorySize::usage = "DirectorySize[dir] returns the byte count for 'dir' as a quantity";

DatasetMap::usage = "DatasetMap[func, expr] evaluates as Dataset[AssociationMap[func, expr]]";
DatasetImport::usage = "DatasetImport[file, ...] evaluates as Dataset[Import[ file, ...]]";
DatasetImportFiles::usage = "DatasetImportFiles[files, ...] evaluates as Map[Dataset, ImportFiles[files, ...]]";

RandomGeoPosition::usage = "RandomGeoPosition[] picks a random geo position";

ImageStrictlyPortraitQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is less than the image height";
ImagePortraitQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is less than or equal to the image height";
ImageStrictlyLandscapeQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is greater than the image height";
ImageLandscapeQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is greater than or equal to the image height";
ImageSquareQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is equal to the image height";

Begin["`Private`"]

(* general extensions *)

InformationDataset[pattern_] :=  Dataset[Association[ Map[ Function[ # -> ToExpression[# <> "::usage"] ],  Names[pattern]]]]

(* file extensions *)

ImportFiles[ files_List, a___ ] := Map[ Function[ Import[ #, a ] ], files ]

ExportFiles[ files_List, a___ ] := Map[ Function[ Export[ #, a ] ], files ]

GetFiles[ files_List ] := Map[ Get, files ]

DirectoryByteCount = Internal`DirectoryByteCount;

DirectorySize[ dir_ /; DirectoryQ[dir] ] := Quantity[ DirectoryByteCount[dir] ];

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

End[]

EndPackage[]
