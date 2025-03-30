<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Proof of Orthonormality of a Certain Sequence of
  Spherical Bessel functions of the First
  Kind>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  \;

  Let <math|\<psi\><rsub|n><around|(|y|)>> be defined as:

  <\equation>
    \<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
  </equation>

  where <math|J<rsub|\<nu\>><around|(|y|)>> is the Bessel function of the
  first kind of order <math|\<nu\>>.

  <\theorem>
    The functions <math|\<psi\><rsub|n><around|(|y|)>> are orthonormal over
    the interval <math|0> to <math|\<infty\>>, i.e.,

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j><around|(|y|)>*\<psi\><rsub|k><around|(|y|)>*<space|0.17em>d*y=\<delta\><rsub|j*k>
    </equation>

    where <math|\<delta\><rsub|j*k>> is the Kronecker delta, defined as:

    <\equation>
      \<delta\><rsub|j*k>=<choice|<tformat|<table|<row|<cell|1,>|<cell|<text|if
      >j=k>>|<row|<cell|0,>|<cell|<text|if >j\<neq\>k>>>>>
    </equation>
  </theorem>

  <\proof>
    First, consider the given integral:

    <\equation>
      I=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j><around|(|y|)>*\<psi\><rsub|k><around|(|y|)>*<space|0.17em>d*y
    </equation>

    Substituting <math|\<psi\><rsub|j><around|(|y|)>> and
    <math|\<psi\><rsub|k><around|(|y|)>>, we get:

    <\equation>
      I=<big|int><rsub|0><rsup|\<infty\>><sqrt|<frac|4*j+1|y>>*<around|(|-1|)><rsup|j>*J<rsub|2*j+<frac|1|2>><around|(|y|)><sqrt|<frac|4*k+1|y>>*<around|(|-1|)><rsup|k>*J<rsub|2*k+<frac|1|2>><around|(|y|)>*<space|0.17em>d*y
    </equation>

    This simplifies to:

    <\equation>
      I=<sqrt|<around|(|4*j+1|)>*<around|(|4*k+1|)>>*<around|(|-1|)><rsup|j+k>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*j+<frac|1|2>><around|(|y|)>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y
    </equation>

    Next, we use the orthogonality relation for Bessel functions
    <cite|watson1995treatise>:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|\<nu\>><around|(|y|)>*J<rsub|\<mu\>><around|(|y|)>|y>*<space|0.17em>d*y=<frac|\<delta\><rsub|\<nu\>*\<mu\>>|2*\<nu\>>
    </equation>

    where <math|J<rsub|\<nu\>><around|(|y|)>> and
    <math|J<rsub|\<mu\>><around|(|y|)>> are Bessel functions of the first
    kind with orders <math|\<nu\>> and <math|\<mu\>>, respectively. For our
    case, <math|\<nu\>=2*j+<frac|1|2>> and <math|\<mu\>=2*k+<frac|1|2>>.
    Thus, we have:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*j+<frac|1|2>><around|(|y|)>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y=<frac|\<delta\><rsub|j*k>|4*j+1>
    </equation>

    Substituting this back into our integral <math|I>:

    <\equation>
      I=<sqrt|<around|(|4*j+1|)>*<around|(|4*k+1|)>>*<around|(|-1|)><rsup|j+k><frac|\<delta\><rsub|j*k>|4*j+1>
    </equation>

    For <math|j\<neq\>k>, <math|\<delta\><rsub|j*k>=0>, resulting in:

    <\equation>
      I=0
    </equation>

    For <math|j=k>, <math|\<delta\><rsub|j*k>=1>, and we get:

    <\equation>
      I=<frac|<sqrt|<around|(|4*j+1|)><rsup|2>>|4*j+1>=1
    </equation>

    Thus, the orthonormality condition holds true.
  </proof>

  <thebibliography|9|<bibitem|watson1995treatise>G. N. Watson, A Treatise on
  the Theory of Bessel Functions, Cambridge University Press, 1995.>
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
    <associate|auto-1|<tuple|11|2|../../.TeXmacs/texts/scratch/no_name_41.tm>>
    <associate|bib-watson1995treatise|<tuple|watson1995treatise|2|../../.TeXmacs/texts/scratch/no_name_41.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      watson1995treatise
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>