<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Generalized Solutions to the Zeta Function Integral
  Equation>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  Following the work of Rao<nbsp><cite|rao2025>, this note establishes the
  complete characterization of generalized solutions to the integral equation
  arising from the equivalence between zeros of the Riemann zeta function and
  solutions to a convolution equation. Rao showed that the existence of
  nontrivial zeros <math|\<zeta\>*<around|(|\<sigma\>+i*t|)>=0> for
  <math|\<sigma\>\<in\><around|(|0,1|)>> is equivalent to the existence of
  nontrivial solutions to the integral equation

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|\<sigma\>>*<around|(|x-y|)>*\<phi\><around|(|y|)>*<space|0.17em>d*y=0
  </equation>

  where the kernel <math|K<rsub|\<sigma\>>> arises from the Fourier
  representation of the zeta function.

  The kernel <math|K<rsub|\<sigma\>>> is defined explicitly through the
  integral representation

  <\equation>
    \<zeta\><around|(|s|)>*<around|(|1-2<rsup|1-s>|)>=<big|int><rsub|\<bbb-R\>>K<rsub|\<sigma\>><around|(|u|)>*e<rsup|i*t*u>*<space|0.17em>d*u
  </equation>

  for <math|s=\<sigma\>+i*t>, where

  <\equation>
    K<rsub|\<sigma\>><around|(|u|)>=<frac|e<rsup|\<sigma\>*u>|e<rsup|e<rsup|u>>+1>\<forall\>u\<in\>\<bbb-R\>
  </equation>

  This kernel is obtained by the change of variables <math|u=log x> applied
  to the integral <math|<big|int><rsub|0><rsup|\<infty\>><frac|x<rsup|\<sigma\>-1>|e<rsup|x>+1>*e<rsup|i*t*log
  x>*<space|0.17em>d*x> appearing in Rao's derivation.

  <\theorem>
    [Complete Space of Generalized Solutions]<label|thm:generalized_solutions>

    Let\ 

    <\equation>
      K<rsub|\<sigma\>><around|(|u|)>=<frac|e<rsup|\<sigma\>*u>|e<rsup|e<rsup|u>>+1>\<forall\>\<sigma\>\<in\><around|(|0,1|)>
    </equation>

    <math|>Since <math|K<rsub|\<sigma\>>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>,
    its Fourier transform

    <\equation>
      <wide|K<rsub|\<sigma\>>|^><around|(|t|)>=<big|int><rsub|\<bbb-R\>>K<rsub|\<sigma\>><around|(|u|)>*e<rsup|-i*t*u>*<space|0.17em>d*u
    </equation>

    exists and is continuous. Define the zero set

    <\equation>
      Z<rsub|\<sigma\>>\<assign\><around|{|t\<in\>\<bbb-R\>:<wide|K<rsub|\<sigma\>>|^><around|(|t|)>=0|}>.
    </equation>

    The complete space of generalized solutions to the convolution equation

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|\<sigma\>>*<around|(|x-y|)>*\<phi\><around|(|y|)>*<space|0.17em>d*y=0,<space|1em>\<forall\>x\<in\>\<bbb-R\>
    </equation>

    in the space of tempered distributions
    <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>> is

    <\equation>
      \<cal-N\><rsub|\<sigma\>>=<around*|{|\<phi\>\<in\>\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>:<text|supp><around|(|<wide|\<phi\>|^>|)>\<subseteq\>Z<rsub|\<sigma\>>|}>.
    </equation>

    Moreover, every solution <math|\<phi\>\<in\>\<cal-N\><rsub|\<sigma\>>>
    admits the integral representation

    <\equation>
      \<phi\><around|(|x|)>=<big|int><rsub|Z<rsub|\<sigma\>>>e<rsup|i*t*x>*<space|0.17em>d*\<mu\><around|(|t|)>
    </equation>

    where <math|\<mu\>> is a complex tempered measure on
    <math|Z<rsub|\<sigma\>>>.
  </theorem>

  <\proof>
    The convolution operator <math|T:\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>\<to\>\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>
    defined by <math|T*\<phi\>=K<rsub|\<sigma\>>\<ast\>\<phi\>> satisfies

    <\equation>
      <wide|T*\<phi\>|^>=<wide|K<rsub|\<sigma\>>|^>\<cdot\><wide|\<phi\>|^>
    </equation>

    in the sense of tempered distributions.

    The equation <math|T*\<phi\>=0> is equivalent to
    <math|<wide|K<rsub|\<sigma\>>|^><around|(|t|)>*<wide|\<phi\>|^><around|(|t|)>=0>
    as an identity of distributions. Since <math|<wide|K<rsub|\<sigma\>>|^>>
    is a continuous function, this occurs if and only if
    supp<math|<around|(|<wide|\<phi\>|^>|)>\<subseteq\>Z<rsub|\<sigma\>>>.

    For the integral representation, any tempered distribution <math|\<phi\>>
    with supp<math|<around|(|<wide|\<phi\>|^>|)>\<subseteq\>Z<rsub|\<sigma\>>>
    can be written as

    <\equation>
      \<phi\><around|(|x|)>=<big|int><rsub|Z<rsub|\<sigma\>>>e<rsup|i*t*x>*<space|0.17em>d*\<mu\><around|(|t|)>
    </equation>

    by the Bochner-Schwartz theorem, where <math|\<mu\>> is a tempered
    measure on <math|Z<rsub|\<sigma\>>>. The integral converges in
    <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>> since for any test
    function <math|\<psi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>,

    <\equation>
      <around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>=<big|int><rsub|Z<rsub|\<sigma\>>><wide|\<psi\>|^><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|t|)>
    </equation>

    is well-defined due to the rapid decay of <math|<wide|\<psi\>|^>>.

    Conversely, any such integral representation yields a solution since
    <math|<wide|\<phi\>|^>=\<mu\>> as measures, and
    supp<math|<around|(|\<mu\>|)>\<subseteq\>Z<rsub|\<sigma\>>> implies
    <math|<wide|K<rsub|\<sigma\>>|^>\<cdot\><wide|\<phi\>|^>=0>.
  </proof>

  <\corollary>
    [Application to Zeta Function Zeros] For the kernel
    <math|K<rsub|\<sigma\>>> defined above, the Fourier transform satisfies

    <\equation>
      <wide|K<rsub|\<sigma\>>|^><around|(|t|)>=<frac|\<zeta\>*<around|(|\<sigma\>+i*t|)>*<around|(|1-2<rsup|1-<around|(|\<sigma\>+i*t|)>>|)>|C<rsub|\<sigma\>>>
    </equation>

    for some nonzero constant <math|C<rsub|\<sigma\>>>. Since
    <math|1-2<rsup|1-s>\<neq\>0> for <math|s> with
    Re<math|<around|(|s|)>\<in\><around|(|0,1|)>>, the zero set is

    <\equation>
      Z<rsub|\<sigma\>>=<around|{|t\<in\>\<bbb-R\>:\<zeta\>*<around|(|\<sigma\>+i*t|)>=0|}>
    </equation>

    Therefore, the complete space of generalized solutions is

    <\equation>
      \<cal-N\><rsub|\<sigma\>>=<around*|{|\<phi\><around|(|x|)>=<big|int><rsub|<around|{|t:\<zeta\>*<around|(|\<sigma\>+i*t|)>=0|}>>e<rsup|i*t*x>*<space|0.17em>d*\<mu\><around|(|t|)>:\<mu\><text|is
      a tempered measure>|}>.
    </equation>
  </corollary>

  <thebibliography|9|<bibitem|rao2025>Rao, M.M. Harmonic and Probabilistic
  Approaches to Zeros of Riemann's Zeta Function. Department of Mathematics,
  University of California, Riverside.>
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-2|<tuple|15|3|../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-rao2025|<tuple|rao2025|3|../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|thm:generalized_solutions|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_11.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      rao2025
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>