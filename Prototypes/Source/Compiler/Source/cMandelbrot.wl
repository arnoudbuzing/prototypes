Function[{
  Typed[array, TypeSpecifier["PackedArray"]["ComplexReal64", 2]]
  },
  Module[{
    width = Length[array],
    height = Length[First[array]], a, b, c, d, cnt
    },
    Table[
      a = Part[array, i, j];
      c = a;
      b = 1;
      d = 1;
      cnt = 0;
      While[
        cnt < 50 && Abs[c] < 4,
        cnt++;
        b += 1;
        c = c^2 + a
      ];
      b,
      {i, width}, {j, height}
    ]
  ]
]
