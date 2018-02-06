ExpressionServer[host_,port_] := Module[{ socket, listener },
  socket = SocketOpen[ {host,port} ];
  listener = SocketListen[ socket,
    Function[{assoc},
      Module[{client,data,line,input,expr,result},
        {client,data}=Lookup[assoc,{"SourceSocket","Data"}];
        line=First@StringSplit[data,"\n"];
        input=StringTake[line,{6,-10}];
        expr=ToExpression[URLDecode@input];
        result=ToString[expr];
        WriteString[ client, "HTTP/1.1 200 OK\nContent-Type: text/plain\n\n" <> result ];
        Close[client]
      ]
    ]
  ]
]
