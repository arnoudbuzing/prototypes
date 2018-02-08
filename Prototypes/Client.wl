Attributes[ExpressionEvaluate]={HoldAllComplete};

ExpressionEvaluate[host_,port_,expr_] := Module[{request,response,result},
  request = HTTPRequest[ "http://" <> host <> ":" <> port <> "/" <> URLEncode @ MakeString @ expr ];
  response = URLRead[request];
  result = response["Body"];
  result
]
