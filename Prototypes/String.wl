(* strings *)

Attributes[MakeString] = {HoldAllComplete};
MakeString[e_] := ToString[Unevaluated[e],InputForm]

StringFirst[string_String] := StringTake[string,1]

StringLast[string_String] := StringTake[string,-1]

StringRest[string_String] := StringTake[string,{2,-1}]

StringMost[string_String] := StringTake[string,{1,-2}]


$UUIDStringPattern =
 Repeated[HexadecimalCharacter, 8] ~~ "-" ~~
  Repeated[HexadecimalCharacter, 4] ~~ "-" ~~
  Repeated[HexadecimalCharacter, 4] ~~ "-" ~~
  Repeated[HexadecimalCharacter, 4] ~~ "-" ~~
  Repeated[HexadecimalCharacter, 12];


CapitalizeSentences[string_] := StringReplace[string, Map[# -> Capitalize[#] &, TextSentences[string]]]
