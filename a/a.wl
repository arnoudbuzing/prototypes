BeginPackage["a`"]

ImportFiles::usage = "ImportFiles[ files, ...] evaluates as Map[ Import, files] with common settings taken from '...'"

ExportFiles::usage = "ExportFiles[ files, ...] evaluates like Map[ Export, files] with common settings taken from '...'"

GetFiles::usage = "GetFiles[ files ] evaluates like Map[ Get, files]"

DatasetMap::usage = "DatasetMap[ func, expr ] evaluates as Dataset[ AssociationMap[ func, expr ]]"

DatasetImport::usage = "DatasetImport[ file, ...] evaluates as Dataset[ Import[ file, ...] ]"

DatasetImportFiles::usage = "DatasetImportFiles[ files, ...] evaluates as Map[ Dataset, ImportFiles[ files, ...]]"

Begin["`Private`"]

ImportFiles[ files_List, a___ ] := Map[ Function[ Import[ #, a ] ], files ]

ExportFiles[ files_List, a___ ] := Map[ Function[ Export[ #, a ] ], files ]

GetFiles[ files_List ] := Map[ Get, files ]

DatasetMap[ func_ , expr_ ] := Dataset[ AssociationMap[ func, expr ] ]

DatasetImport[ file_, a___] := Dataset[ Import[ files, a ] ]

DatasetImportFiles[ files, a___] := Map[ Dataset, ImportFiles[ files, a]]

End[]

EndPackage[]
