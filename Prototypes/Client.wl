Attributes[EvaluationRequest]={HoldAllComplete};

EvaluationRequest[ object_EvaluationServerObject, expr_ ] := EvaluationRequest[ object["Host"], object["Port"], expr ]

EvaluationRequest[ assoc_Association, expr_ ] := EvaluationRequest[ assoc["Host"], assoc["Port"], expr ];

EvaluationRequest[host_,port_,expr_] := Module[{query, url, request,response,result},
  query = MakeString[expr];
  url = URLBuild[<|"Scheme" -> "http", "Domain" -> host, "Port" -> port |>];
  request = HTTPRequest[ url, <| Method -> "POST", "Body" -> query |> ];
  response = URLRead[request];
  result = response["Body"];
  result
]
