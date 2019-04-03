SetOptions[ $Output, PageWidth -> Infinity ];

Needs["Lint`"]

files = FileNames["*.wl", ".", Infinity];

Scan[ 
  Function[ {file},
    Module[ {lints},
      lints = LintFile[file];
      If[ lints =!= {} ,    
		report = LintFileReport[ file, lints ];
        Print["\n================================================================================"];
        Print[file];
        Print["================================================================================\n"];
        Print[ report ];
        Print["\n================================================================================\n"];
      ]
    ]
  ], 
  files ]
