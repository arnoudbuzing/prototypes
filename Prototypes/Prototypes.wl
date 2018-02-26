PrintTemporary["Loading ",ToString[Length[Names["Prototypes`*"]]], " prototype functions"];

BeginPackage["Prototypes`", {"PacletManager`"}];

Get[ FileNameJoin[{DirectoryName[$InputFileName], "Usage.wl"}] ];

Begin["`Private`"];

Module[ {files},
  files = {"Build.wl", "Client.wl", "Dataset.wl", "Dock.wl", "Files.wl",
"Image.wl", "Language.wl", "Notebook.wl", "Paclet.wl",
"Resources.wl", "Search.wl", "Server.wl", "String.wl"};
  Map[ Get[ FileNameJoin[{DirectoryName[$InputFileName], #}] ] &, files ];
];

End[];

EndPackage[];
