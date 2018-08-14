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

StringSwap[string_String, a_String <-> b_String] :=  StringReplace[string, {a -> b, b -> a}]

StringComplement[s1_String, s2_String] := StringJoin@Complement[Characters[s1], Characters[s2]]

StringIntersection[s1_String, s2_String] := StringJoin@Intersection[Characters[s1], Characters[s2]]

StringUnion[s1_String, s2_String] := StringJoin@Union[Characters[s1], Characters[s2]]
