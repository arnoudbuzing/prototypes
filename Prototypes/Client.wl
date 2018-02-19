Attributes[EvaluationRequest2]={HoldAllComplete};

EvaluationRequest[host_,port_,expr_] := Module[{query, request,response,result},
  query = MakeString[expr];
  url = URLBuild[<|"Scheme" -> "http", "Domain" -> host, "Port" -> port |>];
  request = HTTPRequest[ url, <| Method -> "POST", "Body" -> query |> ];
  response = URLRead[request];
  result = response["Body"];
  result
]
