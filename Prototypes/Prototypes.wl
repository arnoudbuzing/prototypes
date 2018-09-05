PrintTemporary["Loading prototype functions ..."];
PrintTemporary["Start time (s): ", Prototypes`Private`timing01 = N@SessionTime[] ];

If[ Head[$FrontEnd] === FrontEndObject,

  SetOptions[$FrontEndSession, WindowStatusArea -> "Note: Prototypes` functions loaded"];

  If[ $CloudConnected, ResourceFunction["SetContextStyle"]["Prototypes`", {Darker[Green, 0.75]}];
  ];

];

BeginPackage["Prototypes`", {"PacletManager`"}];

Get[ FileNameJoin[{DirectoryName[$InputFileName], "Source", "Usage.wl"}] ];

Begin["`Private`"];

Module[ {files},

  (* load in any session *)
  files = {"Build.wl", "Dataset.wl", "Files.wl", "Cloud.wl",
  "Image.wl", "Language.wl", "Paclet.wl", "Formats.wl",
  "Resources.wl", "Search.wl", "String.wl", "System.wl", "Color.wl",
  "Entities.wl", "WolframAlpha.wl", "Translation.wl","GeoGraphics.wl", "Words.wl", "Packages.wl", "Random.wl"};
  Map[ Get[ FileNameJoin[{DirectoryName[$InputFileName], "Source", #}] ] &, files ];

  PrintTemporary["Loaded WL files (s): ", Prototypes`Private`timing02 = N@SessionTime[] ];

  (* only load in a notebook session *)
  If[ Head[$FrontEnd] === FrontEndObject,
    files = {"Dock.wl","Notebook.wl"};
    Map[ Get[ FileNameJoin[{DirectoryName[$InputFileName], "Source", #}] ] &, files ];
  ];

  PrintTemporary["Loaded UI files (s): ", Prototypes`Private`timing03 = N@SessionTime[] ];

];

End[];

EndPackage[];

PrintTemporary["End time (s): ", Prototypes`Private`timing04 = N@SessionTime[] ];
PrintTemporary["Elapsed time (ms): ", Prototypes`Private`totaltiming = Round[ 1000 * (Prototypes`Private`timing04 - Prototypes`Private`timing01) ] ];
