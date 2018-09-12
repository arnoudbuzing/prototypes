what3wordskey = "U9EWUDAI";

What3Words[{word1_String, word2_String, word3_String}] :=  Module[{response, result},
  response = URLRead["https://api.what3words.com/v2/forward?addr=" <> word1 <> "." <> word2 <> "." <> word3 <> "&key=" <> what3wordskey];
  result = ImportString[response["Body"], "RawJSON"];
  GeoPosition[ ToExpression /@ Lookup[result["geometry"], {"lat", "lng"}]]
]

What3Words[geo_GeoPosition] := Module[{lat, long, response, result},
  {lat, long} = ToString /@ QuantityMagnitude[LatitudeLongitude[geo]];
  response = URLRead["https://api.what3words.com/v2/reverse?coords=" <> lat <> "," <> long <> "&key=" <> what3wordskey];
  result = ImportString[response["Body"], "RawJSON"];
  StringSplit[result["words"], "."]
  ]
