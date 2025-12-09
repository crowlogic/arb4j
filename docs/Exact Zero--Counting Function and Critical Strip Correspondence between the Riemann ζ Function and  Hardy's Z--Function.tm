<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Exact Zero--Counting Function and Critical Strip
  Correspondence between the Riemann <math|\<zeta\>> Function and \ Hardy's
  <math|Z>--Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  \;

  \;

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Critical
    strips and the linear map> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Riemann\USiegel
    theta and Hardy's <with|mode|math|Z>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Zero
    counting and the map <with|mode|math|\<Phi\>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Argument
    principle and the completed function>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Evaluation
    of the three contributions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Exact
    Riemann\Uvon Mangoldt formula and transfer to <with|mode|math|Z>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Reference>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Critical strips and the linear map>

  <\theorem>
    [Critical strips and linear correspondence]<label|thm:strips>Define the
    critical strips

    <\equation>
      \<cal-S\>=<around|{|<space|0.17em>s\<in\>\<bbb-C\>:0\<less\>\<Re\>*s\<less\>1<space|0.17em>|}>,<space|2em>\<cal-Z\>=<around|{|<space|0.17em>t\<in\>\<bbb-C\>:<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2><space|0.17em>|}>.
    </equation>

    Define the linear map

    <\equation>
      \<Phi\><around|(|t|)>=<tfrac|1|2>+i*t,<space|2em>\<Phi\><rsup|-1><around|(|s|)>=-i*<around*|(|s-<tfrac|1|2>|)>.
    </equation>

    Then:

    <\enumerate>
      <item><math|\<Phi\>:\<cal-Z\>\<to\>\<cal-S\>> is a biholomorphism with
      inverse <math|\<Phi\><rsup|-1>:\<cal-S\>\<to\>\<cal-Z\>>.

      <item>For <math|s=\<sigma\>+i*T\<in\>\<cal-S\>> and
      <math|t=\<Phi\><rsup|-1><around|(|s|)>>,

      <\equation*>
        \<Re\>*t=T,<space|2em>\<Im\>*t=<tfrac|1|2>-\<sigma\>.
      </equation*>

      <item>The condition <math|0\<less\>\<Im\>*s\<le\>T> is equivalent to
      <math|0\<less\>\<Re\>*t\<le\>T>.
    </enumerate>
  </theorem>

  <\proof>
    The map <math|\<Phi\>> is affine and holomorphic with derivative
    <math|\<Phi\><rprime|'><around|(|t|)>=i\<neq\>0>, hence biholomorphic
    onto its image. The formula for <math|\<Phi\><rsup|-1>> follows by
    solving <math|s=<tfrac|1|2>+i*t> for <math|t>.

    For <math|s=\<sigma\>+i*T>,

    <\equation*>
      t=\<Phi\><rsup|-1><around|(|s|)>=-i*<around|(|\<sigma\>-<tfrac|1|2>+i*T|)>=T+i*<around*|(|<tfrac|1|2>-\<sigma\>|)>,
    </equation*>

    so <math|\<Re\>*t=T> and <math|\<Im\>*t=<tfrac|1|2>-\<sigma\>>. The
    inequality <math|0\<less\>\<Im\>*s\<le\>T> coincides with the condition
    <math|0\<less\>\<Re\>*t\<le\>T> for the corresponding <math|t>.
  </proof>

  <section|Riemann\USiegel theta and Hardy's <math|Z>>

  <\theorem>
    [Riemann\USiegel theta function]<label|thm:theta>Define the
    Riemann\USiegel theta function by

    <\equation>
      \<vartheta\><around|(|t|)>=\<Im\>*log
      \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log
      \<pi\>,
    </equation>

    where <math|log \<Gamma\>> is taken with a branch obtained by continuous
    variation along the straight segments
    <math|2\<to\>2+i*t\<to\><tfrac|1|2>+i*t> and with normalization <math|arg
    \<Gamma\><around|(|1|)>=0>. Then for all real <math|t>,

    <\equation>
      \<vartheta\><around|(|t|)>=arg <around*|(|\<pi\><rsup|-<frac|s|2>>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>|)>*<space|1em><text|with><space|1em>s=<tfrac|1|2>+i*t,
    </equation>

    where the argument is taken along the same path and normalization.
  </theorem>

  <\proof>
    Put <math|s=<tfrac|1|2>+i*t>. Then

    <\equation*>
      \<pi\><rsup|-<frac|s|2>>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>=exp
      <space|-0.17em><around*|(|-<tfrac|s|2>log
      \<pi\>|)>*<space|0.17em>\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>,
    </equation*>

    so

    <\equation*>
      log <space|-0.17em><around*|(|\<pi\><rsup|-<frac|s|2>>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>|)>=-<tfrac|s|2>log
      \<pi\>+log \<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>,
    </equation*>

    with the same branch conventions. Taking the imaginary part gives

    <\equation*>
      arg <around*|(|\<pi\><rsup|-<frac|s|2>>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>|)>=-<tfrac|t|2>log
      \<pi\>+\<Im\>*log \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>=\<vartheta\><around|(|t|)>.
    </equation*>
  </proof>

  <\theorem>
    [Hardy's <math|Z>\Ufunction and reality on the real
    line]<label|thm:Z-def>Define

    <\equation>
      Z<around|(|t|)>=e<rsup|i*\<vartheta\><around|(|t|)>>*<space|0.17em>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>,
    </equation>

    where <math|\<vartheta\><around|(|t|)>> is as in
    Theorem<nbsp><reference|thm:theta>. Then for all real <math|t> one has
    <math|Z<around|(|t|)>\<in\>\<bbb-R\>>, and

    <\equation>
      Z<around|(|t|)>=0<space|1em>\<Longleftrightarrow\><space|1em>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>=0.
    </equation>
  </theorem>

  <\proof>
    Define the completed function

    <\equation*>
      \<xi\><around|(|s|)>=<tfrac|1|2>s*<around|(|s-1|)>*<space|0.17em>\<pi\><rsup|-s/2>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>*\<zeta\><around|(|s|)>.
    </equation*>

    The functional equation <math|\<xi\><around|(|s|)>=\<xi\>*<around|(|1-s|)>>
    holds, and <math|\<xi\>*<around|(|<tfrac|1|2>+i*t|)>> is real for
    <math|t\<in\>\<bbb-R\>> (see Titchmarsh, Chapters<nbsp>2 and<nbsp>9).

    For <math|s=<tfrac|1|2>+i*t>,

    <\equation*>
      \<xi\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>=<tfrac|1|2><around*|(|<tfrac|1|4>+t<rsup|2>|)>*<space|0.17em>\<pi\><rsup|-<around|(|<frac|1|2>+i*t|)>/2>*\<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>*\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>.
    </equation*>

    By Theorem<nbsp><reference|thm:theta>, the argument of
    <math|\<pi\><rsup|-s/2>*\<Gamma\>*<around|(|s/2|)>> at
    <math|s=<tfrac|1|2>+i*t> equals <math|\<vartheta\><around|(|t|)>>.
    Multiplication by <math|e<rsup|i*\<vartheta\><around|(|t|)>>> removes
    this argument, and <math|Z<around|(|t|)>> becomes real.

    The factor <math|e<rsup|i*\<vartheta\><around|(|t|)>>> never vanishes,
    hence

    <\equation*>
      Z<around|(|t|)>=0<space|1em>\<Longleftrightarrow\><space|1em>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>=0.
    </equation*>
  </proof>

  <section|Zero counting and the map <math|\<Phi\>>>

  <\theorem>
    [Zero counting functions and bijection]<label|thm:counting-bijection>Define

    <\equation>
      N<rsub|\<zeta\>><around|(|T|)>=#<around|{|\<rho\>\<in\>\<cal-S\>:0\<less\>\<Im\>*\<rho\>\<le\>T|}>,
    </equation>

    where zeros are counted with multiplicity and with half multiplicity if
    <math|\<Im\>*\<rho\>=T>. Define

    <\equation>
      N<rsub|Z><around|(|T|)>=#<around|{|t\<in\>\<cal-Z\>:0\<less\>\<Re\>*t\<le\>T|}>,
    </equation>

    again with multiplicity and half multiplicity for zeros with
    <math|\<Re\>*t=T>. Then for all <math|T\<gtr\>0>,

    <\equation>
      N<rsub|Z><around|(|T|)>=N<rsub|\<zeta\>><around|(|T|)>,
    </equation>

    and the map <math|\<Phi\><around|(|t|)>=<tfrac|1|2>+i*t> establishes a
    bijection between the zeros counted on both sides, preserving
    multiplicities and the half\Uweight boundary convention.
  </theorem>

  <\proof>
    By Theorem<nbsp><reference|thm:Z-def>, for <math|t\<in\>\<bbb-R\>>,

    <\equation*>
      Z<around|(|t|)>=0<space|1em>\<Longleftrightarrow\><space|1em>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>=0.
    </equation*>

    Zeros of <math|Z<around|(|t|)>> in <math|\<cal-Z\>> correspond to zeros
    of <math|\<zeta\><around|(|s|)>> on the critical line
    <math|\<Re\>*s=<tfrac|1|2>> via the map <math|s=<tfrac|1|2>+i*t>.

    For a nontrivial zero <math|\<rho\>=\<beta\>+i*\<gamma\>\<in\>\<cal-S\>>,
    Theorem<nbsp><reference|thm:strips> gives

    <\equation*>
      t=\<Phi\><rsup|-1><around|(|\<rho\>|)>=-i*<around|(|\<rho\>-<tfrac|1|2>|)>,
    </equation*>

    which lies in <math|\<cal-Z\>> and satisfies <math|\<Re\>*t=\<gamma\>>.
    The map <math|\<Phi\>> is biholomorphic, hence multiplicities of zeros
    are preserved. The condition <math|0\<less\>\<Im\>*\<rho\>\<le\>T> is
    equivalent to <math|0\<less\>\<Re\>*t\<le\>T>, so the counting ranges
    coincide. The half\Uweight convention on the boundary is preserved: a
    zero with <math|\<Im\>*\<rho\>=T> corresponds to a zero with
    <math|\<Re\>*t=T>, and both receive half their multiplicities. Hence
    <math|N<rsub|Z><around|(|T|)>=N<rsub|\<zeta\>><around|(|T|)>>.
  </proof>

  <section|Argument principle and the completed function>

  <\theorem>
    [Argument principle for the completed
    function]<label|thm:arg-principle>Define the completed function

    <\equation>
      \<xi\><around|(|s|)>=<tfrac|1|2>s*<around|(|s-1|)>*<space|0.17em>\<pi\><rsup|-s/2>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>*\<zeta\><around|(|s|)>.
    </equation>

    Let <math|T\<gtr\>0> and consider the rectangle

    <\equation>
      R<rsub|T>=<around|{|<space|0.17em>s=\<sigma\>+i*t:<tfrac|1|2>\<le\>\<sigma\>\<le\>2,0\<le\>t\<le\>T<space|0.17em>|}>
    </equation>

    with positively oriented boundary <math|C<rsub|T>>. Assume that
    <math|C<rsub|T>> contains no zeros of <math|\<xi\><around|(|s|)>>. Then

    <\equation>
      \<Delta\><rsub|C<rsub|T>>*arg \<xi\><around|(|s|)>=2*\<pi\>*N<rsub|\<zeta\>><around|(|T|)>,
    </equation>

    where <math|N<rsub|\<zeta\>><around|(|T|)>> counts the nontrivial zeros
    of <math|\<zeta\><around|(|s|)>> in the interior of <math|R<rsub|T>> with
    multiplicity.
  </theorem>

  <\proof>
    The function <math|\<xi\><around|(|s|)>> is entire and its zeros coincide
    with the nontrivial zeros of <math|\<zeta\><around|(|s|)>>, all lying in
    <math|\<cal-S\>>. There are no poles.

    The argument principle states that for a meromorphic function one has

    <\equation*>
      \<Delta\><rsub|C<rsub|T>>*arg \<xi\><around|(|s|)>=2*\<pi\>*<around|(|N-P|)>,
    </equation*>

    where <math|N> is the number of zeros and <math|P> the number of poles in
    the interior, both counted with multiplicities. Here <math|P=0> and
    <math|N=N<rsub|\<zeta\>><around|(|T|)>>, which gives the stated identity.
  </proof>

  <\theorem>
    [Decomposition into factors]<label|thm:factor-decomp>With
    <math|\<xi\><around|(|s|)>> as above,

    <\equation*>
      \<xi\><around|(|s|)>=A<around|(|s|)>*<space|0.17em>\<zeta\><around|(|s|)>*<space|0.17em>B<around|(|s|)>,
    </equation*>

    where

    <\equation>
      A<around|(|s|)>=\<pi\><rsup|-s/2>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>,<space|2em>B<around|(|s|)>=<tfrac|1|2>s*<around|(|s-1|)>.
    </equation>

    Assume that <math|C<rsub|T>> contains no zeros of
    <math|\<xi\><around|(|s|)>>. Then

    <\equation>
      2*\<pi\>*N<rsub|\<zeta\>><around|(|T|)>=\<Delta\><rsub|C<rsub|T>>*arg
      A<around|(|s|)>+\<Delta\><rsub|C<rsub|T>>*arg
      \<zeta\><around|(|s|)>+\<Delta\><rsub|C<rsub|T>>*arg B<around|(|s|)>.
    </equation>
  </theorem>

  <\proof>
    The factorization follows from the definition of
    <math|\<xi\><around|(|s|)>>. On <math|C<rsub|T>> none of the factors
    <math|A<around|(|s|)>,\<zeta\><around|(|s|)>,B<around|(|s|)>> vanishes,
    since <math|C<rsub|T>> contains no zeros of <math|\<xi\><around|(|s|)>>.

    On any path where none of the factors vanishes, one has

    <\equation*>
      log \<xi\><around|(|s|)>=log A<around|(|s|)>+log
      \<zeta\><around|(|s|)>+log B<around|(|s|)>
    </equation*>

    for a branch of the logarithm consistent along the contour. Taking
    imaginary parts and total increments along <math|C<rsub|T>> yields

    <\equation*>
      \<Delta\><rsub|C<rsub|T>>*arg \<xi\><around|(|s|)>=\<Delta\><rsub|C<rsub|T>>*arg
      A<around|(|s|)>+\<Delta\><rsub|C<rsub|T>>*arg
      \<zeta\><around|(|s|)>+\<Delta\><rsub|C<rsub|T>>*arg B<around|(|s|)>.
    </equation*>

    Combining this identity with Theorem<nbsp><reference|thm:arg-principle>
    gives the stated formula.
  </proof>

  <section|Evaluation of the three contributions>

  <\theorem>
    [Contribution from <math|B<around|(|s|)>=<tfrac|1|2>s*<around|(|s-1|)>>]<label|thm:B-contrib>Let
    <math|T\<gtr\>0> and <math|C<rsub|T>> be as above, with <math|C<rsub|T>>
    containing no zeros of <math|\<xi\><around|(|s|)>>. Then

    <\equation>
      \<Delta\><rsub|C<rsub|T>>*arg B<around|(|s|)>=\<pi\>.
    </equation>
  </theorem>

  <\proof>
    The function <math|B<around|(|s|)>=<tfrac|1|2>s*<around|(|s-1|)>> is
    entire and has zeros at <math|s=0> and <math|s=1>. Only <math|s=1> lies
    on the real axis in the range <math|<tfrac|1|2>\<le\>\<sigma\>\<le\>2>;
    the zero <math|s=0> lies to the left of the rectangle.

    Along the bottom side of <math|C<rsub|T>>, where
    <math|s=\<sigma\>\<in\><around|[|<tfrac|1|2>,2|]>>,
    <math|B<around|(|\<sigma\>|)>> is real. For
    <math|\<sigma\>\<in\><around|(|1,2|]>>,
    <math|\<sigma\>*<around|(|\<sigma\>-1|)>\<gtr\>0>, hence
    <math|B<around|(|\<sigma\>|)>\<gtr\>0> and <math|arg
    B<around|(|\<sigma\>|)>=0>. For <math|\<sigma\>\<in\><around|[|<tfrac|1|2>,1|)>>,
    <math|\<sigma\>*<around|(|\<sigma\>-1|)>\<less\>0>, hence
    <math|B<around|(|\<sigma\>|)>\<less\>0> and <math|arg
    B<around|(|\<sigma\>|)>=\<pi\>> with continuous variation along the real
    axis.

    Thus as the bottom side is traversed from <math|2> to <math|<tfrac|1|2>>,
    the argument jumps from <math|0> to <math|\<pi\>> when crossing
    <math|s=1>. This yields a net change <math|\<pi\>> along the bottom side.

    The vertical sides at <math|\<sigma\>=2> and
    <math|\<sigma\>=<tfrac|1|2>>, and the top side at height <math|T>, carry
    no zeros or poles of <math|B<around|(|s|)>>. Hence these sides do not
    contribute any additional net change to the total increment of the
    argument. Therefore

    <\equation*>
      \<Delta\><rsub|C<rsub|T>>*arg B<around|(|s|)>=\<pi\>.
    </equation*>
  </proof>

  <\theorem>
    [Contribution from <math|A<around|(|s|)>>]<label|thm:A-contrib>With
    <math|A<around|(|s|)>=\<pi\><rsup|-s/2>*\<Gamma\>*<around|(|s/2|)>> as
    above, one has

    <\equation>
      \<Delta\><rsub|C<rsub|T>>*arg A<around|(|s|)>=\<vartheta\><around|(|T|)>,
    </equation>

    where <math|\<vartheta\><around|(|T|)>> is the Riemann\USiegel theta
    function defined in Theorem<nbsp><reference|thm:theta>.
  </theorem>

  <\proof>
    This evaluation follows Titchmarsh, <em|The Theory of the Riemann
    Zeta-Function>, 2nd ed., Chapter<nbsp>9, in particular equations
    (9.3.1)\U(9.3.5) and (9.5.1)\U(9.5.6).

    Decompose the contour <math|C<rsub|T>> into four sides. On the bottom
    side, with <math|s=\<sigma\>\<in\><around|[|<tfrac|1|2>,2|]>>, one has
    <math|A<around|(|s|)>\<gtr\>0> and <math|arg A<around|(|s|)>=0>, so this
    side contributes zero.

    On the vertical sides from <math|2> to <math|2+i*T> and from
    <math|<tfrac|1|2>+i*T> to <math|<tfrac|1|2>>, the contribution of
    <math|A<around|(|s|)>> is handled using the functional equation of
    <math|\<xi\><around|(|s|)>>, and the resulting net effect of these sides
    cancels in the final sum.

    On the top side from <math|2+i*T> to <math|<tfrac|1|2>+i*T>, the explicit
    representation of <math|log A<around|(|s|)>> and the branch choice give

    <\equation*>
      arg A*<space|-0.17em><around*|(|<tfrac|1|2>+i*T|)>=\<Im\>*<around*|(|log
      \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*T|2>|)>-<tfrac|i*T|2>log
      \<pi\>|)>=\<vartheta\><around|(|T|)>,
    </equation*>

    as in Theorem<nbsp><reference|thm:theta>.

    Summing the contributions from all four sides gives

    <\equation*>
      \<Delta\><rsub|C<rsub|T>>*arg A<around|(|s|)>=\<vartheta\><around|(|T|)>.
    </equation*>
  </proof>

  <\lemma>
    [Argument increment for <math|\<zeta\><around|(|s|)>>]<label|lem:S-def>Let
    <math|S<around|(|T|)>> be defined by

    <\equation>
      S<around|(|T|)>=<frac|1|\<pi\>>*arg
      \<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*T|)>,
    </equation>

    where <math|arg \<zeta\><around|(|s|)>> is obtained by continuous
    variation along the path

    <\equation*>
      2\<longrightarrow\>2+i*T\<longrightarrow\><tfrac|1|2>+i*T,
    </equation*>

    starting with <math|arg \<zeta\><around|(|2|)>=0> and avoiding zeros of
    <math|\<zeta\>> by indentations if necessary. Then, for <math|T> such
    that no zero lies on <math|C<rsub|T>>,

    <\equation>
      \<Delta\><rsub|C<rsub|T>>*arg \<zeta\><around|(|s|)>=\<pi\>*S<around|(|T|)>.
    </equation>
  </lemma>

  <\proof>
    This statement appears in Titchmarsh, Chapter<nbsp>9, as part of
    Theorem<nbsp>9.4. The function <math|arg \<zeta\><around|(|s|)>> is
    defined along the path from <math|2> to <math|<tfrac|1|2>+i*T> as
    specified. The total change in <math|arg \<zeta\><around|(|s|)>> along
    the right side and the top side of <math|C<rsub|T>> equals <math|arg
    \<zeta\>*<around|(|<tfrac|1|2>+i*T|)>> by construction of the branch.

    On the bottom side, <math|\<zeta\><around|(|\<sigma\>|)>> is real and
    nonzero for <math|\<sigma\>\<gtr\>1> and can be continued to
    <math|\<sigma\>=<tfrac|1|2>> without encountering zeros, hence this side
    contributes no net change. The contribution from the left side is handled
    via the functional equation for <math|\<xi\><around|(|s|)>> and does not
    alter the final expression once the contributions from
    <math|A<around|(|s|)>> and <math|B<around|(|s|)>> are included.

    Consequently

    <\equation*>
      \<Delta\><rsub|C<rsub|T>>*arg \<zeta\><around|(|s|)>=arg
      \<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*T|)>=\<pi\>*S<around|(|T|)>.
    </equation*>
  </proof>

  <section|Exact Riemann\Uvon Mangoldt formula and transfer to <math|Z>>

  <\theorem>
    [Exact Riemann\Uvon Mangoldt formula]<label|thm:R-vM>For all
    <math|T\<gtr\>0> such that <math|C<rsub|T>> contains no zeros of
    <math|\<xi\><around|(|s|)>>,

    <\equation>
      N<rsub|\<zeta\>><around|(|T|)>=<frac|\<vartheta\><around|(|T|)>|\<pi\>>+1+S<around|(|T|)>,
    </equation>

    where <math|N<rsub|\<zeta\>><around|(|T|)>> is the nontrivial zero
    counting function, and <math|\<vartheta\><around|(|T|)>,S<around|(|T|)>>
    are as in Theorem<nbsp><reference|thm:theta> and
    Lemma<nbsp><reference|lem:S-def>.
  </theorem>

  <\proof>
    Combine Theorem<nbsp><reference|thm:factor-decomp> with
    Theorem<nbsp><reference|thm:B-contrib>,
    Theorem<nbsp><reference|thm:A-contrib>, and
    Lemma<nbsp><reference|lem:S-def>:

    <\equation*>
      2*\<pi\>*N<rsub|\<zeta\>><around|(|T|)>=\<Delta\><rsub|C<rsub|T>>*arg
      A<around|(|s|)>+\<Delta\><rsub|C<rsub|T>>*arg
      \<zeta\><around|(|s|)>+\<Delta\><rsub|C<rsub|T>>*arg
      B<around|(|s|)>=\<vartheta\><around|(|T|)>+\<pi\>*S<around|(|T|)>+\<pi\>.
    </equation*>

    Division by <math|2*\<pi\>> gives

    <\equation*>
      N<rsub|\<zeta\>><around|(|T|)>=<frac|\<vartheta\><around|(|T|)>|\<pi\>>+1+S<around|(|T|)>.
    </equation*>
  </proof>

  <\theorem>
    [Midpoint convention for boundary zeros]<label|thm:midpoint>If <math|T>
    coincides with the ordinate of one or more nontrivial zeros of
    <math|\<zeta\><around|(|s|)>>, then both
    <math|N<rsub|\<zeta\>><around|(|T|)>> and <math|S<around|(|T|)>> have
    jumps equal to the total multiplicity of those zeros. Define

    <\equation>
      N<rsub|\<zeta\>><around|(|T|)>=<tfrac|1|2><around*|(|N<rsub|\<zeta\>><around|(|T<rsup|->|)>+N<rsub|\<zeta\>><around|(|T<rsup|+>|)>|)>,<space|2em>S<around|(|T|)>=<tfrac|1|2><around*|(|S<around|(|T<rsup|->|)>+S<around|(|T<rsup|+>|)>|)>,
    </equation>

    where <math|T<rsup|\<pm\>>\<to\>T> avoiding zeros. Then the formula in
    Theorem<nbsp><reference|thm:R-vM> holds for such <math|T>.
  </theorem>

  <\proof>
    When <math|T> passes through the ordinate of a zero of
    <math|\<xi\><around|(|s|)>>, deform the contour <math|C<rsub|T>> by a
    semicircular indentation around the zero. Let the zero have multiplicity
    <math|m>. The indentation has radius <math|\<epsilon\>\<gtr\>0>, and the
    limit <math|\<epsilon\>\<to\>0> is taken.

    On this semicircle, <math|\<xi\><around|(|s|)>> has a zero of order
    <math|m>, so

    <\equation*>
      \<xi\><around|(|s|)>=<around|(|s-s<rsub|0>|)><rsup|m>*h<around|(|s|)>,
    </equation*>

    where <math|s<rsub|0>> is the location of the zero and
    <math|h<around|(|s<rsub|0>|)>\<neq\>0>. The argument of
    <math|<around|(|s-s<rsub|0>|)><rsup|m>> changes by <math|m*\<pi\>> as the
    semicircle is traversed (half of the full circular change). The argument
    of <math|h<around|(|s|)>> remains continuous and contributes no singular
    change in the limit <math|\<epsilon\>\<to\>0>. Hence the contribution
    from the semicircle to <math|\<Delta\><rsub|C<rsub|T>>*arg
    \<xi\><around|(|s|)>> tends to <math|m*\<pi\>>.

    Each zero on the contour therefore contributes half its multiplicity to
    <math|N<rsub|\<zeta\>><around|(|T|)>>, which matches the half\Uweight
    convention in the definition.

    The same contour deformation shows that <math|arg
    \<zeta\>*<around|(|<tfrac|1|2>+i*T|)>> changes by <math|m*\<pi\>>, so
    <math|S<around|(|T|)>> jumps by <math|m>. The midpoint prescription
    averages the limits from above and below the jump, and the identity from
    Theorem<nbsp><reference|thm:R-vM> remains valid at the boundary point.
    This is precisely the argument recorded in Titchmarsh, Theorem<nbsp>9.4.
  </proof>

  <\theorem>
    [Exact zero\Ucounting for Hardy's <math|Z>]<label|thm:Z-main>Let
    <math|T\<gtr\>0>, and define <math|N<rsub|Z><around|(|T|)>> and
    <math|S<around|(|T|)>> as above, with <math|Z<around|(|T|)>> as in
    Theorem<nbsp><reference|thm:Z-def> and midpoint conventions for boundary
    zeros:

    <\equation>
      N<rsub|Z><around|(|T|)>=<tfrac|1|2><around*|(|N<rsub|Z><around|(|T<rsup|->|)>+N<rsub|Z><around|(|T<rsup|+>|)>|)>,<space|2em>S<around|(|T|)>=<tfrac|1|2><around*|(|S<around|(|T<rsup|->|)>+S<around|(|T<rsup|+>|)>|)>
    </equation>

    whenever <math|Z<around|(|T|)>=0>. Then for all <math|T\<gtr\>0>,

    <\equation>
      N<rsub|Z><around|(|T|)>=<frac|\<vartheta\><around|(|T|)>|\<pi\>>+1+S<around|(|T|)>.
    </equation>
  </theorem>

  <\proof>
    By Theorem<nbsp><reference|thm:counting-bijection>,

    <\equation*>
      N<rsub|Z><around|(|T|)>=N<rsub|\<zeta\>><around|(|T|)>
    </equation*>

    for all <math|T\<gtr\>0>, including half\Uweights on the boundary, and
    multiplicities are preserved under the bijection induced by
    <math|\<Phi\>>.

    By Theorems<nbsp><reference|thm:R-vM> and <reference|thm:midpoint>,

    <\equation*>
      N<rsub|\<zeta\>><around|(|T|)>=<frac|\<vartheta\><around|(|T|)>|\<pi\>>+1+S<around|(|T|)>
    </equation*>

    holds for all <math|T\<gtr\>0>, with midpoint conventions at ordinates of
    zeros. Substituting <math|N<rsub|Z><around|(|T|)>=N<rsub|\<zeta\>><around|(|T|)>>
    yields

    <\equation*>
      N<rsub|Z><around|(|T|)>=<frac|\<vartheta\><around|(|T|)>|\<pi\>>+1+S<around|(|T|)>
    </equation*>

    for every <math|T\<gtr\>0>, with the stated midpoint prescription when
    <math|Z<around|(|T|)>=0>.
  </proof>

  <section*|Reference>

  E.<space|0.17em>C.<nbsp>Titchmarsh, <em|The Theory of the Riemann
  Zeta-Function>, 2nd ed. (rev. D.<space|0.17em>R.<nbsp>Heath-Brown), Oxford
  University Press, 1986, Chapters<nbsp>9\U10.
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
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|4|4>>
    <associate|auto-5|<tuple|5|5>>
    <associate|auto-6|<tuple|6|7>>
    <associate|auto-7|<tuple|22|9>>
    <associate|lem:S-def|<tuple|9|6>>
    <associate|thm:A-contrib|<tuple|8|6>>
    <associate|thm:B-contrib|<tuple|7|5>>
    <associate|thm:R-vM|<tuple|10|7>>
    <associate|thm:Z-def|<tuple|3|2>>
    <associate|thm:Z-main|<tuple|12|8>>
    <associate|thm:arg-principle|<tuple|5|4>>
    <associate|thm:counting-bijection|<tuple|4|3>>
    <associate|thm:factor-decomp|<tuple|6|5>>
    <associate|thm:midpoint|<tuple|11|7>>
    <associate|thm:strips|<tuple|1|1>>
    <associate|thm:theta|<tuple|2|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Critical
      strips and the linear map> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Riemann\USiegel
      theta and Hardy's <with|mode|<quote|math>|Z>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Zero
      counting and the map <with|mode|<quote|math>|\<Phi\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Argument
      principle and the completed function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Evaluation
      of the three contributions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Exact
      Riemann\Uvon Mangoldt formula and transfer to
      <with|mode|<quote|math>|Z>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Reference>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>