<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Radial Solution of the Two-Dimensional Schrödinger
  Equation with Circular Symmetry>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    [Separation of Variables for 2D Schrödinger Equation] Consider a particle
    of mass <math|m> in a two-dimensional radially symmetric potential
    <math|V<around|(|r|)>>. The time-independent Schrödinger equation in
    polar coordinates <math|<around|(|r,\<theta\>|)>> admits separable
    solutions of the form <math|\<psi\><around|(|r,\<theta\>|)>=R<around|(|r|)>*\<Theta\><around|(|\<theta\>|)>>.
  </theorem>

  <\proof>
    The time-independent Schrödinger equation in polar coordinates is:

    <\equation>
      -<frac|\<hbar\><rsup|2>|2*m>*<around*|(|<frac|\<partial\><rsup|2>|\<partial\>*r<rsup|2>>+<frac|1|r>*<frac|\<partial\>|\<partial\>*r>+<frac|1|r<rsup|2>>*<frac|\<partial\><rsup|2>|\<partial\>*\<theta\><rsup|2>>|)>*\<psi\><around|(|r,\<theta\>|)>+V<around|(|r|)>*\<psi\><around|(|r,\<theta\>|)>=E*\<psi\><around|(|r,\<theta\>|)>
    </equation>

    Substituting <math|\<psi\><around|(|r,\<theta\>|)>=R<around|(|r|)>*\<Theta\><around|(|\<theta\>|)>>
    and dividing by <math|R<around|(|r|)>*\<Theta\><around|(|\<theta\>|)>>:

    <\equation>
      -<frac|\<hbar\><rsup|2>|2*m>*<around*|(|<frac|R<rprime|''><around|(|r|)>|R<around|(|r|)>>+<frac|1|r>*<frac|R<rprime|'><around|(|r|)>|R<around|(|r|)>>+<frac|1|r<rsup|2>>*<frac|\<Theta\><rprime|''><around|(|\<theta\>|)>|\<Theta\><around|(|\<theta\>|)>>|)>+V<around|(|r|)>=E
    </equation>

    Multiplying by <math|r<rsup|2>> and rearranging:

    <\equation>
      r<rsup|2>*<around*|[|-<frac|\<hbar\><rsup|2>|2*m>*<around*|(|<frac|R<rprime|''><around|(|r|)>|R<around|(|r|)>>+<frac|1|r>*<frac|R<rprime|'><around|(|r|)>|R<around|(|r|)>>|)>+V<around|(|r|)>-E|]>=-<frac|\<hbar\><rsup|2>|2*m>*<frac|\<Theta\><rprime|''><around|(|\<theta\>|)>|\<Theta\><around|(|\<theta\>|)>>
    </equation>

    Since the left side depends only on <math|r> and the right side depends
    only on <math|\<theta\>>, both sides must equal a constant. Let this
    separation constant be <math|<frac|\<hbar\><rsup|2>*m<rsub|l><rsup|2>|2*m>>
    where <math|m<rsub|l>> is an integer.
  </proof>

  <\theorem>
    [Angular Part Solution] The angular part of the separated wave function
    satisfies <math|\<Theta\><around|(|\<theta\>|)>=e<rsup|i*m<rsub|l>*\<theta\>>>
    where <math|m<rsub|l>\<in\>\<bbb-Z\>>.
  </theorem>

  <\proof>
    From the separation procedure, the angular equation is:

    <\equation>
      <frac|\<Theta\><rprime|''><around|(|\<theta\>|)>|\<Theta\><around|(|\<theta\>|)>>=-m<rsub|l><rsup|2>
    </equation>

    This gives the differential equation:

    <\equation>
      \<Theta\><rprime|''><around|(|\<theta\>|)>+m<rsub|l><rsup|2>*\<Theta\><around|(|\<theta\>|)>=0
    </equation>

    The general solution is:

    <\equation>
      \<Theta\><around|(|\<theta\>|)>=A*e<rsup|i*m<rsub|l>*\<theta\>>+B*e<rsup|-i*m<rsub|l>*\<theta\>>
    </equation>

    For single-valued wave functions, periodicity requires
    <math|\<Theta\>*<around|(|\<theta\>+2*\<pi\>|)>=\<Theta\><around|(|\<theta\>|)>>,
    which implies:

    <\equation>
      e<rsup|i*m<rsub|l>\<cdot\>2*\<pi\>>=1
    </equation>

    This condition is satisfied if and only if
    <math|m<rsub|l>\<in\>\<bbb-Z\>>. Without loss of generality, one can
    choose the normalized form <math|\<Theta\><around|(|\<theta\>|)>=<frac|1|<sqrt|2*\<pi\>>>*e<rsup|i*m<rsub|l>*\<theta\>>>.
  </proof>

  <\theorem>
    [Radial Equation for Free Particle] For a free particle in two dimensions
    (<math|V<around|(|r|)>=0>), the radial part of the wave function
    satisfies Bessel's differential equation of integer order
    <math|<around|\||m<rsub|l>|\|>>.
  </theorem>

  <\proof>
    From the separation of variables with <math|V<around|(|r|)>=0>, the
    radial equation becomes:

    <\equation>
      -<frac|\<hbar\><rsup|2>|2*m>*<around*|(|R<rprime|''><around|(|r|)>+<frac|1|r>*R<rprime|'><around|(|r|)>|)>+<frac|\<hbar\><rsup|2>*m<rsub|l><rsup|2>|2*m*r<rsup|2>>*R<around|(|r|)>=E*R<around|(|r|)>
    </equation>

    Rearranging and defining <math|k<rsup|2>=<frac|2*m*E|\<hbar\><rsup|2>>>:

    <\equation>
      R<rprime|''><around|(|r|)>+<frac|1|r>*R<rprime|'><around|(|r|)>+<around*|(|k<rsup|2>-<frac|m<rsub|l><rsup|2>|r<rsup|2>>|)>*R<around|(|r|)>=0
    </equation>

    Making the substitution <math|x=k*r>, let
    <math|u<around|(|x|)>=R<around|(|r|)>=R*<around|(|x/k|)>>. Then:

    <\align>
      <tformat|<table|<row|<cell|<frac|d*R|d*r>>|<cell|=k*<frac|d*u|d*x>
      <frac|d<rsup|2>*R|d*r<rsup|2>>>|<cell|=k<rsup|2>*<frac|d<rsup|2>*u|d*x<rsup|2>><eq-number>>>>>
    </align>

    Substituting into the radial equation:

    <\equation>
      k<rsup|2>*<frac|d<rsup|2>*u|d*x<rsup|2>>+<frac|k|r>*k*<frac|d*u|d*x>+<around*|(|k<rsup|2>-<frac|m<rsub|l><rsup|2>|r<rsup|2>>|)>*u=0
    </equation>

    Since <math|r=x/k>, this becomes:

    <\equation>
      x<rsup|2>*<frac|d<rsup|2>*u|d*x<rsup|2>>+x*<frac|d*u|d*x>+<around|(|x<rsup|2>-m<rsub|l><rsup|2>|)>*u=0
    </equation>

    This is precisely Bessel's differential equation of order
    <math|<around|\||m<rsub|l>|\|>>.
  </proof>

  <\theorem>
    [General Solution in Terms of Bessel Functions] The general solution to
    the radial equation for a free particle in two dimensions is:

    <\equation>
      R<around|(|r|)>=A*J<rsub|<around|\||m<rsub|l>|\|>>*<around|(|k*r|)>+B*Y<rsub|<around|\||m<rsub|l>|\|>>*<around|(|k*r|)>
    </equation>

    where <math|J<rsub|<around|\||m<rsub|l>|\|>>> and
    <math|Y<rsub|<around|\||m<rsub|l>|\|>>> are Bessel functions of the first
    and second kind, respectively, of order <math|<around|\||m<rsub|l>|\|>>.
  </theorem>

  <\proof>
    From Theorem 3, the radial equation is Bessel's differential equation of
    order <math|<around|\||m<rsub|l>|\|>>. The standard theory of Bessel
    functions establishes that the general solution to:

    <\equation>
      x<rsup|2>*y<rprime|''>+x*y<rprime|'>+<around|(|x<rsup|2>-\<nu\><rsup|2>|)>*y=0
    </equation>

    is given by:

    <\equation>
      y<around|(|x|)>=c<rsub|1>*J<rsub|\<nu\>><around|(|x|)>+c<rsub|2>*Y<rsub|\<nu\>><around|(|x|)>
    </equation>

    where <math|J<rsub|\<nu\>>> and <math|Y<rsub|\<nu\>>> are linearly
    independent solutions for non-integer <math|\<nu\>>, and for integer
    <math|\<nu\>>, <math|Y<rsub|\<nu\>>> is defined as the appropriate limit.
    Since <math|<around|\||m<rsub|l>|\|>> is a non-negative integer, and with
    <math|x=k*r>, the general solution is:

    <\equation>
      R<around|(|r|)>=A*J<rsub|<around|\||m<rsub|l>|\|>>*<around|(|k*r|)>+B*Y<rsub|<around|\||m<rsub|l>|\|>>*<around|(|k*r|)>
    </equation>
  </proof>

  <\corollary>
    [Regular Solution at Origin] For wave functions that must be finite at
    the origin <math|r=0>, the coefficient <math|B=0>, yielding:

    <\equation>
      R<around|(|r|)>=A*J<rsub|<around|\||m<rsub|l>|\|>>*<around|(|k*r|)>
    </equation>
  </corollary>

  <\proof>
    The Bessel function of the second kind
    <math|Y<rsub|<around|\||m<rsub|l>|\|>>*<around|(|k*r|)>> has a
    logarithmic singularity at <math|r=0> for <math|m<rsub|l>=0> and diverges
    as <math|r<rsup|-<around|\||m<rsub|l>|\|>>> for <math|m<rsub|l>\<neq\>0>.
    Since physical wave functions must be square-integrable near the origin,
    one requires <math|B=0>.
  </proof>

  <\theorem>
    [Complete Solution] The complete separable solution for a free particle
    in two dimensions with circular symmetry is:

    <\equation>
      \<psi\><around|(|r,\<theta\>|)>=A*J<rsub|<around|\||m<rsub|l>|\|>>*<around|(|k*r|)>*e<rsup|i*m<rsub|l>*\<theta\>>
    </equation>

    where <math|m<rsub|l>\<in\>\<bbb-Z\>>,
    <math|k=<sqrt|<frac|2*m*E|\<hbar\><rsup|2>>>>, and <math|A> is a
    normalization constant.
  </theorem>

  <\proof>
    This follows directly from combining Theorems 2, 4, and Corollary 1. The
    angular part contributes <math|e<rsup|i*m<rsub|l>*\<theta\>>> with
    integer <math|m<rsub|l>>, and the radial part contributes
    <math|A*J<rsub|<around|\||m<rsub|l>|\|>>*<around|(|k*r|)>> for regularity
    at the origin.
  </proof>

  \;
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
    <associate|auto-1|<tuple|1|3|../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-2|<tuple|2|4|../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-3|<tuple|3|5|../.TeXmacs/texts/scratch/no_name_23.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>General
      Radial Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Two-Dimensional
      Isotropic Harmonic Oscillator> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Two-Dimensional
      Coulomb Potential> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>