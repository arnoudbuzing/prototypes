(* strings *)

StringRest[string_String] := StringTake[string,{2,-1}]

StringMost[string_String] := StringTake[string,{1,-2}]
