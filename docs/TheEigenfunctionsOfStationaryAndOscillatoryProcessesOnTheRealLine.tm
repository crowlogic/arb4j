<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <doc-data|<doc-title|The Eigenfunctions of Stationary and Oscillatory
  Processes on the Real Line>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Definitions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Eigenfunctions
    for Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Eigenfunctions
    for Oscillatory Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Symmetry and
    Real-Valued Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Dual Fourier
    Structure of the Filter Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Time Domain
    Filter Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section*|Definitions>

  <\definition>
    <dueto|Stationary Process>A stochastic process
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> is stationary if its
    covariance function satisfies <math|R<around|(|s,t|)>=R*<around|(|t-s|)>>
    for all <math|s,t\<in\>\<bbb-R\>>.
  </definition>

  <\definition>
    <dueto|Oscillatory Process (Priestley)>A process
    <math|<around|{|Y<around|(|t|)>,t\<in\>\<bbb-R\>|}>> is called
    <em|oscillatory> if it possesses an evolutionary spectral representation

    <\equation*>
      Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>,
    </equation*>

    where <math|A<around|(|t,\<omega\>|)>> is the gain function and
    <math|Z<around|(|\<omega\>|)>> is an orthogonal increment process with
    spectral measure <math|F<around|(|\<omega\>|)>>.
  </definition>

  <section*|Eigenfunctions for Stationary Processes>

  <\theorem>
    <dueto|Eigenfunction Property for Stationary Processes>Let
    <math|<around|{|X<around|(|t|)>|}>> be stationary with covariance kernel
    <math|R<around|(|\<tau\>|)>> and covariance operator

    <\equation*>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*f<around|(|s|)>*d*s.
    </equation*>

    Then the complex exponentials <math|e<rsup|i*\<omega\>*t>> are
    eigenfunctions of <math|K> with eigenvalue

    <\equation*>
      S<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>,
    </equation*>

    the power spectral density.
  </theorem>

  <\proof>
    Set <math|f<around|(|t|)>=e<rsup|i*\<omega\>*t>>. Then

    <\equation*>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*e<rsup|i*\<omega\>*s>*d*s.
    </equation*>

    Make the change of variable <math|\<tau\>=t-s>, so <math|s=t-\<tau\>>,
    <math|d*s=-d*\<tau\>>:

    <\equation*>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|i*\<omega\>*<around|(|t-\<tau\>|)>>*<around|(|-d*\<tau\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|i*\<omega\>*t>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=e<rsup|i*\<omega\>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>.
    </equation*>

    Thus <math|e<rsup|i*\<omega\>*t>> is an eigenfunction with eigenvalue
    <math|S<around|(|\<omega\>|)>>.
  </proof>

  <section*|Eigenfunctions for Oscillatory Processes>

  <\theorem>
    <dueto|Eigenfunction Property for Oscillatory Processes>Let
    <math|Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>>
    with covariance function

    <\equation*>
      C<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|s,\<omega\>|)>*A<rsup|\<ast\>><around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>,
    </equation*>

    and covariance operator

    <\equation*>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*f<around|(|s|)>*d*s.
    </equation*>

    Define <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>.
    Then

    <\equation*>
      K*\<phi\><around|(|\<cdummy\>,\<omega\>|)>=\<phi\><around|(|\<cdummy\>,\<omega\>|)>*<space|0.17em>d*F<around|(|\<omega\>|)>,
    </equation*>

    that is, <math|\<phi\><around|(|t,\<omega\>|)>> are eigenfunctions of
    <math|K> with eigenvalue element <math|d*F<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    Compute <math|<around|(|K*\<phi\>|(>\<cdot\>,\<omega\>))<around|(|t|)>>:

    <\equation*>
      <around|(|K*\<phi\>|(>\<cdot\>,\<omega\>))<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s.
    </equation*>

    Substitute the definition of <math|C<around|(|t,s|)>>:

    <\equation*>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*d*F<around|(|\<lambda\>|)>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s.
    </equation*>

    Interchange the order of integration:

    <\equation*>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s|)>*d*F<around|(|\<lambda\>|)>.
    </equation*>

    Now consider the inner integral:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s.
    </equation*>

    By the orthogonality property for evolutionary spectra, this is
    <math|\<delta\>*<around|(|\<lambda\>-\<omega\>|)>>. Thus,

    <\equation*>
      <around|(|K*\<phi\>|(>\<cdot\>,\<omega\>))<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*F<around|(|\<lambda\>|)>=A<around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>=\<phi\><around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>.
    </equation*>
  </proof>

  <\lemma>
    <dueto|Orthogonality Property for Evolutionary Amplitudes>

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>.
    </equation*>

    <\proof>
      The orthogonality of the increments <math|d*Z<around|(|\<omega\>|)>>,
      together with the spectral representation, guarantees this inner
      product relation between gain functions indexed by different
      frequencies. The delta function expresses the continuous orthogonality
      for the integral operator.
    </proof>
  </lemma>

  <section*|Symmetry and Real-Valued Processes>

  <\theorem>
    <dueto|Reality and Conjugate Symmetry><math|X<around|(|t|)>> is
    real-valued if and only if <math|A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>>
    and <math|d*Z*<around|(|-\<omega\>|)>=d*Z<rsup|\<ast\>><around|(|\<omega\>|)>>
    for all <math|t,\<omega\>>. The eigenfunctions then satisfy
    <math|\<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)>=\<phi\><around|(|t,-\<omega\>|)>>.
  </theorem>

  <\proof>
    Write the conjugate of <math|X<around|(|t|)>>:

    <\equation*>
      X<rsup|\<ast\>><around|(|t|)>=<around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>|)><rsup|\<ast\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>.
    </equation*>

    Set <math|\<nu\>=-\<omega\>>, <math|d*\<omega\>=-d*\<nu\>>, so

    <\equation*>
      X<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|+\<infty\>><rsup|-\<infty\>>A<rsup|\<ast\>><around|(|t,-\<nu\>|)>*e<rsup|i*\<nu\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<nu\>|)>*<around|(|-d*\<nu\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,-\<nu\>|)>*e<rsup|i*\<nu\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<nu\>|)>*d*\<nu\>.
    </equation*>

    Relabel <math|\<nu\>\<mapsto\>\<omega\>>:

    <\equation*>
      X<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,-\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)>*d*\<omega\>.
    </equation*>

    For real-valued <math|X<around|(|t|)>>,
    <math|X<rsup|\<ast\>><around|(|t|)>=X<around|(|t|)>> requires

    <\equation*>
      A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>,<space|2em>d*Z*<around|(|-\<omega\>|)>=d*Z<rsup|\<ast\>><around|(|\<omega\>|)>,
    </equation*>

    by the uniqueness of the stochastic integral representation. For the
    eigenfunctions,

    <\equation*>
      \<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)>=<around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>|]><rsup|\<ast\>>=A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>=A<around|(|t,-\<omega\>|)>*e<rsup|i*<around|(|-\<omega\>|)>*t>=\<phi\><around|(|t,-\<omega\>|)>.
    </equation*>
  </proof>

  <section*|Dual Fourier Structure of the Filter Kernel>

  <\theorem>
    <dueto|Explicit Fourier Structure of the Filter Kernel>Let
    <math|A<around|(|t,\<omega\>|)>> be the gain function and
    <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    the oscillatory function. Then for any <math|t,u\<in\>\<bbb-R\>>,

    <\equation*>
      h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*d*\<omega\>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*u>*d*\<omega\>.
    </equation*>
  </theorem>

  <\proof>
    Substitute <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    in the second integral:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*u>*d*\<omega\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*e<rsup|-i*\<omega\>*u>*d*\<omega\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*d*\<omega\>.
    </equation*>

    The two forms are equal.
  </proof>

  <\theorem>
    <dueto|Inverse Formulae for Gain and Oscillatory Functions>For fixed
    <math|t>,

    <\equation*>
      A<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u,<space|2em>\<phi\><around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*u>*d*u.
    </equation*>
  </theorem>

  <\proof>
    Start from

    <\equation*>
      h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*<around|(|t-u|)>>*d*\<lambda\>.
    </equation*>

    Multiply both sides by <math|e<rsup|-i*\<omega\>*<around|(|t-u|)>>> and
    integrate over <math|u>:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|t-u|)>>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u*d*\<lambda\>.
    </equation*>

    Collapsing the exponentials:

    <\equation*>
      e<rsup|i*\<lambda\>*<around|(|t-u|)>>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>=e<rsup|i*<around|(|\<lambda\>-\<omega\>|)>*<around|(|t-u|)>>.
    </equation*>

    Interchange integrals and use the identity
    <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<lambda\>-\<omega\>|)>*<around|(|t-u|)>>*d*u=2*\<pi\>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>>:

    <\equation*>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>2*\<pi\>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*\<lambda\>=A<around|(|t,\<omega\>|)>.
    </equation*>

    Similarly,

    <\equation*>
      \<phi\><around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*u>*d*u.
    </equation*>
  </proof>

  <section*|Time Domain Filter Representation>

  <\theorem>
    <dueto|Time Domain Filter Representation of Oscillatory Processes>If
    <math|X<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*d*Z<around|(|\<omega\>|)>>
    is a stationary process, then the oscillatory process

    <\equation*>
      Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation*>

    can be written as

    <\equation*>
      Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u
    </equation*>

    where <math|h<around|(|t,u|)>> is as above.
  </theorem>

  <\proof>
    Insert the spectral representation for <math|X<around|(|u|)>>:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*d*Z<around|(|\<omega\>|)>|)>*d*u=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|i*\<omega\>*u>*d*u|)>*d*Z<around|(|\<omega\>|)>.
    </equation*>

    Substitute the expression for <math|h<around|(|t,u|)>>:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|i*\<omega\>*u>*d*u=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*<around|(|t-u|)>>*e<rsup|i*\<omega\>*u>*d*\<lambda\>*d*u
    </equation*>

    <\equation*>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\>-\<lambda\>|)>*u>*d*u*<space|0.17em>d*\<lambda\>
    </equation*>

    <\equation*>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<lambda\>|)>*d*\<lambda\>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>.
    </equation*>

    Therefore,

    <\equation*>
      Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>.
    </equation*>
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|5|3>>
    <associate|auto-5|<tuple|6|4>>
    <associate|auto-6|<tuple|8|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Definitions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Eigenfunctions
      for Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Eigenfunctions
      for Oscillatory Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Symmetry
      and Real-Valued Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Dual
      Fourier Structure of the Filter Kernel>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Time
      Domain Filter Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>