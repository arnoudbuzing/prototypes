RandomRealPoint[list_] := Map[RandomReal, list]

RandomRealPoints[list_, n_Integer: 1] :=  Table[Map[RandomReal, list], n]


RandomCircle[list_] := Circle[ RandomRealPoints[list] ]

(* get a random Wikipedia article *)
RandomWikipediaData[] := Module[ {response, topic},
  response = URLRead["https://en.wikipedia.org/wiki/Special:Random", FollowRedirects -> False];
  topic = Last[ FileNameSplit[Association[response["Headers"]]["location"]]];
  WikipediaData[topic]
]

RandomRomanNumeral[args___] := RomanNumeral[RandomInteger[args]];



RandomDelete[expr_, pattern_, opts___] := Delete[expr, RandomChoice[Position[expr, pattern, opts]]]

RandomPosition[expr_, pattern_, opts___] := RandomChoice[Position[expr, pattern, opts]]
