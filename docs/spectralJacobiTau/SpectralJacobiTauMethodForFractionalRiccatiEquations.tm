<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|The Spectral Jacobi Tau Method for Fractional Riccati
  Equations>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Problem Formulation>

  The fractional Riccati equation on <math|<around|[|0,T|]>>:

  <\equation>
    D<rsup|\<nu\>>*y<around|(|t|)>=p<around|(|t|)>+q<around|(|t|)>*y<around|(|t|)>+r<around|(|t|)>*y<rsup|2><around|(|t|)>,<space|1em>t\<in\><around|[|0,T|]>
  </equation>

  with initial condition <math|y<around|(|0|)>=y<rsub|0>>.

  <section|Spectral Tau Method>

  The shifted Jacobi polynomials on <math|<around|[|0,1|]>> are defined by:

  <\equation>
    P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>=<big|sum><rsub|k=0><rsup|i><around|(|-1|)><rsup|i-k><binom|i+\<alpha\>|k><binom|i+\<beta\>|i-k>t<rsup|k>.
  </equation>

  The solution is expanded as:

  <\equation>
    y<rsub|N><around|(|t|)>=<big|sum><rsub|i=0><rsup|N>c<rsub|i>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>.
  </equation>

  Functions <math|p<around|(|t|)>>, <math|q<around|(|t|)>>, and
  <math|r<around|(|t|)>> are also expanded:

  <\equation>
    p<around|(|t|)>=<big|sum><rsub|i=0><rsup|N>p<rsub|i>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>,<space|1em>q<around|(|t|)>=<big|sum><rsub|i=0><rsup|N>q<rsub|i>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>,<space|1em>r<around|(|t|)>=<big|sum><rsub|i=0><rsup|N>r<rsub|i>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>.
  </equation>

  The shifted weight function:

  <\equation>
    w<around|(|t|)>=t<rsup|\<alpha\>>*<around|(|1-t|)><rsup|\<beta\>>.
  </equation>

  The coefficients are defined by:

  <\equation>
    p<rsub|i>=<frac|1|h<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>>*<big|int><rsub|0><rsup|1>p*<around|(|T*t|)>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*<space|0.17em>d*t,
  </equation>

  <\equation>
    q<rsub|i>=<frac|1|h<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>>*<big|int><rsub|0><rsup|1>q*<around|(|T*t|)>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*<space|0.17em>d*t,
  </equation>

  <\equation>
    r<rsub|i>=<frac|1|h<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>>*<big|int><rsub|0><rsup|1>r*<around|(|T*t|)>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*<space|0.17em>d*t.
  </equation>

  The normalization constant is:

  <\equation>
    h<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>=<frac|\<Gamma\>*<around|(|i+\<alpha\>+1|)>*\<Gamma\>*<around|(|i+\<beta\>+1|)>|<around|(|2*i+\<alpha\>+\<beta\>+1|)>*\<Gamma\>*<around|(|i+1|)>*\<Gamma\>*<around|(|i+\<alpha\>+\<beta\>+1|)>>.
  </equation>

  The fractional derivative matrix <math|<math-bf|D><rsup|\<nu\>>> has
  elements:

  <\equation>
    D<rsub|i*j><rsup|\<nu\>>=<frac|1|T<rsup|\<nu\>>>*<big|sum><rsub|k=j><rsup|i>\<theta\><rsub|i,k><rsup|\<nu\>>,
  </equation>

  where

  <\equation>
    \<theta\><rsub|i,k><rsup|\<nu\>>=<frac|\<Gamma\>*<around|(|k+\<beta\>+1|)>*\<Gamma\>*<around|(|i+\<alpha\>+\<beta\>+1|)>|\<Gamma\>*<around|(|k+\<alpha\>+\<beta\>+1|)>*\<Gamma\>*<around|(|i+\<beta\>+1|)>><binom|i|k><frac|\<Gamma\>*<around|(|k+\<nu\>|)>|\<Gamma\>*<around|(|k+1|)>>.
  </equation>

  The operational matrices <math|<math-bf|P>>, <math|<math-bf|Q>>, and
  <math|<math-bf|R>> have elements:

  <\equation>
    P<rsub|i*j>=<frac|1|h<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>>>*<big|int><rsub|0><rsup|1>P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*<space|0.17em>d*t,
  </equation>

  <\equation>
    Q<rsub|i*j>=<big|sum><rsub|k=0><rsup|N><frac|q<rsub|k>|h<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>>>*<big|int><rsub|0><rsup|1>P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*<space|0.17em>d*t,
  </equation>

  <\equation>
    R<rsub|i*j>=<big|sum><rsub|k=0><rsup|N><frac|r<rsub|k>|h<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>>>*<big|int><rsub|0><rsup|1>P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*<space|0.17em>d*t.
  </equation>

  The triple product integral is given by

  <\equation>
    <with|font-base-size|9|<big|int><rsub|0><rsup|1>P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*<space|0.17em>d*t=<big|sum><rsub|m=0><rsup|i><big|sum><rsub|n=0><rsup|j><big|sum><rsub|l=0><rsup|k>\<gamma\><rsub|m*n*l><rsup|i*j*k>*<frac|\<Gamma\>*<around|(|m+n+l+\<alpha\>+1|)>*\<Gamma\>*<around|(|\<beta\>+1|)>|\<Gamma\>*<around|(|m+n+l+\<alpha\>+\<beta\>+2|)>>>
  </equation>

  <\equation>
    \;
  </equation>

  where

  <\equation>
    \<gamma\><rsub|m*n*l><rsup|i*j*k>=<around|(|-1|)><rsup|i+j+k-m-n-l><binom|i+\<alpha\>|m><binom|i+\<beta\>|i-m><binom|j+\<alpha\>|n><binom|j+\<beta\>|j-n><binom|k+\<alpha\>|l><binom|k+\<beta\>|k-l>
  </equation>

  The nonlinear system to solve is:

  <\equation>
    <math-bf|D><rsup|\<nu\>><math-bf|c><rsub|m>=<math-bf|p>+<math-bf|Qc><rsub|m>+<math-bf|Rc><rsub|m><rsup|2>,
  </equation>

  where\ 

  <\equation>
    <math-bf|c><rsub|m>=<around|[|c<rsub|m,0>,c<rsub|m,1>,\<ldots\>,c<rsub|m,N>|]><rsup|\<top\>>
  </equation>

  \ is the <math|m>-th iteration of the coefficient vector. The tau condition
  for the initial value is:

  <\equation>
    <big|sum><rsub|i=0><rsup|N>c<rsub|0,i>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|0|)>=y<rsub|0><space|1em><text|where><space|1em>P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|0|)>=<around|(|-1|)><rsup|i><binom|i+\<beta\>|i>.
  </equation>

  The Newton iteration update is:

  <\equation>
    <math-bf|c><rsub|m+1>=<math-bf|c><rsub|m>-<math-bf|J><around|(|<math-bf|c><rsub|m>|)><rsup|-1><math-bf|F><around|(|<math-bf|c><rsub|m>|)>
  </equation>

  where

  <\equation>
    <math-bf|F><around|(|<math-bf|c><rsub|m>|)>=<math-bf|D><rsup|\<nu\>><math-bf|c><rsub|m>-<math-bf|p>-<math-bf|Qc><rsub|m>-<math-bf|Rc><rsub|m><rsup|2>
  </equation>

  and

  <\equation>
    <math-bf|J><around|(|<math-bf|c><rsub|m>|)>=<math-bf|D><rsup|\<nu\>>-<math-bf|Q>-2<math-bf|Rc><rsub|m>
  </equation>

  The solution is:

  <\equation>
    y<around|(|t|)>=<big|sum><rsub|i=0><rsup|N>c<rsub|i><rsup|\<ast\>>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around*|(|<frac|t|T>|)>,
  </equation>

  where <math|c<rsub|i><rsup|\<ast\>>> are the converged coefficients
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
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Problem
      Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Spectral
      Tau Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>