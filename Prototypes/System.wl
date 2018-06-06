Prototype["StringJoin"] := Module[{},
  Unprotect[StringJoin];
  StringJoin[args___ /; MemberQ[{args}, _Integer | _Real]] :=  Apply[StringJoin, {args} /. {n : (_Integer | _Real) :> ToString[n, InputForm]}];
  Protect[StringJoin];
  ]
