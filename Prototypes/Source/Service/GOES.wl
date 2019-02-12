GOESImages[assoc_Association] := Module[{dates, list, band, size,satellite},
  satellite = assoc["Satellite"];
  size = Switch[assoc["Size"], Small, "339x339", Medium, "678x678",
    Large, "1808x1808"];
  band = If[IntegerQ[assoc["Band"]],
    IntegerString[assoc["Band"], 10, 2], assoc["Band"]];
  dates = Flatten@Table[
     DateString[
      DateObject[{assoc["Date"]["Year"], assoc["Date"]["Month"],
        assoc["Date"]["Day"], h, m}], {"Year", "ISOYearDay", "Hour24",
        "Minute"}], {h, 0, 23}, {m, 0, 45, 15}];
  list = Select[
    Map[Import,
     Table[CacheDownload[
       "https://cdn.star.nesdis.noaa.gov/"<>satellite<>"/ABI/FD/" <> band <>
        "/" <> d <> "_"<>satellite<>"-ABI-FD-" <> band <> "-" <> size <>
        ".jpg"], {d, dates}]], ImageQ];
  list
  ]

GOESAnimate[assoc_Association] := ListAnimate[ GOESImages[assoc] ]

GOESExport[assoc_Association] := Export[ assoc["File"], GOESImages[assoc], "GIF", AnimationRepetitions->Infinity];
