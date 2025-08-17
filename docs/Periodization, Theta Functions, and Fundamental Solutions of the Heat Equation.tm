<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Periodization, Theta Functions, and Fundamental
  Solutions of the Heat Equation: Connections to Discrete Fourier Transforms
  and Method of Images>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <abstract-data|<\abstract>
    This document establishes the mathematical connections between the
    Poisson summation formula, discrete Fourier transforms, and the method of
    images for solving the heat equation with boundary conditions. The
    analysis demonstrates how periodization serves as the unifying principle,
    leading to theta function representations of heat kernels on bounded
    domains.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Poisson Summation Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Connection
    to Discrete Fourier Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Heat
    Equation and Fundamental Solutions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Method
    of Images and Absorbing Boundaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Periodization
    and Rectangular Domains> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Theta
    Functions and Periodic Heat Kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Unified
    Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|The Poisson Summation Formula>

  <\definition>
    For a function <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> with Fourier
    transform <math|<wide|f|^><around|(|\<xi\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*e<rsup|-2*\<pi\>*i*x*\<xi\>>*d*x>,
    the Poisson summation formula states

    <\equation>
      <label|eq:poisson><big|sum><rsub|n\<in\>\<bbb-Z\>>f<around|(|n|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>><wide|f|^><around|(|k|)>
    </equation>
  </definition>

  <\theorem>
    Let <math|f> be a Schwartz function on <math|\<bbb-R\>>. Then equation
    <eqref|eq:poisson> holds.
  </theorem>

  <\proof>
    Define the periodized function

    <\equation>
      <label|eq:periodized>F<around|(|x|)>=<big|sum><rsub|n\<in\>\<bbb-Z\>>f*<around|(|x+n|)>
    </equation>

    Since <math|f> is Schwartz, the series converges uniformly and <math|F>
    is periodic with period 1. The Fourier series expansion of <math|F> is

    <\equation>
      <label|eq:fourier_series>F<around|(|x|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>>c<rsub|k>*e<rsup|2*\<pi\>*i*k*x>
    </equation>

    where the Fourier coefficients are

    <\align>
      <tformat|<table|<row|<cell|c<rsub|k>>|<cell|=<big|int><rsub|0><rsup|1>F<around|(|x|)>*e<rsup|-2*\<pi\>*i*k*x>*d*x<eq-number><label|eq:coeff_def>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|1><big|sum><rsub|n\<in\>\<bbb-Z\>>f*<around|(|x+n|)>*e<rsup|-2*\<pi\>*i*k*x>*d*x<eq-number><label|eq:coeff_expand>>>|<row|<cell|>|<cell|=<big|sum><rsub|n\<in\>\<bbb-Z\>><big|int><rsub|0><rsup|1>f*<around|(|x+n|)>*e<rsup|-2*\<pi\>*i*k*x>*d*x<eq-number><label|eq:interchange>>>>>
    </align>

    Substituting <math|u=x+n> in each integral:

    <\align>
      <tformat|<table|<row|<cell|c<rsub|k>>|<cell|=<big|sum><rsub|n\<in\>\<bbb-Z\>><big|int><rsub|n><rsup|n+1>f<around|(|u|)>*e<rsup|-2*\<pi\>*i*k*<around|(|u-n|)>>*d*u<eq-number><label|eq:substitution>>>|<row|<cell|>|<cell|=<big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|2*\<pi\>*i*k*n>*<big|int><rsub|n><rsup|n+1>f<around|(|u|)>*e<rsup|-2*\<pi\>*i*k*u>*d*u<eq-number><label|eq:factor_out>>>|<row|<cell|>|<cell|=<big|sum><rsub|n\<in\>\<bbb-Z\>><big|int><rsub|n><rsup|n+1>f<around|(|u|)>*e<rsup|-2*\<pi\>*i*k*u>*d*u<eq-number><label|eq:periodic_sum>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|u|)>*e<rsup|-2*\<pi\>*i*k*u>*d*u<eq-number><label|eq:union_intervals>>>|<row|<cell|>|<cell|=<wide|f|^><around|(|k|)><eq-number><label|eq:fourier_transform>>>>>
    </align>

    Step <eqref|eq:periodic_sum> uses the fact that
    <math|<big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|2*\<pi\>*i*k*n>=1> for
    integer <math|k>.

    Setting <math|x=0> in equation <eqref|eq:fourier_series>:

    <\equation>
      <label|eq:x_zero>F<around|(|0|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>>c<rsub|k>=<big|sum><rsub|k\<in\>\<bbb-Z\>><wide|f|^><around|(|k|)>
    </equation>

    From definition <eqref|eq:periodized>:

    <\equation>
      <label|eq:f_zero>F<around|(|0|)>=<big|sum><rsub|n\<in\>\<bbb-Z\>>f<around|(|n|)>
    </equation>

    Combining equations <eqref|eq:x_zero> and <eqref|eq:f_zero> yields
    <eqref|eq:poisson>.
  </proof>

  <section|Connection to Discrete Fourier Transform>

  <\definition>
    For a sequence <math|<around|{|x<rsub|n>|}><rsub|n=0><rsup|N-1>>, the
    <math|N>-point discrete Fourier transform is

    <\equation>
      <label|eq:dft>X<rsub|k>=<big|sum><rsub|n=0><rsup|N-1>x<rsub|n>*e<rsup|-2*\<pi\>*i*k*n/N>,<space|1em>k=0,1,\<ldots\>,N-1
    </equation>

    with inverse transform

    <\equation>
      <label|eq:idft>x<rsub|n>=<frac|1|N>*<big|sum><rsub|k=0><rsup|N-1>X<rsub|k>*e<rsup|2*\<pi\>*i*k*n/N>,<space|1em>n=0,1,\<ldots\>,N-1
    </equation>
  </definition>

  <\theorem>
    Let <math|f> be a function on <math|\<bbb-R\>> and define
    <math|x<rsub|n>=f*<around|(|n/N|)>> for <math|n=0,1,\<ldots\>,N-1>. Then

    <\equation>
      <label|eq:dft_poisson_relation>X<rsub|k>=N*<big|sum><rsub|m\<in\>\<bbb-Z\>><wide|f|^>*<around|(|k+m*N|)>
    </equation>

    where <math|<wide|f|^>> is the continuous Fourier transform of <math|f>.
  </theorem>

  <\proof>
    From definition <eqref|eq:dft>:

    <\equation>
      <label|eq:dft_expanded>X<rsub|k>=<big|sum><rsub|n=0><rsup|N-1>f*<around|(|n/N|)>*e<rsup|-<frac|2*\<pi\>*i*k*n|N>>
    </equation>

    Consider the scaled function <math|g<around|(|x|)>=f*<around*|(|<frac|x|N>|)>>.
    Its Fourier transform is

    <\equation>
      <label|eq:scaled_fourier><wide|g|^><around|(|\<xi\>|)>=N*<wide|f|^><around|(|N*\<xi\>|)>
    </equation>

    Define the impulse train

    <\equation>
      <label|eq:impulse_train>h<around|(|x|)>=<big|sum><rsub|n=0><rsup|N-1>f*<around*|(|<frac|n|N>|)>*\<delta\>*<around*|(|x-<frac|n|N>|)>
    </equation>

    The Fourier transform of <math|h> is

    <\equation>
      <label|eq:impulse_fourier><wide|h|^><around|(|\<xi\>|)>=<big|sum><rsub|n=0><rsup|N-1>f*<around|(|n/N|)>*e<rsup|-2*\<pi\>*i*n*\<xi\>/N>
    </equation>

    Setting <math|\<xi\>=k> gives <math|<wide|h|^><around|(|k|)>=X<rsub|k>>.

    The function <math|h> can be written as

    <\equation>
      <label|eq:h_periodic>h<around|(|x|)>=<frac|1|N>*<big|sum><rsub|n=0><rsup|N-1>g<around|(|x|)>*<text|III><rsub|N><around|(|x-n/N|)>
    </equation>

    where III<rsub|<math|N>> is the Shah function with period <math|1/N>.

    By the Poisson summation formula applied to the periodization:

    <\align>
      <tformat|<table|<row|<cell|<wide|h|^><around|(|k|)>>|<cell|=N*<big|sum><rsub|m\<in\>\<bbb-Z\>><wide|g|^>*<around|(|k+m*N|)><eq-number><label|eq:poisson_applied>>>|<row|<cell|>|<cell|=N*<big|sum><rsub|m\<in\>\<bbb-Z\>>N*<wide|f|^><around|(|N*<around|(|k+m*N|)>/N|)><eq-number><label|eq:scaling_applied>>>|<row|<cell|>|<cell|=N<rsup|2>*<big|sum><rsub|m\<in\>\<bbb-Z\>><wide|f|^>*<around|(|k+m*N|)><eq-number><label|eq:simplified>>>>>
    </align>

    Since <math|X<rsub|k>=<wide|h|^><around|(|k|)>/N>, we obtain equation
    <eqref|eq:dft_poisson_relation>.
  </proof>

  <section|Heat Equation and Fundamental Solutions>

  <\definition>
    The heat equation in <math|\<bbb-R\><rsup|d>> is

    <\equation>
      <label|eq:heat><frac|\<partial\>*u|\<partial\>*t>=\<Delta\>*u
    </equation>

    where <math|\<Delta\>=<big|sum><rsub|i=1><rsup|d><frac|\<partial\><rsup|2>|\<partial\>*x<rsub|i><rsup|2>>>
    is the Laplacian.
  </definition>

  <\theorem>
    The fundamental solution of equation <eqref|eq:heat> is

    <\equation>
      <label|eq:heat_kernel>G<around|(|x,t|)>=<frac|1|<around|(|4*\<pi\>*t|)><rsup|d/2>>*e<rsup|-<around|\||x|\|><rsup|2>/<around|(|4*t|)>>
    </equation>

    for <math|t\<gtr\>0> and <math|x\<in\>\<bbb-R\><rsup|d>>.
  </theorem>

  <\proof>
    Take the Fourier transform with respect to <math|x>:

    <\equation>
      <label|eq:fourier_heat><frac|\<partial\>*<wide|u|^>|\<partial\>*t>=-4*\<pi\><rsup|2><around|\||\<xi\>|\|><rsup|2>*<wide|u|^>
    </equation>

    The solution is

    <\equation>
      <label|eq:fourier_solution><wide|u|^><around|(|\<xi\>,t|)>=<wide|u|^><around|(|\<xi\>,0|)>*e<rsup|-4*\<pi\><rsup|2><around|\||\<xi\>|\|><rsup|2>*t>
    </equation>

    For the fundamental solution with initial condition
    <math|u<around|(|x,0|)>=\<delta\><around|(|x|)>>, we have
    <math|<wide|u|^><around|(|\<xi\>,0|)>=1>, so

    <\equation>
      <label|eq:fundamental_fourier><wide|G|^><around|(|\<xi\>,t|)>=e<rsup|-4*\<pi\><rsup|2><around|\||\<xi\>|\|><rsup|2>*t>
    </equation>

    Taking the inverse Fourier transform:

    <\align>
      <tformat|<table|<row|<cell|G<around|(|x,t|)>>|<cell|=<big|int><rsub|\<bbb-R\><rsup|d>>e<rsup|-4*\<pi\><rsup|2><around|\||\<xi\>|\|><rsup|2>*t>*e<rsup|2*\<pi\>*i*x\<cdot\>\<xi\>>*d*\<xi\><eq-number><label|eq:inverse_transform>>>|<row|<cell|>|<cell|=<big|prod><rsub|j=1><rsup|d><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-4*\<pi\><rsup|2>*\<xi\><rsub|j><rsup|2>*t>*e<rsup|2*\<pi\>*i*x<rsub|j>*\<xi\><rsub|j>>*d*\<xi\><rsub|j><eq-number><label|eq:product_form>>>>>
    </align>

    For each one-dimensional integral:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-4*\<pi\><rsup|2>*\<xi\><rsup|2>*t>*e<rsup|2*\<pi\>*i*x*\<xi\>>*d*\<xi\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-4*\<pi\><rsup|2>*t*<around|(|\<xi\><rsup|2>-<frac|i*x|2*\<pi\>*t>|)>>*d*\<xi\><eq-number><label|eq:completing_square>>>|<row|<cell|>|<cell|=e<rsup|-x<rsup|2>/<around|(|4*t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-4*\<pi\><rsup|2>*t*<around|(|\<xi\>-<frac|i*x|4*\<pi\>*t>|)><rsup|2>>*d*\<xi\><eq-number><label|eq:completed_square>>>|<row|<cell|>|<cell|=<frac|e<rsup|-x<rsup|2>/<around|(|4*t|)>>|<sqrt|4*\<pi\>*t>><eq-number><label|eq:gaussian_integral>>>>>
    </align>

    Therefore:

    <\equation>
      <label|eq:final_kernel>G<around|(|x,t|)>=<frac|1|<around|(|4*\<pi\>*t|)><rsup|d/2>>*e<rsup|-<around|\||x|\|><rsup|2>/<around|(|4*t|)>>
    </equation>
  </proof>

  <section|Method of Images and Absorbing Boundaries>

  <\theorem>
    For the heat equation on the half-line <math|x\<gtr\>0> with absorbing
    boundary condition <math|u<around|(|0,t|)>=0>, the fundamental solution
    is

    <\equation>
      <label|eq:half_line_solution>G<rsub|+><around|(|x,y,t|)>=G<around|(|x-y,t|)>-G<around|(|x+y,t|)>
    </equation>

    where <math|G> is given by equation <eqref|eq:heat_kernel> in one
    dimension.
  </theorem>

  <\proof>
    The method constructs the solution using the original source at
    <math|y\<gtr\>0> and an image source at <math|-y\<less\>0> with opposite
    sign.

    For the source term <math|\<delta\>*<around|(|x-y|)>>, place an image
    source <math|-\<delta\>*<around|(|x+y|)>> at <math|-y>. The combined
    solution is

    <\align>
      <tformat|<table|<row|<cell|u<around|(|x,t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>G<around|(|x-y,t|)>*\<delta\>*<around|(|y-y<rsub|0>|)>*d*y-<big|int><rsub|0><rsup|\<infty\>>G<around|(|x+y,t|)>*\<delta\>*<around|(|y-y<rsub|0>|)>*d*y<eq-number><label|eq:superposition>>>|<row|<cell|>|<cell|=G<around|(|x-y<rsub|0>,t|)>-G<around|(|x+y<rsub|0>,t|)><eq-number><label|eq:evaluation>>>>>
    </align>

    Verification of boundary condition:

    <\align>
      <tformat|<table|<row|<cell|u<around|(|0,t|)>>|<cell|=G<around|(|-y<rsub|0>,t|)>-G<around|(|y<rsub|0>,t|)><eq-number><label|eq:boundary_check>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|4*\<pi\>*t>>*e<rsup|-y<rsub|0><rsup|2>/<around|(|4*t|)>>-<frac|1|<sqrt|4*\<pi\>*t>>*e<rsup|-y<rsub|0><rsup|2>/<around|(|4*t|)>><eq-number><label|eq:symmetry>>>|<row|<cell|>|<cell|=0<eq-number><label|eq:boundary_satisfied>>>>>
    </align>

    The solution satisfies the heat equation since both
    <math|G<around|(|x-y<rsub|0>,t|)>> and <math|G<around|(|x+y<rsub|0>,t|)>>
    are solutions, and linear combinations of solutions are solutions.
  </proof>

  <section|Periodization and Rectangular Domains>

  <\theorem>
    For the heat equation on the rectangle
    <math|<around|(|0,a|)>\<times\><around|(|0,b|)>> with absorbing boundary
    conditions, the fundamental solution is

    <\equation>
      <label|eq:rectangle_solution>G<rsub|R><around|(|x,y,\<xi\>,\<eta\>,t|)>=<big|sum><rsub|m,n\<in\>\<bbb-Z\>><around|(|-1|)><rsup|m+n>*G<around|(|x-\<xi\>+2*m*a,y-\<eta\>+2*n*b,t|)>
    </equation>
  </theorem>

  <\proof>
    Apply the method of images successively in both directions. For absorbing
    boundaries at <math|x=0,a> and <math|y=0,b>, place image sources at:

    <\itemize>
      <item><math|<around|(|2*m*a\<pm\>\<xi\>,2*n*b\<pm\>\<eta\>|)>> for all
      integers <math|m,n>

      <item>Signs alternate: <math|<around|(|-1|)><rsup|m+n>> for the source
      at <math|<around|(|2*m*a+<around|(|-1|)><rsup|m>*\<xi\>,2*n*b+<around|(|-1|)><rsup|n>*\<eta\>|)>>
    </itemize>

    The infinite sum in equation <eqref|eq:rectangle_solution> represents the
    superposition of all image sources. Each term satisfies the heat
    equation, so their sum does as well.

    Boundary condition verification at <math|x=0>:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|G<rsub|R><around|(|0,y,\<xi\>,\<eta\>,t|)><eq-number><label|eq:boundary_x_zero>>>|<row|<cell|>|<cell|=<big|sum><rsub|m,n\<in\>\<bbb-Z\>><around|(|-1|)><rsup|m+n>*G<around|(|-\<xi\>+2*m*a,y-\<eta\>+2*n*b,t|)><eq-number><label|eq:x_zero_expanded>>>|<row|<cell|>|<cell|=<big|sum><rsub|m,n\<in\>\<bbb-Z\>><around|(|-1|)><rsup|m+n>*G<around|(|\<xi\>-2*m*a,y-\<eta\>+2*n*b,t|)><eq-number><label|eq:symmetry_applied>>>|<row|<cell|>|<cell|=<big|sum><rsub|m,n\<in\>\<bbb-Z\>><around|(|-1|)><rsup|m+n+1>*G<around|(|\<xi\>+2*m*a,y-\<eta\>+2*n*b,t|)><eq-number><label|eq:index_shift>>>|<row|<cell|>|<cell|=-G<rsub|R><around|(|0,y,\<xi\>,\<eta\>,t|)><eq-number><label|eq:sign_flip>>>>>
    </align>

    This implies <math|G<rsub|R><around|(|0,y,\<xi\>,\<eta\>,t|)>=0>. Similar
    calculations verify the boundary conditions at <math|x=a>, <math|y=0>,
    and <math|y=b>.
  </proof>

  <section|Theta Functions and Periodic Heat Kernels>

  <\definition>
    The Jacobi theta function is defined as

    <\equation>
      <label|eq:theta_def>\<vartheta\><rsub|3><around|(|z,\<tau\>|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>e<rsup|\<pi\>*i*n<rsup|2>*\<tau\>+2*\<pi\>*i*n*z>
    </equation>

    where <math|\<Im\><around|(|\<tau\>|)>\<gtr\>0>.
  </definition>

  <\theorem>
    The solution of the heat equation on the circle
    <math|S<rsup|1>=\<bbb-R\>/\<bbb-Z\>> with initial condition
    <math|u<around|(|x,0|)>=\<delta\>*<around|(|x-x<rsub|0>|)>> is

    <\equation>
      <label|eq:circle_solution>u<around|(|x,t|)>=<big|sum><rsub|n\<in\>\<bbb-Z\>>G<around|(|x-x<rsub|0>+n,t|)>=<frac|1|<sqrt|4*\<pi\>*t>>*\<vartheta\><rsub|3><around*|(|<frac|x-x<rsub|0>|2>,<frac|i*t|\<pi\>>|)>
    </equation>
  </theorem>

  <\proof>
    The periodization of the fundamental solution gives:

    <\align>
      <tformat|<table|<row|<cell|u<around|(|x,t|)>>|<cell|=<big|sum><rsub|n\<in\>\<bbb-Z\>><frac|1|<sqrt|4*\<pi\>*t>>*e<rsup|-<around|(|x-x<rsub|0>+n|)><rsup|2>/<around|(|4*t|)>><eq-number><label|eq:periodized_kernel>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|4*\<pi\>*t>>*e<rsup|-<around|(|x-x<rsub|0>|)><rsup|2>/<around|(|4*t|)>>*<big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|-n*<around|(|x-x<rsub|0>|)>/<around|(|2*t|)>>*e<rsup|-n<rsup|2>/<around|(|4*t|)>><eq-number><label|eq:factored>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|4*\<pi\>*t>>*e<rsup|-<around|(|x-x<rsub|0>|)><rsup|2>/<around|(|4*t|)>>*<big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|\<pi\>*i*n<rsup|2>*<around|(|i*t/\<pi\>|)>+2*\<pi\>*i*n*<frac|x-x<rsub|0>|2>><eq-number><label|eq:theta_form>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|4*\<pi\>*t>>*\<vartheta\><rsub|3><around*|(|<frac|x-x<rsub|0>|2>,<frac|i*t|\<pi\>>|)><eq-number><label|eq:theta_identified>>>>>
    </align>

    Step <eqref|eq:theta_form> uses the identity
    <math|e<rsup|-n<rsup|2>/<around|(|4*t|)>-n*<around|(|x-x<rsub|0>|)>/<around|(|2*t|)>>=e<rsup|\<pi\>*i*n<rsup|2>*<around|(|i*t/\<pi\>|)>+2*\<pi\>*i*n*<around|(|x-x<rsub|0>|)>/2>>.

    The connection to Poisson summation follows from:

    <\equation>
      <label|eq:poisson_theta><big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|-<around|(|x+n|)><rsup|2>/4*t>=<sqrt|\<pi\>*t>*<big|sum><rsub|k\<in\>\<bbb-Z\>>e<rsup|-\<pi\><rsup|2>*k<rsup|2>*t>*e<rsup|2*\<pi\>*i*k*x>
    </equation>

    This establishes the theta function as the periodized heat kernel on the
    circle.
  </proof>

  <section|Unified Framework>

  The connections established demonstrate that:

  <\enumerate>
    <item>The Poisson summation formula provides the mathematical foundation
    for relating continuous and discrete Fourier transforms through
    periodization.

    <item>The discrete Fourier transform emerges as a sampled and periodized
    version of the continuous transform, with aliasing effects captured by
    equation <eqref|eq:dft_poisson_relation>.

    <item>The method of images for boundary value problems creates solutions
    through systematic periodization and reflection of fundamental solutions.

    <item>Theta functions arise naturally as periodized heat kernels,
    representing the exact solutions for heat flow on compact domains.

    <item>The inverse discrete Fourier transform reconstructs signals from
    their frequency components using the same periodization principles that
    govern heat kernel construction on bounded domains.
  </enumerate>

  The mathematical structure reveals periodization as the fundamental
  operation connecting discrete sampling, boundary conditions, and exact
  solutions of the heat equation through theta function representations.

  <no-indent><cite|grafakosClassicalFourierAnalysis><cite|hormanderI><cite|steinWeissEuclidean><cite|evansPDE><cite|courantHilbertII><cite|ahlforsComplexAnalysis><cite|mumfordTataI>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|7>
      <bibitem*|1><label|bib-ahlforsComplexAnalysis>Lars<nbsp>V.<nbsp>Ahlfors.
      <newblock><with|font-shape|italic|Complex Analysis>.
      <newblock>McGraw-Hill, 3rd<localize| edition>, 1979.<newblock>

      <bibitem*|2><label|bib-courantHilbertII>Richard Courant<localize| and
      >David Hilbert. <newblock><with|font-shape|italic|Methods of
      Mathematical Physics, Vol. II: Partial Differential Equations>.
      <newblock>Wiley\UVCH, 1962.<newblock>

      <bibitem*|3><label|bib-evansPDE>Lawrence<nbsp>C.<nbsp>Evans.
      <newblock><with|font-shape|italic|Partial Differential Equations>.
      <newblock>American Mathematical Society, 2nd<localize| edition>,
      2010.<newblock>

      <bibitem*|4><label|bib-grafakosClassicalFourierAnalysis>Loukas
      Grafakos. <newblock><with|font-shape|italic|Classical Fourier
      Analysis>. <newblock>Springer, 3rd<localize| edition>, 2014.<newblock>

      <bibitem*|5><label|bib-hormanderI>Lars Hörmander.
      <newblock><with|font-shape|italic|The Analysis of Linear Partial
      Differential Operators I: Distribution Theory and Fourier Analysis>.
      <newblock>Springer, 2nd<localize| edition>, 1990.<newblock>

      <bibitem*|6><label|bib-mumfordTataI>David Mumford.
      <newblock><with|font-shape|italic|Tata Lectures on Theta I>.
      <newblock>Birkhäuser, 1983.<newblock>

      <bibitem*|7><label|bib-steinWeissEuclidean>Elias<nbsp>M.<nbsp>Stein<localize|
      and >Guido Weiss. <newblock><with|font-shape|italic|Introduction to
      Fourier Analysis on Euclidean Spaces>. <newblock>Princeton University
      Press, 1971.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|5>>
    <associate|auto-5|<tuple|5|5>>
    <associate|auto-6|<tuple|6|6>>
    <associate|auto-7|<tuple|7|7>>
    <associate|auto-8|<tuple|5|7>>
    <associate|bib-ahlforsComplexAnalysis|<tuple|1|7>>
    <associate|bib-courantHilbertII|<tuple|2|7>>
    <associate|bib-evansPDE|<tuple|3|7>>
    <associate|bib-grafakosClassicalFourierAnalysis|<tuple|4|7>>
    <associate|bib-hormanderI|<tuple|5|7>>
    <associate|bib-mumfordTataI|<tuple|6|7>>
    <associate|bib-steinWeissEuclidean|<tuple|7|7>>
    <associate|eq:boundary_check|<tuple|39|5>>
    <associate|eq:boundary_satisfied|<tuple|41|5>>
    <associate|eq:boundary_x_zero|<tuple|43|6>>
    <associate|eq:circle_solution|<tuple|49|6>>
    <associate|eq:coeff_def|<tuple|4|2>>
    <associate|eq:coeff_expand|<tuple|5|2>>
    <associate|eq:completed_square|<tuple|33|5>>
    <associate|eq:completing_square|<tuple|32|5>>
    <associate|eq:dft|<tuple|14|3>>
    <associate|eq:dft_expanded|<tuple|17|3>>
    <associate|eq:dft_poisson_relation|<tuple|16|3>>
    <associate|eq:evaluation|<tuple|38|5>>
    <associate|eq:f_zero|<tuple|13|2>>
    <associate|eq:factor_out|<tuple|8|2>>
    <associate|eq:factored|<tuple|51|6>>
    <associate|eq:final_kernel|<tuple|35|5>>
    <associate|eq:fourier_heat|<tuple|27|4>>
    <associate|eq:fourier_series|<tuple|3|2>>
    <associate|eq:fourier_solution|<tuple|28|4>>
    <associate|eq:fourier_transform|<tuple|11|2>>
    <associate|eq:fundamental_fourier|<tuple|29|4>>
    <associate|eq:gaussian_integral|<tuple|34|5>>
    <associate|eq:h_periodic|<tuple|21|3>>
    <associate|eq:half_line_solution|<tuple|36|5>>
    <associate|eq:heat|<tuple|25|4>>
    <associate|eq:heat_kernel|<tuple|26|4>>
    <associate|eq:idft|<tuple|15|3>>
    <associate|eq:impulse_fourier|<tuple|20|3>>
    <associate|eq:impulse_train|<tuple|19|3>>
    <associate|eq:index_shift|<tuple|46|6>>
    <associate|eq:interchange|<tuple|6|2>>
    <associate|eq:inverse_transform|<tuple|30|4>>
    <associate|eq:periodic_sum|<tuple|9|2>>
    <associate|eq:periodized|<tuple|2|2>>
    <associate|eq:periodized_kernel|<tuple|50|6>>
    <associate|eq:poisson|<tuple|1|1>>
    <associate|eq:poisson_applied|<tuple|22|4>>
    <associate|eq:poisson_theta|<tuple|54|7>>
    <associate|eq:product_form|<tuple|31|4>>
    <associate|eq:rectangle_solution|<tuple|42|5>>
    <associate|eq:scaled_fourier|<tuple|18|3>>
    <associate|eq:scaling_applied|<tuple|23|4>>
    <associate|eq:sign_flip|<tuple|47|6>>
    <associate|eq:simplified|<tuple|24|4>>
    <associate|eq:substitution|<tuple|7|2>>
    <associate|eq:superposition|<tuple|37|5>>
    <associate|eq:symmetry|<tuple|40|5>>
    <associate|eq:symmetry_applied|<tuple|45|6>>
    <associate|eq:theta_def|<tuple|48|6>>
    <associate|eq:theta_form|<tuple|52|6>>
    <associate|eq:theta_identified|<tuple|53|6>>
    <associate|eq:union_intervals|<tuple|10|2>>
    <associate|eq:x_zero|<tuple|12|2>>
    <associate|eq:x_zero_expanded|<tuple|44|6>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      grafakosClassicalFourierAnalysis

      hormanderI

      steinWeissEuclidean

      evansPDE

      courantHilbertII

      ahlforsComplexAnalysis

      mumfordTataI
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Poisson Summation Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Connection
      to Discrete Fourier Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Heat
      Equation and Fundamental Solutions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Method
      of Images and Absorbing Boundaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Periodization
      and Rectangular Domains> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Theta
      Functions and Periodic Heat Kernels>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Unified
      Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>