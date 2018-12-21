Function[ { Typed[n, "MachineInteger"] },
 Module[{fibonacci},
  fibonacci = Function[{a},
   If[a > 2,
    If[Mod[a, 2] === 0,
     fibonacci[ Quotient[a, 2]]*(2*fibonacci[Quotient[a, 2] + 1] - fibonacci[Quotient[a, 2]]),
      fibonacci[Quotient[a - 1, 2] + 1]^2 + fibonacci[Quotient[a - 1, 2]]^2],
    1]];
  fibonacci[n]
 ]
]
