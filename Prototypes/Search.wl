CreateNotebookIndex[] := Module[ {},
  files = FileNames["*.nb", $InstallationDirectory, \[Infinity]];
  PrintTemporary[ "Creating index of all notebooks under $InstallationDirectory (this will take a few minutes): ", ProgressIndicator[Appearance -> "Percolate"] ];
  CreateSearchIndex[files, "NotebookIndex"]
  ]
