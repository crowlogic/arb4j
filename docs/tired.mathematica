X[n_, y_] := Integrate[ChebyshevT[n, x]*Exp[-I*x*y], {x, -1, 1}]

Vnorm[m_] := 2*((-1)^m*Pi*(2*m^2-1)/(4*m^2-1))^(1/2)

V[m_, y_] := Piecewise[{{-I*(Exp[y*I] - Exp[-I*y])/y, m == 0}, {Limit[V[m, y], y -> 0], y == 0}}, 
  Simplify[(HypergeometricPFQ[{1, m, -m}, {1/2}, 1/2*I/y]*Exp[2*I*Pi*m - y*I] - 
     HypergeometricPFQ[{1, m, -m}, {1/2}, -1/2*I/y]*Exp[m*Pi*I + y*I])*I/y]]

lresol := RSolve[{(n + 4) a[n + 2] - n a[n] == 0, a[1] == -2/3, a[2] == 0}, a[n], n]

V0[m_] := Simplify[(lresol /. n -> m) // First]

Y[m_, y_] := Simplify[V[m, y]/Vnorm[m]]

f[x_] := Assuming[x != 0, Integrate[BesselJ[0, y]*Exp[-I*x*y], {y, 0, Infinity}]]

GramSchmidt[vecList_, a_, b_] := Module[{n, m, inner, projection, u, v, orthoList = {}},
  For[n = 1, n <= Length[vecList], n++,
    v = vecList[[n]];
    projection = 0;
    For[m = 1, m < n, m++,
      u = orthoList[[m]];
      inner = Integrate[u*v, {y, a, b}];
      projection += inner*u;
    ];
    u = Simplify[v - projection];
    u = Simplify[u/Sqrt[Integrate[u*Conjugate[u], {y, a, b}]]];
    orthoList = Append[orthoList, u];
  ];
  orthoList
]

funcList = Table[Simplify[Y[n, y]], {n, 0, 10}];

orthoFuncs = GramSchmidt[Take[funcList, 10], -Infinity, Infinity];
