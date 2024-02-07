<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  \;

  The swinging factorial of a number <math|n>, denoted by
  <math|a<around|(|n|)>>, is defined in several equivalent ways.\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|a<around*|(|n|)>>|<cell|=2<rsup|n-<around|(|n<modulo|2>|)>>*<big|prod><rsub|k=1><rsup|n>k<rsup|<around|(|-1|)><rsup|k+1>>>>|<row|<cell|>|<cell|=<frac|n!|<around*|\<lfloor\>|<frac|n|2>|\<rfloor\>>!<rsup|2>>>>|<row|<cell|>|<cell|=lcm<around*|(|a<around*|(|n-1|)>,<choose|n|\<lfloor\><frac|n|2>\<rfloor\>>|)>>>|<row|<cell|>|<cell|=<text|<math|<big|prod><rsub|p\<in\><around*|{|prime:<frac|n|2>\<less\>p\<leqslant\>n|}>>p>>>>|<row|<cell|>|<cell|=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    >n=0>>|<row|<cell|n<rsup|<text|irem><around|(|n,2|)>><around*|(|<frac|4|n>|)><rsup|<text|irem><around|(|n+1,2|)>>*a*<around|(|n-1|)>>|<cell|<text|otherwise>>>>>>>>>>>
  </equation>

  For odd prime numbers <math|p>, the sequence shows a pattern where <math|p>
  consecutive multiples of <math|p> follow the least positive multiple of
  <math|p>.\ 

  <\itemize>
    <item>Exponential generating function (E.g.f.):

    <\equation>
      <around|(|1+x|)>*I<rsub|0>*<around|(|2*x|)>
    </equation>

    where <math|I<rsub|0>> is the modified type 1 Bessel function.

    <item>Ordinary generating function (O.g.f.):

    <\equation>
      a<around|(|n|)>=<text|SeriesCoeff><rsub|n><around*|(|<frac|1+<frac|z|1-4*z<rsup|2>>|<sqrt|1-4*z<rsup|2>>>|)>
    </equation>

    <item>Polynomial generating function (P.g.f.):

    <\equation>
      a<around|(|n|)>=<text|PolyCoeff><rsub|n><around|(|<around|(|1+z<rsup|2>|)><rsup|n>+n*z*<around|(|1+z<rsup|2>|)><rsup|n-1>|)>
    </equation>

    <item>D-finite recurrence:

    <\equation>
      n\<cdot\>a<around|(|n|)>+<around|(|n-2|)>\<cdot\>a*<around|(|n-1|)>+4*<around|(|3-2*n|)>\<cdot\>a*<around|(|n-2|)>+4*<around|(|1-n|)>\<cdot\>a*<around|(|n-3|)>+16*<around|(|n-3|)>\<cdot\>a*<around|(|n-4|)>=0
    </equation>
  </itemize>

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