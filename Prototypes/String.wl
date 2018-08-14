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

StringSwap[string_String, a_String <-> b_String] :=  Module[{i1,i2,ok},
  i1 = Interval /@ StringPosition[string,a];
  i2 = Interval /@ StringPosition[string,b];
  ok = SameQ[ {Interval[]}, Union @ Flatten @ Outer[IntervalIntersection,i1,i2]];
  If[ ok,
  StringReplace[string, {a -> b, b -> a}],
  $Failed (* swapping can be problematic with things like "ab" <-> "bc"; give up on those cases for now *)
  ]

StringComplement[args___String] := StringJoin[Complement @@ Map[Characters, {args}]]

StringIntersection[args___String] := StringJoin[Intersection @@ Map[Characters, {args}]]

StringUnion[args___String] := StringJoin[Union @@ Map[Characters, {args}]]

StringDisjointQ[s1_String, s2_String] := DisjointQ[Characters[s1],Characters[s2]]

StringIntersectingQ[s1_String, s2_String] :=IntersectingQ[Characters[s1],Characters[s2]]

StringSort[s1_String] := StringJoin@Sort[Characters[s1]]
