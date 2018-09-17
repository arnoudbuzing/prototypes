primeCountBinary = FileNameJoin[{DirectoryName[$InputFileName], "Binaries", $SystemID, "primecount"}];

PrimeCount[n_Integer] := ToExpression[ StringTrim[ RunProcess[ {primeCountBinary, ToString[n]}, "StandardOutput"]]];
