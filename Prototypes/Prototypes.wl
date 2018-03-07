PrintTemporary["Loading ",ToString[Length[Names["Prototypes`*"]]], " prototype functions"];

BeginPackage["Prototypes`", {"PacletManager`"}];

Get[ FileNameJoin[{DirectoryName[$InputFileName], "Usage.wl"}] ];

Begin["`Private`"];

Module[ {files},

  (* load in any session *)
  files = {"Build.wl", "Dataset.wl", "Files.wl",
  "Image.wl", "Language.wl", "Paclet.wl",
  "Resources.wl", "Search.wl", "String.wl", "Color.wl", "Support.wl"};
  Map[ Get[ FileNameJoin[{DirectoryName[$InputFileName], #}] ] &, files ];

  (* only load in a notebook session *)
  If[ Head[$FrontEnd] === FrontEndObject,
    files = {"Dock.wl","Notebook.wl"};
    Map[ Get[ FileNameJoin[{DirectoryName[$InputFileName], #}] ] &, files ];
  ]

];

End[];

EndPackage[];
