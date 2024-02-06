<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Swinging Factorial>>

  The sequence A056040, known as the <with|font-shape|italic|swinging
  factorial>, is defined as:

  <\equation*>
    a<around|(|n|)>=2<rsup|n-<around|(|n<modulo|2>|)>>*<big|prod><rsub|k=1><rsup|n>k<rsup|<around|(|-1|)><rsup|k+1>>.
  </equation*>

  The first few values of this sequence are:

  <\equation*>
    1,1,2,6,6,30,20,140,70,630,252,2772,924,12012,3432,51480,12870,218790,48620,923780,184756,3879876,705432,16224936,2704156,67603900,10400600,280816200,40116600,1163381400,155117520,4808643120,601080390,19835652870,2333606220.
  </equation*>

  <section*|Properties and Formulas>

  <\itemize>
    <item>The offset is <math|0,3>.

    <item><math|a<around|(|n|)>> represents the number of 'swinging
    orbitals', enumerated by the trinomial <math|n> over
    <math|<around|[|<around|\<lfloor\>|n/2|\<rfloor\>>,n<modulo|2>,<around|\<lfloor\>|n/2|\<rfloor\>>|]>>.

    <item>For <math|n\<gtr\>0>, <math|a<around|(|n|)>=<text|lcm><around|(|A*001405*<around|(|n-1|)>,A*001405<around|(|n|)>|)>>.

    <item><math|A*055773<around|(|n|)>> divides <math|a<around|(|n|)>>, and
    <math|A*001316<around|(|<around|\<lfloor\>|n/2|\<rfloor\>>|)>> divides
    <math|a<around|(|n|)>>.

    <item><math|a<around|(|n|)>> is also the number of vertices of the
    polytope resulting from the intersection of an <math|n>-hypercube with
    the hyperplane perpendicular to and bisecting one of its long diagonals.

    <item>The generating functions include:

    <\align*>
      <tformat|<table|<row|<cell|<text|E.g.f.:>>|<cell|<space|1em><around|(|1+x|)>*I<rsub|0><around|(|2*x|)>.>>|<row|<cell|<text|O.g.f.:>>|<cell|<space|1em>a<around|(|n|)>=<text|SeriesCoeff><rsub|n><around*|(|<frac|1+z/<around|(|1-4*z<rsup|2>|)>|<sqrt|1-4*z<rsup|2>>>|)>.>>|<row|<cell|<text|P.g.f.:>>|<cell|<space|1em>a<around|(|n|)>=<text|PolyCoeff><rsub|n><around*|(|<around|(|1+z<rsup|2>|)><rsup|n>+n*z*<around|(|1+z<rsup|2>|)><rsup|n-1>|)>.>>>>
    </align*>

    <item>The recurrence relation is given by:

    <\equation*>
      n*a<around|(|n|)>+<around|(|n-2|)>*a*<around|(|n-1|)>+4*<around|(|-2*n+3|)>*a*<around|(|n-2|)>+4*<around|(|-n+1|)>*a*<around|(|n-3|)>+16*<around|(|n-3|)>*a*<around|(|n-4|)>=0.
    </equation*>

    <item><math|a*<around|(|2*n|)>=<binom|2*n|n>>; for odd indices,
    <math|a*<around|(|2*n+1|)>=<around|(|2*n+1|)><binom|2*n|n>>.
  </itemize>

  <section*|Examples>

  <\itemize>
    <item><math|a<around|(|10|)>=10!/5!<rsup|2>=<text|trinomial><around|(|10,<around|[|5,0,5|]>|)>>.

    <item><math|a<around|(|11|)>=11!/5!<rsup|2>=<text|trinomial><around|(|11,<around|[|5,1,5|]>|)>>.
  </itemize>

  <subsection*|MAPLE>

  <\verbatim>
    \;

    SeriesCoeff := proc(s, n) series(s(w, n), w, n+2);

    convert(%, polynom); coeff(%, w, n) end;

    a1 := proc(n) local k;

    2^(n-(n mod 2))*mul(k^((-1)^(k+1)), k=1..n) end:

    a2 := proc(n) option remember;

    `if`(n=0, 1, n^irem(n, 2)*(4/n)^irem(n+1, 2)*a2(n-1)) end;

    a3 := n -\<gtr\> n!/iquo(n, 2)!^2;

    g4 := z -\<gtr\> BesselI(0, 2*z)*(1+z);

    a4 := n -\<gtr\> n!*SeriesCoeff(g4, n);

    g5 := z -\<gtr\> (1+z/(1-4*z^2))/sqrt(1-4*z^2);

    a5 := n -\<gtr\> SeriesCoeff(g5, n);

    g6 := (z, n) -\<gtr\> (1+z^2)^n+n*z*(1+z^2)^(n-1);

    a6 := n -\<gtr\> SeriesCoeff(g6, n);

    a7 := n -\<gtr\> combinat[multinomial](n, floor(n/2), n mod 2,
    floor(n/2));

    h := n -\<gtr\> binomial(n, floor(n/2)); # A001405

    a8 := n -\<gtr\> ilcm(h(n-1), h(n));

    F := [a1, a2, a3, a4, a5, a6, a7, a8];

    for a in F do seq(a(i), i=0..32) od;

    \;
  </verbatim>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-3|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-4|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-7|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-8|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Properties
      and Formulas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Examples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Implementation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|MAPLE <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|MATHEMATICA
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|PARI/GP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|Magma <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|Sage <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>
    </associate>
  </collection>
</auxiliary>