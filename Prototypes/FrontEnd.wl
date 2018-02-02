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


BoxSyntaxQ[boxes_,form_:StandardForm] := Not[MatchQ[MakeExpression[boxes, form],_ErrorBox]]

iconSpikey = Import["icons/spikey.png"];
iconPrototypes = Import["icons/prototypes.png"];
iconNeuralnetRepo = Import["icons/neuralnet-repo.png"];
iconGithub = Import["icons/github.png"];

SetOptions[ $FrontEndSession ,
 DockedCells -> {Cell[
    BoxData@ToBoxes@Row[{
      Tooltip[Button[iconSpikey, SystemOpen["paclet:guide/WolframRoot"]],"Open Documentation Center"],
      Tooltip[Button[iconPrototypes, CopyToClipboard[Prototypes`$BuildInfo]],"Copy build information"],
      Tooltip[Button[iconNeuralnetRepo, SystemOpen["https://resources.wolframcloud.com/NeuralNetRepository"]],"Open Neural Network Repository"],
      Tooltip[Button[iconGithub, SystemOpen["https://github.com/arnoudbuzing/prototypes"]],"Open Prototypes Repository"]

      }],
    "Text",CellFrameMargins -> 0, CellMargins -> 0]}]
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
