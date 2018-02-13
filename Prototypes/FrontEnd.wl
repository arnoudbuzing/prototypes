(* add Alt-' keyboard shortcut to insert matching parentheses into a notebook *)

FrontEndExecute[
 FrontEnd`AddMenuCommands["InsertMatchingParentheses",
  {MenuItem[
    "Matching \"\"",
    FrontEndExecute[
     NotebookWrite[EvaluationNotebook[], "\"\[Placeholder]\"",
      Placeholder]; NotebookDelete[EvaluationNotebook[]]],
    MenuEvaluator -> "System",
    Global`MenuKey["'", Global`Modifiers -> {"Command"}]
    ]}]]

(* Alt-/ shortcut to insert matching comment delimiters in a notebook *)

FrontEndExecute[
   FrontEnd`AddMenuCommands[
    "InsertMatchingParentheses", {MenuItem["Matching (* *)",
      FrontEndExecute[
       NotebookWrite[EvaluationNotebook[], "(* \[Placeholder] *)",
        Placeholder]; NotebookDelete[EvaluationNotebook[]]],
      MenuEvaluator -> "System",
      Global`MenuKey["/", Global`Modifiers -> {"Command"}]]}]]


QuickSearch[] := DynamicModule[{index, input = "", result = ConstantArray["",5], type},
  index = SearchIndexObject["NotebookIndex"];
  Column[{
    InputField[Dynamic[input], String, ContinuousAction -> True],
    Dynamic[
      If[input =!= "",
        result = TextSearch[index, input, MaxItems -> 5];
        If[ result =!= $Failed,
          result = result[All];
          result = Map[
            Function[
              type = Part[FileNameSplit[#["ReferenceLocation"]], -2];
              Row[{type, " ", Hyperlink[#["Title"], #["ReferenceLocation"]]}] ],
              result
          ];
          result = PadRight[result,5,""],
          result = ConstantArray["",5]
        ];
      Column[result]
    ]]
  }]
]


BoxSyntaxQ[boxes_,form_:StandardForm] := Not[MatchQ[MakeExpression[boxes, form],_ErrorBox]]

(*

CreatePalette[
  Column[{
    TextCell["Prototypes", "Title"],
    TextCell["A paclet with useful functions", "SubTitle"],
    TextCell["By: Arnoud Buzing", "Author"]
    }
  ]
]

*)

(* TODO: ArrangeNotebooks[] -- arrange notebooks onscreen in an ordered fashion
SystemInformation["Devices", "ScreenInformation"]
*)
