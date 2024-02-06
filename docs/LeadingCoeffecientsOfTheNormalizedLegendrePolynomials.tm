<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Numerators in the expansion of
  <math|<frac|1|<sqrt|1-x>>>>>

  The sequence \ consists of the numerators in the expansion of
  <math|<frac|1|<sqrt|1-x>>>. The first few terms of the sequence are:1, 1,
  3, 5, 35, 63, 231, 429, 6435, 12155, 46189, 88179, 676039, \<cdot\>1300075,
  5014575, 9694845, 300540195, 583401555, 2268783825, 4418157975,
  34461632205, 67282234305, 263012370465, 514589420475, 8061900920775,
  15801325804719. <cite|oeisA001790>

  <section*|OFFSET>

  0,3

  <section*|Comments>

  <\itemize>
    <item>Also numerator of <math|<binom|2*n|n>/4<rsup|n>> (cf. A046161).

    <item>Also numerator of <math|e<around|(|n-1,n-1|)>> (see Maple line).

    <item>Leading coefficient of normalized Legendre polynomial.

    <item>Common denominator of expansions of powers of x in terms of
    Legendre polynomials <math|P<rsub|n><around|(|x|)>>.

    <item>Also the numerator of <math|<binom|2*n|n>/2<rsup|n>>. - T. D. Noe,
    Nov 29 2005

    <item>This sequence gives the numerators of the Maclaurin series of the
    Lorentz factor (see Wikipedia link) of

    <\equation>
      <frac|1|<sqrt|1-b<rsup|2>>>=<frac|d t|d \<tau\>>
    </equation>

    \ where

    <\equation>
      b=<frac|u|c>
    </equation>

    \ is the velocity in terms of the speed of light <math|c>, <math|u> is
    the velocity as observed in the reference frame where time <math|t> is
    measured, and <math|\<tau\>> is the proper time.
    <with|font-shape|slanted|- Stephen Crowley, Apr 03 2007>

    <item>Truncations of rational expressions like those given by the
    numerator operator are artifacts in integer formulas and have many
    disadvantages. A pure integer formula follows. Let <math|n*$> denote the
    swinging factorial and <math|\<sigma\><around|(|n|)>=> number of '1's in
    the base-2 representation of <math|<around|\<lfloor\>|n/2|\<rfloor\>>>.
    Then <math|a<around|(|n|)>=<around|(|2*n|)>*$/\<sigma\>*<around|(|2*n|)>=A*056040*<around|(|2*n|)>/A*060632*<around|(|2*n+1|)>>.
    Simply said: this sequence is the odd part of the swinging factorial at
    even indices. - Peter Luschny, Aug 01 2009

    <item>It appears that <math|a<around|(|n|)>=A*060818<around|(|n|)>\<cdot\>A*001147<around|(|n|)>/A*000142<around|(|n|)>>.
    - James R. Buddenhagen, Jan 20 2010

    <item>The convolution of sequence <math|<binom|2*n|n>/4<rsup|n>> with
    itself is the constant sequence with all terms = 1.

    <item><math|a<around|(|n|)>> equals the denominator of
    <math|<rsub|2>F<rsub|1><around*|(|<around*|[|<frac|1|2>,n|]>,<around*|[|1+n|]>;-1|)>>
    (see Mathematica code below). - John M. Campbell, Jul 04 2011

    <item><math|a<around|(|n|)>=> denominator of
    <math|2<rsup|n>\<cdot\>n!\<cdot\>n!/<around|(|2*n|)>>!. - Artur Jasinski,
    Nov 26 2011

    <item><math|a<around|(|n|)>=> numerator of
    <math|<around|(|1/\<pi\>|)>\<cdot\><big|int><rsub|-\<infty\>><rsup|+\<infty\>>1/<around|(|x<rsup|2>-2*x+2|)><rsup|n>*d*x>.
    - Leonid Bedratyuk, Nov 17 2012

    <item><math|a<around|(|n|)>=> numerator of the mean value of <math|cos
    <around|(|x|)><rsup|2*n>> from <math|x=0> to <math|2*\<pi\>>. -
    Jean-François Alcover, Mar 21 2013

    <item>Also numerators in expansion of <math|arcsin <around|(|x|)>>. -
    Jean-François Alcover, May 17 2013

    <item>Constant terms for normalized Legendre polynomials. - Tom Copeland,
    Feb 04 2016

    <item>From Ralf Steiner, Apr 07 2017: By analytic continuation to the
    entire complex plane there exist regularized values for divergent sums:
    <math|a<around|(|n|)>/A*060818<around|(|n|)>=<around|(|-2|)><rsup|n><sqrt|\<pi\>>/<around|(|\<Gamma\>*<around|(|1/2-n|)>*\<Gamma\>*<around|(|1+n|)>|)>>.

    <item>Summation identities involving <math|a<around|(|n|)>> and related
    sequences revealing deep connections with square roots of small integers,
    the gamma function, and hypergeometric functions.

    <item><math|a<around|(|n|)>> is the numerator of
    <math|<around|(|1/\<pi\>|)>\<cdot\><big|int><rsub|-\<infty\>><rsup|+\<infty\>><text|sech><around|(|x|)><rsup|2*n+1>*d*x>.
    The corresponding denominator is A046161. - Mohammed Yaseen, Jul 29 2023

    <item><math|a<around|(|n|)>> is the numerator of
    <math|<around|(|1/\<pi\>|)>\<cdot\><big|int><rsub|0><rsup|\<pi\>/2>sin
    <around|(|x|)><rsup|2*n>*d*x>. The corresponding denominator is
    A101926(n). - Mohammed Yaseen, Sep 19 2023
  </itemize>

  <section*|References>

  <\enumerate>
    <item>P. J. Davis, <with|font-shape|italic|Interpolation and
    Approximation>, Dover Publications, 1975, p. 372.

    <item>W. Feller, <with|font-shape|italic|An Introduction to Probability
    Theory and Its Applications>, Vol. 1, 2nd ed. New York: Wiley, 1968;
    Chap. III, Eq. 4.1.

    <item>N. J. A. Sloane, <with|font-shape|italic|A Handbook of Integer
    Sequences>, Academic Press, 1973 (includes this sequence).

    <item>N. J. A. Sloane and Simon Plouffe, <with|font-shape|italic|The
    Encyclopedia of Integer Sequences>, Academic Press, 1995 (includes this
    sequence).

    <item>J. V. Uspensky and M. A. Heaslet,
    <with|font-shape|italic|Elementary Number Theory>, McGraw-Hill, NY, 1939,
    p. 102.
  </enumerate>

  <section*|Links>

  <\itemize>
    <item>Robert G. Wilson v, Table of n, a(n) for n = 0..1666 (first 201
    terms from T. D. Noe)

    <item>Eric Weisstein's World of Mathematics, Binomial Series

    <item>Wikipedia, Lorentz Factor
  </itemize>

  <section*|Keywords>

  nonn, easy, nice, frac

  <section*|Author>

  N. J. A. Sloane

  <section*|Status>

  Approved

  <\bibliography|bib|tm-plain|refs2>
    <\bib-list|1>
      <bibitem*|1><label|bib-oeisA001790>OEIS<nbsp>Foundation Inc.
      <newblock>A001790 numerators in the expansion of
      <math|<frac|1|<sqrt|1-x>>>. <newblock><slink|http://oeis.org/A001790>,
      2024. <newblock>This sequence gives the numerators of the Maclaurin
      series of the Lorentz factor (see Wikipedia link) of
      <math|<frac|1|<sqrt|1-b<rsup|2>>>=<frac|d*t|d*\<tau\>>> where
      <math|b=<frac|u|c>> is the velocity in terms of the speed of light c, u
      is the velocity as observed in the reference frame where time t is
      measured and tau is the proper time. - Stephen Crowley, Apr 03
      2007.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|auto-2|<tuple|?|1>>
    <associate|auto-3|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-4|<tuple|5|3>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-7|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-8|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|bib-oeisA001790|<tuple|1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      oeisA001790
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|OFFSET>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Comments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Links>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Keywords>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Author>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Status>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>