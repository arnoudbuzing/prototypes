RandomRealPoint[list_] := Map[RandomReal, list]

RandomRealPoints[list_, n_Integer: 1] :=  Table[Map[RandomReal, list], n]


RandomCircle[list_] := Circle[ RandomRealPoints[list] ]
