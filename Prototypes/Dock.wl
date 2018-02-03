

DockButton["DocumentationCenter"] = Module[ {icon},
  Print[FileType["icons/spikey.png"]];
  icon = Import["icons/spikey.png"];
  Tooltip[Button[icon, SystemOpen["paclet:guide/WolframRoot"]],"Open Documentation Center"]
]

DockButton["CopyBuildInfo"] = Module[ {icon},
  icon = Import["icons/copy-info.png"];
  Tooltip[Button[icon, CopyToClipboard[Prototypes`$BuildInfo]],"Copy build information"]
]

DockButton["NeuralNetRepository"] = Module[ {icon},
  icon = Import["icons/neuralnet-repo.png"];
  Tooltip[Button[icon, SystemOpen["https://resources.wolframcloud.com/NeuralNetRepository"]],"Open Neural Network Repository"]
]

DockButton["GitHub"] = Module[ {icon},
  icon = Import["icons/github.png"];
  Tooltip[Button[icon, SystemOpen["https://github.com/arnoudbuzing/prototypes"]],"Open Prototypes Repository"]
]

$DockButtons = {
  DockButton["DocumentationCenter"],
  DockButton["CopyBuildInfo"],
  DockButton["NeuralNetRepository"],
  DockButton["GitHub"]
};

SetOptions[ $FrontEndSession ,
 DockedCells -> {Cell[
    BoxData@ToBoxes@Row[$DockButtons],
    "Text",CellFrameMargins -> 0, CellMargins -> 0]}]
