BeginPackage["a`"]

DatasetMap::usage = "DatasetMap[ func, expr ] evaluates as Dataset[ AssociationMap[ func, expr ]]"

ImportFiles::usage = "ImportFiles[ files, ...] evaluates like Map[ Import, files]"

Begin["`Private`"]

DatasetMap[ func_ , expr_ ] := Dataset[ AssociationMap[ func, expr ] ]

ImportFiles[ files_List, a___ ] := Map[ Function[ Import[ #, a ] ], files ]


End[]

EndPackage[]
