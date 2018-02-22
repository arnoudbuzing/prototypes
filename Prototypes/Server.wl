EvaluationServer[] := EvaluationServer["127.0.0.1","27182"]

EvaluationServer[host_IPAddress,port_String] := EvaluationServer[First[host],port];

EvaluationServer[host_String,port_] := Module[{ socket, listener },
  socket = SocketOpen[ {host,port} ];
  listener = SocketListen[ socket,
    Function[{assoc},
      Module[{client,data,request,response,line,input,expr,result,len},
        {client,data}=Lookup[assoc,{"SourceSocket","Data"}];
        request=ImportString[data,"HTTPRequest"];
        input=StringTrim[request["Body"]];
        If[
          input=="favicon.ico"
          ,
          (* chrome, and maybe other browsers look for favicon.ico until you tell them otherwise *)
          response = ExportString[ HTTPResponse[ "", <| "StatusCode" -> 404 |> ], "HTTPResponse" ];
          WriteString[ client, response ]
          ,
          (* the normal case *)
          expr=ToExpression[input];
          result=ToString[expr];
          len=ToString[StringLength[result]];
          response = ExportString[ HTTPResponse[ ToCharacterCode[result,"UTF8"], <| "StatusCode"->200, "ContentType"->"text/plain;charset=utf-8", "Headers" ->{"Content-Length"->len} |> ], "HTTPResponse" ];
          WriteString[ client, response ];
        ];
        Close[client]
      ]
    ]
  ];
  EvaluationServerObject[host,port,socket,listener]
]

EvaluationServerObject /:  MakeBoxes[  object:EvaluationServerObject[host_, port_,socket_,listener_], form:(StandardForm |TraditionalForm)] := BoxForm`ArrangeSummaryBox[
  EvaluationServerObject,
  object,
  None,
  { {BoxForm`SummaryItem[{"Host: ",host}]}, {BoxForm`SummaryItem[{"Port: ",port}]} },
  { {BoxForm`SummaryItem[{"Socket: ",socket}]}, {BoxForm`SummaryItem[{"Listener: ",listener}]} },
  form,
  "Interpretable"->True
]

EvaluationServerObject[host_,port_,socket_,listener_][key_] := <|"Host"->host,"Port"->port,"SocketObject"->socket,"SocketListener"->listener|>[key]
