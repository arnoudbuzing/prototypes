$PrototypesLibraryDirectory = DirectoryName @ $InputFileName;

BuildCompilerLibraries[directory_:$PrototypesLibraryDirectory] := Module[ {cdir,files,ext},
  cdir = FileNameJoin[ { directory, "Libraries", $SystemID }];
  If[FileType[cdir]=!=Directory,CreateDirectory[cdir,CreateIntermediateDirectories->True]];
  ext = <|"Windows-x86-64" -> ".dll", "MacOSX-x86-64" -> ".dylib", "Linux-x86-64" -> ".so"|>;
  files = FileNames[ "*.wl", FileNameJoin[{directory,"Source"}] ];
  Scan[
    Function[ {file},
      Echo @ file;
      function = Import[ file, "Package" ];
      FunctionCompileExportLibrary[ FileNameJoin[ { cdir, FileBaseName[file] <> ext[$SystemID]} ], function ]
      ],
      files
    ]
  ]

LoadCompilerLibraries[directory_:$PrototypesLibraryDirectory] := Module[{files},
  files = FileNames[ "*.dll", FileNameJoin[{directory,"Libraries",$SystemID}] ];
  Begin["Prototypes`"];
  Scan[
    Function[{file},
      Echo @ file;
      With[{n=ToExpression[FileBaseName[file]]}, Set[n,LibraryFunctionLoad[file]];
      ]
    ],
    files
  ];
  End[];
]