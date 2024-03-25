<TeXmacs|2.1.1>

<style|generic>

<\body>
  <doc-data|<doc-title|The Wigner-Moyal Equation>>

  The Wigner-Moyal equation, which governs the time evolution of the Wigner
  function <math|W<around|(|x,p,t|)>> in phase space, is given by:

  <\equation>
    <frac|\<partial\>*W|\<partial\>*t>+<frac|p|m>*<frac|\<partial\>*W|\<partial\>*x>=<big|sum><rsub|n=0><rsup|\<infty\>><around*|(|<frac|\<hbar\>|2*i>|)><rsup|2*n><frac|1|<around|(|2*n+1|)>!>*<frac|\<partial\><rsup|2*n+1>*V|\<partial\>*x<rsup|2*n+1>>*<frac|\<partial\><rsup|2*n+1>*W|\<partial\>*p<rsup|2*n+1>>
  </equation>

  For the one-dimensional quantum harmonic oscillator, a particularly
  insightful solution to the Wigner-Moyal equation can be found by
  considering the ground state of the system. The Wigner function for the
  ground state of a quantum harmonic oscillator is given by:

  <\equation>
    W<around|(|x,p|)>=<frac|e<rsup|-<frac|2*H|\<hbar\>*\<omega\>>>|\<hbar\>
    \<pi\>*>*
  </equation>

  where <math|H> is the Hamiltonian of the harmonic oscillator, expressed in
  terms of position <math|x> and momentum <math|p> as:

  <\equation>
    H=<frac|p<rsup|2>|2*m>+<frac|m*\<omega\><rsup|2>*x<rsup|2>|2>*
  </equation>

  Substituting the expression for <math|H> into the Wigner function, we
  obtain:

  <\equation>
    W<around|(|x,p|)>=<frac|*e<rsup|-<frac|p<rsup|2>|m*\<hbar\>*\<omega\>>-<frac|m*\<omega\>*x<rsup|2>|\<hbar\>>>|\<pi\>*\<hbar\>>
  </equation>

  Yes, the Wigner function for a state centered at an arbitrary complex
  number in phase space can indeed be formulated, extending the discussion to
  coherent states of the quantum harmonic oscillator. A coherent state is
  often described by a complex number <math|\<alpha\>>, where\ 

  <\equation>
    \<alpha\>=<frac|<around|(|m*\<omega\>*x<rsub|0>+i*p<rsub|0>|)>|<sqrt|2*\<hbar\>*m*\<omega\>>>*
  </equation>

  \ with <math|x<rsub|0>> and <math|p<rsub|0>> being the average position and
  momentum, respectively. The Wigner function for a coherent state centered
  at <math|\<alpha\>> is:

  <\equation>
    W<rsub|\<alpha\>><around|(|x,p|)>=<frac|e<rsup|-<frac|m*\<omega\>|\<hbar\>>*<around|(|x-x<rsub|0>|)><rsup|2>-<frac|1|\<hbar\>*m*\<omega\>>*<around|(|p-p<rsub|0>|)><rsup|2>>|\<pi\>*\<hbar\>>*
  </equation>
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