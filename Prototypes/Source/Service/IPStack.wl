IPStack[ip_String, key_String] := Module[{response},
  response = URLRead["http://api.ipstack.com/" <> ip <> "?access_key=" <> key];
  ImportByteArray[response["BodyByteArray"], "RawJSON"]
];

IPStack[ip_IPAddress, key_String] := IPStack[First[ip], key]

IPStack[ips_List, key_String] := Dataset[ Map[ IPStack[#,key]&, ips] ];

