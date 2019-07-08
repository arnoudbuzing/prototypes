SatelliteImage[assoc_Association] := Module[{satellite, size, band, date },
  satellite = assoc["Satellite"];
  size = Switch[assoc["Size"], Tiny, "339x339", Small, "678x678", Medium, "1808x1808", Large, "5424x5424", Huge, "10848x10848" ];
  band = If[ IntegerQ[assoc["Band"]], IntegerString[assoc["Band"], 10, 2], assoc["Band"]];
  date = DateString[ assoc["Date"], {"Year", "ISOYearDay", "Hour24", "Minute"}];
  file = CacheDownload[ "https://cdn.star.nesdis.noaa.gov/"<>satellite<>"/ABI/FD/" <> band <>
        "/" <> date <> "_" <> satellite <> "-ABI-FD-" <> band <> "-" <> size <> ".jpg"];
  Import[file]
  ]


SatelliteImageList[assoc_Association] := Module[{dates},
  dates = DateRange[assoc["DateStart"], assoc["DateEnd"], Quantity[10,"Minutes"]];
  Map[ SatelliteImage[ <|
    "Satellite"->assoc["Satellite"],
    "Size"->assoc["Size"],
    "Band"->assoc["Band"],
    "Date"->#
    |>] &, dates]
  ]
