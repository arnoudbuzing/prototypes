BeginPackage["a`"]

DatasetMap::usage = "DatasetMap[ func, expr ] evaluates as Dataset[ AssociationMap[ func, expr ]]"

Begin["`Private`"]

DatasetMap[ func_ , expr_ ] := Dataset[ AssociationMap[ func, expr ] ]

End[]

EndPackage[]
