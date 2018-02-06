Print[$InputFileName];
directory = DirectoryName[$InputFileName];
Print[directory];
files = FileNames["*.paclet", directory];
Print[files];
DeleteFile /@ files;
paclet = PackPaclet[FileNameJoin[{directory, "Prototypes"}]];
Print[paclet];
