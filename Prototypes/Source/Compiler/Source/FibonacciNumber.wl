Function[{Typed[n, "Integer64"]},
  If[
    n > 2
    ,
    If[
      Mod[n, 2] === 0
      ,
      Typed[KernelFunction[FibonacciNumber], {"Integer64"} -> "Integer64"][Quotient[n, 2]]*(
      2*Typed[KernelFunction[FibonacciNumber], {"Integer64"} -> "Integer64"][Quotient[n, 2] + 1] -
      Typed[KernelFunction[FibonacciNumber], {"Integer64"} -> "Integer64"][Quotient[n, 2]])
      ,
      Typed[KernelFunction[FibonacciNumber], {"Integer64"} -> "Integer64"][Quotient[n - 1, 2] + 1]^2 +
      Typed[KernelFunction[FibonacciNumber], {"Integer64"} -> "Integer64"][Quotient[n - 1, 2]]^2]
    ,
    1
  ]
]
