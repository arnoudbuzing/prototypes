directory = DirectoryName[$InputFileName];
Print[directory];
files = FileNames["*.paclet", directory];
Print[files];
paclet = First @ files;
Print[paclet];
PacletInstall[paclet, IgnoreVersion -> True];
