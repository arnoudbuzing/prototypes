Function[{Typed[x, "Integer64"]},
 If[x > 2,
  Typed[KernelFunction[FibonacciNumber], {"Integer64"} -> "Integer64"][
    x - 1] +
   Typed[KernelFunction[FibonacciNumber], {"Integer64"} -> "Integer64"][
    x - 2],
  1
  ]
 ]
