

DockButton["DocumentationCenter"] := Module[ {file,icon},
  file = FileNameJoin[{ $InputDirectoryName, "icons", "spikey.png" }];
(*
  Print[{$ProcessID,$EvaluationEnvironment,Developer`$ProtectedMode,file}];
  Print[FileType[file]];
*)
  icon = Import[ file, "PNG" ];
  Tooltip[Button[icon, SystemOpen["paclet:guide/WolframRoot"]],"Open Documentation Center"]
]

DockButton["CopyBuildInfo"] := Module[ {file,icon},
  file = FileNameJoin[{ $InputDirectoryName, "icons", "copy-info.png" }];
  icon = Import[ file, "PNG" ];
  Tooltip[Button[icon, CopyToClipboard[Prototypes`$BuildInfo]],"Copy build information"]
]

DockButton["NeuralNetRepository"] := Module[ {file,icon},
  file = FileNameJoin[{ $InputDirectoryName, "icons", "neuralnet-repo.png" }] ;
  icon = Import[ file, "PNG" ];
  Tooltip[Button[icon, SystemOpen["https://resources.wolframcloud.com/NeuralNetRepository"]],"Open Neural Network Repository"]
]

DockButton["GitHub"] := Module[ {file, icon},
  file = FileNameJoin[{ $InputDirectoryName, "icons", "github.png" }];
  icon = Import[ file, "PNG" ];
  Tooltip[Button[icon, SystemOpen["https://github.com/arnoudbuzing/prototypes"]],"Open Prototypes Repository"]
]

$DockButtons := {
  DockButton["DocumentationCenter"],
  DockButton["CopyBuildInfo"],
  DockButton["NeuralNetRepository"],
  DockButton["GitHub"]
};

(*

SetOptions[ $FrontEndSession ,
 DockedCells -> {Cell[
    BoxData@ToBoxes@Row[$DockButtons],
    "Text",CellFrameMargins -> 0, CellMargins -> 0]}]

*)
