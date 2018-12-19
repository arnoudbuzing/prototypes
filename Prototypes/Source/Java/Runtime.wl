Runtime[ "exec", command_String] := Module[{rt},
  InstallJava[]; 
  LoadJavaClass["java.lang.Runtime"];
  rt = java`lang`Runtime`getRuntime[];
  rt @ java`lang`Runtime`exec[ command ]
  ]
