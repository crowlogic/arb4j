<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Stationary Isotropic Correlation Functions>>

  <abstract-data|<abstract|Examples of Stationary Isotropic Correlation
  Functions in 1, 2 and 3 dimensions are recalled from
  Yaglom'87<cite|yaglom1987>>>

  \;

  <\example>
    <cite-detail|yaglom1987|Example 6>Consider the stationary correlation
    function (2.101) given by the equation

    <\equation>
      B<around|(|\<tau\>|)>=C*exp <around|(|-\<alpha\>*\<tau\>|)>*cos
      <around|(|\<omega\><rsub|0>*\<tau\>|)>
    </equation>

    where <math|\<alpha\>\<gtr\>0>, <math|\<omega\><rsub|0>\<gtr\>0>,
    <math|\<tau\>\<gtr\>0>.

    It is clear that if <math|\<alpha\>> is small enough, this function does
    not satisfy even the first inequality (4.1.13), i.e. it does not belong
    to the class <math|D<rsub|0>> of isotropic correlation function in the
    space <math|\<bbb-R\><rsup|n>>. By evaluating, with the aid of (4.1.18)
    or (2.102) and (4.1.32), the two-dimensional spectral density
    <math|f<around|(|k|)>>, which corresponds to the correlation function
    <math|B<around|(|\<tau\>|)>>, and by studying the conditions for the
    nonnegativity of this <math|f<around|(|k|)>>, one can show that the
    function (2.101) is a possible correlation function of the isotropic
    field in the space <math|\<bbb-R\><rsup|n>> if, and only if,
    <math|\<alpha\>\<gtr\><sqrt|\<omega\><rsub|0><rsup|2>+\<lambda\><rsub|n><rsup|2>>>.
    It is still easier to obtain conditions guaranteeing that
    <math|B<around|(|\<tau\>|)>> belongs to <math|D<rsub|n>>. Indeed, it was
    noted on pp. 124-125 that for a (one-dimensional) spectral density
    corresponding to the correlation function (2.101) is monotonically
    nonincreasing on the positive half-axis if, and only if,
    <math|\<alpha\>\<geq\><sqrt|3>*\<omega\><rsub|0>>. It follows that the
    function (2.101) is a three-dimensional isotropic correlation function in
    the space <math|\<bbb-R\><rsup|3>> if, and only if,
    <math|\<alpha\>\<geq\><sqrt|3>*\<omega\><rsub|0>>.
  </example>

  <\example>
    <cite-detail|yaglom1987|Example 7>Formula (4.105) shows that the function

    <\equation>
      B<around|(|\<tau\>|)>=<frac|*J<rsub|<frac|n-2|2>>*<around|(|\<alpha\>*\<tau\>|)>|C*<around|(|\<alpha\>*\<tau\>|)><rsup|<frac|n-2|2>>>
    </equation>

    where <math|C\<gtr\>0>, <math|\<alpha\>\<gtr\>0>, is an
    <math|n>-dimensional isotropic correlation function. The spectral
    distribution function <math|\<Phi\><around|(|k|)>> corresponding to this
    correlation function is clearly of the form

    <\equation*>
      \<Phi\><around|(|k|)>=<choice|<tformat|<table|<row|<cell|0,>|<cell|<text|for
      >k\<less\>\<alpha\>>>|<row|<cell|<frac|<frac|C|2><around*|(|<frac|\<alpha\>|2>|)><rsup|<frac|n|2>>|\<Gamma\><around*|(|<frac|n|2>|)>*k<rsup|n+1>>*>|<cell|<text|for
      >k\<gtr\>\<alpha\>>>>>>
    </equation*>

    i.e., the <math|n>-dimensional spectral density is given here by the
    relation

    <\equation>
      f<around|(|k|)>=\<Phi\><rprime|'><around|(|k|)><around*|(|<frac|\<alpha\>|2>|)><rsup|<frac|n|2>>*2*\<pi\><rsup|-<frac|n|2>>*k<rsup|n-1>=<frac|<frac|C|<around|(|2*\<pi\>|)><rsup|<frac|n|2>>>*\<alpha\><rsup|<frac|n|2>>*|\<Gamma\>*<around*|(|<frac|n|2>+1|)>>*k<rsup|n-1>*\<delta\>*<around|(|k-\<alpha\>|)>
    </equation>

    where <math|\<delta\><around|(|x|)>> is the Dirac
    <math|\<delta\>>-function. Using (4.120), we easily obtain an equation of
    the form (2.138), with <math|\<nu\>=<frac|n-2|2>>, for the corresponding
    one-dimensional spectral density <math|f<rsub|1><around|(|k|)>>.
    Replacing <math|<frac|n-2|2>> in the right-hand side of (4.1.39) by an
    arbitrary real number <math|\<nu\>\<gtr\>-<frac|1|2>>, we arrive at a
    more general stationary correlation function (2.137). The inequality
    (4.112) clearly implies that the function (2.137) does not belong to the
    class <math|D<rsub|n>> (i.e. cannot be an isotropic correlation function
    in the <math|n>-dimensional space <math|\<bbb-R\><rsup|n>>) if
    <math|\<nu\>\<less\><frac|n-2|2>>. On the other hand, it is not hard to
    show that if <math|\<nu\>\<gtr\><frac|n-2|2>> the function (2.137)
    belongs to the class <math|D><rsub|n> . In fact, it is well known that
    for <math|\<nu\>\<gtr\>\<nu\><rsub|\<ast\>>=-1> the following identity
    holds:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>k<rsup|\<mu\>>*J<rsub|\<mu\>>*<around|(|k*x|)>*J<rsub|\<mu\>>*<around|(|k*y|)>*k*<space|0.17em>d*k=<frac|2<rsup|\<mu\>-1>*\<Gamma\>*<around|(|\<nu\>+\<mu\>|)>|x<rsup|\<mu\>>*\<Gamma\><around|(|\<mu\>|)>*y<rsup|\<nu\>+1>>*\<delta\>*<around|(|x-y|)><space|1em><text|\<forall\><math|\<mu\>\<gtr\>-<frac|1|2>>>
    </equation>

    (see, e.g., Erdelyi et al., 1953, Vol. 2, Eq. 7.14.2(34) or Gradshteyn
    and Ryzhik, 1980, Eq. 6.575(1)). According to (4.114) it follows from
    this that, for <math|\<nu\>\<gtr\><around|(|n-2|)>/2>, the
    <math|n>-dimensional spectral density <math|f<around|(|k|)>>, which
    corresponds to the correlation function (2.137), has the form

    <\equation>
      f<around|(|k|)>=<choice|<tformat|<table|<row|<cell|C*<around|(|\<alpha\><rsup|2>-k<rsup|2>|)>\<nu\>-<frac|n|2>>|<cell|<text|for
      >k\<less\>\<alpha\>>>|<row|<cell|0>|<cell|<text|for
      >k\<gtr\>\<alpha\>>>>>>
    </equation>

    where <math|C> is a normalization constant. The function (4.139) is
    everywhere nonnegative; hence the function (2.137), where
    <math|\<nu\>\<gtr\><frac|n-2|2>>, belongs to <math|D<rsub|n>>.

    Some more examples of isotropic correlation functions can also be found
    in the available literature, but we will not pursue this topic any
    further here.
  </example>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-yaglom1987>A.M.<nbsp>Yaglom.
      <newblock><with|font-shape|italic|Correlation Theory of Stationary and
      Related Random Functions: Volume I: Basic Results>. <newblock>Applied
      Probability. Springer New York, 1987.<newblock>
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
    <associate|auto-1|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|bib-yaglom1987|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      yaglom1987

      yaglom1987
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>