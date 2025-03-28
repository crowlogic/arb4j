<TeXmacs|2.1.4>

<style|generic>

<\body>
  \;

  Let <math|f<around|(|z|)>> be a complex rational function defined as:

  <\equation*>
    f<around|(|z|)>=<frac|P<around|(|z|)>|Q<around|(|z|)>>+i*<frac|R<around|(|z|)>|S<around|(|z|)>>,
  </equation*>

  where <math|P<around|(|z|)>,Q<around|(|z|)>,R<around|(|z|)>,S<around|(|z|)>>
  are real-valued rational functions, and <math|z=x+i*y> is a complex
  variable with real part <math|x> and imaginary part <math|y>.

  The goal is to evaluate <math|f<around|(|z|)>> at <math|z=x+i*y>, ensuring
  proper complex arithmetic.

  <section*|Notation>

  For any complex function <math|H<around|(|z|)>>, we denote:

  <\itemize>
    <item><math|H<rsub|r><around|(|x,y|)>> or simply <math|H<rsub|r>>: The
    real part of <math|H<around|(|z|)>>

    <item><math|H<rsub|i><around|(|x,y|)>> or simply <math|H<rsub|i>>: The
    imaginary part of <math|H<around|(|z|)>>
  </itemize>

  Thus, <math|H<around|(|z|)>=H<rsub|r>+i*H<rsub|i>> where both
  <math|H<rsub|r>> and <math|H<rsub|i>> are real-valued functions.

  <section*|Complex Division>

  For a single complex rational function <math|<frac|P<around|(|z|)>|Q<around|(|z|)>>>,
  we multiply by the complex conjugate:

  <\equation*>
    <frac|P<around|(|z|)>|Q<around|(|z|)>>=<frac|P<around|(|z|)>*Q<rsup|\<ast\>><around|(|z|)>|Q<around|(|z|)>*Q<rsup|\<ast\>><around|(|z|)>>=<frac|<around|(|P<rsub|r>+i*P<rsub|i>|)>*<around|(|Q<rsub|r>-i*Q<rsub|i>|)>|<around|(|Q<rsub|r>+i*Q<rsub|i>|)>*<around|(|Q<rsub|r>-i*Q<rsub|i>|)>>
  </equation*>

  This simplifies to:

  <\equation*>
    <frac|P<around|(|z|)>|Q<around|(|z|)>>=<frac|<around|(|P<rsub|r>*Q<rsub|r>+P<rsub|i>*Q<rsub|i>|)>+i*<around|(|P<rsub|i>*Q<rsub|r>-P<rsub|r>*Q<rsub|i>|)>|Q<rsub|r><rsup|2>+Q<rsub|i><rsup|2>>
  </equation*>

  Similarly for <math|<frac|R<around|(|z|)>|S<around|(|z|)>>>:

  <\equation*>
    <frac|R<around|(|z|)>|S<around|(|z|)>>=<frac|<around|(|R<rsub|r>*S<rsub|r>+R<rsub|i>*S<rsub|i>|)>+i*<around|(|R<rsub|i>*S<rsub|r>-R<rsub|r>*S<rsub|i>|)>|S<rsub|r><rsup|2>+S<rsub|i><rsup|2>>
  </equation*>

  <section*|Final Expression>

  Therefore:

  <\equation*>
    f<around|(|z|)>=<around*|(|<frac|P<rsub|r>*Q<rsub|r>+P<rsub|i>*Q<rsub|i>|Q<rsub|r><rsup|2>+Q<rsub|i><rsup|2>>|)>+i<around*|(|<frac|P<rsub|i>*Q<rsub|r>-P<rsub|r>*Q<rsub|i>|Q<rsub|r><rsup|2>+Q<rsub|i><rsup|2>>|)>+i<around*|(|<frac|R<rsub|r>*S<rsub|r>+R<rsub|i>*S<rsub|i>|S<rsub|r><rsup|2>+S<rsub|i><rsup|2>>|)>-<around*|(|<frac|R<rsub|i>*S<rsub|r>-R<rsub|r>*S<rsub|i>|S<rsub|r><rsup|2>+S<rsub|i><rsup|2>>|)>
  </equation*>

  Combining real and imaginary parts:

  <\equation*>
    <text|Re><around|(|f<around|(|z|)>|)>=<frac|P<rsub|r>*Q<rsub|r>+P<rsub|i>*Q<rsub|i>|Q<rsub|r><rsup|2>+Q<rsub|i><rsup|2>>-<frac|R<rsub|i>*S<rsub|r>-R<rsub|r>*S<rsub|i>|S<rsub|r><rsup|2>+S<rsub|i><rsup|2>>
  </equation*>

  <\equation*>
    <text|Im><around|(|f<around|(|z|)>|)>=<frac|P<rsub|i>*Q<rsub|r>-P<rsub|r>*Q<rsub|i>|Q<rsub|r><rsup|2>+Q<rsub|i><rsup|2>>+<frac|R<rsub|r>*S<rsub|r>+R<rsub|i>*S<rsub|i>|S<rsub|r><rsup|2>+S<rsub|i><rsup|2>>
  </equation*>

  <section*|Proof of Correctness>

  <subsection*|Complex Division Property>

  The use of complex conjugates in the numerator and denominator preserves
  equality while eliminating complex division:

  <\equation*>
    <frac|a+b*i|c+d*i>=<frac|<around|(|a+b*i|)>*<around|(|c-d*i|)>|<around|(|c+d*i|)>*<around|(|c-d*i|)>>=<frac|<around|(|a*c+b*d|)>+i*<around|(|b*c-a*d|)>|c<rsup|2>+d<rsup|2>>
  </equation*>

  <subsection*|Denominator Non-zero Condition>

  The denominators <math|Q<rsub|r><rsup|2>+Q<rsub|i><rsup|2>> and
  <math|S<rsub|r><rsup|2>+S<rsub|i><rsup|2>> are sums of squares, which are
  always positive for non-zero complex numbers, ensuring valid division.

  <subsection*|Component Interaction>

  Each component of the output (Re<math|<around|(|f<around|(|z|)>|)>,<text|Im><around|(|f<around|(|z|)>|)>>)
  properly depends on both real and imaginary parts of the input through the
  cross-terms in the numerators.

  <subsection*|Special Case Verification>

  For real inputs (<math|y=0>), the imaginary components become zero,
  reducing to the expected real-valued result.

  <section*|Conclusion>

  This formulation correctly evaluates complex rational functions by:

  <\itemize>
    <item>Properly handling complex division using conjugates

    <item>Maintaining the relationship between input and output components

    <item>Ensuring well-defined results for all valid inputs

    <item>Preserving expected behavior for special cases
  </itemize>
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
    <associate|auto-2|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
    <associate|auto-3|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
    <associate|auto-4|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-7|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-8|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-9|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Notation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Complex
      Division> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Final
      Expression> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Proof
      of Correctness> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Complex Division Property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|Denominator Non-zero Condition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|Component Interaction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|Special Case Verification
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>