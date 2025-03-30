<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <doc-data|<doc-title|The Characteristic Function of the Product of
  Independent Standard Normal Variables>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|<date|>>>

  \;

  <\abstract>
    This paper demonstrates that the characteristic function of the product
    of two independent standard normal random variables involves the Bessel
    function of the first kind of order 0. Polar coordinate transformations
    and properties of Bessel functions are utilized to obtain the closed form
    expression.
  </abstract>

  \;

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Proof>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Zero
    Counting Function via Regularized Transform for Gaussian Processes on
    <with|color|dark red|font-family|rm|<with|mode|math|<around|[|0,\<infty\>|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Natural Framework and Preliminaries
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|3.2<space|2spc>Note on Compactness Verification
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|3.3<space|2spc>Bidirectional Representations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|3.4<space|2spc>Simplicity of Zeros
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|3.5<space|2spc>Explicit Emergence of the Bessel
    Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.6<space|2spc>Zero Counting Function Development
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Commentary on
    Mathematical Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The characteristic function of the product of two independent standard
  normal random variables serves as a fundamental result in probability
  theory and statistical analysis. This paper presents a rigorous derivation
  of its closed form.

  \;

  <\lemma>
    For independent standard normal random variables X and Y, the
    characteristic function of their product XY is given by:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=<frac|J<rsub|0><around*|(|<frac|t|<sqrt|1+t<rsup|2>>>|)>|<sqrt|1+t<rsup|2>>>
    </equation>

    where <math|J<rsub|0>> denotes the Bessel function of the first kind of
    order zero.
  </lemma>

  <section|Proof>

  <\proof>
    The derivation begins with the characteristic function definition:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=E<around|[|e<rsup|i*t*X*Y>|]>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*x*y>*e<rsup|-<around|(|x<rsup|2>+y<rsup|2>|)>/2>*d*x*d*y
    </equation>

    <with|font-series|bold|Polar Coordinate Transformation>

    The introduction of polar coordinates where <math|x=r*cos \<theta\>>,
    <math|y=r*sin \<theta\>>, and <math|d*x*d*y=r*d*r*d*\<theta\>> transforms
    the integral to:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*r<rsup|2>*cos
      \<theta\>*sin \<theta\>>*r*e<rsup|-r<rsup|2>/2>*d*\<theta\>*d*r
    </equation>

    <with|font-series|bold|Variable Substitution>

    The substitution <math|u=r<rsup|2>/2>, with <math|d*u=r*d*r>, yields:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|2*i*t*u*cos
      \<theta\>*sin \<theta\>>*e<rsup|-u>*d*\<theta\>*d*u
    </equation>

    <with|font-series|bold|Double Angle Formula>

    Application of the identity <math|cos \<theta\>*sin
    \<theta\>=<frac|1|2>*sin <around|(|2*\<theta\>|)>> gives:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*u*sin
      <around|(|2*\<theta\>|)>>*e<rsup|-u>*d*\<theta\>*d*u
    </equation>

    <with|font-series|bold|Bessel Function Connection>

    The inner integral relates to the Bessel function through the identity:

    <\equation>
      <big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*u*sin
      <around|(|2*\<theta\>|)>>*d*\<theta\>=2*\<pi\>*J<rsub|0>*<around|(|t*u|)>
    </equation>

    This follows from the integral representation of the Bessel function of
    the first kind:

    <\equation>
      J<rsub|0><around|(|z|)>=<frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*z*sin
      <around|(|\<theta\>|)>>*d*\<theta\>
    </equation>

    The integral thus reduces to:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|t*u|)>*e<rsup|-u>*d*u
    </equation>

    <with|font-series|bold|Final Evaluation>

    The evaluation proceeds through the known Laplace transform of Bessel
    functions:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|a*t|)>*e<rsup|-u*t>*d*t=<frac|1|<sqrt|1+a<rsup|2>>>*J<rsub|0><around*|(|<frac|a|<sqrt|1+a<rsup|2>>>|)>
    </equation>

    This leads to the final result:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=<frac|J<rsub|0><around*|(|<frac|t|<sqrt|1+t<rsup|2>>>|)>|<sqrt|1+t<rsup|2>>>
    </equation>
  </proof>

  \;

  The derivation establishes that the characteristic function of the product
  of two independent standard normal random variables takes the form
  <math|J<rsub|0>*<around|(|t/<sqrt|1+t<rsup|2>>|)>/<sqrt|1+t<rsup|2>>>. The
  proof relies on coordinate transformation, properties of Bessel functions,
  and integral transforms. This result holds significance in various
  applications of probability theory and statistical analysis.

  <\proof>
    The derivation begins with the characteristic function definition:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=E<around|[|e<rsup|i*t*X*Y>|]>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*x*y>*e<rsup|-<around|(|x<rsup|2>+y<rsup|2>|)>/2>*d*x*d*y
    </equation>

    <with|font-series|bold|Polar Coordinate Transformation>

    The introduction of polar coordinates where <math|x=r*cos \<theta\>>,
    <math|y=r*sin \<theta\>>, and <math|d*x*d*y=r*d*r*d*\<theta\>> transforms
    the integral to:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*r<rsup|2>*cos
      \<theta\>*sin \<theta\>>*r*e<rsup|-r<rsup|2>/2>*d*\<theta\>*d*r
    </equation>

    <with|font-series|bold|Variable Substitution>

    The substitution <math|u=r<rsup|2>/2>, with <math|d*u=r*d*r>, yields:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|2*i*t*u*cos
      \<theta\>*sin \<theta\>>*e<rsup|-u>*d*\<theta\>*d*u
    </equation>

    <with|font-series|bold|Double Angle Formula>

    Application of the identity <math|cos \<theta\>*sin
    \<theta\>=<frac|1|2>*sin <around|(|2*\<theta\>|)>> gives:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*u*sin
      <around|(|2*\<theta\>|)>>*e<rsup|-u>*d*\<theta\>*d*u
    </equation>

    <with|font-series|bold|Bessel Function Connection>

    The inner integral relates to the Bessel function through the identity:

    <\equation>
      <big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*u*sin
      <around|(|2*\<theta\>|)>>*d*\<theta\>=2*\<pi\>*J<rsub|0>*<around|(|t*u|)>
    </equation>

    This follows from the integral representation of the Bessel function of
    the first kind:

    <\equation>
      J<rsub|0><around|(|z|)>=<frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*z*sin
      <around|(|\<theta\>|)>>*d*\<theta\>
    </equation>

    The integral thus reduces to:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|t*u|)>*e<rsup|-u>*d*u
    </equation>

    <with|font-series|bold|Final Evaluation>

    The evaluation proceeds through the known Laplace transform of Bessel
    functions:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|a*t|)>*e<rsup|-u*t>*d*t=<frac|1|<sqrt|1+a<rsup|2>>>*J<rsub|0><around*|(|<frac|a|<sqrt|1+a<rsup|2>>>|)>
    </equation>

    This leads to the final result:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=<frac|J<rsub|0><around*|(|<frac|t|<sqrt|1+t<rsup|2>>>|)>|<sqrt|1+t<rsup|2>>>
    </equation>
  </proof>

  <section|Zero Counting Function via Regularized Transform for Gaussian
  Processes on <math|<around|[|0,\<infty\>|)>>>

  <subsection|Natural Framework and Preliminaries>

  Let <math|<around|{|X<rsub|t>|}><rsub|t\<in\><around|[|0,\<infty\>|)>>> be
  a real-valued centered Gaussian process whose covariance operator <math|K>
  is compact relative to the canonical metric it induces. This compactness is
  characterized by the finiteness of Dudley's metric entropy integral:

  <\equation>
    <big|int><rsub|0><rsup|1><sqrt|log N<around|(|\<varepsilon\>,B<rsub|T>,d|)>>*<space|0.17em>d*\<varepsilon\>\<less\>\<infty\>
  </equation>

  where <math|N<around|(|\<varepsilon\>,B<rsub|T>,d|)>> is the covering
  number - the minimal number of <math|\<varepsilon\>>-balls needed to cover
  any bounded set <math|B<rsub|T>=<around|[|0,T|]>> under the canonical
  metric:

  <\equation>
    d*<around|(|s,t|)>=<sqrt|K<around|(|s,s|)>+K<around|(|t,t|)>-2*K<around|(|s,t|)>>
  </equation>

  <subsection|Note on Compactness Verification>

  While the covering number <math|N<around|(|\<varepsilon\>,B<rsub|T>,d|)>>
  represents the exact supremum over all errors of finite rank
  approximations, its direct computation is typically infeasible. However,
  the upper bound:

  <\equation>
    N<around|(|\<varepsilon\>,B<rsub|T>,d|)>\<leq\>min
    <around|{|n\<in\>\<bbb-N\>:\<lambda\><rsub|n>\<less\>\<varepsilon\><rsup|2>|}>
  </equation>

  is sufficient to prove compactness.

  Importantly, one need not verify compactness a priori. The very existence
  of an orthogonal polynomial system for the spectral density implies
  compactness of the corresponding kernel operator (Rao, M.M., Stochastic
  Processes: Inference Theory). Thus, the success of this expansion method
  itself confirms compactness - if the kernel were not compact, no such
  orthogonal system would exist.

  The compactness of <math|K> ensures the existence of a countable
  orthonormal basis <math|<around|{|\<phi\><rsub|n>|}>> with corresponding
  eigenvalues <math|<around|{|\<lambda\><rsub|n>|}>>. Importantly, <math|K>
  is not required to be trace class.

  <subsection|Bidirectional Representations>

  Given this spectral decomposition, the process admits two equivalent
  representations:

  Given a path <math|X<rsub|t>>, its projection coefficients are:

  <\equation>
    Z<rsub|n>=<frac|<big|int><rsub|0><rsup|\<infty\>>X<rsub|t>*\<phi\><rsub|n><around|(|t|)>*d*t|<sqrt|\<lambda\><rsub|n>>>*
  </equation>

  Conversely, given the projection coefficients
  <math|<around|{|Z<rsub|n>|}>>, the path is reconstructed as:

  <\equation>
    X<rsub|t>=<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>
  </equation>

  <subsection|Simplicity of Zeros>

  For such a Gaussian process, the impossibility of simultaneous vanishing of
  the process and its mean square derivative follows from the properties of
  joint normal distributions. At any point <math|t>, consider
  <math|<around|(|X<rsub|t>,X<rprime|'><rsub|t>|)>>, where
  <math|X<rprime|'><rsub|t>> is the mean square derivative. These form a
  bivariate normal distribution with covariance matrix:

  <\equation>
    \<Sigma\>=<matrix|<tformat|<table|<row|<cell|K<around|(|t,t|)>>|<cell|\<partial\><rsub|2>*K<around|(|t,t|)>>>|<row|<cell|\<partial\><rsub|2>*K<around|(|t,t|)>>|<cell|-\<partial\><rsub|1>*\<partial\><rsub|2>*K<around|(|t,t|)>>>>>>
  </equation>

  where <math|\<partial\><rsub|i>> denotes partial derivative with respect to
  the <math|i>th argument.

  The probability of both vanishing simultaneously is:

  <\equation>
    P<around|(|X<rsub|t>=0,X<rprime|'><rsub|t>=0|)>=<frac|e<rsup|-<frac|<around|(|0,0|)>*\<Sigma\><rsup|-1><around|(|0,0|)><rsup|T>|2>*>|2*\<pi\><sqrt|det
    <around|(|\<Sigma\>|)>>>*=0
  </equation>

  since the determinant of <math|\<Sigma\>> is strictly positive due to the
  non-degeneracy of the process.

  <subsection|Explicit Emergence of the Bessel Function>

  The joint distribution of <math|<around|(|X<rsub|t>,X<rprime|'><rsub|t>|)>>
  at any point <math|t> has density:

  <\equation>
    p<around|(|x,y|)>=<frac|1|2*\<pi\><sqrt|det
    <around|(|\<Sigma\>|)>>>*e<rsup|-<frac|1|2>*<around|(|x,y|)>*\<Sigma\><rsup|-1><around|(|x,y|)><rsup|T>>
  </equation>

  Transforming to polar coordinates <math|<around|(|r,\<theta\>|)>> with
  <math|x=r*cos \<theta\>>, <math|y=r*sin \<theta\>>:

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|p<around|(|r,\<theta\>|)>>|<cell|=<frac|r
      *e<rsup|-<frac|r<rsup|2>|2>*<around|(|cos \<theta\>,sin
      \<theta\>|)>*\<Sigma\><rsup|-1><around|(|cos \<theta\>,sin
      \<theta\>|)><rsup|T>>|2*\<pi\><sqrt|det
      <around|(|\<Sigma\>|)>>>>>|<row|<cell|>|<cell|=<frac|r
      e<rsup|-<frac|r<rsup|2>|2>*Q<around|(|\<theta\>|)>>|2*\<pi\><sqrt|det
      <around|(|\<Sigma\>|)>>>*>>>>
    </eqsplit>
  </equation>

  where <math|Q<around|(|\<theta\>|)>> is the quadratic form in the
  exponential.

  Integrating over <math|\<theta\>> yields:

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|2*\<pi\>>p<around|(|r,\<theta\>|)>*d*\<theta\>>|<cell|=<frac|r
      <big|int><rsub|0><rsup|2*\<pi\>>e<rsup|-<frac|r<rsup|2>|2>*Q<around|(|\<theta\>|)>>*d*\<theta\>|2*\<pi\><sqrt|det
      <around|(|\<Sigma\>|)>>>*>>|<row|<cell|>|<cell|=r*J<rsub|0>*<around|(|r*<sqrt|det
      <around|(|\<Sigma\>|)>>|)>>>>>
    </eqsplit>
  </equation>

  This natural emergence of <math|J<rsub|0>> from the joint distribution
  structure directly connects to our counting function representation.

  <subsection|Zero Counting Function Development>

  The expected zero counting function takes the form:

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|N<around|(|T|)>>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*exp
      <around*|(|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>|)>*d*r*d*t>>|<row|<cell|>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T>\<cal-H\><rsub|0,r\<to\>\<epsilon\>><around*|[|exp
      <around*|(|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>|)>|]>*d*t>>>>
    </eqsplit>
  </equation>

  where <math|\<cal-H\><rsub|0,r\<to\>s><around|[|f|]>=<big|int><rsub|0><rsup|\<infty\>>r*f<around|(|r|)>*J<rsub|0>*<around|(|s*r|)>*d*r>
  is the Hankel transform of order zero.

  By Fubini's theorem:

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|N<around|(|T|)>>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*\<cal-H\><rsub|0,r\<to\>\<epsilon\>><around*|[|exp
      <around*|(|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*<big|int><rsub|0><rsup|T>\<phi\><rsub|n><around|(|t|)>*d*t|)>|]>>>|<row|<cell|>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*exp
      <around*|(|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*<big|int><rsub|0><rsup|T>\<phi\><rsub|n><around|(|t|)>*d*t|)>*d*r>>>>
    </eqsplit>
  </equation>

  Using the integral representation of <math|J<rsub|0>>:

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|N<around|(|T|)>>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||r|\|>*<around*|(|<frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*\<epsilon\>*r*cos
      \<theta\>>*d*\<theta\>|)>*exp <around*|(|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*<big|int><rsub|0><rsup|T>\<phi\><rsub|n><around|(|t|)>*d*t|)>*d*r>>|<row|<cell|>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||r|\|>*e<rsup|i*r*<around|(|\<epsilon\>*cos
      \<theta\>-<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*<big|int><rsub|0><rsup|T>\<phi\><rsub|n><around|(|t|)>*d*t|)>>*d*r*d*\<theta\>>>>>
    </eqsplit>
  </equation>

  The inner integral evaluates to:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||r|\|>*e<rsup|i*r*<around|(|\<epsilon\>*cos
    \<theta\>-<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*<big|int><rsub|0><rsup|T>\<phi\><rsub|n><around|(|t|)>*d*t|)>>*d*r=<frac|2|<around|(|\<epsilon\>*cos
    \<theta\>-<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*<big|int><rsub|0><rsup|T>\<phi\><rsub|n><around|(|t|)>*d*t|)><rsup|2>>
  </equation>

  Therefore:

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|N<around|(|T|)>>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>><frac|1|<around|(|\<epsilon\>*cos
      \<theta\>-<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*<big|int><rsub|0><rsup|T>\<phi\><rsub|n><around|(|t|)>*d*t|)><rsup|2>>*d*\<theta\>>>|<row|<cell|>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<frac|1|<around|(|<around|(|<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*<big|int><rsub|0><rsup|T>\<phi\><rsub|n><around|(|t|)>*d*t|)><rsup|2>+\<epsilon\><rsup|2>|)><rsup|3/2>>>>>>
    </eqsplit>
  </equation>

  <section*|Commentary on Mathematical Structure>

  The emergence of <math|J<rsub|0>> through the Hankel transform is not
  merely computational convenience but reflects the fundamental structure of
  Gaussian processes. The regularization parameter <math|\<epsilon\>>
  provides the necessary resolution while preserving the natural symmetries
  of the process. This framework reveals why the counting function takes this
  particular form and provides a natural setting for understanding both its
  average behavior and fluctuations.

  The simplicity of zeros follows directly from the Gaussian process
  properties, as the path and its mean square derivative cannot
  simultaneously vanish. This elementary fact, combined with the natural
  emergence of <math|J<rsub|0>> from joint distributions, provides a complete
  and elegant description of the zero counting function.
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
    <associate|auto-10|<tuple|34|7>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|3.1|4>>
    <associate|auto-5|<tuple|3.2|5>>
    <associate|auto-6|<tuple|3.3|5>>
    <associate|auto-7|<tuple|3.4|5>>
    <associate|auto-8|<tuple|3.5|6>>
    <associate|auto-9|<tuple|3.6|6>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Zero
      Counting Function via Regularized Transform for Gaussian Processes on
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|<around|[|0,\<infty\>|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Natural Framework and
      Preliminaries <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Note on Compactness
      Verification <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Bidirectional
      Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Simplicity of Zeros
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|3.5<space|2spc>Explicit Emergence of the
      Bessel Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.6<space|2spc>Zero Counting Function
      Development <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Commentary
      on Mathematical Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>