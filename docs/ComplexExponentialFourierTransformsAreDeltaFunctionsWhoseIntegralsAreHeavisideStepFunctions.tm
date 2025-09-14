<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Fourier Transform Theory: Complex Exponentials and
  Generalized Functions>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Definitions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Main
    Theorems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This document presents the fundamental relationships between the Fourier
  transform of complex exponentials, the Dirac delta function, and the
  Heaviside step function.

  <section|Definitions>

  <\definition>
    [Complex Exponential Function] The complex exponential function is
    defined as:

    <\equation>
      x<around|(|t|)>=e<rsup|j*\<omega\><rsub|0>*t>
    </equation>

    where <math|j=<sqrt|-1>> is the imaginary unit and
    <math|\<omega\><rsub|0>> is the angular frequency.
  </definition>

  <\definition>
    [Dirac Delta Function] The Dirac delta function
    <math|\<delta\><around|(|t|)>> is a generalized function (distribution)
    with the following properties:

    <\align>
      <tformat|<table|<row|<cell|\<delta\><around|(|t|)>>|<cell|=0*<space|1em><text|for
      >t\<neq\>0<eq-number>>>|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<delta\><around|(|t|)>*<space|0.17em>d*t>|<cell|=1<eq-number>>>|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)>*\<delta\>*<around|(|t-a|)>*<space|0.17em>d*t>|<cell|=f<around|(|a|)><space|1em><text|(sifting
      property)><eq-number>>>>>
    </align>
  </definition>

  <\definition>
    [Heaviside Step Function] The Heaviside step function
    <math|H<around|(|t|)>> is defined as:

    <\equation>
      H<around|(|t|)>=<choice|<tformat|<table|<row|<cell|0,>|<cell|t\<less\>0>>|<row|<cell|1,>|<cell|t\<geq\>0>>>>>
    </equation>
  </definition>

  <\definition>
    [Fourier Transform] The Fourier transform of a function
    <math|f<around|(|t|)>> is defined as:

    <\equation>
      F<around|(|\<omega\>|)>=\<cal-F\><around|{|f<around|(|t|)>|}>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)>*e<rsup|-j*\<omega\>*t>*<space|0.17em>d*t
    </equation>

    with the inverse transform:

    <\equation>
      f<around|(|t|)>=\<cal-F\><rsup|-1><around|{|F<around|(|\<omega\>|)>|}>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>F<around|(|\<omega\>|)>*e<rsup|j*\<omega\>*t>*<space|0.17em>d*\<omega\>
    </equation>
  </definition>

  <section|Main Theorems>

  <\theorem>
    [Fourier Transform of Complex Exponential] The Fourier transform of the
    complex exponential <math|e<rsup|j*\<omega\><rsub|0>*t>> is:

    <\equation>
      \<cal-F\><around|{|e<rsup|j*\<omega\><rsub|0>*t>|}>=2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>
    </equation>
  </theorem>

  Since <math|e<rsup|j*\<omega\><rsub|0>*t>> has infinite energy and is not
  absolutely integrable, we use the inverse transform approach.

  Starting with the frequency domain representation
  <math|2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>>, we
  apply the inverse Fourier transform:

  <\align>
    <tformat|<table|<row|<cell|\<cal-F\><rsup|-1>*<around|{|2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>|}>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>*e<rsup|j*\<omega\>*t>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>*e<rsup|j*\<omega\>*t>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=e<rsup|j*\<omega\><rsub|0>*t><space|1em><text|(by
    sifting property)><eq-number>>>>>
  </align>

  Therefore, by the uniqueness of the
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
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Definitions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Main
      Theorems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>