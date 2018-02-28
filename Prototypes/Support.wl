

$CrashDumpPattern = Switch[
  $SystemID,
  "Windows-x86-64", "Mathematica*.dmp" | "WolframKernel*.dmp",
  "MacOSX-x86-64", "Mathematica*.crash" | "WolframKernel*.crash",
  _ , ""
]

CrashDumps[] := CrashDumps[ $CrashDumpsDirectory ];

CrashDumps[ directory_ ] := FileNames[ $CrashDumpPattern, directory ];


ReportCrashDump[ assoc_Association ] := Module[{},
  SendMail[
 <|
  "To" -> assoc["Recipient"],
  "Subject" -> "Crash report",
  "TextBody" -> assoc["Message"] <> "\n\n\n" <> $BuildInfo,
  "AttachedFiles" -> {assoc["Notebook"], assoc["CrashDump"]}
  |>
 ]
]
