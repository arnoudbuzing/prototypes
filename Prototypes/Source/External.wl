ExternalInstall["Python", package_String] := RunProcess[{"pip", "install", package}]

ExternalUninstall["Python", package_String] := RunProcess[{"pip", "uninstall", "-y", package}]

ExternalPackageList["Python"] := Module[{stdout, data},
  stdout = RunProcess[{"pip", "list"}, "StandardOutput"];
  data = Association @@
    Map[Rule @@ # &, Drop[ImportString[stdout, "Table"], 2]];
  Dataset[data]
  ]

ExternalPackageInformation["Python", package_String] := Module[{stdout},
  stdout = RunProcess[{"pip", "show", package}, "StandardOutput"];
  data = Map[StringSplit[StringTrim[#], ":", 2] &,
    StringSplit[stdout, "\n"]];
  data = Association @@
    Map[First[#] ->
        Last[StringTrim[#]] /. {"" -> Missing["NotAvailable"]} &,
     data];
  Dataset[data]
  ]
