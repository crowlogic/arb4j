<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Interval-Dependent Covariance
  Parametrization<next-line>and Complex-Analytic Time Change>|<\doc-date>
    \;
  </doc-date>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Setup
    and interval-dependent parametrization>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Empirical autocovariance
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Parametric kernel hypothesis
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|2.3<space|2spc>Best-fit parameters via least squares
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.4<space|2spc>Reparametrization by midpoint and
    length <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Optimization:
    Newton convergence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Gradient
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.2<space|2spc>Hessian
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|3.3<space|2spc>Newton iteration
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Complex-analytic
    interpretation via Wirtinger and areolar derivatives>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Wirtinger derivatives and local metric
    scaling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|4.2<space|2spc>Stationary process pullback
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|4.3<space|2spc>Areolar derivatives and averaged
    second-order behavior <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|4.4<space|2spc>Reconstruction strategy
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Connection
    to the Riemann zeta function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Computational
    implementation in ARB4J> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  Let <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
  real-valued, second-order Gaussian process that is non-stationary in the
  sense of Priestley. Such processes are <em|oscillatory> and have separable
  linear span in <math|L<rsup|2>>. We study how the covariance structure of
  <math|X> over finite intervals can be parametrized by a two-parameter
  family of kernels, and how this parametrization connects to an underlying
  complex-analytic time-change via Wirtinger and areolar derivatives.

  <section|Setup and interval-dependent parametrization>

  <subsection|Empirical autocovariance>

  Fix a bounded interval <math|<around|[|S,T|]>\<subset\>\<bbb-R\>> and
  assume <math|X> is observed on a discrete grid
  <math|<around|{|t<rsub|0>,\<ldots\>,t<rsub|n-1>|}>\<subset\><around|[|S,T|]>>
  with uniform spacing <math|\<Delta\>*t>. The <em|empirical autocovariance>
  at lag index <math|k\<in\>\<bbb-Z\><rsub|\<ge\>0>> is

  <\equation*>
    <wide|C|^><rsub|<around|[|S,T|]>><around|(|k|)>=<frac|1|n-k>*<big|sum><rsub|j=0><rsup|n-k-1><around*|(|X<around|(|t<rsub|j>|)>-<wide|X|\<bar\>>|)>*<around*|(|X<around|(|t<rsub|j+k>|)>-<wide|X|\<bar\>>|)>,
  </equation*>

  where <math|<wide|X|\<bar\>>> is the sample mean over the interval.

  <subsection|Parametric kernel hypothesis>

  Suppose there exists a fixed kernel <math|K:\<bbb-R\>\<to\>\<bbb-R\>>,
  depending only on the lag <math|h=t-s>, such that on each finite interval
  <math|<around|[|S,T|]>>, the second-order structure of <math|X> is
  well-approximated by a two-parameter family

  <\equation*>
    C<rsub|A,B><around|(|s,t|)>=A*<space|0.17em>K*<around*|(|B*<around|(|t-s|)>|)>,<space|2em>s,t\<in\><around|[|S,T|]>,
  </equation*>

  for scalars <math|A,B\<in\>\<bbb-R\>> depending on the interval. Here:

  <\itemize>
    <item><math|K<around|(|h|)>> captures a universal oscillatory shape
    (stationary covariance structure);

    <item><math|A> encodes interval-dependent variance/amplitude scaling;

    <item><math|B> encodes interval-dependent time-scale (frequency) scaling.
  </itemize>

  <subsection|Best-fit parameters via least squares>

  Fix a finite set of lags <math|\<cal-L\>=<around|{|k<rsub|1>,\<ldots\>,k<rsub|m>|}>\<subset\>\<bbb-Z\><rsub|\<ge\>0>>
  with corresponding lag values <math|h<rsub|k>=k*\<Delta\>*t>. Define the
  residual at lag <math|k> by

  <\equation*>
    r<rsub|k><around|(|A,B|)>=<wide|C|^><rsub|<around|[|S,T|]>><around|(|k|)>-A*<space|0.17em>K*<around|(|B*h<rsub|k>|)>,
  </equation*>

  and the mean square error

  <\equation*>
    <math-up|MSE><rsub|<around|[|S,T|]>><around|(|A,B|)>=<frac|1|<around|\||\<cal-L\>|\|>>*<big|sum><rsub|k\<in\>\<cal-L\>>r<rsub|k><around|(|A,B|)><rsup|2>.
  </equation*>

  <\definition>
    For each interval <math|<around|[|S,T|]>> with <math|S\<less\>T>, define
    <math|<around|(|A*<around|(|S,T|)>,B*<around|(|S,T|)>|)>> to be any
    minimizer

    <\equation*>
      <around*|(|A*<around|(|S,T|)>,B*<around|(|S,T|)>|)>\<in\>arg
      min<rsub|<around|(|A,B|)>\<in\>\<bbb-R\><rsup|2>><math-up|MSE><rsub|<around|[|S,T|]>><around|(|A,B|)>.
    </equation*>
  </definition>

  This defines a mapping

  <\equation*>
    \<Phi\>:<around|{|<around|(|S,T|)>\<in\>\<bbb-R\><rsup|2>:S\<less\>T|}>\<longrightarrow\>\<bbb-R\><rsup|2>,<space|2em>\<Phi\><around|(|S,T|)>=<around*|(|A*<around|(|S,T|)>,<space|0.17em>B*<around|(|S,T|)>|)>,
  </equation*>

  which assigns to each choice of interval endpoints a pair of scalars giving
  the best-fit covariance kernel.

  <subsection|Reparametrization by midpoint and length>

  Define

  <\equation*>
    M=<frac|S+T|2>,<space|2em>L=T-S\<gtr\>0.
  </equation*>

  Then

  <\equation*>
    \<Psi\>:\<cal-D\>\<to\>\<bbb-R\><rsup|2>,<space|2em>\<Psi\><around|(|M,L|)>=<around|(|A*<around|(|M,L|)>,<space|0.17em>B*<around|(|M,L|)>|)>,
  </equation*>

  with

  <\equation*>
    A*<around|(|M,L|)>=A*<around*|(|M-L/2,<space|0.17em>M+L/2|)>,<space|2em>B*<around|(|M,L|)>=B*<around*|(|M-L/2,<space|0.17em>M+L/2|)>.
  </equation*>

  Empirically, one may observe simple functional forms, e.g.

  <\equation*>
    A*<around|(|M,L|)>\<approx\>\<alpha\><rsub|0>+\<alpha\><rsub|1>*M+\<alpha\><rsub|2>*L,<space|2em>B*<around|(|M,L|)>\<approx\>\<beta\><rsub|0>+\<beta\><rsub|1>*M+\<beta\><rsub|2>*L,
  </equation*>

  indicating that the non-stationarity manifests as a systematic linear
  variation of variance and time scale with interval location and length.

  <section|Optimization: Newton convergence>

  <subsection|Gradient>

  Compute partial derivatives of the residuals:

  <\equation*>
    <frac|\<partial\>*r<rsub|k>|\<partial\>*A>=-K*<around|(|B*h<rsub|k>|)>,<space|2em><frac|\<partial\>*r<rsub|k>|\<partial\>*B>=-A*<space|0.17em>K<rprime|'>*<around|(|B*h<rsub|k>|)>*<space|0.17em>h<rsub|k>.
  </equation*>

  The gradient of <math|<math-up|MSE><around|(|A,B|)>> is

  <\equation*>
    \<nabla\><math-up|MSE>=<frac|2|<around|\||\<cal-L\>|\|>><matrix|<tformat|<cwith|1|1|1|-1|cell-valign|top>|<cwith|1|1|1|-1|cell-vmode|exact>|<cwith|1|1|1|-1|cell-height|<plus|1fn|6pt>>|<table|<row|<cell|-<big|sum><rsub|k>r<rsub|k><around|(|A,B|)>*<space|0.17em>K*<around|(|B*h<rsub|k>|)>>>|<row|<cell|-<big|sum><rsub|k>r<rsub|k><around|(|A,B|)>*<space|0.17em>A*<space|0.17em>K<rprime|'>*<around|(|B*h<rsub|k>|)>*<space|0.17em>h<rsub|k>>>>>>.
  </equation*>

  <subsection|Hessian>

  The second derivatives are

  <\equation*>
    <frac|\<partial\><rsup|2><math-up|MSE>|\<partial\>*A<rsup|2>>=<frac|2|<around|\||\<cal-L\>|\|>>*<big|sum><rsub|k>K*<around|(|B*h<rsub|k>|)><rsup|2>,
  </equation*>

  <\equation*>
    <frac|\<partial\><rsup|2><math-up|MSE>|\<partial\>*A*<space|0.17em>\<partial\>*B>=<frac|2|<around|\||\<cal-L\>|\|>>*<big|sum><rsub|k><around*|[|A*<space|0.17em>K<rprime|'>*<around|(|B*h<rsub|k>|)>*<space|0.17em>h<rsub|k>*<space|0.17em>K*<around|(|B*h<rsub|k>|)>-r<rsub|k><around|(|A,B|)>*<space|0.17em>K<rprime|'>*<around|(|B*h<rsub|k>|)>*<space|0.17em>h<rsub|k>|]>,
  </equation*>

  <\equation*>
    <frac|\<partial\><rsup|2><math-up|MSE>|\<partial\>*B<rsup|2>>=<frac|2|<around|\||\<cal-L\>|\|>>*<big|sum><rsub|k><around*|[|A<rsup|2>*K<rprime|'>*<around|(|B*h<rsub|k>|)><rsup|2>*h<rsub|k><rsup|2>-r<rsub|k><around|(|A,B|)>*<space|0.17em>A*<space|0.17em>K<rprime|''>*<around|(|B*h<rsub|k>|)>*<space|0.17em>h<rsub|k><rsup|2>|]>.
  </equation*>

  Assemble the Hessian matrix <math|H<around|(|A,B|)>>.

  <subsection|Newton iteration>

  Newton's method updates

  <\equation*>
    <matrix|<tformat|<table|<row|<cell|A<rsub|n+1>>>|<row|<cell|B<rsub|n+1>>>>>>=<matrix|<tformat|<table|<row|<cell|A<rsub|n>>>|<row|<cell|B<rsub|n>>>>>>-H<around|(|A<rsub|n>,B<rsub|n>|)><rsup|-1>*<space|0.17em>\<nabla\><math-up|MSE><around|(|A<rsub|n>,B<rsub|n>|)>.
  </equation*>

  <\proposition>
    [Local convergence] Near the true minimizer
    <math|<around|(|A<rsup|\<ast\>>,B<rsup|\<ast\>>|)>>, if <math|K> is
    <math|C<rsup|2>> and the residuals <math|r<rsub|k><around|(|A<rsup|\<ast\>>,B<rsup|\<ast\>>|)>>
    are small, then the Hessian is dominated by the sum-of-squares terms

    <\equation*>
      <big|sum><rsub|k>K*<around|(|B<rsup|\<ast\>>*h<rsub|k>|)><rsup|2>\<gtr\>0,<space|2em><big|sum><rsub|k>A<rsup|\<ast\>2>*K<rprime|'>*<around|(|B<rsup|\<ast\>>*h<rsub|k>|)><rsup|2>*h<rsub|k><rsup|2>\<gtr\>0,
    </equation*>

    which ensure <math|H<around|(|A<rsup|\<ast\>>,B<rsup|\<ast\>>|)>> is
    positive definite. Standard Newton\UKantorovich theory then guarantees
    quadratic convergence from any starting point sufficiently close to
    <math|<around|(|A<rsup|\<ast\>>,B<rsup|\<ast\>>|)>>.
  </proposition>

  <section|Complex-analytic interpretation via Wirtinger and areolar
  derivatives>

  The interval-dependent parameters <math|<around|(|A,B|)>> have a deeper
  origin in an underlying <em|complex-analytic time change>. Instead of a
  real monotone time-reparametrization, we posit a map
  <math|F:\<bbb-C\>\<to\>\<bbb-C\>> such that the process <math|X> arises by
  pulling back a stationary Gaussian process through <math|F>.

  <subsection|Wirtinger derivatives and local metric scaling>

  For a map <math|F<around|(|z|)>> of a complex variable <math|z=x+i*y>,
  define the Wirtinger derivatives

  <\equation*>
    <frac|\<partial\>*F|\<partial\>*z>=<frac|1|2>*<around*|(|<frac|\<partial\>*F|\<partial\>*x>-i*<frac|\<partial\>*F|\<partial\>*y>|)>,<space|2em><frac|\<partial\>*F|\<partial\>*<wide|z|\<bar\>>>=<frac|1|2>*<around*|(|<frac|\<partial\>*F|\<partial\>*x>+i*<frac|\<partial\>*F|\<partial\>*y>|)>.
  </equation*>

  If <math|F> is holomorphic, then <math|\<partial\>*F/\<partial\>*<wide|z|\<bar\>>=0>
  and <math|\<partial\>*F/\<partial\>*z=F<rprime|'><around|(|z|)>> is the
  complex derivative.

  <with|font-series|bold|Key fact:> At a point <math|z<rsub|0>>, the map
  <math|F> locally scales the Euclidean metric by

  <\equation*>
    <around|\||d*F|\|><rsup|2>\<approx\><around|\||F<rprime|'><around|(|z<rsub|0>|)><around|\||<rsup|2><space|0.17em>|\|>*d*z|\|><rsup|2>.
  </equation*>

  Hence <math|<around|\||F<rprime|'><around|(|z|)>|\|><rsup|2>> encodes the
  <em|local variance scaling> induced by <math|F>, and
  <math|<around|\||F<rprime|'><around|(|z|)>|\|>> encodes the <em|local
  length/time-scale scaling>.

  <subsection|Stationary process pullback>

  Suppose <math|Y<around|(|w|)>> is a stationary Gaussian process indexed by
  <math|w\<in\>\<bbb-C\>> with covariance kernel
  <math|K*<around|(|w-w<rprime|'>|)>> that depends only on the lag. Define

  <\equation*>
    X<around|(|z|)>=Y<around*|(|F<around|(|z|)>|)>.
  </equation*>

  Near a point <math|z<rsub|0>>, for small real displacement <math|h>,

  <\equation*>
    F*<around|(|z<rsub|0>+h|)>-F<around|(|z<rsub|0>|)>\<approx\>F<rprime|'><around|(|z<rsub|0>|)>*<space|0.17em>h.
  </equation*>

  Hence the covariance of <math|X> near <math|z<rsub|0>> is

  <\equation*>
    \<bbb-E\>*<around*|[|X<around|(|z<rsub|0>|)>*<space|0.17em>X*<around|(|z<rsub|0>+h|)>|]>=\<bbb-E\>*<around*|[|Y<around|(|F<around|(|z<rsub|0>|)>|)>*<space|0.17em>Y*<around|(|F*<around|(|z<rsub|0>+h|)>|)>|]>\<approx\>K*<around*|(|F<rprime|'><around|(|z<rsub|0>|)>*<space|0.17em>h|)>,
  </equation*>

  assuming the variance of <math|Y> is constant. If the variance of <math|Y>
  itself varies as <math|\<sigma\><rsup|2><around|(|w|)>>, then

  <\equation*>
    \<bbb-E\>*<around*|[|X<around|(|z<rsub|0>|)>*<space|0.17em>X*<around|(|z<rsub|0>+h|)>|]>\<approx\>\<sigma\><rsup|2><around*|(|F<around|(|z<rsub|0>|)>|)>*<space|0.17em>K*<around*|(|F<rprime|'><around|(|z<rsub|0>|)>*<space|0.17em>h|)>.
  </equation*>

  This is <em|exactly> of the form

  <\equation*>
    A<around|(|z<rsub|0>|)>*<space|0.17em>K*<around*|(|B<around|(|z<rsub|0>|)>*<space|0.17em>h|)>,
  </equation*>

  with

  <\equation*>
    A<around|(|z<rsub|0>|)>=\<sigma\><rsup|2><around*|(|F<around|(|z<rsub|0>|)>|)>,<space|2em>B<around|(|z<rsub|0>|)>=<around|\||F<rprime|'><around|(|z<rsub|0>|)>|\|>.
  </equation*>

  <subsection|Areolar derivatives and averaged second-order behavior>

  The <em|areolar derivative> (Pompeiu derivative) generalizes the usual
  complex derivative by probing average behavior over small discs instead of
  pointwise quotients. For a function <math|F>, the areolar derivative at
  <math|z<rsub|0>> is defined roughly by

  <\equation*>
    F<rsup|\<circ\>><around|(|z<rsub|0>|)>=lim<rsub|\<varepsilon\>\<to\>0>
    <frac|1|\<pi\>*\<varepsilon\><rsup|2>>*<big|int><rsub|<around|\||w-z<rsub|0>|\|>\<less\>\<varepsilon\>><around*|(|F<around|(|w|)>-F<around|(|z<rsub|0>|)>|)>*<space|0.17em>d*A<around|(|w|)>,
  </equation*>

  where <math|d*A> is area measure.

  For covariance, which is inherently a second-order (mean-square) object,
  the areolar derivative provides the correct notion of \Paveraged
  infinitesimal distortion.\Q In particular,
  <math|<around|\||F<rsup|\<circ\>><around|(|z|)>|\|><rsup|2>> describes the
  local <em|area-averaged variance scaling>.

  If <math|A*<around|(|S,T|)>> is the best-fit amplitude over the interval
  <math|<around|[|S,T|]>>, then in a continuous model one expects

  <\equation*>
    A*<around|(|S,T|)>\<approx\><big|int><rsub|S><rsup|T>\<rho\><rsub|F><around|(|t|)>*<space|0.17em>d*t,<space|1em><text|where
    >\<rho\><rsub|F><around|(|t|)>=<around|\||F<rsup|\<circ\>><around|(|t|)>|\|><rsup|2>.
  </equation*>

  Similarly, the average time-scale scaling <math|B*<around|(|S,T|)>> should
  correspond to a suitable average of <math|<around|\||F<rprime|'><around|(|t|)>|\|>>
  over the interval.

  <subsection|Reconstruction strategy>

  Given empirically fitted <math|<around|(|A*<around|(|S,T|)>,B*<around|(|S,T|)>|)>>
  for many intervals:

  <\enumerate>
    <item>Interpret <math|A*<around|(|M,L|)>> as an interval average of a
    local variance density <math|\<rho\><rsub|F><around|(|t|)>>.

    <item>Interpret <math|B*<around|(|M,L|)>> as an interval average of the
    modulus <math|<around|\||F<rprime|'><around|(|t|)>|\|>> of the complex
    derivative.

    <item>Invert: solve for a smooth function
    <math|\<rho\><rsub|F><around|(|t|)>> (or equivalently
    <math|<around|\||F<rsup|\<circ\>><around|(|t|)>|\|><rsup|2>>) and
    <math|<around|\||F<rprime|'><around|(|t|)>|\|>> such that averaging them
    over <math|<around|[|S,T|]>> reproduces the observed
    <math|A*<around|(|S,T|)>> and <math|B*<around|(|S,T|)>>.

    <item>Use the relation

    <\equation*>
      F<rprime|'><around|(|t|)>=B<around|(|t|)>*<space|0.17em>e<rsup|i*\<phi\><around|(|t|)>>,
    </equation*>

    where <math|\<phi\><around|(|t|)>> is an unknown phase, to reconstruct
    <math|F> up to a global phase ambiguity by integrating

    <\equation*>
      F<around|(|t|)>=F<around|(|t<rsub|0>|)>+<big|int><rsub|t<rsub|0>><rsup|t>F<rprime|'><around|(|s|)>*<space|0.17em>d*s.
    </equation*>
  </enumerate>

  This yields an explicit complex map <math|F> whose Wirtinger and areolar
  derivatives encode the observed modulation of variance and time-scale,
  replacing the ad hoc monotonized Riemann\USiegel <math|\<theta\>> function
  with a principled complex-analytic time change.

  <section|Connection to the Riemann zeta function>

  In the context of modeling the zeros of
  <math|\<zeta\>*<around|(|1/2+i*t|)>>, the smooth zero-counting function is

  <\equation*>
    N<around|(|T|)>=<frac|\<theta\><around|(|T|)>|\<pi\>>+1+S<around|(|T|)>,
  </equation*>

  where <math|\<theta\><around|(|T|)>> is the Riemann\USiegel theta function
  and <math|S<around|(|T|)>> is the <math|S>-function (argument of
  <math|\<zeta\>>). The original conjecture was to use a monotonized version
  of <math|\<theta\><around|(|T|)>> as the time change to map a stationary
  process into one matching the zero density.

  The revised approach via Wirtinger/areolar derivatives suggests:

  <\itemize>
    <item>The correct time change <math|F> is not merely a monotonized real
    function, but a <em|complex map> whose local metric properties (encoded
    in <math|F<rprime|'>> and <math|F<rsup|\<circ\>>>) reproduce the observed
    <math|A> and <math|B> scalings.

    <item>The phase structure of <math|F> should encode the oscillatory
    behavior of <math|arg \<zeta\>>, while the modulus
    <math|<around|\||F<rprime|'>|\|>> encodes the local density of zeros.

    <item>Empirically fitting <math|A*<around|(|M,L|)>> and
    <math|B*<around|(|M,L|)>> over many intervals and inverting to find
    <math|\<rho\><rsub|F><around|(|t|)>> and
    <math|<around|\||F<rprime|'><around|(|t|)>|\|>> gives a data-driven way
    to determine <math|F>.
  </itemize>

  <section|Computational implementation in ARB4J>

  Given the above framework, a practical workflow using ARB4J (high-precision
  arbitrary ball arithmetic for Java) is:

  <\enumerate>
    <item><with|font-series|bold|Precompute time-change inverse:> Build a
    discretized inverse table for the candidate <math|F> (or its real part)
    over the domain <math|<around|[|0,200|]>> or other relevant range. This
    allows instant lookup evaluation of <math|t\<mapsto\>F<around|(|t|)>>.

    <item><with|font-series|bold|Sample intervals:> For a grid of intervals
    <math|<around|{|<around|[|S<rsub|i>,T<rsub|i>|]>|}>>, compute the
    empirical autocovariance <math|<wide|C|^><rsub|<around|[|S<rsub|i>,T<rsub|i>|]>><around|(|k|)>>
    for each lag <math|k\<in\>\<cal-L\>>.

    <item><with|font-series|bold|Fit <math|<around|(|A<rsub|i>,B<rsub|i>|)>>:>
    For each interval, use Newton iteration with high-precision arithmetic to
    minimize <math|<math-up|MSE><rsub|<around|[|S<rsub|i>,T<rsub|i>|]>><around|(|A,B|)>>
    and record <math|<around|(|A<rsub|i>,B<rsub|i>|)>>.

    <item><with|font-series|bold|Chart the relationships:> Plot
    <math|A<rsub|i>> and <math|B<rsub|i>> against the midpoint
    <math|M<rsub|i>=<around|(|S<rsub|i>+T<rsub|i>|)>/2> and length
    <math|L<rsub|i>=T<rsub|i>-S<rsub|i>>. Identify functional forms (e.g.,
    linear, logarithmic).

    <item><with|font-series|bold|Infer <math|\<rho\><rsub|F><around|(|t|)>>
    and <math|<around|\||F<rprime|'><around|(|t|)>|\|>>:> Using the
    relationship

    <\equation*>
      A*<around|(|M,L|)>\<approx\><big|int><rsub|M-L/2><rsup|M+L/2>\<rho\><rsub|F><around|(|t|)>*<space|0.17em>d*t,<space|2em>B*<around|(|M,L|)>\<approx\><frac|1|L>*<big|int><rsub|M-L/2><rsup|M+L/2><around|\||F<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t,
    </equation*>

    invert (via differentiation or deconvolution) to extract the pointwise
    functions <math|\<rho\><rsub|F><around|(|t|)>> and
    <math|<around|\||F<rprime|'><around|(|t|)>|\|>>.

    <item><with|font-series|bold|Reconstruct <math|F>:> Integrate
    <math|F<rprime|'><around|(|t|)>=B<around|(|t|)>*<space|0.17em>e<rsup|i*\<phi\><around|(|t|)>>>
    to obtain <math|F<around|(|t|)>> up to a phase function
    <math|\<phi\><around|(|t|)>>, which can be determined from additional
    geometric or oscillatory constraints (e.g., matching the argument of
    <math|\<zeta\>>).
  </enumerate>

  This yields an explicit, data-validated complex map <math|F> encoding the
  non-stationarity as a unitary (or quasi-unitary) time change with rigorous
  complex-analytic structure.

  <section|Conclusion>

  The observation that a non-stationary oscillatory process has empirical
  autocovariance of the form <math|A*<around|(|S,T|)>*<space|0.17em>K*<around|(|B*<around|(|S,T|)>*<around|(|t-s|)>|)>>
  on every finite interval, with <math|A> and <math|B> depending linearly on
  the interval endpoints (sum and difference), is a strong structural
  signature. It indicates:

  <\enumerate>
    <item>The process is a unitarily time-changed stationary Gaussian
    process, or a close approximation thereof.

    <item>The time change can be realized via a complex-analytic map <math|F>
    whose Wirtinger and areolar derivatives encode the observed variance and
    time-scale modulations.

    <item>The correct <math|F> is not an ad hoc monotonization of a real
    function, but a map whose complex derivative structure is determined by
    the data through the best-fit <math|<around|(|A,B|)>> parameters.
  </enumerate>

  By implementing the fitting procedure in high-precision arithmetic (ARB4J),
  one can empirically determine <math|A*<around|(|M,L|)>> and
  <math|B*<around|(|M,L|)>> to high accuracy, chart their dependence on
  interval geometry, and invert to reconstruct the underlying complex
  time-change map <math|F> that governs the oscillatory structure of the
  process.
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
    <associate|auto-10|<tuple|3.3|4>>
    <associate|auto-11|<tuple|4|4>>
    <associate|auto-12|<tuple|4.1|4>>
    <associate|auto-13|<tuple|4.2|5>>
    <associate|auto-14|<tuple|4.3|5>>
    <associate|auto-15|<tuple|4.4|6>>
    <associate|auto-16|<tuple|5|6>>
    <associate|auto-17|<tuple|6|7>>
    <associate|auto-18|<tuple|7|7>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.2|2>>
    <associate|auto-5|<tuple|2.3|2>>
    <associate|auto-6|<tuple|2.4|3>>
    <associate|auto-7|<tuple|3|3>>
    <associate|auto-8|<tuple|3.1|3>>
    <associate|auto-9|<tuple|3.2|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Setup
      and interval-dependent parametrization>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Empirical autocovariance
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Parametric kernel hypothesis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Best-fit parameters via
      least squares <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Reparametrization by
      midpoint and length <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Optimization:
      Newton convergence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Gradient
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Hessian
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Newton iteration
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Complex-analytic
      interpretation via Wirtinger and areolar derivatives>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Wirtinger derivatives and
      local metric scaling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Stationary process pullback
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>Areolar derivatives and
      averaged second-order behavior <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|4.4<space|2spc>Reconstruction strategy
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Connection
      to the Riemann zeta function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Computational
      implementation in ARB4J> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>