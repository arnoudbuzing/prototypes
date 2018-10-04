SoftwareInstall[ package_String ] := SoftwareInstall[ $SystemID, package ]

SoftwareInstall[ "Windows-x86-64", package_String ] := Null


(* ------------------------- *)
SoftwareUninstall[ package ] := SoftwareUninstall[ $SystemID, package ]

SoftwareUninstall[ "Windows-x86-64", package ] := Null

(* ------------------------- *)

SoftwareList[] := SoftwareList[$SystemID]

SoftwareList["Windows-x86-64"] := Module[{text},
  PrintTemporary[ProgressIndicator[Appearance -> "Percolate"]];
  text = StringTrim[ RunProcess[{"wmic", "product", "get", "/format:list"}, "StandardOutput"]];
  text = StringReplace[text, "\r\n" -> "\n"];
  text = StringSplit[text, "\n\n\n"];
  text = Map[StringSplit[#, "\n"] &, text];
  Dataset@Map[Association@Map[Function[Rule @@ StringSplit[#, "=", 2]], #] &, text]
  ]

(* ------------------------- *)
