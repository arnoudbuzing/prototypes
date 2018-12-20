Function[{Typed[n, "Integer64"]},
  Module[{m, Typed[list, TypeSpecifier["PackedArray"]["Integer64", 1]] = {n}},
  m = n;
  While[m > 1,
   m = If[Mod[m, 2] === 0, Quotient[m, 2], 3*m + 1];
   AppendTo[list, m]]; list]
 ]
