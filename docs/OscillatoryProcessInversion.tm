<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Inversion Theory for Oscillatory
  Processes:<next-line>Three Equivalent Formulations and Connection
  to<next-line>Devinatz--Aronszajn Integral
  Representations>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Spectral Formulation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Filter Formulation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>Operator Formulation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Main
    Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Orthogonality of Oscillatory Functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|2.2<space|2spc>Inverse Filter Kernel
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|2.3<space|2spc>Inverse Filter Theorem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Two-Sided
    Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Connection
    to Devinatz\UAronszajn Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Summary>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  \;

  <section|Introduction>

  The theory of oscillatory processes unites three equivalent formulations:
  spectral, filter, and operator. Each provides a rigorous mechanism for
  inverting between stationary and oscillatory representations. All
  derivations below concern real-valued processes, where the symmetry of the
  spectral measure ensures that no imaginary asymmetries arise.

  <inactive|<\assumption|Real-Valued Process and Symmetric Spectrum>
    \;
  </assumption>>

  <\theorem>
    <label|asm:real>Let <math|X<around|(|u|)>> be a real-valued process:

    <\equation>
      X<around|(|u|)>\<in\>\<bbb-R\>\<forall\>u\<in\>\<bbb-R\><label|eq:1>
    </equation>

    Then its (complex-valued) random orthogonal spectral measure satisfies

    <\equation>
      d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=d*\<Phi\>*<around|(|-\<lambda\>|)><label|eq:2>
    </equation>

    and the corresponding covariance spectral measure <math|F> is even:

    <\equation>
      F*<around|(|-A|)>=F<around|(|A|)><label|eq:3>
    </equation>
  </theorem>

  <\proof>
    <text-dots> insert proof here..

    \;
  </proof>

  <subsection|Spectral Formulation>

  The stationary and oscillatory processes are given by

  <\align>
    <tformat|<table|<row|<cell|X<around|(|u|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><eq-number><label|eq:4>>>|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><eq-number><label|eq:5>>>>>
  </align>

  Inversion follows by the projection integral

  <\equation>
    d*\<Phi\><around|(|\<lambda\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>Z<around|(|t|)>*<space|0.17em>d*t<label|eq:6>
  </equation>

  The fundamental orthogonality relation is

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>\<phi\><rsub|t><around|(|\<mu\>|)>*<space|0.17em>d*t=2*\<pi\>*\<delta\>*<around|(|\<lambda\>-\<mu\>|)><label|eq:7>
  </equation>

  <subsection|Filter Formulation>

  Transformation between <math|X> and <math|Z> proceeds through time-varying
  filters:

  <\align>
    <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>X<around|(|u|)>*<space|0.17em>d*u<eq-number><label|eq:8>>>|<row|<cell|X<around|(|u|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u,t|)>*<space|0.17em>Z<around|(|t|)>*<space|0.17em>d*t<eq-number><label|eq:9>>>>>
  </align>

  The filters relate to the oscillatory function as

  <\align>
    <tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<lambda\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*u<eq-number><label|eq:10>>>|<row|<cell|g<around|(|u,t|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<lambda\><eq-number><label|eq:11>>>>>
  </align>

  and satisfy

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|h<around|(|t,u|)>|\<bar\>><space|0.17em>h<around|(|t,v|)>*<space|0.17em>d*t=\<delta\>*<around|(|u-v|)><label|eq:12>
  </equation>

  which implies

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u,t|)>*<space|0.17em>h<around|(|t,v|)>*<space|0.17em>d*t=\<delta\>*<around|(|u-v|)><label|eq:13>
  </equation>

  <subsection|Operator Formulation>

  The operator relations express the same structure as maps between
  <math|L<rsup|2>> function spaces:

  <\equation>
    T:X\<mapsto\>Z,<space|1em>S:Z\<mapsto\>X<label|eq:14>
  </equation>

  Mutual invertibility follows as

  <\equation>
    S*T=T*S=<math-up|Id><label|eq:15>
  </equation>

  with completeness conditions identical to <eqref|eq:12> and <eqref|eq:7>.

  <section|Main Results>

  <subsection|Orthogonality of Oscillatory Functions>

  <\lemma>
    <dueto|Orthogonality of Oscillatory Functions><label|lem:orth>Let
    <math|h<around|(|t,u|)>> satisfy <eqref|eq:12> and define
    <math|\<phi\><rsub|t><around|(|\<lambda\>|)>> by <eqref|eq:10>. Then

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>\<phi\><rsub|t><around|(|\<mu\>|)>*<space|0.17em>d*t=2*\<pi\>*\<delta\>*<around|(|\<lambda\>-\<mu\>|)><label|eq:16>
    </equation>
  </lemma>

  <\proof>
    From <eqref|eq:10>,

    <\align>
      <tformat|<table|<row|<cell|<wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|h<around|(|t,u|)>|\<bar\>><space|0.17em>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*u<eq-number><label|eq:17>>>|<row|<cell|\<phi\><rsub|t><around|(|\<mu\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,v|)>*<space|0.17em>e<rsup|i*\<mu\>*v>*<space|0.17em>d*v<eq-number><label|eq:18>>>>>
    </align>

    so that

    <\equation>
      <big|int><rsub|t><wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>\<phi\><rsub|t><around|(|\<mu\>|)>*<space|0.17em>d*t=<big|int><rsub|t,u,v><wide|h<around|(|t,u|)>|\<bar\>><space|0.17em>h<around|(|t,v|)>*<space|0.17em>e<rsup|-i*\<lambda\>*u>*<space|0.17em>e<rsup|i*\<mu\>*v>*<space|0.17em>d*u*<space|0.17em>d*v*<space|0.17em>d*t<label|eq:19>
    </equation>

    Using <eqref|eq:12>,

    <\equation>
      <big|int><rsub|u,v>e<rsup|i*<around|(|\<mu\>*v-\<lambda\>*u|)>>*<space|0.17em>\<delta\>*<around|(|u-v|)>*<space|0.17em>d*u*<space|0.17em>d*v=<big|int><rsub|u>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*u>*<space|0.17em>d*u=2*\<pi\>*\<delta\>*<around|(|\<lambda\>-\<mu\>|)><label|eq:20>
    </equation>

    This proves the lemma.
  </proof>

  <subsection|Inverse Filter Kernel>

  <\lemma>
    <dueto|Inverse Filter Relation><label|lem:ginverse>The kernel
    <math|g<around|(|u,t|)>> defined by <eqref|eq:11> satisfies

    <\equation>
      g<around|(|u,t|)>=<wide|h<around|(|t,u|)>|\<bar\>><label|eq:21>
    </equation>
  </lemma>

  <\proof>
    Substitute <eqref|eq:17> into <eqref|eq:11>:

    <\align>
      <tformat|<table|<row|<cell|g<around|(|u,t|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|\<lambda\>><big|int><rsub|x><wide|h<around|(|t,x|)>|\<bar\>><space|0.17em>e<rsup|-i*\<lambda\>*x>*<space|0.17em>d*x*<space|0.17em>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<lambda\><eq-number><label|eq:22>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|x><wide|h<around|(|t,x|)>|\<bar\>><big|int><rsub|\<lambda\>>e<rsup|i*\<lambda\>*<around|(|u-x|)>>*<space|0.17em>d*\<lambda\>*<space|0.17em>d*x<eq-number><label|eq:23>>>|<row|<cell|>|<cell|=<big|int><rsub|x><wide|h<around|(|t,x|)>|\<bar\>><space|0.17em>\<delta\>*<around|(|u-x|)>*<space|0.17em>d*x=<wide|h<around|(|t,u|)>|\<bar\>><eq-number><label|eq:24>>>>>
    </align>
  </proof>

  <subsection|Inverse Filter Theorem>

  <\theorem>
    <dueto|Exact Inversion><label|thm:inverse>For <math|g<around|(|u,t|)>>
    defined as above and <math|Z<around|(|t|)>> given by <eqref|eq:5>,

    <\equation>
      X<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u,t|)>*<space|0.17em>Z<around|(|t|)>*<space|0.17em>d*t<label|eq:25>
    </equation>
  </theorem>

  <\proof>
    Insert the definitions from <eqref|eq:11> and <eqref|eq:5>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|t>g<around|(|u,t|)>*<space|0.17em>Z<around|(|t|)>*<space|0.17em>d*t>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|t><big|int><rsub|\<lambda\>><wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<lambda\>*<big|int><rsub|\<mu\>>\<phi\><rsub|t><around|(|\<mu\>|)>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)>*<space|0.17em>d*t<eq-number><label|eq:26>>>>>
    </align>

    Exchange the order of integration:

    <\align>
      <tformat|<table|<row|<cell|<frac|1|2*\<pi\>>*<big|int><rsub|\<lambda\>,\<mu\>>e<rsup|i*\<lambda\>*u><around*|(|<big|int><rsub|t><wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>\<phi\><rsub|t><around|(|\<mu\>|)>*<space|0.17em>d*t|)>*d*\<lambda\>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)><eq-number><label|eq:27>>>>>
    </align>

    Apply Lemma <reference|lem:orth>:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|\<lambda\>,\<mu\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>2*\<pi\>*\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*<space|0.17em>d*\<lambda\>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)>=<big|int><rsub|\<mu\>>e<rsup|i*\<mu\>*u>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)><label|eq:28>
    </equation>

    which equals <math|X<around|(|u|)>> by <eqref|eq:4>.
  </proof>

  <section|Two-Sided Reconstruction>

  <\enumerate>
    <item>Backward followed by forward recovers <math|X<around|(|u|)>>:

    <\equation>
      <big|int><rsub|t>g<around|(|u,t|)>*<space|0.17em>Z<around|(|t|)>*<space|0.17em>d*t=X<around|(|u|)><label|eq:29>
    </equation>

    <item>Forward followed by backward recovers <math|Z<around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|d*\<Phi\><rsub|<math-up|recon>><around|(|\<lambda\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|s><wide|\<phi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>Z<around|(|s|)>*<space|0.17em>d*s<eq-number><label|eq:30>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|\<mu\>><around*|(|<big|int><rsub|s><wide|\<phi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>\<phi\><rsub|s><around|(|\<mu\>|)>*<space|0.17em>d*s|)>*d*\<Phi\><around|(|\<mu\>|)><eq-number><label|eq:31>>>|<row|<cell|>|<cell|=<big|int><rsub|\<mu\>>\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)>=d*\<Phi\><around|(|\<lambda\>|)><eq-number><label|eq:32>>>>>
    </align>

    Hence

    <\equation>
      <wide|Z|^><around|(|t|)>=<big|int>\<phi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><rsub|<math-up|recon>><around|(|\<lambda\>|)>=Z<around|(|t|)><label|eq:33>
    </equation>
  </enumerate>

  <section|Connection to Devinatz\UAronszajn Theory>

  <\theorem>
    <dueto|Devinatz Integral Representation><label|thm:devinatz>Let
    <math|V<around|(|\<lambda\>|)>> be a bounded non-decreasing function with
    measure <math|d*V<around|(|\<lambda\>|)>> and
    <math|a<around|(|x,\<lambda\>|)>\<in\>L<rsup|2><around|(|V|)>> for each
    <math|x>. Then

    <\equation>
      K<around|(|x,y|)>=<big|int>a<around|(|x,\<lambda\>|)><space|0.17em><wide|a<around|(|y,\<lambda\>|)>|\<bar\>><space|0.17em>d*V<around|(|\<lambda\>|)><label|eq:34>
    </equation>

    is positive definite, and

    <\enumerate>
      <item>Each function <math|f<around|(|x|)>> in the associated RKHS has
      the form

      <\equation>
        f<around|(|x|)>=<big|int>a<around|(|x,\<lambda\>|)>*<space|0.17em>\<psi\><around|(|\<lambda\>|)>*<space|0.17em>d*V<around|(|\<lambda\>|)><label|eq:35>
      </equation>

      <item>The radical is

      <\equation>
        L<rsub|0>=<around|{|\<psi\>\<in\>L<rsup|2><around|(|V|)>:<big|int>a<around|(|x,\<lambda\>|)>*<space|0.17em>\<psi\><around|(|\<lambda\>|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>=0,\<forall\>x|}><label|eq:36>
      </equation>

      <item>The inner product satisfies

      <\equation>
        <around|\<langle\>|f,g|\<rangle\>><rsub|\<cal-J\>>=<big|int>\<psi\><around|(|\<lambda\>|)><space|0.17em><wide|\<chi\><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*V<around|(|\<lambda\>|)><label|eq:37>
      </equation>
    </enumerate>
  </theorem>

  <\theorem>
    <dueto|Equivalence with Oscillatory Kernels><label|thm:equiv>Under
    Assumption <reference|asm:real>, the oscillatory process formulation
    coincides with the Devinatz framework when
    <math|a<around|(|t,\<lambda\>|)>=\<phi\><rsub|t><around|(|\<lambda\>|)>>
    and <math|d*V=d*F>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>Kernel correspondence:

      <\equation>
        K<rsub|<math-up|osc>><around|(|t,s|)>=<big|int>\<phi\><rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|\<phi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)><label|eq:38>
      </equation>

      <item>Representations coincide since

      <\equation>
        Z<around|(|t|)>=<big|int>\<phi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<psi\><around|(|\<lambda\>|)>*<space|0.17em>d*F<around|(|\<lambda\>|)><label|eq:39>
      </equation>

      <item>If <math|\<psi\>\<in\>L<rsub|0>>, then

      <\equation>
        0=<big|int>\<phi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<psi\><around|(|\<lambda\>|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>,<space|1em>\<forall\>t<label|eq:40>
      </equation>

      Multiply by <math|<wide|\<phi\><rsub|t><around|(|\<mu\>|)>|\<bar\>>>
      and integrate over <math|t>:

      <\align>
        <tformat|<table|<row|<cell|0>|<cell|=<big|int><rsub|\<lambda\>>\<psi\><around|(|\<lambda\>|)><around*|(|<big|int><rsub|t><wide|\<phi\><rsub|t><around|(|\<mu\>|)>|\<bar\>><space|0.17em>\<phi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*t|)>*d*F<around|(|\<lambda\>|)><eq-number><label|eq:41>>>|<row|<cell|>|<cell|=2*\<pi\>*\<psi\><around|(|\<mu\>|)><eq-number><label|eq:42>>>>>
      </align>

      so <math|\<psi\>=0>, hence <math|L<rsub|0>=<around|{|0|}>>.

      <item>Inversion formula:

      <\equation>
        \<psi\><around|(|\<lambda\>|)>=<frac|1|2*\<pi\>>*<big|int><wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>Z<around|(|t|)>*<space|0.17em>d*t<label|eq:43>
      </equation>

      which matches <eqref|eq:6>.
    </enumerate>
  </proof>

  <section|Summary>

  <\enumerate>
    <item>Lemma <reference|lem:orth> establishes oscillatory orthogonality.

    <item>Lemma <reference|lem:ginverse> provides the identity
    <math|g<around|(|u,t|)>=<wide|h<around|(|t,u|)>|\<bar\>>>.

    <item>Theorem <reference|thm:inverse> verifies that
    <math|<big|int>g<around|(|u,t|)>*<space|0.17em>Z<around|(|t|)>*<space|0.17em>d*t=X<around|(|u|)>>.

    <item>Theorem <reference|thm:equiv> shows equivalence with Devinatz's
    kernel framework.
  </enumerate>
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
    <associate|asm:real|<tuple|1|2>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|4|6>>
    <associate|auto-11|<tuple|5|7>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-4|<tuple|1.3|3>>
    <associate|auto-5|<tuple|2|4>>
    <associate|auto-6|<tuple|2.1|4>>
    <associate|auto-7|<tuple|2.2|4>>
    <associate|auto-8|<tuple|2.3|5>>
    <associate|auto-9|<tuple|3|5>>
    <associate|eq:1|<tuple|1|2>>
    <associate|eq:10|<tuple|10|3>>
    <associate|eq:11|<tuple|11|3>>
    <associate|eq:12|<tuple|12|3>>
    <associate|eq:13|<tuple|13|3>>
    <associate|eq:14|<tuple|14|3>>
    <associate|eq:15|<tuple|15|3>>
    <associate|eq:16|<tuple|16|4>>
    <associate|eq:17|<tuple|17|4>>
    <associate|eq:18|<tuple|18|4>>
    <associate|eq:19|<tuple|19|4>>
    <associate|eq:2|<tuple|2|2>>
    <associate|eq:20|<tuple|20|4>>
    <associate|eq:21|<tuple|21|4>>
    <associate|eq:22|<tuple|22|4>>
    <associate|eq:23|<tuple|23|4>>
    <associate|eq:24|<tuple|24|4>>
    <associate|eq:25|<tuple|25|5>>
    <associate|eq:26|<tuple|26|5>>
    <associate|eq:27|<tuple|27|5>>
    <associate|eq:28|<tuple|28|5>>
    <associate|eq:29|<tuple|29|5>>
    <associate|eq:3|<tuple|3|2>>
    <associate|eq:30|<tuple|30|5>>
    <associate|eq:31|<tuple|31|5>>
    <associate|eq:32|<tuple|32|5>>
    <associate|eq:33|<tuple|33|5>>
    <associate|eq:34|<tuple|34|6>>
    <associate|eq:35|<tuple|35|6>>
    <associate|eq:36|<tuple|36|6>>
    <associate|eq:37|<tuple|37|6>>
    <associate|eq:38|<tuple|38|6>>
    <associate|eq:39|<tuple|39|6>>
    <associate|eq:4|<tuple|4|2>>
    <associate|eq:40|<tuple|40|6>>
    <associate|eq:41|<tuple|41|7>>
    <associate|eq:42|<tuple|42|7>>
    <associate|eq:43|<tuple|43|7>>
    <associate|eq:5|<tuple|5|2>>
    <associate|eq:6|<tuple|6|2>>
    <associate|eq:7|<tuple|7|3>>
    <associate|eq:8|<tuple|8|3>>
    <associate|eq:9|<tuple|9|3>>
    <associate|lem:ginverse|<tuple|3|4>>
    <associate|lem:orth|<tuple|2|4>>
    <associate|thm:devinatz|<tuple|5|6>>
    <associate|thm:equiv|<tuple|6|6>>
    <associate|thm:inverse|<tuple|4|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Spectral Formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Filter Formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Operator Formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Orthogonality of Oscillatory
      Functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Inverse Filter Kernel
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Inverse Filter Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Two-Sided
      Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Connection
      to Devinatz\UAronszajn Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Summary>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>