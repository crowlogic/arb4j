<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Covariance of Ergodic Stationary
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    This note establishes in detail the equality, for strictly stationary and
    ergodic real-valued stochastic processes with finite second moment,
    between the covariance function as defined by the expectation of the
    product of observations at a given lag and the almost sure limit of
    temporal expectation of products along a single path. The argument is
    developed from first principles, specifying measure-theoretic structure,
    shift invariance, ergodicity, and relevant properties of function spaces,
    and invoking the continuous-time ergodic theorem in full generality for
    integrable functions.
  </abstract>

  <section*|1. Preliminaries>

  <\definition>
    [Probability Space and Process] Let <math|<around|(|\<Omega\>,\<cal-F\>,P|)>>
    be a probability space. A <em|stochastic process>
    <math|\<xi\>:\<bbb-R\>\<times\>\<Omega\>\<to\>\<bbb-R\>> is a collection
    of real random variables <math|\<xi\><around|(|t|)>:\<Omega\>\<to\>\<bbb-R\>>,
    indexed by <math|t\<in\>\<bbb-R\>>. The process is <em|jointly
    measurable> if the mapping <math|<around|(|t,\<omega\>|)>\<mapsto\>\<xi\><around|(|t,\<omega\>|)>>
    is measurable with respect to the product <math|\<sigma\>>-algebra
    <math|\<cal-B\><around|(|\<bbb-R\>|)>\<otimes\>\<cal-F\>>.
  </definition>

  <\definition>
    [Strict Stationarity] A stochastic process
    <math|\<xi\>=<around|(|\<xi\><around|(|t|)>|)><rsub|t\<in\>\<bbb-R\>>> is
    <em|strictly stationary> if, for every <math|n\<in\>\<bbb-N\>>, every
    choice <math|t<rsub|1>,\<ldots\>,t<rsub|n>\<in\>\<bbb-R\>>, and every
    <math|h\<in\>\<bbb-R\>>,

    <\equation*>
      <around|(|\<xi\>*<around|(|t<rsub|1>+h|)>,\<ldots\>,\<xi\>*<around|(|t<rsub|n>+h|)>|)><above|=|d><around|(|\<xi\><around|(|t<rsub|1>|)>,\<ldots\>,\<xi\><around|(|t<rsub|n>|)>|)>,
    </equation*>

    that is, the finite-dimensional distributions are invariant under time
    shifts.
  </definition>

  <\definition>
    [Covariance Function] For a stochastic process <math|\<xi\>> with
    <math|\<bbb-E\><around|[|\<xi\><around|(|0|)><rsup|2>|]>\<less\>\<infty\>>,
    define the <em|covariance function> <math|r> by

    <\equation*>
      r<around|(|\<tau\>|)>=<text|Cov><around|(|\<xi\><around|(|0|)>,\<xi\><around|(|\<tau\>|)>|)>=\<bbb-E\>*<around|[|<around|(|\<xi\><around|(|0|)>-m|)>*<around|(|\<xi\><around|(|\<tau\>|)>-m|)>|]>,<space|1em>m=\<bbb-E\><around|[|\<xi\><around|(|0|)>|]>.
    </equation*>

    If <math|\<bbb-E\><around|[|\<xi\><around|(|0|)>|]>=0>, then
    <math|r<around|(|\<tau\>|)>=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>>.
  </definition>

  <\definition>
    [Shift Operator (Path Space Version)] Let <math|E=\<bbb-R\>> and consider
    the canonical space <math|\<Omega\>=\<bbb-R\><rsup|\<bbb-R\>>> consisting
    of all functions <math|x:\<bbb-R\>\<to\>\<bbb-R\>>. For each
    <math|h\<in\>\<bbb-R\>> define the shift operator
    <math|T<rsub|h>:\<Omega\>\<to\>\<Omega\>> by

    <\equation*>
      <around|(|T<rsub|h>*x|)><around|(|t|)>=x*<around|(|t+h|)>
    </equation*>

    for all <math|t\<in\>\<bbb-R\>>, <math|x\<in\>\<Omega\>>. If
    <math|\<xi\>> is a process on an abstract probability space, interpret
    <math|x> as a sample path <math|x<rsub|\<omega\>><around|(|t|)>=\<xi\><around|(|t,\<omega\>|)>>.
  </definition>

  <\proposition>
    [Shift Invariance] Let <math|\<mu\>> be a probability measure on
    <math|<around|(|\<Omega\>,\<cal-F\>|)>> such that the coordinate process
    <math|x<around|(|t|)>> under <math|\<mu\>> has the same law as
    <math|\<xi\><around|(|t|)>> for all <math|t>. If <math|\<xi\>> is
    strictly stationary, then for every <math|h\<in\>\<bbb-R\>> and every
    <math|A\<in\>\<cal-F\>>, <math|\<mu\>*<around|(|T<rsub|h><rsup|-1>*A|)>=\<mu\><around|(|A|)>>.
  </proposition>

  <\proof>
    Let <math|A\<in\>\<cal-F\>> be a cylinder set of the form

    <\equation*>
      A=<around*|{|x\<in\>\<Omega\>:<around|(|x<around|(|t<rsub|1>|)>,\<ldots\>,x<around|(|t<rsub|n>|)>|)>\<in\>B|}>
    </equation*>

    where <math|t<rsub|1>,\<ldots\>,t<rsub|n>\<in\>\<bbb-R\>> and <math|B> is
    a Borel set in <math|\<bbb-R\><rsup|n>>. Then

    <\equation*>
      T<rsub|h><rsup|-1>*A=<around*|{|x\<in\>\<Omega\>:<around|(|x*<around|(|t<rsub|1>+h|)>,\<ldots\>,x*<around|(|t<rsub|n>+h|)>|)>\<in\>B|}>.
    </equation*>

    Since under <math|\<mu\>> the law of <math|<around|(|x*<around|(|t<rsub|1>+h|)>,\<ldots\>,x*<around|(|t<rsub|n>+h|)>|)>>
    coincides with that of <math|<around|(|x<around|(|t<rsub|1>|)>,\<ldots\>,x<around|(|t<rsub|n>|)>|)>>
    by stationarity,

    <\equation*>
      \<mu\>*<around*|(|<around|(|x*<around|(|t<rsub|1>+h|)>,\<ldots\>,x*<around|(|t<rsub|n>+h|)>|)>\<in\>B|)>=\<mu\>*<around*|(|<around|(|x<around|(|t<rsub|1>|)>,\<ldots\>,x<around|(|t<rsub|n>|)>|)>\<in\>B|)>=\<mu\><around|(|A|)>.
    </equation*>

    Extension from cylinder sets to <math|\<cal-F\>> proceeds by the monotone
    class theorem or standard arguments.
  </proof>

  <\definition>
    [Ergodicity] The measure-preserving flow
    <math|<around|(|T<rsub|h>|)><rsub|h\<in\>\<bbb-R\>>> on
    <math|<around|(|\<Omega\>,\<cal-F\>,\<mu\>|)>> is called <em|ergodic> if,
    for every <math|A\<in\>\<cal-F\>> satisfying
    <math|T<rsub|h><rsup|-1>*A=A> for all <math|h\<in\>\<bbb-R\>>, either
    <math|\<mu\><around|(|A|)>=0> or <math|\<mu\><around|(|A|)>=1>.
  </definition>

  <\remark>
    Ergodicity is equivalent to the triviality of the shift-invariant
    <math|\<sigma\>>-algebra:

    <\equation*>
      \<cal-I\>=<around|{|A\<in\>\<cal-F\>:T<rsub|h><rsup|-1>*A=A*<text|for
      all >h\<in\>\<bbb-R\>|}>.
    </equation*>
  </remark>

  <section*|2. The Covariance Function and Pathwise Limit>

  <\theorem>
    [Pathwise Determination of Covariance Function]<label|mainthm>Let
    <math|<around|(|\<Omega\>,\<cal-F\>,\<mu\>|)>> and the canonical process
    <math|x<around|(|t|)>> be as above. Suppose that under <math|\<mu\>>,
    <math|x<around|(|t|)>> is strictly stationary, ergodic with respect to
    <math|<around|(|T<rsub|h>|)><rsub|h\<in\>\<bbb-R\>>>, and
    <math|\<bbb-E\><rsub|\<mu\>><around|[|x<around|(|0|)><rsup|2>|]>\<less\>\<infty\>>.
    Fix <math|\<tau\>\<in\>\<bbb-R\>>. Then for <math|\<mu\>>-almost every
    <math|x\<in\>\<Omega\>>,

    <\equation*>
      lim<rsub|T\<to\>\<infty\>> <frac|1|2*T>*<big|int><rsub|-T><rsup|T>x<around|(|t|)>*<space|0.17em>x*<around|(|t+\<tau\>|)>*<space|0.17em>d*t=r<around|(|\<tau\>|)>
    </equation*>

    where <math|r<around|(|\<tau\>|)>=\<bbb-E\><rsub|\<mu\>>*<around|[|x<around|(|0|)>*x<around|(|\<tau\>|)>|]>>.
  </theorem>

  <\proof>
    The steps follow as below.

    <\enumerate>
      <item>The map <math|x\<mapsto\>x<around|(|0|)>*x<around|(|\<tau\>|)>>
      is measurable as a product of coordinate projections, hence Borel
      measurable on <math|\<Omega\>>.

      <item>Since <math|\<bbb-E\><rsub|\<mu\>><around|[|x<around|(|0|)><rsup|2>|]>\<less\>\<infty\>>,
      by the Cauchy-Schwarz inequality,

      <\equation*>
        \<bbb-E\><rsub|\<mu\>><around|[|<space|0.17em><around|\||x<around|(|0|)>*x<around|(|\<tau\>|)>|\|><space|0.17em>|]>\<leq\><sqrt|\<bbb-E\><rsub|\<mu\>><around|[|x<around|(|0|)><rsup|2>|]>*<space|0.27em>\<bbb-E\><rsub|\<mu\>><around|[|x<around|(|\<tau\>|)><rsup|2>|]>>=\<bbb-E\><rsub|\<mu\>><around|[|x<around|(|0|)><rsup|2>|]>\<less\>\<infty\>
      </equation*>

      by stationarity, so <math|x\<mapsto\>x<around|(|0|)>*x<around|(|\<tau\>|)>>
      is integrable.

      <item>Consider the function <math|F:\<Omega\>\<to\>\<bbb-R\>> given by
      <math|F<around|(|x|)>=x<around|(|0|)>*x<around|(|\<tau\>|)>>. For each
      <math|t\<in\>\<bbb-R\>>, define <math|F\<circ\>T<rsub|t><around|(|x|)>=x<around|(|t|)>*x*<around|(|t+\<tau\>|)>>.
      As above, this is measurable and integrable for each <math|t>.

      <item>For each <math|x\<in\>\<Omega\>> and <math|T\<gtr\>0>, set

      <\equation*>
        A<rsub|T><around|(|x|)>\<assign\><frac|1|2*T>*<big|int><rsub|-T><rsup|T>F*<around|(|T<rsub|t>*x|)>*<space|0.17em>d*t=<frac|1|2*T>*<big|int><rsub|-T><rsup|T>x<around|(|t|)>*<space|0.17em>x*<around|(|t+\<tau\>|)>*<space|0.17em>d*t.
      </equation*>

      <item>The Birkhoff (Khintchine) ergodic theorem in continuous time for
      flows of measure-preserving transformations applies under the above
      conditions. Thus, for <math|\<mu\>>-almost every
      <math|x\<in\>\<Omega\>>,

      <\equation*>
        lim<rsub|T\<to\>\<infty\>> A<rsub|T><around|(|x|)>=\<bbb-E\><rsub|\<mu\>><around|[|F|]>=r<around|(|\<tau\>|)>.
      </equation*>
    </enumerate>

    This matches the claimed formula.
  </proof>

  <\remark>
    The set of <math|x\<in\>\<Omega\>> for which the limit in Theorem
    <reference|mainthm> fails has measure zero under <math|\<mu\>>. The limit
    is a measurable function of <math|x>. The limit equals the covariance
    function for each fixed <math|\<tau\>\<in\>\<bbb-R\>>. Almost sure
    convergence for all <math|\<tau\>> simultaneously generally holds only
    for countable subsets of <math|\<bbb-R\>>.
  </remark>

  <section*|3. Measure-Theoretic and Technical Details>

  <\enumerate>
    <item>The canonical path space <math|\<Omega\>=\<bbb-R\><rsup|\<bbb-R\>>>
    with the product <math|\<sigma\>>-algebra supports all coordinate
    projections and the shift operator. The measure <math|\<mu\>> is defined
    such that the law of <math|<around|(|x<around|(|t<rsub|1>|)>,\<ldots\>,x<around|(|t<rsub|n>|)>|)>>
    under <math|\<mu\>> is that of <math|<around|(|\<xi\><around|(|t<rsub|1>|)>,\<ldots\>,\<xi\><around|(|t<rsub|n>|)>|)>>.

    <item>The measurability and integrability of
    <math|x\<mapsto\>x<around|(|0|)>*x<around|(|\<tau\>|)>> follow from the
    structure of <math|\<Omega\>> and the moment assumption.

    <item>The shift flow <math|<around|(|T<rsub|h>|)><rsub|h\<in\>\<bbb-R\>>>
    acts measurably and preserves <math|\<mu\>>.

    <item>The ergodic theorem for flows applies, as all conditions
    (integrability, invariance, ergodicity) are satisfied.
  </enumerate>

  <section*|4. Almost Sure Convergence>

  <\definition>
    [Almost Surely] Let <math|<around|(|\<Omega\>,\<cal-F\>,\<mu\>|)>> be a
    probability space. A property holds <em|almost surely> if the set of
    <math|x\<in\>\<Omega\>> for which it fails has <math|\<mu\>>-measure
    zero.
  </definition>

  <\remark>
    If a sequence of measurable maps <math|f<rsub|n>:\<Omega\>\<to\>\<bbb-R\>>
    converges almost surely to <math|f>, this means
    <math|\<mu\><around*|(|<around|{|x:lim<rsub|n\<to\>\<infty\>>
    f<rsub|n><around|(|x|)>=f<around|(|x|)>|}>|)>=1>. Sets of measure zero do
    not affect expectation or measure-theoretic statements.
  </remark>

  <\thebibliography|10>
    <bibitem|doob>Joseph L. Doob, <with|font-shape|italic|Stochastic
    Processes>, Wiley, 1953.

    <bibitem|krengel>Ulrich Krengel, <with|font-shape|italic|Ergodic
    Theorems>, de Gruyter, 1985.

    <bibitem|cohn>Donald L. Cohn, <with|font-shape|italic|Measure Theory>,
    Birkhäuser, 2013.

    <bibitem|cornfeld>Ilya P. Cornfeld, Sergei V. Fomin, Yakov G. Sinai,
    <with|font-shape|italic|Ergodic Theory>, Springer, 1982.

    <bibitem|yosida>Kôsaku Yosida, <with|font-shape|italic|Ergodic Theorems>,
    Springer, 1965.
  </thebibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|3>>
    <associate|auto-2|<tuple|7|?>>
    <associate|auto-3|<tuple|9|?>>
    <associate|auto-4|<tuple|4|?>>
    <associate|auto-5|<tuple|11|?>>
    <associate|bib-cohn|<tuple|cohn|3>>
    <associate|bib-cornfeld|<tuple|cornfeld|3>>
    <associate|bib-doob|<tuple|doob|3>>
    <associate|bib-krengel|<tuple|krengel|3>>
    <associate|bib-yosida|<tuple|yosida|3>>
    <associate|mainthm|<tuple|8|?>>
    <associate|thm:covariance|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>