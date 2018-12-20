$PrototypesCompilerDirectory = DirectoryName @ $InputFileName;

BuildCompilerLibraries[directory_] := Module[ {},
  Echo @ FunctionCompileExportLibrary[ FileNameJoin[ { directory, $SystemID, "Integer64Identity.dll"} ], Function[{Typed[x, "Integer64"]}, x] ];
  ]


Integer64Identity = LibraryFunctionLoad[ FileNameJoin[ { $PrototypesCompilerDirectory, $SystemID, "Integer64Identity.dll"} ] ];

(*
LoadCompilerLibraries[] := Module[{},
  Prototypes`Integer64Identity = LibraryFunctionLoad[ FileNameJoin[ { $PrototypesCompilerDirectory, $SystemID, "Integer64Identity.dll"} ] ];
  ]
*)
