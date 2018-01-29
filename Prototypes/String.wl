(* strings *)

Attributes[MakeString] = {HoldAllComplete};
MakeString[e_] := ToString[HoldForm[e]]

StringFirst[string_String] := StringTake[string,1]

StringLast[string_String] := StringTake[string,-1]

StringRest[string_String] := StringTake[string,{2,-1}]

StringMost[string_String] := StringTake[string,{1,-2}]
