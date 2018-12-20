$PrototypesCompilerDirectory = DirectoryName @ $InputFileName;


BuildCompilerLibraries[directory_] := Module[ {files,ext},
  ext = <|"Windows-x86-64" -> ".dll", "MacOSX-x86-64" -> ".dylib", "Linux-x86-64" -> ".so"|>;
  files = FileNames[ "*.wl", FileNameJoin[{directory,"Source"}] ];
  Map[
    Function[ {file},
      Echo @ file;
      function = Import[ file, "Package" ];
      FunctionCompileExportLibrary[ FileNameJoin[ { directory, "Libraries", $SystemID, FileBaseName[file] <> ext[$SystemID]} ], function ]
      ],
      files
    ]
  ]

LoadCompilerLibraries[directory_] := Module[{files},
  files = FileNames[ "*.dll", FileNameJoin[{directory,"Libraries",$SystemID}] ];
  Begin["Prototypes`"];
  Map[
    Function[{file},
      Echo @ file;
      With[{n=ToExpression[FileBaseName[file]]},
        Set[n,LibraryFunctionLoad[file]];
      ]
    ],
    files
  ];
  End[];
]
