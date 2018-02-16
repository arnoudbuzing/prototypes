PrintTemporary["Loading Prototypes paclet"];

BeginPackage["Prototypes`", {"PacletManager`"}];

Get[ FileNameJoin[{DirectoryName[$InputFileName], "Usage.wl"}] ];

Begin["`Private`"];

(* load dataset prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Files.wl"}] ];

(* load language functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Language.wl"}] ];

(* load dataset prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Dataset.wl"}] ];

(* load string prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "String.wl"}] ];

(* load image processing prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Image.wl"}] ];

(* load paclet prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Paclet.wl"}] ];

(* expression server *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Server.wl"}] ];
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Client.wl"}] ];

(* load resource prototype functions *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Resources.wl"}] ];

(* load search utilities *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Search.wl"}] ];

(* load search utilities *)
Get[ FileNameJoin[{DirectoryName[$InputFileName], "Build.wl"}] ];

(* frontend only things *)
If[ Head[$FrontEnd] === FrontEndObject ,
  (* load dock prototype functions *)
  Get[ FileNameJoin[{DirectoryName[$InputFileName], "Dock.wl"}] ];
  (* load frontend prototype functions *)
  Get[ FileNameJoin[{DirectoryName[$InputFileName], "NotebookInterface.wl"}] ];
]

End[];

EndPackage[];
