start = SessionTime[];

PacletUninstall["Prototypes"];

(* copy source files to build directory *)

Print["\n================================================================================"];
Print["Setting Up Build"];
Print["================================================================================\n"];


source = FileNameJoin[{ DirectoryName[ First @ $ScriptCommandLine ], "Prototypes"}];
Print["Source directory: ", source];
build = "D:\\output\\Prototypes";
Print["Build directory: ", build];
DeleteDirectory[build, DeleteContents->True];
CopyDirectory[source, build];

(* build documentation *)

Print["\n================================================================================"];
Print["Building Documentation"];
Print["================================================================================\n"];

PrependTo[$Path,"D:\\git\\pubs"];

Quiet[ Get["DocumentationBuild`"], {RunProcess::pnfd, StringReplace::strse}];

files = FileNames["*.nb", FileNameJoin[{build, "Documentation"}], Infinity];
Print["Number of files: ", Length @ files];
Scan[
 Function[{file},
  Module[{source},
   Print["Processing file: ", file];
   source = RenameFile[file, file <> "-source"];
   Quiet[ MakeNotebook[source, "RasterizeOutput" -> False, "outfile" -> file], {ReplaceAll::reps} ];
   DeleteFile[source];
   ]],
 files]

(* create index *)

Print["\n================================================================================"];
Print["Index Documentation"];
Print["================================================================================\n"];

Needs["DocumentationSearch`"];

index = FileNameJoin[{build, "Documentation", "English", "SearchIndex", "2"}];
Print["Indexing: ", index];
CreateDirectory[index];
Quiet[
  DocumentationSearch`CreateDocumentationIndex[
    files,
    FileNameDrop[index, -1],
    "2",
    OverwriteTarget -> True
  ],
  {CreateSearchIndex::uf}
]

ReinstallJava[]

(* create paclet *)

Print["\n================================================================================"];
Print["Building Paclet"];
Print["================================================================================\n"];

DeleteFile /@ FileNames["*.paclet", ParentDirectory[build]];
paclet = PackPaclet[build];
Print["Finished paclet: ", paclet];

(* install paclet *)

PacletInstall[paclet,"IgnoreVersion"->True];

Print["\nElapsed time: ", N[ SessionTime[] - start ], " seconds" ];

