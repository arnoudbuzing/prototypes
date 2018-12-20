Function[{Typed[n, "Integer64"]},
  With[{fib = Typed[KernelFunction[FibonacciNumber], {"Integer64"} -> "Integer64"]},
  If[
    n > 2
    ,
    If[
      Mod[n, 2] === 0
      ,
      fib[ Quotient[n, 2] ] * ( 2 * fib[Quotient[n, 2] + 1] - fib[Quotient[n, 2] ] )
      ,
      fib[ Quotient[n - 1, 2] + 1 ]^2 + fib[ Quotient[n - 1, 2] ]^2
    ]
    ,
    1
  ]
]
