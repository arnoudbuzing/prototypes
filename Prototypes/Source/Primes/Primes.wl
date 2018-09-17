primeCountBinary = FileNameJoin[{DirectoryName[$InputFileName], "Binaries", "PrimeCount", $SystemID, "primecount"}];

PrimeCount[n_Integer] := ToExpression[ StringTrim[ RunProcess[ {primeCountBinary, ToString[n]}, "StandardOutput"]]];


primeSumBinary = FileNameJoin[{DirectoryName[$InputFileName], "Binaries", "PrimeSum", $SystemID, "primesum"}];

PrimeSum[n_Integer] := ToExpression[ StringTrim[ RunProcess[ {primeSumBinary, ToString[n]}, "StandardOutput"]]];
