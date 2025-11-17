<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Injective Measure-Preserving Time-Changes of
  Stationary Processes are Oscillatory>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|July 24, 2025>>

  <section|<section*|Oscillatory Processes and Normalized Injective
  Time-Changes>>

  <\definition>
    [Oscillatory Process] A complex-valued second-order stochastic process
    <math|<around|{|X<rsub|t>|}><rsub|t\<in\>I>> is said to be oscillatory if
    there exists a family of functions <math|\<phi\><rsub|t><around|(|\<omega\>|)>>
    and a complex orthogonal increment process <math|Z<around|(|\<omega\>|)>>
    with

    <\equation>
      E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>
    </equation>

    \ such that

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)><space|0.17em>
    </equation>

    where

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation>

    and <math|A<rsub|t><around|(|\<omega\>|)>> is a quadratically integrable
    gain function with respect to <math|d*\<mu\>>.
  </definition>

  <\definition*>
    [Stationary Process] A second-order process
    <math|<around|{|S<rsub|t>|}><rsub|t\<in\>J>> is stationary if it admits
    the spectral representation

    <\equation>
      S<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>

    for some orthogonal increment process <math|Z<around|(|\<omega\>|)>> with

    <\equation>
      E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>
    </equation>
  </definition*>

  \;

  <\theorem>
    [Oscillatory Representation of Injective Time-Change] The process

    <\equation>
      X<rsub|t>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>>
    </equation>

    has the oscillatory representation

    <\equation>
      <tabular|<tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>d*Z<around|(|\<omega\>|)>>>>>>
    </equation>

    where

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>
    </equation>
  </theorem>

  <\proof>
    Starting from the spectral representation of <math|S<rsub|t>>:

    <\align>
      <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*d*Z<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*d*Z<around|(|\<omega\>|)><eq-number>>>>>
    </align>

    Thus

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>
    </equation>
  </proof>

  <\corollary>
    [Envelope in Standard Form] The oscillatory functions can be written in
    the standard for

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation>

    \ where

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>
  </corollary>

  <\proof>
    Substitute and combine the exponentials

    <\align>
      <tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<omega\>|)>>|<cell|=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t+t|)>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>>>>>
    </align>

    where

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>
  </proof>

  <\theorem>
    [Evolutionary Power Spectrum] For the oscillatory process\ 

    <\equation>
      X<rsub|t>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>>
    </equation>

    \ with envelope\ 

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    the evolutionary power spectrum at time <math|t> is

    <\equation>
      d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>=\<theta\><rprime|'><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>
    </equation>
  </theorem>

  <\proof>
    The evolutionary power spectrum is defined as

    <\equation>
      d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    Computing the magnitude squared:

    <\align>
      <tformat|<table|<row|<cell|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>>|<cell|=<around*|\||<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)><around*|\||e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)>\<cdot\>1<eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)><eq-number>>>>>
    </align>

    Therefore

    <\equation>
      d*F<rsub|t><around|(|\<omega\>|)>=\<theta\><rprime|'><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>
    </equation>
  </proof>

  <\theorem>
    [L\<twosuperior\>-Norm Preservation] The transformation\|

    <\equation>
      S<rsub|t>\<mapsto\><sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>>
    </equation>

    \ preserves the L\<twosuperior\>-norm in the sense that

    <\equation>
      <big|int><rsub|I>E<around|\||X<rsub|t>|\|><rsup|2>*d*t=<big|int><rsub|J>E<around|\||S<rsub|s>|\|><rsup|2>*d*s
    </equation>

    where <math|I> is the domain of <math|t> and
    <math|J=\<theta\><around|(|I|)>>.
  </theorem>

  <\proof>
    Using the change of variables <math|s=\<theta\><around|(|t|)>>, so
    <math|d*s=\<theta\><rprime|'><around|(|t|)>*d*t>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|I>E<around|\||X<rsub|t>|\|><rsup|2>*d*t>|<cell|=<big|int><rsub|I>E*<around*|\||<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>>|\|><rsup|2>*d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|I>\<theta\><rprime|'><around|(|t|)>*E<around|\||S<rsub|\<theta\><around|(|t|)>>|\|><rsup|2>*d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|J>E<around|\||S<rsub|s>|\|><rsup|2>*d*s<eq-number>>>>>
    </align>
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-4|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc><assign|section-numbered|false><assign|section-prefix|<macro|>><assign|subsection-nr|0><assign|subsubsection-nr|0><assign|paragraph-nr|0><assign|subparagraph-nr|0><flag|table
      of contents|dark green|what><assign|auto-nr|2><write|toc|<vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Oscillatory
      Processes and Normalized Injective Time-Changes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>><toc-notify|toc-strong-2|Oscillatory
      Processes and Normalized Injective Time-Changes><surround|<no-indent>|<specific|texmacs|<htab|0fn|first>>|<with|font-series|<quote|bold>|math-font-series|<quote|bold>|<vspace*|1.5fn><with|font-size|<quote|1.414>|Oscillatory
      Processes and Normalized Injective Time-Changes<space|2spc>><vspace|0.5fn>><no-page-break><no-indent*>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Oscillatory
      Processes and Normalized Injective Time-Changes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>