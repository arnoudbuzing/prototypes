PrintTemporary["Loading prototype functions ..."];

(*

If[ Head[$FrontEnd] === FrontEndObject,

  SetOptions[$FrontEndSession, WindowStatusArea -> "Note: Prototypes` functions loaded"];

  If[ $CloudConnected, ResourceFunction["SetContextStyle"]["Prototypes`", {Darker[Green, 0.75]}];
  ];

];

*)

BeginPackage["Prototypes`", {"PacletManager`"}];

Get[ FileNameJoin[{DirectoryName[$InputFileName], "Source", "Usage.wl"}] ];

Begin["`Private`"];

applicationDataDirectory = FileNameJoin[{$UserBaseDirectory, "ApplicationData", "Prototypes"}];

If[ FileType[applicationDataDirectory] === None, CreateDirectory[applicationDataDirectory] ];

timings = <||>;
AppendTo[ timings, "Start" ->N@SessionTime[] ];

Module[ {files},

  If[ Not @ StringQ @ FrontEnd`Private`$KernelName || FrontEnd`Private`KernelName === "Local" ,

    (* load in any session *)
    files = {"Build.wl", "Dataset.wl", "Files.wl", "Cloud.wl",
    "Image.wl", "Language.wl", "Paclet.wl", "Formats.wl",
    "Resources.wl", "Search.wl", "String.wl", "System.wl", "Color.wl",
    "Entities.wl", "WolframAlpha.wl", "Translation.wl","GeoGraphics.wl", "Words.wl", "Packages.wl", "Random.wl",
    "Cryptography.wl", "Service/What3Words.wl", "Service/OpenSky.wl", "Primes/Primes.wl"};
    Map[
      Function[ {file},
        AppendTo[ timings, file<>"-Before" -> N@SessionTime[] ];
        Get[ FileNameJoin[{DirectoryName[$InputFileName], "Source", file}] ];
        AppendTo[ timings, file<>"-After" -> N@SessionTime[] ];
        ], files ];


    (* only load in a notebook session *)
    If[ Head[$FrontEnd] === FrontEndObject,
      files = {"Dock.wl","Notebook.wl"};
      Map[
        Function[ {file},
          AppendTo[ timings, file<>"-Before" -> N@SessionTime[] ];
          Get[ FileNameJoin[{DirectoryName[$InputFileName], "Source", file}] ];
          AppendTo[ timings, file<>"-After" -> N@SessionTime[] ];
          ], files
      ];
    ];
  ];
];

AppendTo[ timings, "End" ->N@SessionTime[] ];

End[];

EndPackage[];
