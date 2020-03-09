Disable["SummaryBox"] := Module[{},
  Unprotect[BoxForm`ArrangeSummaryBox];
  BoxForm`ArrangeSummaryBox = Function[RowBox[{"\[LeftGuillemet]", #1, "\[RightGuillemet]"}]]
]