<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <section|The Discrete Fourier Transform>

  The Fourier transform establishes a bijective mapping between temporal and
  frequency domain representations of signals. For discrete-time signals of
  finite duration, the Discrete Fourier Transform (DFT) provides this
  mapping:

  <\definition>
    <dueto|Discrete Fourier Transform (DFT)>Given a discrete-time signal
    <math|x<around|(|k|)>> where <math|k=0,1,\<ldots\>,N-1>, the DFT yields
    the same number of complex coefficients <math|X<around|(|k|)>>:

    <\equation>
      X<around|(|k|)>=<big|sum><rsub|n=0><rsup|N-1>x<around|(|n|)>*exp
      <around*|(|-i*<frac|2*\<pi\>*k*n|N>|)>
    </equation>

    The inverse DFT reconstructs the original signal:

    <\equation>
      x<around|(|k|)>=<frac|1|N>*<big|sum><rsub|n=0><rsup|N-1>X<around|(|n|)>*exp
      <around*|(|i*<frac|2*\<pi\>*k*n|N>|)>
    </equation>
  </definition>

  The DFT presupposes periodic extension of the finite-length sequence
  <math|x<around|(|n|)>>, a fact that underlies many spectral estimation
  artifacts.

  <subsection|The Fast Fourier Transform>

  The Fast Fourier Transform denotes a family of algorithms that compute the
  DFT with <math|O<around|(|N*log N|)>> complexity rather than the
  <math|O<around|(|N<rsup|2>|)>> complexity of direct matrix multiplication.
  Crucially, the FFT produces numerically identical results to the DFT;
  scaling relationships derived for the DFT apply without modification to FFT
  implementations.

  <subsection|Magnitude and Phase>

  The complex output <math|X<around|(|k|)>> encodes both magnitude and phase
  information:

  <\equation>
    X<around|(|k|)>=<around|\||X<around|(|k|)>|\|>*exp <around*|(|i*arg
    <around|(|X<around|(|k|)>|)>|)>
  </equation>

  where <math|<around|\||X<around|(|k|)>|\|>> represents the magnitude and
  <math|arg <around|(|X<around|(|k|)>|)>> the phase of the <math|k>-th
  frequency component.

  <\definition>
    <dueto|Argument (Phase)>For a non-zero complex number <math|z=a+i*b>
    where <math|a,b\<in\>\<bbb-R\>>, the principal argument (phase) with
    range <math|<around|(|-\<pi\>,\<pi\>|]>> is:

    <\equation>
      arg <around|(|z|)>=<choice|<tformat|<cwith|1|1|1|-1|cell-valign|top>|<cwith|1|1|1|-1|cell-vmode|exact>|<cwith|1|1|1|-1|cell-height|<plus|1fn|10pt>>|<table|<row|<cell|2*arctan
      <around*|(|<dfrac|b|<sqrt|a<rsup|2>+b<rsup|2>>+a>|)>,>|<cell|<text|if
      >b\<neq\>0*<text|or >a\<gtr\>0,>>|<row|<cell|\<pi\>,>|<cell|<text|if
      >b=0*<text|and >a\<less\>0.>>>>>
    </equation>

    where <math|arg <around|(|0|)>> is undefined. This follows from the
    half-angle identity

    <\equation>
      \<lambda\>=2*arctan <around*|(|<frac|sin <around|(|\<lambda\>|)>|1+cos
      <around|(|\<lambda\>|)>>|)>,<space|1em>\<lambda\>\<in\><around|(|-\<pi\>,\<pi\>|)>
    </equation>

    where

    <\equation>
      a<around|(|r,\<lambda\>|)>=r*cos <around|(|\<lambda\>|)>
    </equation>

    and

    <\equation>
      b<around|(|r,\<lambda\>|)>=r*sin <around|(|\<lambda\>|)>
    </equation>

    with

    <\equation>
      r=<sqrt|a<rsup|2>+b<rsup|2>>
    </equation>

    The conjugate relationship

    <\equation>
      arg <around|(|<wide|z|\<bar\>>|)>=<choice|<tformat|<table|<row|<cell|-arg
      <around|(|z|)>,>|<cell|<text|if >z\<nin\><around|(|-\<infty\>,0|]>,>>|<row|<cell|\<pi\>,>|<cell|<text|if
      >z\<in\><around|(|-\<infty\>,0|)>>>>>>
    </equation>

    and the identity

    <\equation>
      b+i*a=i*<wide|z|\<bar\>>
    </equation>

    yield:

    <\equation>
      arg <around|(|i*<wide|z|\<bar\>>|)>=<choice|<tformat|<cwith|1|1|1|-1|cell-valign|top>|<cwith|1|1|1|-1|cell-vmode|exact>|<cwith|1|1|1|-1|cell-height|<plus|1fn|10pt>>|<table|<row|<cell|2*arctan
      <around*|(|<dfrac|a|<sqrt|a<rsup|2>+b<rsup|2>>+b>|)>,>|<cell|<text|if
      >a\<neq\>0*<text|or >b\<gtr\>0,>>|<row|<cell|\<pi\>,>|<cell|<text|if
      >a=0*<text|and >b\<less\>0.>>>>>
    </equation>
  </definition>

  For real-valued input signals <math|x<around|(|n|)>\<in\>\<bbb-R\>>, the
  DFT exhibits conjugate symmetry:

  <\equation>
    X<around|(|k|)>=X<rsup|\<ast\>>*<around|(|N-k|)>
  </equation>

  Consequently, the magnitude spectrum is symmetric:

  <\equation>
    <around|\||X<around|(|k|)>|\|>=<around|\||X*<around|(|N-k|)>|\|>
  </equation>

  and the phase spectrum is antisymmetric modulo <math|2*\<pi\>>:

  <\equation>
    arg <around|(|X<around|(|k|)>|)>\<equiv\>-arg
    <around|(|X*<around|(|N-k|)>|)><pmod|2*\<pi\>>
  </equation>

  with exact equality <math|arg <around|(|X<around|(|k|)>|)>=-arg
  <around|(|X*<around|(|N-k|)>|)>> holding when <math|X<around|(|k|)>> is not
  a negative real number. Thus in the real-valued (symmetric) case the
  coefficients contain redundant information.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-3|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_47.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Discrete Fourier Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Fast Fourier Transform
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Magnitude and Phase
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>