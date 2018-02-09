Attributes[ExpressionEvaluate]={HoldAllComplete};

ExpressionEvaluate[host_,port_,expr_] := Module[{query, request,response,result},
  query = MakeString[expr];
  request = HTTPRequest[ URLBuild[<|"Scheme" -> "http", "Domain" -> host, "Port" -> port, "Query" -> {"q"->query}|>] ];
  response = URLRead[request];
  result = response["Body"];
  result
]
