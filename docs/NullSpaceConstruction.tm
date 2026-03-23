<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Null Space Construction of Stationary Integral
  Covariance Operators>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>>

  <\theorem>
    [Spectral Null Space and Uniform Orthogonal Expansion of Bandlimited
    Stationary Covariance Operators] Let <math|\<Lambda\>=<around|[|-L,L|]>>
    be a compact interval in <math|\<bbb-R\>>. Let <math|\<cal-W\>> be the
    class of strictly positive spectral density functions
    <math|w\<in\>L<rsup|2><around|(|\<Lambda\>|)>>. For any
    <math|w\<in\>\<cal-W\>>, define

    <\equation>
      K<around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>>w<around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>.
    </equation>

    Let <math|<around|{|P<rsub|n><around|(|\<lambda\>|)>|}><rsub|n=0><rsup|\<infty\>>>
    be the orthogonal polynomials with respect to the weight
    <math|w<around|(|\<lambda\>|)>> on <math|\<Lambda\>>, normalized by
    <math|P<rsub|0><around|(|\<lambda\>|)>=1>, and define

    <\equation>
      \<Phi\><rsub|n><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>>P<rsub|n><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>.
    </equation>

    Then:

    <\enumerate>
      <item>For every <math|n\<ge\>1>,

      <\equation>
        <big|int><rsub|\<bbb-R\>>K<around|(|x|)><space|0.17em><wide|\<Phi\><rsub|n><around|(|x|)>|\<bar\>><space|0.17em>d*x=<frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>>w<around|(|\<lambda\>|)><space|0.17em><wide|P<rsub|n><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*\<lambda\>=0.
      </equation>

      <item>Let <math|<around|{|Q<rsub|n><around|(|\<lambda\>|)>|}><rsub|n=0><rsup|\<infty\>>>
      be the orthogonal polynomials with respect to Lebesgue measure on
      <math|\<Lambda\>>, with

      <\equation>
        h<rsub|n>=<big|int><rsub|\<Lambda\>><around|\||Q<rsub|n><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*\<lambda\>.
      </equation>

      Define

      <\equation>
        \<cal-Q\><rsub|n><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>>Q<rsub|n><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>,
      </equation>

      and

      <\equation>
        c<rsub|n>=<frac|1|h<rsub|n>>*<big|int><rsub|\<Lambda\>>w<around|(|\<lambda\>|)><space|0.17em><wide|Q<rsub|n><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*\<lambda\>.
      </equation>

      Then

      <\equation>
        K<around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*<space|0.17em>\<cal-Q\><rsub|n><around|(|x|)>
      </equation>

      for every <math|x\<in\>\<bbb-R\>>, and the convergence is uniform on
      <math|\<bbb-R\>>.
    </enumerate>
  </theorem>

  <\proof>
    Adopt the Fourier convention

    <\equation*>
      <wide|f|^><around|(|\<xi\>|)>=<big|int><rsub|\<bbb-R\>>f<around|(|x|)>*<space|0.17em>e<rsup|-i*\<xi\>*x>*<space|0.17em>d*x,<space|2em>f<around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><wide|f|^><around|(|\<xi\>|)>*<space|0.17em>e<rsup|i*\<xi\>*x>*<space|0.17em>d*\<xi\>,
    </equation*>

    with Parseval identity

    <\equation*>
      <big|int><rsub|\<bbb-R\>>f<around|(|x|)><space|0.17em><wide|g<around|(|x|)>|\<bar\>><space|0.17em>d*x=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><wide|f|^><around|(|\<xi\>|)><space|0.17em><wide|<wide|g|^><around|(|\<xi\>|)>|\<bar\>><space|0.17em>d*\<xi\>.
    </equation*>

    <with|font-series|bold|Part 1.> Since

    <\equation*>
      K<around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>>w<around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>,
    </equation*>

    there holds

    <\equation*>
      <wide|K|^><around|(|\<xi\>|)>=w<around|(|\<xi\>|)>*<space|0.17em>\<bbb-I\><rsub|\<Lambda\>><around|(|\<xi\>|)>.
    </equation*>

    Likewise,

    <\equation*>
      <wide|\<Phi\><rsub|n>|^><around|(|\<xi\>|)>=P<rsub|n><around|(|\<xi\>|)>*<space|0.17em>\<bbb-I\><rsub|\<Lambda\>><around|(|\<xi\>|)>.
    </equation*>

    Therefore

    <\equation*>
      <big|int><rsub|\<bbb-R\>>K<around|(|x|)><space|0.17em><wide|\<Phi\><rsub|n><around|(|x|)>|\<bar\>><space|0.17em>d*x=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><wide|K|^><around|(|\<xi\>|)><space|0.17em><wide|<wide|\<Phi\><rsub|n>|^><around|(|\<xi\>|)>|\<bar\>><space|0.17em>d*\<xi\>=<frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>>w<around|(|\<lambda\>|)><space|0.17em><wide|P<rsub|n><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*\<lambda\>.
    </equation*>

    The polynomials <math|P<rsub|n>> have real coefficients, so
    <math|<wide|P<rsub|n><around|(|\<lambda\>|)>|\<bar\>>=P<rsub|n><around|(|\<lambda\>|)>>
    on <math|\<Lambda\>>. Since <math|P<rsub|0>\<equiv\>1> and
    <math|<around|{|P<rsub|n>|}>> is orthogonal with respect to the weight
    <math|w>,

    <\equation*>
      <big|int><rsub|\<Lambda\>>w<around|(|\<lambda\>|)>*<space|0.17em>P<rsub|n><around|(|\<lambda\>|)>*<space|0.17em>P<rsub|0><around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>=0
    </equation*>

    for all <math|n\<ge\>1>. This proves the first assertion.

    <vspace*|1em><with|font-series|bold|Part 2.> By Parseval,

    <\equation*>
      <around|\<langle\>|\<Phi\><rsub|n>,\<Phi\><rsub|m>|\<rangle\>><rsub|L<rsup|2><around|(|\<bbb-R\>|)>>=<frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>>P<rsub|n><around|(|\<lambda\>|)><space|0.17em><wide|P<rsub|m><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*\<lambda\>.
    </equation*>

    The Gram\USchmidt procedure depends only on ratios of inner products, so
    the common constant factor <math|<around|(|2*\<pi\>|)><rsup|-1>> is
    irrelevant. Hence Gram\USchmidt applied to
    <math|<around|{|\<Phi\><rsub|n>|}>> in
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> produces the same coefficient
    relations as Gram\USchmidt applied to <math|<around|{|P<rsub|n>|}>> in
    <math|L<rsup|2><around|(|\<Lambda\>,d*\<lambda\>|)>>. Since <math|deg
    P<rsub|n>=n>, the span of <math|<around|{|P<rsub|0>,\<ldots\>,P<rsub|N>|}>>
    equals the span of <math|<around|{|1,\<lambda\>,\<ldots\>,\<lambda\><rsup|N>|}>>.
    Therefore the resulting orthogonal system is, up to normalization, the
    orthogonal polynomial system <math|<around|{|Q<rsub|n>|}><rsub|n=0><rsup|\<infty\>>>
    for Lebesgue measure on <math|\<Lambda\>>, and its spatial images are

    <\equation*>
      \<cal-Q\><rsub|n><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>>Q<rsub|n><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>.
    </equation*>

    Since <math|<around|{|Q<rsub|n>|}>> is complete in
    <math|L<rsup|2><around|(|\<Lambda\>|)>>,

    <\equation*>
      w<around|(|\<lambda\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*<space|0.17em>Q<rsub|n><around|(|\<lambda\>|)>
    </equation*>

    in <math|L<rsup|2><around|(|\<Lambda\>|)>>, where

    <\equation*>
      c<rsub|n>=<frac|1|h<rsub|n>>*<big|int><rsub|\<Lambda\>>w<around|(|\<lambda\>|)><space|0.17em><wide|Q<rsub|n><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*\<lambda\>.
    </equation*>

    Let

    <\equation*>
      w<rsub|N><around|(|\<lambda\>|)>=<big|sum><rsub|n=0><rsup|N>c<rsub|n>*<space|0.17em>Q<rsub|n><around|(|\<lambda\>|)>.
    </equation*>

    Then <math|<around|\<\|\|\>|w-w<rsub|N>|\<\|\|\>><rsub|L<rsup|2><around|(|\<Lambda\>|)>>\<to\>0>
    as <math|N\<to\>\<infty\>>.

    For every <math|x\<in\>\<bbb-R\>>,

    <\equation*>
      K<around|(|x|)>-<big|sum><rsub|n=0><rsup|N>c<rsub|n>*<space|0.17em>\<cal-Q\><rsub|n><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>><around*|(|w<around|(|\<lambda\>|)>-w<rsub|N><around|(|\<lambda\>|)>|)>*e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>.
    </equation*>

    Hence

    <\equation*>
      <around*|\||K<around|(|x|)>-<big|sum><rsub|n=0><rsup|N>c<rsub|n>*<space|0.17em>\<cal-Q\><rsub|n><around|(|x|)>|\|>\<le\><frac|1|2*\<pi\>>*<big|int><rsub|\<Lambda\>><around|\||w<around|(|\<lambda\>|)>-w<rsub|N><around|(|\<lambda\>|)>|\|>*<space|0.17em>d*\<lambda\>.
    </equation*>

    Since <math|\<Lambda\>> has finite measure,

    <\equation*>
      <around|\<\|\|\>|w-w<rsub|N>|\<\|\|\>><rsub|L<rsup|1><around|(|\<Lambda\>|)>>\<le\><around|\||\<Lambda\>|\|><rsup|1/2>*<space|0.17em><around|\<\|\|\>|w-w<rsub|N>|\<\|\|\>><rsub|L<rsup|2><around|(|\<Lambda\>|)>>=<sqrt|2*L>*<space|0.17em><around|\<\|\|\>|w-w<rsub|N>|\<\|\|\>><rsub|L<rsup|2><around|(|\<Lambda\>|)>>.
    </equation*>

    Therefore

    <\equation*>
      sup<rsub|x\<in\>\<bbb-R\>><around*|\||K<around|(|x|)>-<big|sum><rsub|n=0><rsup|N>c<rsub|n>*<space|0.17em>\<cal-Q\><rsub|n><around|(|x|)>|\|>\<le\><frac|<sqrt|2*L>|2*\<pi\>>*<space|0.17em><around|\<\|\|\>|w-w<rsub|N>|\<\|\|\>><rsub|L<rsup|2><around|(|\<Lambda\>|)>>\<longrightarrow\>0.
    </equation*>

    Thus

    <\equation*>
      K<around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*<space|0.17em>\<cal-Q\><rsub|n><around|(|x|)>
    </equation*>

    for every <math|x\<in\>\<bbb-R\>>, with uniform convergence on
    <math|\<bbb-R\>>.
  </proof>

  <vspace|2fn>

  <\theorem>
    [One-Sided Orthogonal Expansion Principle] Let
    <math|<around|(|\<Omega\>,\<mu\>|)>> be either the spectral side or the
    spatial side. Let <math|\<cal-F\>> denote the Fourier transform side
    change

    <\equation*>
      <around|(|\<cal-F\>*f|)><around|(|\<xi\>|)>=<big|int><rsub|\<bbb-R\>>f<around|(|x|)>*<space|0.17em>e<rsup|-i*\<xi\>*x>*<space|0.17em>d*x,<space|2em>f<around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><around|(|\<cal-F\>*f|)><around|(|\<xi\>|)>*<space|0.17em>e<rsup|i*\<xi\>*x>*<space|0.17em>d*\<xi\>.
    </equation*>

    Assume that one of the two representations below is available:

    <vspace*|1fn><no-indent><with|font-series|bold|Spectral-side
    representation:>

    <\equation*>
      K<around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<Omega\>>w<around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>.
    </equation*>

    <no-indent><with|font-series|bold|Spatial-side representation:>

    <\equation*>
      w<around|(|\<lambda\>|)>=<big|int><rsub|\<Omega\>>K<around|(|x|)>*<space|0.17em>e<rsup|-i*\<lambda\>*x>*<space|0.17em>d*x.
    </equation*>

    Assume in either case that:

    <\enumerate>
      <item><math|\<Omega\>> is equipped with a measure <math|\<mu\>>;

      <item>the representing function belongs to
      <math|L<rsup|2><around|(|\<Omega\>,\<mu\>|)>>;

      <item>there is a complete orthogonal system
      <math|<around|{|Q<rsub|n>|}>> in <math|L<rsup|2><around|(|\<Omega\>,\<mu\>|)>>;

      <item>the integral transform from that side to the dual side is
      well-defined for the partial sums and for the target function;

      <item>convergence in <math|L<rsup|2><around|(|\<Omega\>,\<mu\>|)>>
      implies convergence after transformation in the sense required on the
      dual side.
    </enumerate>

    Then the representing function admits an
    <math|L<rsup|2><around|(|\<Omega\>,\<mu\>|)>> expansion

    <\equation*>
      f=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*<space|0.17em>Q<rsub|n>,
    </equation*>

    and the transformed object admits the corresponding expansion

    <\equation*>
      \<cal-T\>*f=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*<space|0.17em>\<cal-T\>*Q<rsub|n>,
    </equation*>

    with the mode of convergence determined entirely by the continuity
    estimate available for the transform <math|\<cal-T\>> on that side.

    In particular, if there exists a normed space
    <math|X<around|(|\<Omega\>|)>> such that:

    <\enumerate>
      <item><math|f,f<rsub|N>\<in\>X<around|(|\<Omega\>|)>> for all partial
      sums <math|f<rsub|N>>;

      <item><math|f<rsub|N>\<to\>f> in <math|X<around|(|\<Omega\>|)>>;

      <item>for the transformed functions one has

      <\equation*>
        sup<rsub|y><around|\||\<cal-T\>*<around|(|f-f<rsub|N>|)><around|(|y|)>|\|>\<le\>C*<space|0.17em><around|\<\|\|\>|f-f<rsub|N>|\<\|\|\>><rsub|X<around|(|\<Omega\>|)>>
      </equation*>

      with a constant <math|C> independent of <math|N> and of the dual
      variable <math|y>,
    </enumerate>

    then the transformed series converges uniformly.
  </theorem>

  <\proof>
    Let

    <\equation*>
      f<rsub|N>=<big|sum><rsub|n=0><rsup|N>c<rsub|n>*<space|0.17em>Q<rsub|n>.
    </equation*>

    By completeness of <math|<around|{|Q<rsub|n>|}>> in
    <math|L<rsup|2><around|(|\<Omega\>,\<mu\>|)>>, there holds
    <math|f<rsub|N>\<to\>f> in <math|L<rsup|2><around|(|\<Omega\>,\<mu\>|)>>.
    If the transform <math|\<cal-T\>> is continuous with respect to a
    stronger norm <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|X<around|(|\<Omega\>|)>>>
    for which <math|f<rsub|N>\<to\>f>, then

    <\equation*>
      sup<rsub|y><around|\||\<cal-T\>*<around|(|f-f<rsub|N>|)><around|(|y|)>|\|>\<le\>C*<space|0.17em><around|\<\|\|\>|f-f<rsub|N>|\<\|\|\>><rsub|X<around|(|\<Omega\>|)>>\<to\>0.
    </equation*>

    Therefore

    <\equation*>
      \<cal-T\>*f<around|(|y|)>=lim<rsub|N\<to\>\<infty\>>
      \<cal-T\>*f<rsub|N><around|(|y|)>=lim<rsub|N\<to\>\<infty\>>
      <big|sum><rsub|n=0><rsup|N>c<rsub|n>*<space|0.17em>\<cal-T\>*Q<rsub|n><around|(|y|)>
    </equation*>

    uniformly in the dual variable. No separate summability hypothesis on
    transformed basis elements is required; only continuity of the transform
    in a norm that controls the desired mode of convergence is required.
  </proof>

  <vspace|2fn>

  <\theorem>
    [Noncompact Spectral Expansion Under Integrable Approximation] Let
    <math|\<Omega\>=\<bbb-R\>> and let <math|w\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>.
    Define

    <\equation>
      K<around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>>w<around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>
    </equation>

    whenever the integral is well-defined. Let
    <math|<around|{|Q<rsub|n>|}><rsub|n=0><rsup|\<infty\>>> be a complete
    orthogonal system in <math|L<rsup|2><around|(|\<bbb-R\>|)>>, with

    <\equation*>
      h<rsub|n>=<big|int><rsub|\<bbb-R\>><around|\||Q<rsub|n><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*\<lambda\>,<space|2em>c<rsub|n>=<frac|1|h<rsub|n>>*<big|int><rsub|\<bbb-R\>>w<around|(|\<lambda\>|)><space|0.17em><wide|Q<rsub|n><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*\<lambda\>.
    </equation*>

    Define

    <\equation*>
      w<rsub|N><around|(|\<lambda\>|)>=<big|sum><rsub|n=0><rsup|N>c<rsub|n>*<space|0.17em>Q<rsub|n><around|(|\<lambda\>|)>,<space|2em>\<cal-Q\><rsub|n><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>>Q<rsub|n><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>,
    </equation*>

    whenever these integrals are well-defined.

    Assume that there exists a Banach space
    <math|X\<subset\>L<rsup|1><around|(|\<bbb-R\>|)>\<cap\>L<rsup|2><around|(|\<bbb-R\>|)>>
    such that:

    <\enumerate>
      <item><math|w,w<rsub|N>\<in\>X> for all <math|N>;

      <item><math|<around|\<\|\|\>|w-w<rsub|N>|\<\|\|\>><rsub|X>\<to\>0>;

      <item>there is a constant <math|C\<gtr\>0> such that

      <\equation*>
        sup<rsub|x\<in\>\<bbb-R\>><around*|\||<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>>f<around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>|\|>\<le\>C<around|\<\|\|\>|f|\<\|\|\>><rsub|X>
      </equation*>

      for all <math|f\<in\>X>.
    </enumerate>

    Then

    <\equation*>
      K<around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*<space|0.17em>\<cal-Q\><rsub|n><around|(|x|)>
    </equation*>

    uniformly on <math|\<bbb-R\>>.
  </theorem>

  <\proof>
    Since <math|w<rsub|N>\<to\>w> in <math|X>,

    <\equation*>
      sup<rsub|x\<in\>\<bbb-R\>><around*|\||<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><around|(|w<around|(|\<lambda\>|)>-w<rsub|N><around|(|\<lambda\>|)>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>|\|>\<le\>C*<around|\<\|\|\>|w-w<rsub|N>|\<\|\|\>><rsub|X>\<to\>0.
    </equation*>

    But

    <\equation*>
      <frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>>w<rsub|N><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*x>*<space|0.17em>d*\<lambda\>=<big|sum><rsub|n=0><rsup|N>c<rsub|n>*<space|0.17em>\<cal-Q\><rsub|n><around|(|x|)>.
    </equation*>

    Therefore

    <\equation*>
      sup<rsub|x\<in\>\<bbb-R\>><around*|\||K<around|(|x|)>-<big|sum><rsub|n=0><rsup|N>c<rsub|n>*<space|0.17em>\<cal-Q\><rsub|n><around|(|x|)>|\|>\<to\>0.
    </equation*>

    Thus the transformed orthogonal expansion converges uniformly on
    <math|\<bbb-R\>>.
  </proof>

  <vspace|2fn>

  <\theorem>
    [Noncompact Spatial Expansion Under Integrable Approximation] Let
    <math|K\<in\>L<rsup|2><around|(|\<bbb-R\>|)>> and define

    <\equation>
      w<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>K<around|(|x|)>*<space|0.17em>e<rsup|-i*\<lambda\>*x>*<space|0.17em>d*x
    </equation>

    whenever the integral is well-defined. Let
    <math|<around|{|R<rsub|n>|}><rsub|n=0><rsup|\<infty\>>> be a complete
    orthogonal system in <math|L<rsup|2><around|(|\<bbb-R\>|)>>, with

    <\equation*>
      k<rsub|n>=<big|int><rsub|\<bbb-R\>><around|\||R<rsub|n><around|(|x|)>|\|><rsup|2>*<space|0.17em>d*x,<space|2em>a<rsub|n>=<frac|1|k<rsub|n>>*<big|int><rsub|\<bbb-R\>>K<around|(|x|)><space|0.17em><wide|R<rsub|n><around|(|x|)>|\<bar\>><space|0.17em>d*x.
    </equation*>

    Define

    <\equation*>
      K<rsub|N><around|(|x|)>=<big|sum><rsub|n=0><rsup|N>a<rsub|n>*<space|0.17em>R<rsub|n><around|(|x|)>,<space|2em><wide|R<rsub|n>|^><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>R<rsub|n><around|(|x|)>*<space|0.17em>e<rsup|-i*\<lambda\>*x>*<space|0.17em>d*x,
    </equation*>

    whenever these integrals are well-defined.

    Assume that there exists a Banach space
    <math|Y\<subset\>L<rsup|1><around|(|\<bbb-R\>|)>\<cap\>L<rsup|2><around|(|\<bbb-R\>|)>>
    such that:

    <\enumerate>
      <item><math|K,K<rsub|N>\<in\>Y> for all <math|N>;

      <item><math|<around|\<\|\|\>|K-K<rsub|N>|\<\|\|\>><rsub|Y>\<to\>0>;

      <item>there is a constant <math|C\<gtr\>0> such that

      <\equation*>
        sup<rsub|\<lambda\>\<in\>\<bbb-R\>><around*|\||<big|int><rsub|\<bbb-R\>>f<around|(|x|)>*<space|0.17em>e<rsup|-i*\<lambda\>*x>*<space|0.17em>d*x|\|>\<le\>C<around|\<\|\|\>|f|\<\|\|\>><rsub|Y>
      </equation*>

      for all <math|f\<in\>Y>.
    </enumerate>

    Then

    <\equation*>
      w<around|(|\<lambda\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>a<rsub|n><space|0.17em><wide|R<rsub|n>|^><around|(|\<lambda\>|)>
    </equation*>

    uniformly on <math|\<bbb-R\>>.
  </theorem>

  <\proof>
    Since <math|K<rsub|N>\<to\>K> in <math|Y>,

    <\equation*>
      sup<rsub|\<lambda\>\<in\>\<bbb-R\>><around*|\||<big|int><rsub|\<bbb-R\>><around|(|K<around|(|x|)>-K<rsub|N><around|(|x|)>|)>*<space|0.17em>e<rsup|-i*\<lambda\>*x>*<space|0.17em>d*x|\|>\<le\>C*<around|\<\|\|\>|K-K<rsub|N>|\<\|\|\>><rsub|Y>\<to\>0.
    </equation*>

    But

    <\equation*>
      <big|int><rsub|\<bbb-R\>>K<rsub|N><around|(|x|)>*<space|0.17em>e<rsup|-i*\<lambda\>*x>*<space|0.17em>d*x=<big|sum><rsub|n=0><rsup|N>a<rsub|n><space|0.17em><wide|R<rsub|n>|^><around|(|\<lambda\>|)>.
    </equation*>

    Therefore

    <\equation*>
      sup<rsub|\<lambda\>\<in\>\<bbb-R\>><around*|\||w<around|(|\<lambda\>|)>-<big|sum><rsub|n=0><rsup|N>a<rsub|n><space|0.17em><wide|R<rsub|n>|^><around|(|\<lambda\>|)>|\|>\<to\>0.
    </equation*>

    Thus the transformed orthogonal expansion converges uniformly on
    <math|\<bbb-R\>>.
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