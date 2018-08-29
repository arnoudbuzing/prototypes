PrintTemporary["Loading prototype functions ..."];

If[ Head[$FrontEnd] === FrontEndObject,

  SetOptions[ $FrontEndSession, Background -> RGBColor[0.94,0.94,0.94]];

  If[ $CloudConnected,
    ResourceFunction["SetContextStyle"]["Prototypes`", {Darker[Green, 0.75]}];
  ];

];

BeginPackage["Prototypes`", {"PacletManager`"}];

Get[ FileNameJoin[{DirectoryName[$InputFileName], "Usage.wl"}] ];

Begin["`Private`"];

Module[ {files},

  (* load in any session *)
  files = {"Build.wl", "Dataset.wl", "Files.wl", "Cloud.wl",
  "Image.wl", "Language.wl", "Paclet.wl", "Formats.wl",
  "Resources.wl", "Search.wl", "String.wl", "System.wl", "Color.wl",
  "Entities.wl", "WolframAlpha.wl", "Translation.wl","GeoGraphics.wl", "Words.wl", "Packages.wl", "Random.wl"};
  Map[ Get[ FileNameJoin[{DirectoryName[$InputFileName], #}] ] &, files ];

  (* only load in a notebook session *)
  If[ Head[$FrontEnd] === FrontEndObject,
    files = {"Dock.wl","Notebook.wl"};
    Map[ Get[ FileNameJoin[{DirectoryName[$InputFileName], #}] ] &, files ];
  ]

];

End[];

EndPackage[];
