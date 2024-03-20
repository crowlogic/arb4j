<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Band Limited Processes and Spectral Bimeasures>>

  <abstract-data|<\abstract>
    The following is an excerpt of <cite-detail|stochasticInferenceTheory|6.2>
    by the amazing author M.M. Rao, a true master of abstraction for which I
    am thankful for. May he live to see my proof of Riemann's conjecture. And
    me too for that matter.

    Retypeset by Stephen A. Crowley - starting March 19th 2024
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Band
    Limited Sampling & Spectral Functions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Harmonizability
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Analyticity of second order processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Band Limited Sampling & Spectral Functions>

  <subsection|Harmonizability>

  If <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> is a mean zero stationary
  process with a continuous covariance <math|r<around|(|s,t|)>=<wide|r|~>*<around|(|s-t|)>>,
  then by the classical Bochner theorem

  <\equation>
    <wide|r|~>*<around|(|s-t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*<around|(|s-t|)>*u>*d*F<around|(|u|)><space|3em>\<forall\>s,t\<in\>\<bbb-R\>,
  </equation>

  where <math|F> is a bounded positive nondecreasing function, determining a
  (bounded) Borel measure. Such an <math|F> is termed the
  <with|font-shape|italic|spectral function> of the process, and if moreover
  the support of <math|F> is contained in a bounded interval
  <math|<around|(|-a,a|)>>, the process is usually called
  <with|font-shape|italic|band-limited>. More generally, suppose <math|r> is
  the covariance function of a second order process admitting a
  (two-dimensional) Fourier transform:

  <\equation>
    r<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*x-i*t*y>*d*F<around|(|x,y|)>,<space|1em>s,t\<in\>\<bbb-R\>,<space|1em><around|(|2|)>
  </equation>

  relative to a (necessarily positive definite) bimeasure <math|F> which
  however may only have a finite Fréchet (not Vitali) variation, so that the
  symbol is a (strict) MT-integral as noted in the preceding section, and the
  process is weakly harmonizable. Again <math|F> is termed a
  <with|font-shape|italic|spectral bimeasure>, and if its support is
  contained in a bounded rectangle <math|<around|(|-a,a|)>\<times\><around|(|-b,b|)>>,
  then the process (by analogy) can and will be termed band-limited. Thus the
  concept extends to harmonizable processes. The following result
  characterizes continuous covariances <math|r> that are Fourier transforms
  of such spectral bimeasures, and motivates how other extensions (e.g., the
  Cramér type processes) can be similarly analyzed.

  <\theorem>
    A continuous covariance function <math|r:\<bbb-R\>\<times\>\<bbb-R\>\<rightarrow\>\<bbb-C\>>
    is the Fourier transform of a bimeasure
    <math|F:B<around|(|\<bbb-R\>|)>\<times\>B<around|(|\<bbb-R\>|)>\<rightarrow\>\<bbb-C\>>
    (so that it is weakly harmonizable) iff
    <math|<around|\<\|\|\>|r|\<\|\|\>>\<less\>\<infty\>> where
    <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> and\ 

    <\equation>
      <wide|f|^><around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*x>*f<around|(|x|)>*d*x
    </equation>

    <\equation>
      <around|\<\|\|\>|r|\<\|\|\>>=sup <around*|{|<around*|\||<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>r<around|(|s,t|)>*f<around|(|s|)>*g<around|(|t|)>*d*s*d*t|\|>:<around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>\<leq\>1,<around|\<\|\|\>|g|\<\|\|\>><rsub|\<infty\>>\<leq\>1,f,g\<in\>L<rsup|1><around|(|\<bbb-R\>|)>|}>.<space|1em><around|(|3|)>
    </equation>

    Here and below <math|L<rsup|P><around|(|\<bbb-R\>|)>> is the Lebesgue
    space on the Lebesgue line <math|\<bbb-R\>>.

    <with|font-series|bold|Remark.> The condition that
    <math|<around|\<\|\|\>|r|\<\|\|\>>\<less\>\<infty\>> of (3) is termed
    weakly <math|V>-bounded and is an extended version of a one-dimensional
    concept originally formulated by Bochner [2]. The point of this result is
    that the (two-dimensional) Fourier transform is characterized by a simple
    analytical condition, namely (3), without reference to the \Pabstract\Q
    definition of harmonizability.
  </theorem>

  <\proof>
    The \Pif\Q part is immediate. Indeed, let <math|r> admit a representation
    (2). Then for any <math|f,g\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> one has

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>r<around|(|s,t|)>*f<around|(|s|)>*g<around|(|t|)>*d*s*d*t>|<cell|=<big|int><rsub|\<bbb-R\>>f<around|(|s|)>*g<around|(|t|)>\<times\><around*|(|<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*x-i*t*y>*d*F<around|(|x,y|)>|)>*d*s*d*t>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>f<around|(|x|)>*g<around|(|y|)>*d*F<around|(|x,y|)>>>>>>
    </equation>

    by a form of Fubini's theorem for the Morse-Transue-integrals,

    <\equation>
      \<leq\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>><around|\<\|\|\>|g|\<\|\|\>><rsub|\<infty\>><around|\<\|\|\>|F|\<\|\|\>><rsub|\<bbb-R\>,\<bbb-R\>>
    </equation>

    by a property of the MT-integrals.

    Here <math|<around|\<\|\|\>|F|\<\|\|\>><rsub|\<bbb-R\>,\<bbb-R\>>> is the
    Fréchet variation of the bimeasure (which is always finite) given by:

    <\equation>
      <around|\<\|\|\>|F|\<\|\|\>><rsub|\<bbb-R\>,\<bbb-R\>>=sup
      <around*|{|<big|sum><rsub|i,j=1><rsup|n><around*|\||<big|int><rsub|A<rsub|i>><big|int><rsub|B<rsub|j>>d*F<around|(|x,y|)>*a<rsub|i>*a<rsub|j>|\|>;A<rsub|i>,B<rsub|j>\<in\>\<bbb-R\><text|disjoint>,<around|\||a<rsub|i>|\|>\<leq\>1,a<rsub|i>\<in\>\<bbb-C\>|}>
    </equation>

    Thus (4) implies (3), so that <math|r*s> is (weakly) <math|V>-bounded.

    For the converse suppose <math|<around|\<\|\|\>|r|\<\|\|\>>\<less\>\<infty\>>.
    If <math|H:f\<mapsto\><wide|f|^>> is the Fourier transform, consider the
    functionals <math|T:C<rsub|0><around|(|\<bbb-R\>|)>\<times\>C<rsub|0><around|(|\<bbb-R\>|)>\<rightarrow\>\<bbb-C\>>
    defined by <math|T<around|(|f,g|)>=\<cal-E\><around|(|H<rsup|-1><around|(|f|)>,H<rsup|-1><around|(|g|)>|)>>,
    where for <math|f,g\<in\>L<rsup|1><around|(|\<bbb-R\>|)>,C<rsub|0><around|(|\<bbb-R\>|)>>
    being the space of continuous functions vanishing off compact sets, and
    <math|\<cal-E\><around|(|\<cdummy\>,\<cdummy\>|)>> given by:

    <\equation>
      \<cal-E\><around|(|f,g|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>r*<around|(|s,t|)>*f<around|(|s|)>*g<around|(|t|)>*d*s*d*t
    </equation>

    This <math|T> is a bounded bilinear functional on
    <math|L<rsup|1><around|(|\<bbb-R\>|)>\<times\>L<rsup|1><around|(|\<bbb-R\>|)>>
    since by (3)

    <\equation>
      sup <around|{|<around|\||T<around|(|f,g|)>|\|>;<around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>\<leq\>1,<around|\<\|\|\>|g|\<\|\|\>><rsub|\<infty\>>\<leq\>1|}>=<around|\<\|\|\>|r|\<\|\|\>>\<less\>\<infty\>
    </equation>

    Now <math|T> admits a bound preserving extension to all of
    <math|C<rsub|0><around|(|\<bbb-R\>|)>\<times\>C<rsub|0><around|(|\<bbb-R\>|)>>,
    endowed with the uniform norm, by the standard (Hahn-Banach type)
    extension results. Then by another representation theorem due to F. Riesz
    for multilinear functionals (cf., Dunford-Schwartz [1], Chapter VI, and
    Dobrakov [1] for extensions), there is a unique bounded bimeasure
    <math|F>, necessarily positive definite (cf., Chang and Rao [1], p.21),
    on <math|B<around|(|\<bbb-R\>|)>\<times\>B<around|(|\<bbb-R\>|)>> such
    that the following holds:

    <\equation>
      T<around|(|f,g|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>f<rsup|\<ast\>><around*|(|x|)>*g<around|(|y|)>*d*F<around|(|x,y|)>
    </equation>

    Then (5) and (6) imply

    <\equation>
      <big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>r*<around|(|s,t|)>*f<around|(|s|)>*g<around|(|t|)>*d*s*d*t=\<cal-E\><around|(|f,g|)>=T<around|(|f,g|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*x-i*t*y>*f<around|(|s|)>*g<around|(|t|)>*d*s*d*t*d*F<around|(|x,y|)>
    </equation>

    Subtracting and using again a form of Fubini's theorem, one gets

    <\equation>
      <big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>><around|[|r<around|(|s,t|)>-<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*x-i*t*y>*d*F<around|(|x,y|)>|]>*f<around|(|s|)>*g<around|(|t|)>*d*s*d*t=0<space|1em><around|(|7|)>
    </equation>

    Since <math|f,g\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> are arbitrary, this
    implies that <math|<around|[|<space|1em>|]>=0> a.e., and because of the
    continuity of <math|r> it vanishes identically. Thus <math|r> admits the
    representation (2)
  </proof>

  <\note>
    The preceding analysis also applies to the case that <math|F> is of
    bounded (Vitali) variation, with the following modifications. Consider
    <math|r> as a function on <math|\<bbb-R\><rsup|2>> and (3) replaced by
    <math|<around|\||r|\|><around|(|\<bbb-R\><rsup|2>|)>\<less\>\<infty\>>,
    where

    <\equation>
      <around|\||r|\|><around|(|\<bbb-R\><rsup|2>|)>=sup
      <around|{|<around|\||<big|int><rsub|\<bbb-R\><rsup|2>>r<around|(|x|)>*f<around|(|x|)>*d*\<mu\><around|(|x|)>|\|>:f\<in\>L<rsup|1><around|(|\<bbb-R\><rsup|2>|)>,<around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>\<leq\>1|}>
      <around|(|8|)>
    </equation>

    with <math|\<mu\>> as the planar Lebesgue measure, and
    <math|f:\<bbb-R\><rsup|2>\<rightarrow\>\<bbb-C\>> (not necessarily of the
    product form <math|f<around|(|x<rsub|1>,x<rsub|2>|)>=f<rsub|1><around|(|x<rsub|1>|)>*f<rsub|2><around|(|x<rsub|2>|)>>
    for <math|x=<around|(|x<rsub|1>,x<rsub|2>|)>\<in\>\<bbb-R\><rsup|2>>).
    Then by another (Gleason) representation theorem applied to <math|r>, an
    <math|F:\<bbb-R\><rsup|2>\<rightarrow\>\<bbb-C\>> of bounded (Vitali)
    variation such that (<math|\<tau\>\<cdot\>x=> is an
    <math|F<rprime|'>:\<bbb-R\><rsup|2>\<rightarrow\>\<bbb-C\>> of bounded
    (Vitali) variation such that (<math|\<tau\>\<cdot\>x=> is an
    <math|F<rprime|'>:\<bbb-R\><rsup|2>\<rightarrow\>\<bbb-C\>> of bounded
    (Vitali) variation such that <math|(\<tau\>\<cdot\>x=<around|(|x<rsub|1>-x<rsub|2>|)>>
    for <math|\<tau\>=<around|(|s,-t|)>>

    <\equation>
      \<tau\><around|(|x|)>=<big|int><rsub|\<bbb-R\><rsup|2>>e<rsup|i*\<tau\>\<cdot\>x>*d*F<around|(|s,t|)><space|1em><around|(|9|)>
    </equation>

    and since <math|r> is positive definite, <math|F> is also.
  </note>

  \ Then the preceding work gives the following:

  <\corollary>
    A continuous covariance function <math|r:\<bbb-R\><rsup|2>\<rightarrow\>\<bbb-C\>>
    is strongly harmonizable (or the Fourier transform of a positive definite
    function <math|F:\<bbb-R\><rsup|2>\<rightarrow\>\<bbb-C\>> of bounded
    (Vitali) variation satisfying (9)) if and only if
    <math|<around|\||r|\|><around|(|\<bbb-R\><rsup|2>|)>\<less\>\<infty\>>,
    or more explicitly,

    <\equation>
      <around|\||<big|int><rsub|\<bbb-R\><rsup|2>>r<around|(|s,t|)>*f<around|(|s,t|)>*d*\<mu\><around|(|s,t|)>|\|>\<leq\>K<around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>><space|2em>\<forall\>f\<in\>L<rsup|1><around|(|\<bbb-R\><rsup|2>|)><space|1em><around|(|10|)>
    </equation>

    for some constant <math|0\<less\>K\<less\>\<infty\>>.
  </corollary>

  <\note>
    Thus the class of processes for which a general band-limited concept can
    be defined is precisely the (weakly or strongly) harmonizable family. The
    importance of condition (3) or (10) is enhanced by an obtaining the
    corresponding <with|font-shape|italic|<em|<em|stochastic Fourier
    representation of the <math|X<rsub|t>>-process itself>.>>
  </note>

  \ This is seen as follows. When <math|r> is <math|V>-bounded, one has for
  any bounded Borel <math|f,g> with compact supports,\ 

  \;

  <\equation>
    <big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>r<around|(|s,t|)>*f<around|(|s|)>*g<around|(|t|)>*d*s*d*t=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>X<rsub|s>*f<around|(|s|)>*d*s*<big|int><rsub|\<bbb-R\>>X<rsub|t>*g<around|(|t|)>*d*s*d*t|]>
  </equation>

  \;

  so that on taking <math|f=g>, this becomes

  <\equation>
    \<bbb-E\><around*|[|<around*|(|<big|int><rsub|\<bbb-R\>>X<rsub|s>*f<around|(|s|)>*d*s|)><rsup|2>|]>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>r<around|(|s,t|)>*f<around|(|s|)>*f<around|(|t|)>*d*s*d*t\<leq\>K<around|\<\|\|\>|f|\<\|\|\>><rsup|2><rsub|\<infty\>>,<space|1em><text|by
    (3) [or (10)]>
  </equation>

  for some <math|0\<less\>K\<less\>\<infty\>>. Hence

  <\equation>
    <around*|\||<big|int><rsub|\<bbb-R\>>X<rsub|s>*f<around|(|s|)>*d*s|\|><rsup|2>\<leq\>K<around|\<\|\|\>|f|\<\|\|\>><rsup|2><rsub|\<infty\>><space|1em><around|(|11|)>
  </equation>

  This implies that the set <math|<around*|{|<big|int><rsub|\<bbb-R\>>X<rsub|s>*f<around|(|s|)>*d*s,f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>,<around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>\<leq\>1|}>>
  is <em|relatively weakly compact>. Consequently by another representation
  due to F. Riesz on <math|C<rsub|0><around|(|\<bbb-R\><rsup|2>|)>> to
  <math|L<rsup|2><rsub|0><around|(|P|)>> (in both cases of (3) and (10))
  there is a unique vector measure <math|Z:B<around|(|\<bbb-R\>|)>\<rightarrow\>L<rsup|2><rsub|0><around|(|P|)>>
  such that

  <\equation>
    <big|int><rsub|\<bbb-R\>>X<rsub|s>*f<around|(|s|)>*d*s=T<around|(|f|)>=<big|int><rsub|\<bbb-R\>>f<around|(|t|)>*d*Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*t*u>*f<around|(|u|)>*d*u*d*Z<around|(|t|)>
  </equation>

  where the left side is the standard vector Lebesgue [or the Bochner]
  integral and the right side is the Dunford-Schwartz's. Hence as before one
  has

  <\equation>
    <around*|[|<big|int><rsub|\<bbb-R\>>X<rsub|t>-<big|int><rsub|\<bbb-R\>>e<rsup|i*t*u>*d*Z<around|(|u|)>|]>*f<around|(|t|)>*d*t=0\<forall\><space|1em>f\<in\>L<rsup|1><around|(|\<bbb-R\>|)><space|1em><around|(|12|)>
  </equation>

  It follows that

  <\equation>
    X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*u>*d*Z<around|(|u|)>\<forall\><space|1em>t\<in\>\<bbb-R\>,<space|1em><around|(|13|)>
  </equation>

  which is the integral representation of a weakly (or strongly) harmonizable
  process, and <math|\<bbb-E\>*<around|(|Z<around|(|A|)>*Z<around|(|B|)>|)>=<big|int><rsub|A><big|int><rsub|B>d*F<rsup|\<ast\>><around|(|s,t|)>>
  with <math|F<rsup|\<ast\>>> defining a bimeasure (a signed measure) on
  <math|B<around|(|\<bbb-R\><rsup|2>|)>>.

  <\note>
    The importance of this result is that one can approximate
    <math|e<rsup|i*t*u>> by a (finite or infinite) series as in the proof of
    Theorem 1.3 (cf., eq(15)), leading to several such representations using
    different classical approximations and/or \Psampling theorems\Q. They
    give rise to<em| stochastic sampling versions> of various kinds. For
    instance, the covariance function <math|r> can be replaced by

    <\equation>
      r<rsup|\<ast\>><around|(|s,t|)>=r<around|(|s,t|)>*f<around|(|s|)>*f<around|(|t|)>
    </equation>

    \ for a measurable <math|f> such that\ 

    <\equation>
      <big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>r<rsup|\<ast\>><around|(|s,t|)>*d*\<mu\><around|(|s|)>*d*\<mu\><around|(|t|)>\<less\>\<infty\>
    </equation>

    Then under similar conditions of <math|V>-boundedness <math|r> is a
    Fourier transform of a bimeasure, and more particularly, if
    <math|<wide|r|^>> and <math|<wide|f|^>> are such transforms themselves,
    then <math|r> is the Fourier transform of a convolution. So the
    band-limitedness of a process can be defined, and it leads to some new
    developments in (stochastic) sampling theory.\ 
  </note>

  <\remark>
    Such a generalization of band-limited results was proposed by Zakai [1]
    and the idea is further explored by several others (see e.g., Lee [1]).
    We shall omit a discussion of extending the classical sampling theory
    found in e.g., Higgins [1] and Zayed [1], to the stochastic context,
    since the novelty there is mostly in the deterministic case, and much
    less in its probabilistic counter part. An informative exposition is
    given by Pogány [1]. However, some results related to the above works
    will be included in Sections 4 and 5 below.
  </remark>

  <subsection|Analyticity of second order processes>

  For second order processes, especially the harmonizable classes, we shall
  consider the band-limitedness property and its relation to the analyticity
  of sample paths, which explains our preoccupation with the former in the
  last section. This point was already noted immediately after Corollary 1.2.
  The following result for stationary processes was observed by Belyaev [1],
  and for the (strongly) harmonizable case it was established by Swift [1].

  <\theorem>
    A strongly harmonizable process <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>>
    with spectral (signed) measure <math|F> is analytic in an open
    neighborhood of the origin iff <math|F> has a moment generating function
    in such a neighborhood of the complete plane. In particular, if the
    strongly harmonizable process is band-limited, then it is analytic in the
    complete plane.
  </theorem>

  <\proof>
    The sufficiency is a consequence of Corollary 1.2. In fact, if <math|F>
    has a moment generating function, then

    <\equation>
      <big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|s<rsub|1>*x+s<rsub|2>*y>*d*F<around|(|x,y|)>\<less\>\<infty\>,<space|1em><around|\||s<rsub|j>|\|>\<less\>a<rsub|j>,j=1,2
    </equation>

    and hence <math|F> has all moments finite. Thus <math|r> is infinitely
    differentiable (by the dominated convergence theorem) so that it has an
    infinite Taylor series expansion converging (uniformly and absolutely) in
    the rectangle <math|<around|(|-a<rsub|1>,a<rsub|1>|)>\<times\><around|(|-a<rsub|2>,a<rsub|2>|)>>.
    So <math|r> is analytic, and then <math|X<rsub|t>> has mean square
    derivatives of all orders. It is analytic as in Theorem 1.1.

    For the converse, we assert that the analyticity of <math|r> in a
    rectangular region, as above, implies that its spectral measure function
    <math|F> satisfies (1). Since <math|F> determines a signed (or complex)
    measure on <math|\<bbb-R\><rsup|2>>, by hypothesis, it is bounded and (by
    the Jordan decomposition) can be expressed as a linear combination of
    nonegative measure functions of bounded (Vitali) variation,
    <math|F<rsub|1>,\<ldots\>,F<rsub|4>>. Hence, it suffices to establish (1)
    for one of them, say <math|F<rsub|1>>. So let

    <\equation>
      r<rsub|1><around|(|s,t|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*x-i*t*y>*d*F<rsub|1><around|(|x,y|)><space|1em><around|(|2|)>
    </equation>

    and by hypothesis <math|r<rsub|1>> is analytic. Thus it admits a
    (uniformly and absolutely) convergent power series expansion

    <\equation>
      r<rsub|1><around|(|s<rsub|1>,s<rsub|2>|)>=<big|sum><rsub|j,k=0><rsup|\<infty\>><frac|\<partial\><rsup|j+k>*r<rsub|1>|\<partial\>*s<rsub|1><rsup|j>*\<partial\>*s<rsub|2><rsup|k>>*<around|(|0,0|)><frac|s<rsub|1><rsup|j>|j!>*<frac|s<rsub|2><rsup|k>|k!><space|1em><around|(|3|)>
    </equation>

    for <math|<around|\||s<rsub|m>|\|>\<less\>p<rsub|m>,m=1,2>, a rectangular
    neighborhood of <math|<around|(|0,0|)>> in <math|\<bbb-R\><rsup|2>>,
    following some standard results on characteristic functions of
    probability theory. Now <math|r<rsub|1>> of (2) is infinitely
    differentiable, and it is the Fourier transform of a bounded (positive)
    measure. This implies that <math|F<rsub|1>> has all (absolute) moments
    finite since the integral is in Lebesgue's sense. If\ 

    <\equation>
      \<alpha\><rsub|j,k>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>x<rsup|j>*y<rsup|k>*d*F<rsub|1><around|(|x,y|)>
    </equation>

    , then <math|<frac|\<partial\><rsup|j+k>*r<rsub|1>|\<partial\>*s<rsub|1><rsup|j>*\<partial\>*s<rsub|2><rsup|k>>*<around|(|0,0|)>=i<rsup|j+k>*\<alpha\><rsub|j,k>>.
    Because <math|\<alpha\><rsub|2*j,2*k>\<geq\>0>, the absolute moments
    <math|\<beta\><rsub|j,k>> of <math|F<rsub|1>> are dominated by the even
    moments as follows. Using the elementary inequality
    <math|<around|\||a*b|\|>\<leq\><around|(|<frac|a<rsup|2>+b<rsup|2>|2>|)>>
    one has

    <\equation>
      <around|\||x|\|><rsup|k><around|\||x<rsub|k-1>|\|><rsup|j><around|\||y|\|><rsup|j-1>\<leq\><frac|1|4>*<around|(|x<rsup|2*k>+x<rsup|2*k-2>|)>*<around|(|y<rsup|2*j>+y<rsup|2*j-2>|)>
    </equation>

    and hence

    <\align>
      <tformat|<table|<row|<cell|\<beta\><rsub|2*k-1,2*j-1>>|<cell|\<leq\><frac|1|<around|(|2*k-1|)>!<around|(|2*j-1|)>!>\<leq\><frac|1|4>*\<alpha\><rsub|2*k,2*j><around|(|<around|(|2*k|)>!<around|(|2*j|)>!|)>+<frac|\<alpha\><rsub|2*k-2,2*j-2>|<around|(|2*k-2|)>!<around|(|2*j-2|)>!><eq-number>>>|<row|<cell|>|<cell|\<leq\><frac|\<alpha\><rsub|2*k,2*j>|2*k\<cdot\>2*j-1>+<frac|\<alpha\><rsub|2*k-2,2*j-2>|2*k+2*j-2>\<cdot\><frac|1|<around|(|2*k-2|)>!<around|(|2*j-2|)>!-1><eq-number>>>>>
    </align>

    Substituting this estimate and using the even coefficient terms of the
    absolutely convergent series (3), one finds that
    <math|<big|sum><rsub|j,k=0><rsup|\<infty\>>\<beta\><rsub|j,k>*<frac|s<rsub|1><rsup|2*j>|<around|(|2*j|)>!>*<frac|s<rsub|2><rsup|2*k>|<around|(|2*k|)>!>>
    converges absolutely in the same open neighborhood of
    <math|<around|(|0,0|)>> in <math|\<bbb-R\><rsup|2>>. This implies
    immediately that

    <\equation>
      <big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|<around|\||\<alpha\>*s<rsub|1>+\<beta\>*s<rsub|2>|\|>>*d*F<rsub|1><around|(|x,y|)>\<less\>\<infty\>.
    </equation>

    It follows from this that (1) holds for <math|F<rsub|1>> and by the
    initial reduction, it holds for <math|F> itself. Thus the condition is
    also necessary.

    Finally, in the band-limited case, <math|F> has all moments finite (i.e.,
    its moment generating function exists), and the sufficiency of the result
    implies that the process must be analytic
  </proof>

  \;

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-stochasticInferenceTheory>Malempati<nbsp>M.<nbsp>Rao.
      <newblock><with|font-shape|italic|Stochastic Processes: Inference
      Theory>. <newblock>Springer Monographs in Mathematics. Springer,
      2nd<localize| edition>, 2014.<newblock>
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
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|6>>
    <associate|auto-4|<tuple|31|7>>
    <associate|bib-stochasticInferenceTheory|<tuple|1|7>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticInferenceTheory
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Band
      Limited Sampling & Spectral Functions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Harmonizability
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Analyticity of second order
      processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>