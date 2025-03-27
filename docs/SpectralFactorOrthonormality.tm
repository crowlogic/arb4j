<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Orthonormality Of The Spectral Factor
  Convolution>|<doc-date|>>

  <\lemma>
    [Orthonormality Preservation] Let <math|K<around|(|x,y|)>=J<rsub|0><around|(|<around|\||x-y|\|>|)>>
    be the Bessel kernel with spectral factor
    <math|\<rho\><around|(|y|)>=\<cal-F\><rsup|-1><around*|(|<sqrt|\<cal-F\><around|[|K|]><around|(|\<omega\>|)>>|)>>.
    Given an orthonormal basis <math|<around|{|\<psi\><rsub|n>|}><rsub|n=1><rsup|\<infty\>>>
    for <math|L<rsup|2><around|(|<around|[|0,\<infty\>|)>|)>>, the functions
    <math|\<phi\><rsub|n><around|(|x|)>=<around|(|\<psi\><rsub|n>\<ast\>\<rho\>|)><around|(|x|)>>
    satisfy:

    <\equation*>
      <around|\<langle\>|\<phi\><rsub|m>,\<phi\><rsub|n>|\<rangle\>><rsub|<with|math-font|cal*|H><rsub|K>>=\<delta\><rsub|m*n>,
    </equation*>

    where <math|<with|math-font|cal*|H><rsub|K>> is the RKHS associated with
    <math|K>.
  </lemma>

  <\proof>
    <subsection*|Step 1: RKHS Inner Product Characterization>

    For any <math|f,g\<in\><with|math-font|cal*|H><rsub|K>>, the RKHS inner
    product for translation-invariant kernels is:

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>><rsub|<with|math-font|cal*|H><rsub|K>>=<big|int><rsub|\<bbb-R\>><frac|\<cal-F\><around|[|f|]><around|(|\<omega\>|)><wide|\<cal-F\><around|[|g|]><around|(|\<omega\>|)>|\<bar\>>|\<cal-F\><around|[|K|]><around|(|\<omega\>|)>>*d*\<omega\>
    </equation>

    <subsection*|Step 2: Spectral Representation of <math|\<phi\><rsub|n>>>

    Using the Fourier convolution theorem:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\><around|[|\<phi\><rsub|n>|]><around|(|\<omega\>|)>>|<cell|=\<cal-F\>*<around|[|\<psi\><rsub|n>\<ast\>\<rho\>|]><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<cal-F\><around|[|\<psi\><rsub|n>|]><around|(|\<omega\>|)>\<cdot\>\<cal-F\><around|[|\<rho\>|]><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<cal-F\><around|[|\<psi\><rsub|n>|]><around|(|\<omega\>|)>\<cdot\><sqrt|\<cal-F\><around|[|K|]><around|(|\<omega\>|)>><eq-number>>>>>
    </align>

    <subsection*|Step 3: Inner Product Computation>

    Substitute into (1):

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|\<phi\><rsub|m>,\<phi\><rsub|n>|\<rangle\>><rsub|<with|math-font|cal*|H><rsub|K>>>|<cell|=<big|int><rsub|\<bbb-R\>><frac|<around*|(|\<cal-F\><around|[|\<psi\><rsub|m>|]><around|(|\<omega\>|)><sqrt|\<cal-F\><around|[|K|]><around|(|\<omega\>|)>>|)><around*|(|<wide|\<cal-F\><around|[|\<psi\><rsub|n>|]><around|(|\<omega\>|)>|\<bar\>><sqrt|\<cal-F\><around|[|K|]><around|(|\<omega\>|)>>|)>|\<cal-F\><around|[|K|]><around|(|\<omega\>|)>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<cal-F\><around|[|\<psi\><rsub|m>|]><around|(|\<omega\>|)><wide|\<cal-F\><around|[|\<psi\><rsub|n>|]><around|(|\<omega\>|)>|\<bar\>>d*\<omega\><eq-number>>>>>
    </align>

    <subsection*|Step 4: Parseval's Theorem Application>

    By Plancherel's theorem (Parseval for <math|L<rsup|2>>):

    <\equation>
      <big|int><rsub|\<bbb-R\>>\<cal-F\><around|[|\<psi\><rsub|m>|]><around|(|\<omega\>|)><wide|\<cal-F\><around|[|\<psi\><rsub|n>|]><around|(|\<omega\>|)>|\<bar\>>d*\<omega\>=<around|\<langle\>|\<psi\><rsub|m>,\<psi\><rsub|n>|\<rangle\>><rsub|L<rsup|2>>=\<delta\><rsub|m*n>
    </equation>

    <subsection*|Conclusion>

    Therefore:

    <\equation*>
      <around|\<langle\>|\<phi\><rsub|m>,\<phi\><rsub|n>|\<rangle\>><rsub|<with|math-font|cal*|H><rsub|K>>=\<delta\><rsub|m*n>
    </equation*>

    The convolution with <math|\<rho\>> preserves orthonormality from
    <math|L<rsup|2>> to <math|<with|math-font|cal*|H><rsub|K>>.
  </proof>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-3|<tuple|4|1>>
    <associate|auto-4|<tuple|6|2>>
    <associate|auto-5|<tuple|7|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|Step 1: RKHS Inner Product Characterization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|Step 2: Spectral Representation of
      <with|mode|<quote|math>|\<phi\><rsub|n>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Step 3: Inner Product Computation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|Step 4: Parseval's Theorem Application
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>