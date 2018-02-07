ExpressionServer[host_IPAddress,port_String] := ExpressionServer[First[host],port];

ExpressionServer[host_String,port_] := Module[{ socket, listener },
  socket = SocketOpen[ {host,port} ];
  listener = SocketListen[ socket,
    Function[{assoc},
      Module[{client,data,request,line,input,expr,result,len},
        {client,data}=Lookup[assoc,{"SourceSocket","Data"}];
        request=ImportString[data,"HTTPRequest"];
        input=Last[request["Path"]];
        If[
          input=="favicon.ico"
          ,
          (* chrome, and maybe other browsers look for favicon.ico until you tell them otherwise *)
          WriteString[ client, "HTTP/1.1 404 Not Found\n" ]
          ,
          (* the normal case *)
          expr=ToExpression[input];
          result=ToString[expr];
          len=ToString[StringLength[result]];
          WriteString[ client, "HTTP/1.1 200 OK\nContent-Type: text/plain\nContent-Length: "<>len<>"\n\n" <> result ];
        ];
        Close[client]
      ]
    ]
  ];
  Hyperlink["http://"<>host<>":"<>port]
]
