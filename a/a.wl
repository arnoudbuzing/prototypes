BeginPackage["a`"]

DatasetMap::usage = "DatasetMap[ func, expr ] evaluates as Dataset[ AssociationMap[ func, expr ]]"

ImportFiles::usage = "ImportFiles[ files, ...] evaluates as Map[ Import, files] with common settings taken from '...'"

ExportFiles::usage = "ExportFiles[ files, ...] evaluates like Map[ Export, files] with common settings taken from '...'"

GetFiles::usage = "GetFiles[ files ] evaluates like Map[ Get, files]"

Begin["`Private`"]

DatasetMap[ func_ , expr_ ] := Dataset[ AssociationMap[ func, expr ] ]

ImportFiles[ files_List, a___ ] := Map[ Function[ Import[ #, a ] ], files ]

ExportFiles[ files_List, a___ ] := Map[ Function[ Export[ #, a ] ], files ]

GetFiles[ files_List ] := Map[ Get, files ]

End[]

EndPackage[]
