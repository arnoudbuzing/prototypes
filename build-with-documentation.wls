PacletUninstall["Prototypes"];

(* copy source files to build directory *)

source = FileNameJoin[{ DirectoryName[ First @ $ScriptCommandLine ], "Prototypes"}];
Print["source: ", source];
build = "D:\\output\\Prototypes";
Print["build: ", build];
DeleteDirectory[build, DeleteContents->True];
CopyDirectory[source, build];

(* build documentation *)

Get["DocumentationBuild`"];
files = FileNames["*.nb", FileNameJoin[{build, "Documentation"}], Infinity];
Print["files: ", files];
Scan[
 Function[{file},
  Module[{source},
   source = RenameFile[file, file <> "-source"];
   MakeNotebook[source, "RasterizeOutput" -> False, "outfile" -> file];
   DeleteFile[source];
   ]],
 files]

(* create index *)

Needs["DocumentationSearch`"];

index = FileNameJoin[{build, "Documentation", "English", "SearchIndex", "2"}];
Print["index: ", index];
CreateDirectory[index];
DocumentationSearch`CreateDocumentationIndex[
 files,
 FileNameDrop[index, -1],
 "2",
 OverwriteTarget -> True
 ]

ReinstallJava[]

(* create paclet *)

DeleteFile /@ FileNames["*.paclet", ParentDirectory[build]];
paclet = PackPaclet[build];
Print["paclet: ", paclet];

(* install paclet *)

PacletInstall[paclet,"IgnoreVersion"->True];
