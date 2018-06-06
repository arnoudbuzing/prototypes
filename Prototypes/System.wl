Prototype["StringJoin"] := Module[{},
  Unprotect[StringJoin];
  StringJoin[args___ /; MemberQ[{args}, _Integer | _Real]] := Apply[StringJoin, Map[ToString, {args}]]
  ]
