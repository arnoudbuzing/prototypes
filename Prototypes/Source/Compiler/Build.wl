$PrototypesCompilerDirectory = DirectoryName @ $InputFileName;

BuildCompilerLibraries[] := Module[ {},
  Echo @ FunctionCompileExportLibrary[ FileNameJoin[ { $PrototypesCompilerDirectory, $SystemID, "Integer64Identity.dll"} ], Function[{Typed[x, "Integer64"]}, x] ];
  ]

LoadCompilerLibraries[] := Module[{},
  Prototypes`Integer64Identity = LibraryFunctionLoad[ FileNameJoin[ { $PrototypesCompilerDirectory, $SystemID, "Integer64Identity.dll"} ] ];
  ]
