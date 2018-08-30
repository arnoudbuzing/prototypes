$DockButtons = {};

CreateDockButton[ assoc_Association ] := Module[{db},
  db = (DockButton[assoc["Name"]] = Tooltip[ Button[ assoc["Icon"], assoc["Action"] ], assoc["Tooltip"] ]);
  AppendTo[ $DockButtons, db ];
  db
]

iconsdir = FileNameJoin[{ $InputDirectoryName, "icons" }];

buttons := Map[
  CreateDockButton,
  {
    <|
      "Name" -> "DocumentationCenter",
      "Icon" -> Import[FileNameJoin[{ iconsdir, "spikey.png" }]] ,
      "Action" :> SystemOpen["paclet:guide/WolframRoot"],
      "Tooltip" -> "Open Documentation Center"
    |>,
    <|
      "Name" -> "CopyBuildInfo",
      "Icon" -> Import[FileNameJoin[{ iconsdir, "copy-info.png" }]] ,
      "Action" :> CopyToClipboard[$BuildInfo],
      "Tooltip" -> "Copy build information"
    |>,
    <|
      "Name" -> "NeuralNetRepository",
      "Icon" -> Import[FileNameJoin[{ iconsdir, "neuralnet-repo.png" }]] ,
      "Action" :> SystemOpen["https://resources.wolframcloud.com/NeuralNetRepository"],
      "Tooltip" -> "Open Neural Network Repository"
    |>,
    <|
      "Name" -> "GitHub",
      "Icon" -> Import[FileNameJoin[{ iconsdir, "github.png" }]] ,
      "Action" :> SystemOpen["https://github.com/arnoudbuzing/prototypes"],
      "Tooltip" -> "Open Prototypes Repository"
    |>
  }
];

CreateDock[] := (Once[buttons]; CreateDock[ $DockButtons ]);

CreateDock[ buttons_ ] := (Once[buttons]; SetOptions[ $FrontEndSession , DockedCells -> {Cell[ BoxData@ToBoxes@Row[buttons], "Text",CellFrameMargins -> 0, CellMargins -> 0]}]);

(*

CreateDockButton
DockAppend
DockInsert
DockRemove

Scope of docked cells: notebook, session, global/persistent ?

*)
