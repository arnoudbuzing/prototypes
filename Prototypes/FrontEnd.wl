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

BoxSyntaxQ[boxes_] := UnsameQ[ErrorBox, Head[MakeExpression[boxes, StandardForm]]]
