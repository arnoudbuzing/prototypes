$ScriptExecutionEnvironment := Module[{checks},
 checks = { $Notebooks, Length[$CommandLine]===1, MemberQ[$CommandLine,"-wlbanner"], MemberQ[$CommandLine,"-noicon"] };
 Switch[
  checks,
  {True,False,False,True}, "Running in notebook interface",
  {False,True,False,False}, "Running in wolfram.exe",
  {False,False,True,False}, "Running in wolframscript.exe",
  {False,False,False,False}, "Running directly from .wls"
 ]
]
