$PrototypesCompilerDirectory = DirectoryName @ $InputFileName;

BuildCompilerLibraries[] := Module[ {},
  FunctionCompileExportLibrary[ FileNameJoin[ { $PrototypesCompilerDirectory, $SystemID, "Integer64Identity"} ], Function[{Typed[x, "Integer64"]}, x] ];
  ]

LoadCompilerLibraries[] := Module[{},
  Integer64Identity = LibraryFunctionLoad[ FileNameJoin[ { $PrototypesCompilerDirectory, $SystemID, "Integer64Identity"} ] ];
  ]
