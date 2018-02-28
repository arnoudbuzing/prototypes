

$CrashDumpPattern = Switch[
  $SystemID,
  "Windows-x86-64", "Mathematica*.dmp" | "WolframKernel*.dmp",
  "MacOSX-x86-64", "Mathematica*.crash" | "WolframKernel*.crash",
  _ , ""
]

CrashDumps[] := CrashDumps[ $CrashDumpsDirectory ];

CrashDumps[ directory_ ] := FileNames[ $CrashDumpPattern, directory ];


ReportCrashDump[ assoc_Association ] := Module[{attached={}},
  If[ StringQ[assoc["Notebook"]] && FileType[assoc["Notebook"]]===File, AppendTo[attached,assoc["Notebook"]] ];
  If[ StringQ[assoc["CrashDump"]] && FileType[assoc["CrashDump"]]===File, AppendTo[attached,assoc["CrashDump"]] ];
  SendMail[
 <|
  "To" -> assoc["Recipient"],
  "Subject" -> "Crash report",
  "TextBody" -> assoc["Message"] <> "\n\n\n" <> $BuildInfo,
  "AttachedFiles" -> attached
  |>
 ]
]
