(* github utilities *)

BuildWikiDocumentation[directory_String, context_String] :=
 Module[{names, file},
  names = Names[context <> "`*"];
  (* write the index page *)
  file = OpenWrite[FileNameJoin[{directory, "Home.md"}]];
  Scan[
   Function[{name},
    WriteString[file, "[`" <> name <> "`](" <> name <> ")\n\n"];
    WriteString[file, ToExpression[name <> "::usage"]];
    WriteString[file, "\n\n"]
    ], names];
  Close[file];
  (* write the function pages *)
  Scan[
   Function[{name},
    file = OpenWrite[FileNameJoin[{directory, name <> ".md"}]];
    WriteString[file, "# " <> name <> "\n\n"];
    WriteString[file, ToExpression[name <> "::usage"]];
    WriteString[file, "\n\n"];
    Close[file]
    ],
   names
   ]
  ];

$BuildInfo := "Kernel:\n\tSystem id - " <> SystemInformation["Kernel", "SystemID"] <>
"\n\tRelease id - " <> SystemInformation["Kernel", "ReleaseID"] <>
"\n\tCreation date - " <> TextString[SystemInformation["Kernel", "CreationDate"]] <>
"\nFrontEnd:\n\tOperating system - " <> SystemInformation["FrontEnd", "OperatingSystem"] <>
"\n\tRelease id - " <> SystemInformation["FrontEnd", "ReleaseID"] <>
"\n\tCreation date - " <> TextString[SystemInformation["FrontEnd", "CreationDate"]];

BuildInfo[] := Module[ {},
  ClickToCopy[ Dataset[SystemInformation["Small"] //. {List[a : Repeated[_String -> _]] :> Association[a]}], $BuildInfo ]
  ];
