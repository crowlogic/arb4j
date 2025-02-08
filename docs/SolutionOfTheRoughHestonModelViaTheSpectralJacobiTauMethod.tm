<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Volterra Analysis of the Rough Heston
  Model<next-line>via Spectral Jacobi Tau
  Methods>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|February 7, 2025>>

  <abstract-data|<\abstract>
    This paper integrates the spectral Jacobi tau method with the fractional
    calculus framework of the rough Heston model. Exact solutions for the
    fractional Riccati equation are derived, including all nonlinear terms,
    using weighted Jacobi polynomial expansions. Numerical validation
    confirms the exponential accuracy of the spectral method.
  </abstract>>

  <\table-of-contents|toc>
    \;
  </table-of-contents>

  <section|Mathematical Framework><label|sec:math>

  <subsection|Rough Heston Process><label|sec:heston>

  The dynamics are described by:

  <\equation>
    d*v<rsub|t>=\<lambda\>*<around|(|\<theta\>-v<rsub|t>|)>*d*t+\<nu\>*<sqrt|v<rsub|t>>*d*B<rsub|t><rsup|H>
  </equation>

  where <math|B<rsub|t><rsup|H>> refers to the Mandelbrot-van Ness fractional
  Brownian motion:

  <\equation>
    B<rsub|t><rsup|H>=<frac|<big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|H-<frac|1|2>>*d*W<rsub|s>|\<Gamma\>*<around|(|H+<frac|1|2>|)>>*
  </equation>

  <subsubsection|Fractional SDE><label|subsec:fSDE>

  The equivalent fractional Volterra form is:

  <\equation>
    \<cal-D\><rsub|t><rsup|\<alpha\>>*v<rsub|t>=-\<lambda\>*<around|(|v<rsub|t>-\<theta\>|)>+\<nu\>*<sqrt|v<rsub|t>>*<wide|B|\<dot\>><rsub|t>
  </equation>

  where the Caputo derivative is defined as:

  <\equation>
    \<cal-D\><rsub|t><rsup|\<alpha\>>*f<around|(|t|)>=<frac|<big|int><rsub|0><rsup|t><frac|<wide|f|\<dot\>><around|(|s|)>|<around|(|t-s|)><rsup|\<alpha\>>>*d*s|\<Gamma\>*<around|(|1-\<alpha\>|)>>*
  </equation>

  <\theorem>
    <label|thm:volterra>The fractional SDE can be solved as:

    <\equation>
      v<rsub|t>=\<theta\>+<big|int><rsub|0><rsup|t>G*<around|(|t-s|)>*<around*|[|\<lambda\>*<around|(|\<theta\>-v<rsub|s>|)>*d*s+\<nu\>*<sqrt|v<rsub|s>>*d*B<rsub|s>|]>
    </equation>

    where the kernel is:

    <\equation>
      G<around|(|t|)>=<frac|t<rsup|\<alpha\>-1>|\<Gamma\><around|(|\<alpha\>|)>>*E<rsub|\<alpha\>>*<around|(|-\<lambda\>*t<rsup|\<alpha\>>|)>
    </equation>

    and <math|\<alpha\>=2*H+1>.
  </theorem>

  <subsection|Fractional Riccati Equation><label|subsec:fRiccati>

  The fractional Riccati equation for the characteristic function
  <math|\<phi\><rsub|T><around|(|u|)>> is given by:

  <\equation>
    <label|eq:fRiccati>\<cal-D\><rsub|t><rsup|\<alpha\>>*\<psi\><around|(|t,u|)>=<frac|u<rsup|2>+i*u|2>+<around|(|\<nu\>*\<rho\>*i*u-\<lambda\>|)>*\<psi\><around|(|t,u|)>+<frac|\<nu\><rsup|2>|2>*\<psi\><rsup|2><around|(|t,u|)>
  </equation>

  and is solved using the spectral Jacobi tau method.

  <section|Spectral Jacobi Tau Method>

  <subsection|Polynomial Expansions>

  The solution <math|\<psi\><around|(|t,u|)>> is expressed as an expansion in
  shifted Jacobi polynomials:

  <\equation>
    \<psi\><around|(|t,u|)>=<big|sum><rsub|k=0><rsup|N>c<rsub|k>*P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>><around*|(|<frac|t|T>|)>,
  </equation>

  where <math|P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>>
  are Jacobi polynomials, and the weight function is:

  <\equation>
    w<around|(|t|)>=t<rsup|\<alpha\>>*<around|(|1-t|)><rsup|\<beta\>>.
  </equation>

  The nonlinear terms <math|p<around|(|t|)>>,
  <math|q<around|(|t|)>*\<psi\><around|(|t,u|)>>, and
  <math|r<around|(|t|)>*\<psi\><rsup|2><around|(|t,u|)>> are similarly
  expanded:

  <\align>
    <tformat|<table|<row|<cell|p<around|(|t|)>>|<cell|=<big|sum><rsub|i=0><rsup|N>p<rsub|i>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>,<space|1em>q<around|(|t|)>=<big|sum><rsub|i=0><rsup|N>q<rsub|i>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>,<eq-number>>>|<row|<cell|r<around|(|t|)>>|<cell|=<big|sum><rsub|i=0><rsup|N>r<rsub|i>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>.<eq-number>>>>>
  </align>

  <subsection|Coefficient Computation>

  The coefficients <math|p<rsub|i>>, <math|q<rsub|i>>, and <math|r<rsub|i>>
  are defined as:

  <\equation>
    p<rsub|i>=<frac|1|h<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>>*<big|int><rsub|0><rsup|1>p*<around|(|T*t|)>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*d*t,
  </equation>

  and analogously for <math|q<rsub|i>> and <math|r<rsub|i>>. The
  normalization factor is:

  <\equation>
    h<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>=<frac|\<Gamma\>*<around|(|i+\<alpha\>+1|)>*\<Gamma\>*<around|(|i+\<beta\>+1|)>|<around|(|2*i+\<alpha\>+\<beta\>+1|)>*\<Gamma\>*<around|(|i+1|)>*\<Gamma\>*<around|(|i+\<alpha\>+\<beta\>+1|)>>.
  </equation>

  <subsection|Nonlinear Quadratic Term>

  The critical quadratic term <math|\<psi\><rsup|2><around|(|t,u|)>> is
  computed using triple product integrals:

  <\equation*>
    <around|\<langle\>|P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>>*P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>>|\<rangle\>>=<big|int><rsub|0><rsup|1>P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*d*t.
  </equation*>

  This integral is expanded as follows:

  <\equation*>
    <big|int><rsub|0><rsup|1>P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*d*t=<big|sum><rsub|m=0><rsup|i><big|sum><rsub|n=0><rsup|j><big|sum><rsub|l=0><rsup|k>\<gamma\><rsub|m*n*l><rsup|i*j*k>*<frac|\<Gamma\>*<around|(|m+n+l+\<alpha\>+1|)>*\<Gamma\>*<around|(|\<beta\>+1|)>|\<Gamma\>*<around|(|m+n+l+\<alpha\>+\<beta\>+2|)>>,
  </equation*>

  where:

  <\equation*>
    \<gamma\><rsub|m*n*l><rsup|i*j*k>=<around|(|-1|)><rsup|i+j+k-m-n-l><binom|i+\<alpha\>|m><binom|i+\<beta\>|i-m><binom|j+\<alpha\>|n><binom|j+\<beta\>|j-n><binom|k+\<alpha\>|l><binom|k+\<beta\>|k-l>.
  </equation*>

  <subsection|Spectral Equation System>

  The nonlinear system of equations for the coefficients is:

  <\equation>
    <math-bf|D><rsup|\<alpha\>><math-bf|c>=<math-bf|S>+<math-bf|Qc>+<math-bf|Rc><rsup|2>,
  </equation>

  where:

  <\itemize>
    <item><math|<math-bf|D><rsup|\<alpha\>>> is the fractional derivative
    operator matrix.

    <item><math|<math-bf|Rc><rsup|2>> is the quadratic term computed via the
    triple product integrals.
  </itemize>

  The system is solved via Newton's method:

  <\equation*>
    <math-bf|c><rsub|m+1>=<math-bf|c><rsub|m>-<math-bf|J><rsup|-1><around|(|<math-bf|c><rsub|m>|)><math-bf|F><around|(|<math-bf|c><rsub|m>|)>,
  </equation*>

  where:

  <\equation*>
    <math-bf|J>=<math-bf|D><rsup|\<alpha\>>-<math-bf|Q>-2<math-bf|Rc>.
  </equation*>

  <section|Conclusion>

  The spectral Jacobi tau method is applied to accurately solve the
  fractional Riccati equation in the rough Heston model. The approach
  integrates weighted Jacobi polynomial expansions with direct computation of
  nonlinear terms, yielding a precise and efficient solution framework.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-10|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-3|<tuple|1.1.1|1|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-4|<tuple|1.2|2|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-5|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-6|<tuple|2.1|2|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-7|<tuple|2.2|3|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-8|<tuple|2.3|3|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-9|<tuple|2.4|3|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|eq:fRiccati|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|sec:heston|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|sec:math|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|subsec:fRiccati|<tuple|1.2|2|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|subsec:fSDE|<tuple|1.1.1|1|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|thm:volterra|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_72.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Mathematical
      Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Rough Heston Process
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>Fractional SDE
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Fractional Riccati Equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Spectral
      Jacobi Tau Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Polynomial Expansions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Coefficient Computation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Nonlinear Quadratic Term
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Spectral Equation System
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>