<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Second Quantization for a Free Particle on the Real
  Line: A Harmonic Oscillator Type Factorization>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <abstract-data|<\abstract>
    The standard construction is presented in which the Hamiltonian of a
    non-relativistic free particle on the real line is realized on a bosonic
    Fock space as a factorized sum of commuting number operators, each
    associated with a one-particle momentum mode and acting as a harmonic
    oscillator energy observable without an additive ground-state shift.
    Definitions of the underlying Hilbert spaces, operators, domains, and
    commutation relations are given. The main statements identify the
    one-particle Hamiltonian as a multiplication operator in momentum
    representation and show that its many-body second quantization equals the
    sum of mode energies times number operators. Proofs rely on the Fourier
    transform, the spectral theorem for self-adjoint operators unitarily
    equivalent to multiplication operators, and the functorial construction
    of creation and annihilation operators on bosonic Fock space. Canonical
    references include standard treatments of Fock space and second
    quantization as well as expositions of the Fourier transform and the
    Stone--von Neumann uniqueness of the canonical commutation relations.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>One-Particle
    Structure on the Real Line> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Hilbert space, Fourier transform, and
    momentum representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Spectral resolution
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Bosonic
    Fock Space and Mode Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Bosonic Fock space
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.2<space|2spc>Number operator and occupation numbers
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Second
    Quantization of the Free Hamiltonian>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>One-body operator as an energy
    multiplier <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.2<space|2spc>Many-body Hamiltonian as a factorized
    sum over modes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|3.3<space|2spc>Harmonic oscillator type structure in
    each mode <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Free
    Field Representation on Fock Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Plane-wave label and occupation
    numbers <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|4.2<space|2spc>Commutation structure and dynamics
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Field
    Representation in Position Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>Configuration representation via
    inverse Fourier transform <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Stone\Uvon
    Neumann Uniqueness and Representation Choice>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Summary
    of the Factorization Picture> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18><vspace|0.5fn>
  </table-of-contents>

  <section|One-Particle Structure on the Real Line>

  <subsection|Hilbert space, Fourier transform, and momentum representation>

  <\definition>
    [One-particle Hilbert space] Let <math|\<cal-H\><rsub|1>\<assign\>L<rsup|2><around|(|\<bbb-R\>,d*x|)>>
    with inner product <math|<around|\<langle\>|\<psi\>,\<varphi\>|\<rangle\>>=<big|int><rsub|\<bbb-R\>><wide|\<psi\><around|(|x|)>|\<bar\>><space|0.17em>\<varphi\><around|(|x|)>*<space|0.17em>d*x>.
  </definition>

  <\definition>
    [Fourier transform] Let <math|\<cal-F\>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    denote the unitary Fourier transform

    <\equation>
      <around|(|\<cal-F\>*\<psi\>|)><around|(|p|)>=<frac|1|<sqrt|2*\<pi\>*\<hbar\>>>*<big|int><rsub|\<bbb-R\>>e<rsup|-i*p*x/\<hbar\>>*\<psi\><around|(|x|)>*<space|0.17em>d*x
    </equation>

    defined first on <math|L<rsup|1><around|(|\<bbb-R\>|)>\<cap\>L<rsup|2><around|(|\<bbb-R\>|)>>
    and extended by density and unitarity.<footnote|See, e.g., standard
    spectral theory notes: the Fourier transform is unitary and diagonalizes
    translation operators, and it identifies
    <math|-<frac|\<hbar\><rsup|2>|2*m>*\<Delta\>> with multiplication by
    <math|<frac|p<rsup|2>|2*m>> <cite-detail|harvardfourier|Thm.<nbsp>10>,
    <cite-detail|kowalskispectral|Sec.<nbsp>1.6>,
    <cite-detail|feldmanlaplacian|Sec.<nbsp>2>.>
  </definition>

  <\definition>
    [Free one-particle Hamiltonian] Let

    <\equation>
      H<rsub|1>\<assign\>-<frac|\<hbar\><rsup|2>|2*m>*<space|0.17em><frac|d<rsup|2>|d*x<rsup|2>>
    </equation>

    with domain <math|\<cal-D\><around|(|H<rsub|1>|)>\<assign\>H<rsup|2><around|(|\<bbb-R\>|)>\<subset\>L<rsup|2><around|(|\<bbb-R\>|)>>.
  </definition>

  <\theorem>
    [Momentum representation of <math|H<rsub|1>>] Under <math|\<cal-F\>>, the
    operator <math|H<rsub|1>> is unitarily equivalent to multiplication by
    <math|\<varepsilon\><around|(|p|)>\<assign\><frac|p<rsup|2>|2*m>> on
    <math|L<rsup|2><around|(|\<bbb-R\>,d*p|)>> with domain

    <\equation>
      \<cal-D\><around|(|\<varepsilon\>|)>\<assign\><around*|{|<wide|\<psi\>|^>\<in\>L<rsup|2><around|(|\<bbb-R\>|)><mid|\|>\<varepsilon\>*<space|0.17em><wide|\<psi\>|^>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>|}>
    </equation>

    so that\ 

    <\equation>
      <around|(|\<cal-F\>*H<rsub|1>*\<cal-F\><rsup|-1>*<wide|\<psi\>|^>|)><around|(|p|)>=\<varepsilon\><around|(|p|)>*<wide|\<psi\>|^><around|(|p|)>
    </equation>

    \ for <math|<wide|\<psi\>|^>\<in\>\<cal-D\><around|(|\<varepsilon\>|)>>.<footnote|Self-adjointness
    and identification as a multiplication operator via the Fourier transform
    can be found in standard sources <cite-detail|kowalskispectral|Sec.<nbsp>1.6>,
    <cite-detail|feldmanlaplacian|pp.<nbsp>3--4>.>
  </theorem>

  <\proof>
    It is known that <math|H<rsub|1>> with domain
    <math|H<rsup|2><around|(|\<bbb-R\>|)>> is self-adjoint on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>. The Fourier transform
    <math|\<cal-F\>> is unitary on <math|L<rsup|2><around|(|\<bbb-R\>|)>> and
    maps derivatives to multiplications by <math|<around|(|i*p/\<hbar\>|)>>.
    Hence <math|\<cal-F\>\<circ\><frac|d<rsup|2>|d*x<rsup|2>>\<circ\>\<cal-F\><rsup|-1>>
    equals multiplication by <math|-<around|(|p/\<hbar\>|)><rsup|2>>.
    Therefore,

    <\equation>
      \<cal-F\>*H<rsub|1>*\<cal-F\><rsup|-1>=\<cal-F\>*<around*|(|-<frac|\<hbar\><rsup|2>|2*m>*<frac|d<rsup|2>|d*x<rsup|2>>|)>*\<cal-F\><rsup|-1>=<frac|p<rsup|2>|2*m><space|0.17em>
    </equation>

    as a multiplication operator on <math|L<rsup|2><around|(|\<bbb-R\>|)>>
    with the stated domain. The domain identification follows from standard
    facts about multiplication operators: the domain consists of those
    <math|<wide|\<psi\>|^>> such that <math|\<varepsilon\>*<space|0.17em><wide|\<psi\>|^>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>.
    Unitarity of <math|\<cal-F\>> yields the claim.
  </proof>

  <subsection|Spectral resolution>

  <\proposition>
    The spectral measure of <math|H<rsub|1>> is the push-forward of Lebesgue
    measure on <math|\<bbb-R\>> under\ 

    <\equation>
      p\<mapsto\>\<varepsilon\><around|(|p|)>=<frac|p<rsup|2>|2m>
    </equation>

    realized via <math|\<cal-F\>> as the spectral measure of the
    multiplication operator <math|\<varepsilon\><around|(|p|)>>.<footnote|For
    the spectral theorem description of self-adjoint operators as
    multiplication operators, see standard references
    <cite-detail|kowalskispectral|Ch.<nbsp>2>,
    <cite-detail|taylorst|Sec.<nbsp>2>, <cite-detail|danaspec|Lecture<nbsp>1>.>
  </proposition>

  <\proof>
    Since <math|H<rsub|1>> is unitarily equivalent to the multiplication
    operator <math|M<rsub|\<varepsilon\>>> on
    <math|L<rsup|2><around|(|\<bbb-R\>,d*p|)>>, the projection-valued measure
    of <math|H<rsub|1>> is <math|\<cal-F\><rsup|-1>*E<rsub|\<varepsilon\>>*\<cal-F\>>,
    where <math|E<rsub|\<varepsilon\>>> is the spectral measure of
    <math|M<rsub|\<varepsilon\>>>. The latter is determined by measurable
    subsets of <math|\<bbb-R\>> via multiplication by their indicator
    functions. The push-forward statement follows from the standard form of
    the spectral theorem for multiplication operators.
  </proof>

  <section|Bosonic Fock Space and Mode Operators>

  <subsection|Bosonic Fock space>

  <\definition>
    [Bosonic Fock space] Let <math|\<frak-h\>\<assign\>L<rsup|2><around|(|\<bbb-R\>,d*p|)>>
    and define the bosonic Fock space

    <\equation>
      \<cal-F\><rsub|+><around|(|\<frak-h\>|)>\<assign\><big|oplus><rsub|n=0><rsup|\<infty\>>\<frak-h\><rsup|\<otimes\><rsub|s>n>
    </equation>

    where <math|\<otimes\><rsub|s>> denotes the symmetric tensor product and
    the <math|0>-particle space is <math|\<bbb-C\>*\<Omega\>> with vacuum
    vector <math|\<Omega\>>.<footnote|Standard constructions appear in many
    introductions to second quantization <cite-detail|uiuc561|Sec.<nbsp>1.4>,
    <cite-detail|usp-3|Sec.<nbsp>3>, <cite-detail|libresecond|Sec.<nbsp>4.3>,
    <cite|scholarpedia>.>
  </definition>

  <\definition>
    [Creation and annihilation operators] For <math|f\<in\>\<frak-h\>> define
    <math|a<rsup|\<dagger\>><around|(|f|)>> and <math|a<around|(|f|)>> on the
    algebraic finite particle subspace by the usual ladder operations:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|a<rsup|\<dagger\>><around|(|f|)><around|(|\<psi\><rsup|<around|(|n|)>>|)>>|<cell|\<assign\><sqrt|n+1><space|0.17em><math-up|Sym><around|(|f\<otimes\>\<psi\><rsup|<around|(|n|)>>|)>>>>>>
    </equation>

    where the contraction against one slot of
    <math|\<psi\><rsup|<around|(|n|)>>> is

    <\equation>
      <tabular|<tformat|<table|<row|<cell|a<around|(|f|)><around|(|\<psi\><rsup|<around|(|n|)>>|)>>|<cell|\<assign\><sqrt|n>*<space|0.17em><around|\<langle\>|f,\<cdummy\>|\<rangle\>><rsub|\<frak-h\>>*>>>>>
    </equation>

    They extend to closed operators satisfying the canonical commutation
    relations

    <\equation>
      <around|[|a<around|(|f|)>,a<rsup|\<dagger\>><around|(|g|)>|]>=<around|\<langle\>|f,g|\<rangle\>><rsub|\<frak-h\>><math-up|id>
    </equation>

    <\equation>
      <around|[|a<around|(|f|)>,a<around|(|g|)>|]>=<around|[|a<rsup|\<dagger\>><around|(|f|)>,a<rsup|\<dagger\>><around|(|g|)>|]>=0
    </equation>
  </definition>

  <\definition>
    [Field of mode operators in momentum representation] For
    <math|f\<in\>\<frak-h\>> define the operator-valued distributions by

    <\equation>
      a<around|(|f|)>=<big|int><rsub|\<bbb-R\>><wide|f<around|(|p|)>|\<bar\>><space|0.17em>a<around|(|p|)>*<space|0.17em>d*p
    </equation>

    <\equation>
      a<rsup|\<dagger\>><around|(|f|)>=<big|int><rsub|\<bbb-R\>>f<around|(|p|)>*<space|0.17em>a<rsup|\<dagger\>><around|(|p|)>*<space|0.17em>d*p
    </equation>

    in the sense that\ 

    <\equation>
      <around|[|a<around|(|p|)>,a<rsup|\<dagger\>><around|(|q|)>|]>=\<delta\>*<around|(|p-q|)><space|0.17em><math-up|id>
    </equation>

    \ when tested against functions in <math|\<frak-h\>>.<footnote|Occupation-number
    representations are developed in many sources
    <cite-detail|uiuc561|Sec.<nbsp>1.4>, <cite|scholarpedia>,
    <cite-detail|libresecond|Sec.<nbsp>4.3>.>
  </definition>

  <subsection|Number operator and occupation numbers>

  <\definition>
    [Number operator] Define <math|>

    <\equation>
      N\<assign\><big|int><rsub|\<bbb-R\>>a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>*<space|0.17em>d*p
    </equation>

    \ on its natural quadratic form domain. For any orthonormal set
    <math|<around|{|e<rsub|k>|}>\<subset\>\<frak-h\>> <math|>

    <\equation>
      N=<big|sum><rsub|k>a<around|(|e<rsub|k>|)><rsup|\<dagger\>>*a<around|(|e<rsub|k>|)>
    </equation>

    \ in the strong resolvent sense on the finite-particle subspace.
  </definition>

  <\proposition>
    [Occupation number basis] Let <math|<around|{|e<rsub|k>|}>> be an
    orthonormal basis of <math|\<frak-h\>>. Vectors

    <\equation>
      <around|\||n<rsub|1>,n<rsub|2>,\<ldots\>|\<rangle\>>\<assign\><big|prod><rsub|k><frac|<around|(|a<rsup|\<dagger\>><around|(|e<rsub|k>|)>|)><rsup|n<rsub|k>>|<sqrt|n<rsub|k>!>>*\<Omega\>
    </equation>

    with finitely many nonzero <math|n<rsub|k>> span a dense subspace, and\ 

    <\equation>
      N\|n<rsub|1>,n<rsub|2>,\<ldots\>\<rangle\>=<around*|(|<big|sum><rsub|k>n<rsub|k>|)>\|n<rsub|1>,n<rsub|2>,\<ldots\>\<rangle\>
    </equation>

    <footnote|See, e.g., textbook expositions of Fock space and occupation
    numbers <cite-detail|uiuc561|Sec.<nbsp>1.4>,
    <cite-detail|libresecond|Sec.<nbsp>4.3>, <cite|scholarpedia>.>
  </proposition>

  <\proof>
    On the algebraic Fock space generated by monomials in
    <math|a<rsup|\<dagger\>><around|(|e<rsub|k>|)>> acting on
    <math|\<Omega\>>, the stated vectors form the standard occupation number
    basis with orthonormality following from the CCR and the vacuum
    relations. The finite linear span is dense by construction of
    <math|\<cal-F\><rsub|+><around|(|\<frak-h\>|)>> as the Hilbert
    completion. The action of <math|N> follows from
    <math|<around|[|N,a<rsup|\<dagger\>><around|(|e<rsub|k>|)>|]>=a<rsup|\<dagger\>><around|(|e<rsub|k>|)>>
    and <math|N*\<Omega\>=0>.
  </proof>

  <section|Second Quantization of the Free Hamiltonian>

  <subsection|One-body operator as an energy multiplier>

  <\definition>
    [One-body energy function] Let <math|>

    <\equation>
      \<varepsilon\><around|(|p|)>\<assign\><frac|p<rsup|2>|2*m>
    </equation>

    \ viewed as a measurable function on <math|\<bbb-R\>> and let
    <math|h\<assign\>M<rsub|\<varepsilon\>>> be the multiplication operator
    on <math|\<frak-h\>=L<rsup|2><around|(|\<bbb-R\>,d*p|)>> with domain

    <\equation>
      \<cal-D\><around|(|h|)>\<assign\><around|{|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>\<mid\>\<varepsilon\>*f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>|}>
    </equation>

    By the previous section, <math|h> is unitarily equivalent to
    <math|H<rsub|1>> via <math|\<cal-F\>>.<footnote|See the Fourier-transform
    characterization of the Laplacian and its functional calculus
    <cite-detail|kowalskispectral|Sec.<nbsp>1.6>,
    <cite-detail|feldmanlaplacian|pp.<nbsp>3--4>.>
  </definition>

  <subsection|Many-body Hamiltonian as a factorized sum over modes>

  <\definition>
    [Second quantization of <math|h>] Define the operator
    <math|d*\<Gamma\><around|(|h|)>> on <math|\<cal-F\><rsub|+><around|(|\<frak-h\>|)>>
    by its action on the <math|n>-particle sector as

    <\equation>
      d*\<Gamma\><around|(|h|)><mid|\|><rsub|\<frak-h\><rsup|\<otimes\><rsub|s>n>>\<assign\><big|sum><rsub|j=1><rsup|n>I\<otimes\>\<cdots\>\<otimes\><wide*|h|\<wide-underbrace\>><rsub|j<text|th>>\<otimes\>\<cdots\>\<otimes\>I
    </equation>

    with the natural domain consisting of finite vectors with each component
    in the corresponding domain and closure taken in the usual
    way.<footnote|Standard definitions of second quantization of one-body
    operators can be found in many references
    <cite-detail|uiuc561|Sec.<nbsp>1.4>, <cite-detail|usp-3|Sec.<nbsp>3>,
    <cite|scholarpedia>.>
  </definition>

  <\theorem>
    [Mode factorization of the many-body free Hamiltonian] Let
    <math|\<frak-h\>=L<rsup|2><around|(|\<bbb-R\>,d*p|)>> and
    <math|h=M<rsub|\<varepsilon\>>> with\ 

    <\equation>
      \<varepsilon\><around|(|p|)>=<frac|p<rsup|2>|2*m>
    </equation>

    Then on the finite-particle subspace,

    <\equation>
      d*\<Gamma\><around|(|h|)>=<big|int><rsub|\<bbb-R\>>\<varepsilon\><around|(|p|)>*<space|0.17em>a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>*<space|0.17em>d*p
    </equation>

    and for any orthonormal basis <math|<around|{|e<rsub|k>|}>> diagonalizing
    <math|h> (in the sense of <math|\<frak-h\>>-multiplication),

    <\equation>
      d*\<Gamma\><around|(|h|)>=<big|sum><rsub|k>\<lambda\><rsub|k>*<space|0.17em>a<around|(|e<rsub|k>|)><rsup|\<dagger\>>*a<around|(|e<rsub|k>|)>
    </equation>

    such that

    \;

    <\equation>
      h*e<rsub|k>=\<lambda\><rsub|k>*e<rsub|k>
    </equation>

    In particular, in the momentum representation,

    <\equation>
      H\<assign\>d*\<Gamma\><around|(|h|)>=<big|int><rsub|\<bbb-R\>><frac|p<rsup|2>|2*m>*<space|0.17em>a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>*<space|0.17em>d*p
    </equation>

    is a densely defined self-adjoint operator bounded from below by
    <math|0>.<footnote|The identity <math|d*\<Gamma\><around|(|h|)>=<big|sum>\<lambda\><rsub|k>*a<rsub|k><rsup|\<dagger\>>*a<rsub|k>>
    is standard; see discussions of one-body operators in second quantization
    <cite-detail|uiuc561|Sec.<nbsp>1.4>, <cite-detail|usp-3|Sec.<nbsp>3>,
    <cite|scholarpedia>.>
  </theorem>

  <\proof>
    Let <math|\<cal-D\><rsub|<math-up|fin>>> be the algebraic finite-particle
    subspace spanned by finite monomials in creation operators applied to
    <math|\<Omega\>>, with single-particle vectors in
    <math|\<cal-D\><around|(|h|)>>. On an <math|n>-particle vector
    <math|\<Psi\><rsup|<around|(|n|)>>\<in\>\<frak-h\><rsup|\<otimes\><rsub|s>n>>,

    <\equation>
      d*\<Gamma\><around|(|h|)>*\<Psi\><rsup|<around|(|n|)>>=<big|sum><rsub|j=1><rsup|n>h<rsub|j>*\<Psi\><rsup|<around|(|n|)>>
    </equation>

    For simple tensors <math|\<Psi\><rsup|<around|(|n|)>>=f<rsub|1>\<otimes\><rsub|s>\<cdots\>\<otimes\><rsub|s>f<rsub|n>>,

    <\equation>
      <around|\<langle\>|\<Psi\><rsup|<around|(|n|)>>,d*\<Gamma\><around|(|h|)>*\<Psi\><rsup|<around|(|n|)>>|\<rangle\>>=<big|sum><rsub|j=1><rsup|n><around|\<langle\>|f<rsub|j>,h*f<rsub|j>|\<rangle\>><rsub|\<frak-h\>>
    </equation>

    Since <math|h> is the multiplication by <math|\<varepsilon\>>

    <\equation>
      <around|\<langle\>|f,h*f|\<rangle\>>=<big|int>\<varepsilon\><around|(|p|)><around|\||f<around|(|p|)>|\|><rsup|2>*<space|0.17em>d*p
    </equation>

    Using the well-known identities

    <\equation>
      <big|int>a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>*<space|0.17em>d*p=N
    </equation>

    <\equation>
      a<rsup|\<dagger\>><around|(|f|)>*a<around|(|g|)>=<big|int><wide|g<around|(|p|)>|\<bar\>>f<around|(|p|)>*<space|0.17em>a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>*<space|0.17em>d*p
    </equation>

    valid as quadratic forms on <math|\<cal-D\><rsub|<math-up|fin>>>, one
    finds

    <\equation>
      <big|sum><rsub|j=1><rsup|n>h<rsub|j>=<big|int>\<varepsilon\><around|(|p|)>*<space|0.17em>a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>*<space|0.17em>d*p
    </equation>

    on <math|\<cal-D\><rsub|<math-up|fin>>>. If\ 

    <\equation>
      h*e<rsub|k>=\<lambda\><rsub|k>*e<rsub|k>
    </equation>

    \ with an orthonormal family <math|<around|{|e<rsub|k>|}>> (e.g., an
    <math|L<rsup|2>>-basis diagonalizing multiplication), then by expanding\ 

    <\equation>
      a<rsup|\<dagger\>><around|(|f|)>=<big|sum><rsub|k><around|\<langle\>|e<rsub|k>,f|\<rangle\>>*a<rsub|k><rsup|\<dagger\>>
    </equation>

    \ and the bilinearity of quadratic forms,

    <\equation*>
      <big|int>\<varepsilon\><around|(|p|)>*<space|0.17em>a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>*<space|0.17em>d*p=<big|sum><rsub|k>\<lambda\><rsub|k>*a<rsub|k><rsup|\<dagger\>>*a<rsub|k>
    </equation*>

    on <math|\<cal-D\><rsub|<math-up|fin>>>. Closability and self-adjointness
    follow from the Kato\URellich framework adapted to second quantization of
    nonnegative <math|h> together with the standard fact that
    <math|d*\<Gamma\><around|(|h|)>> is self-adjoint on the natural domain
    and satisfies\ 

    <\equation>
      <around|\<langle\>|\<Psi\>,d*\<Gamma\><around|(|h|)>*\<Psi\>|\<rangle\>>\<ge\>0
    </equation>

    \ for <math|\<Psi\>> in its form domain. The closure is independent of
    the representing orthonormal system.
  </proof>

  <subsection|Harmonic oscillator type structure in each mode>

  <\proposition>
    [Single-mode oscillator structure] Let <math|e\<in\>\<frak-h\>> with
    <math|<around|\<\|\|\>|e|\<\|\|\>>=1> and define
    <math|a\<assign\>a<around|(|e|)>>, <math|a<rsup|\<dagger\>>\<assign\>a<rsup|\<dagger\>><around|(|e|)>>,
    and <math|\<lambda\>\<assign\><around|\<langle\>|e,h*e|\<rangle\>>=<big|int>\<varepsilon\><around|(|p|)><around|\||e<around|(|p|)>|\|><rsup|2>*<space|0.17em>d*p>.
    Then on the algebra generated by <math|a<rsup|\<dagger\>>> on
    <math|\<Omega\>>,

    <\equation>
      <around|[|d*\<Gamma\><around|(|h|)>,a<rsup|\<dagger\>>|]>=\<lambda\>*<space|0.17em>a<rsup|\<dagger\>>
    </equation>

    <\equation>
      <around|[|d*\<Gamma\><around|(|h|)>,a|]>=-\<lambda\>*<space|0.17em>a<text|>
    </equation>

    <\equation>
      d*\<Gamma\><around|(|h|)>=\<lambda\>*<space|0.17em>a<rsup|\<dagger\>>*a+R
    </equation>

    where <math|R> commutes with <math|a> and <math|a<rsup|\<dagger\>>>.
    Consequently the energies along the tower
    <math|<around|{|<around|(|a<rsup|\<dagger\>>|)><rsup|n>*\<Omega\>|}><rsub|n\<ge\>0>>
    increase by <math|\<lambda\>> per quantum and the contribution of this
    mode to <math|H> equals <math|\<lambda\>*<space|0.17em>a<rsup|\<dagger\>>*a>.<footnote|See
    the standard ladder-commutator computation for one-body operators in Fock
    space <cite-detail|uiuc561|Sec.<nbsp>1.4>, <cite|scholarpedia>,
    <cite-detail|libresecond|Sec.<nbsp>4.3>.>
  </proposition>

  <\proof>
    Using <math|<around|[|a<around|(|f|)>,a<rsup|\<dagger\>><around|(|g|)>|]>=<around|\<langle\>|f,g|\<rangle\>>>,
    one computes\ 

    <\equation>
      <around|[|d*\<Gamma\><around|(|h|)>,a<rsup|\<dagger\>><around|(|f|)>|]>=a<rsup|\<dagger\>>*<around|(|h*f|)>
    </equation>

    \ on <math|\<cal-D\><rsub|<math-up|fin>>>. Taking <math|f=e> with
    <math|h*e=\<lambda\>*e> (e.g., if <math|e> is an eigenvector, or in
    general by decomposing relative to a spectral resolution and restricting
    to an eigenspace component), yields <math|<around|[|d*\<Gamma\><around|(|h|)>,a<rsup|\<dagger\>>|]>=\<lambda\>*a<rsup|\<dagger\>>>
    and by adjoint <math|<around|[|d*\<Gamma\><around|(|h|)>,a|]>=-\<lambda\>*a>.
    The equality <math|>

    <\equation>
      d*\<Gamma\><around|(|h|)>=\<lambda\>*a<rsup|\<dagger\>>*a+R
    </equation>

    \ follows by writing <math|d*\<Gamma\><around|(|h|)>> as the sum of its
    part along the one-dimensional subspace spanned by <math|e> and its part
    on the orthogonal complement, which commutes with <math|a> and
    <math|a<rsup|\<dagger\>>> because <math|a> and <math|a<rsup|\<dagger\>>>
    only change occupation in the <math|e>-mode.
  </proof>

  <\corollary>
    [Hamiltonian as a sum over oscillator number operators] Let
    <math|<around|{|e<rsub|k>|}>> be an orthonormal basis diagonalizing
    <math|h> with <math|h*e<rsub|k>=\<lambda\><rsub|k>*e<rsub|k>>. Then

    <\equation>
      H=d*\<Gamma\><around|(|h|)>=<big|sum><rsub|k>\<lambda\><rsub|k>*<space|0.17em>a<rsub|k><rsup|\<dagger\>>*a<rsub|k>
    </equation>

    and each <math|k>-mode contributes <math|\<lambda\><rsub|k>> per particle
    with no additive constant.<footnote|Compare with the standard harmonic
    oscillator Hamiltonian written in terms of number operators; here the
    ground energy shift is absent because <math|\<varepsilon\><around|(|p|)>>
    arises from a one-body kinetic energy rather than a single mechanical
    oscillator frequency <cite-detail|usp-3|Sec.<nbsp>3>,
    <cite|scholarpedia>.>
  </corollary>

  <\proof>
    This is the discrete-mode restatement of the theorem above.
  </proof>

  <section|Free Field Representation on Fock Space>

  <subsection|Plane-wave label and occupation numbers>

  <\definition>
    [Plane-wave label in momentum representation] Label single-particle modes
    by <math|p\<in\>\<bbb-R\>>, with <math|a<rsup|\<dagger\>><around|(|p|)>>
    creating a particle with momentum <math|p> and <math|a<around|(|p|)>>
    removing one, in the sense that for <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>,

    <\equation>
      a<rsup|\<dagger\>><around|(|f|)>=<big|int>f<around|(|p|)>*<space|0.17em>a<rsup|\<dagger\>><around|(|p|)>*<space|0.17em>d*p
    </equation>

    <\equation>
      a<around|(|f|)>=<big|int><wide|f<around|(|p|)>|\<bar\>><space|0.17em>a<around|(|p|)>*<space|0.17em>d*p
    </equation>
  </definition>

  <\theorem>
    [Free many-body Hamiltonian as an energy-weighted number operator] On the
    finite-particle subspace,

    <\equation>
      H=<big|int><rsub|\<bbb-R\>>\<varepsilon\><around|(|p|)>*<space|0.17em>a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>*<space|0.17em>d*p<text|>
    </equation>

    <\equation>
      \<varepsilon\><around|(|p|)>=<frac|p<rsup|2>|2*m>
    </equation>

    For vectors with finite occupation in measurable momentum sets, the
    energy is the integral of <math|\<varepsilon\>> weighted by the
    occupation density.<footnote|See <cite-detail|uiuc561|Sec.<nbsp>1.4>,
    <cite|scholarpedia>, <cite-detail|libresecond|Sec.<nbsp>4.3>.>
  </theorem>

  <\proof>
    The statement is the continuous-mode version of\ 

    <\equation*>
      d*\<Gamma\><around|(|h|)>=<big|sum><rsub|k>\<lambda\><rsub|k>*a<rsub|k><rsup|\<dagger\>>*a<rsub|k>
    </equation*>

    , with <math|\<lambda\><rsub|k>> replaced by
    <math|\<varepsilon\><around|(|p|)>> and the sum replaced by the integral
    against the spectral measure; the proof follows from the quadratic form
    computation in the proof of the earlier theorem, using the facts about
    <math|a<rsup|\<dagger\>><around|(|f|)>*a<around|(|g|)>> and the bilinear
    pairing in <math|\<frak-h\>>.
  </proof>

  <subsection|Commutation structure and dynamics>

  <\proposition>
    [Heisenberg evolution of modes] Let\ 

    <\equation>
      U<around|(|t|)>\<assign\>e<rsup|-i*t*H/\<hbar\>>
    </equation>

    Then for suitable domains

    <\equation>
      U<around|(|t|)><rsup|\<dagger\>>*a<around|(|p|)>*<space|0.17em>U<around|(|t|)>=e<rsup|-i*t*<space|0.17em>\<varepsilon\><around|(|p|)>/\<hbar\>>*a<around|(|p|)>
    </equation>

    <\equation>
      <space|2em>U<around|(|t|)><rsup|\<dagger\>>*a<rsup|\<dagger\>><around|(|p|)>*<space|0.17em>U<around|(|t|)>=e<rsup|+i*t*<space|0.17em>\<varepsilon\><around|(|p|)>/\<hbar\>>*a<rsup|\<dagger\>><around|(|p|)>
    </equation>
  </proposition>

  <\proof>
    Using\ 

    <\equation>
      H=<big|int>\<varepsilon\><around|(|q|)>*a<rsup|\<dagger\>><around|(|q|)>*a<around|(|q|)>*<space|0.17em>d*q
    </equation>

    \ and\ 

    <\equation>
      <around|[|a<around|(|p|)>,a<rsup|\<dagger\>><around|(|q|)>|]>=\<delta\>*<around|(|p-q|)>
    </equation>

    we have

    <\equation>
      <around|[|H,a<around|(|p|)>|]>=-\<varepsilon\><around|(|p|)>*a<around|(|p|)>
    </equation>

    <\equation>
      <around|[|H,a<rsup|\<dagger\>><around|(|p|)>|]>=+\<varepsilon\><around|(|p|)>*a<rsup|\<dagger\>><around|(|p|)>
    </equation>

    as quadratic forms on <math|\<cal-D\><rsub|<math-up|fin>>>. Stone's
    theorem for the one-parameter unitary group <math|U<around|(|t|)>>
    generated by <math|H> gives the Heisenberg equations\ 

    <\equation>
      <frac|d|d*t>*a<rsub|t><around|(|p|)>=<frac|i|\<hbar\>>*<around|[|H,a<rsub|t><around|(|p|)>|]>
    </equation>

    yielding the claimed exponentials.
  </proof>

  <section|Field Representation in Position Space>

  <subsection|Configuration representation via inverse Fourier transform>

  <\definition>
    [Configuration-space field operators] Define operator-valued
    distributions by

    <\equation>
      \<psi\><around|(|x|)>\<assign\><frac|1|<sqrt|2*\<pi\>*\<hbar\>>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*p*x/\<hbar\>>*<space|0.17em>a<around|(|p|)>*<space|0.17em>d*p<text|>
    </equation>

    <\equation>
      \<psi\><rsup|\<dagger\>><around|(|x|)>\<assign\><frac|1|<sqrt|2*\<pi\>*\<hbar\>>>*<big|int><rsub|\<bbb-R\>>e<rsup|-i*p*x/\<hbar\>>*<space|0.17em>a<rsup|\<dagger\>><around|(|p|)>*<space|0.17em>d*p
    </equation>

    Then\ 

    <\equation>
      <around|[|\<psi\><around|(|x|)>,\<psi\><rsup|\<dagger\>><around|(|y|)>|]>=\<delta\>*<around|(|x-y|)>
    </equation>

    \ and\ 

    <\equation>
      <around|[|\<psi\><around|(|x|)>,\<psi\><around|(|y|)>|]>=<around|[|\<psi\><rsup|\<dagger\>><around|(|x|)>,\<psi\><rsup|\<dagger\>><around|(|y|)>|]>=0
    </equation>

    \ in the sense of distributions.<footnote|The construction follows the
    usual passage between momentum and configuration labels
    <cite-detail|uiuc561|Sec.<nbsp>1.4>, <cite|scholarpedia>,
    <cite-detail|libresecond|Sec.<nbsp>4.3>.>
  </definition>

  <\theorem>
    [Hamiltonian in configuration variables] Formally,

    <\equation>
      H=<big|int><rsub|\<bbb-R\>>\<psi\><rsup|\<dagger\>><around|(|x|)>*<around*|(|-<frac|\<hbar\><rsup|2>|2*m>*<frac|d<rsup|2>|d*x<rsup|2>>|)>*\<psi\><around|(|x|)>*<space|0.17em>d*x
    </equation>

    with quadratic form domain specified by the requirement that
    <math|x\<mapsto\>\<psi\><around|(|x|)>*\<Psi\>> lie in
    <math|H<rsup|1><rsub|<math-up|loc>>> and <math|H*\<Psi\>> be in the Fock
    space. On the dense subspace of finite-particle vectors with one-particle
    components in <math|H<rsup|2><around|(|\<bbb-R\>|)>>, the right-hand side
    equals <math|d*\<Gamma\><around|(|H<rsub|1>|)>>.<footnote|The
    identification of <math|H> as the second quantization of <math|H<rsub|1>>
    in position variables is standard <cite-detail|uiuc561|Sec.<nbsp>1.4>,
    <cite|scholarpedia>, <cite-detail|libresecond|Sec.<nbsp>4.3>.>
  </theorem>

  <\proof>
    Substitute the inverse Fourier expressions for <math|\<psi\>> and
    <math|\<psi\><rsup|\<dagger\>>> into the momentum-space expression
    <math|>

    <\equation>
      H=<big|int>\<varepsilon\><around|(|p|)>*a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>*<space|0.17em>d*p
    </equation>

    \ and integrate against the exponential kernels to obtain the operator
    <math|-<frac|\<hbar\><rsup|2>|2*m>*\<partial\><rsub|x><rsup|2>> acting
    between <math|\<psi\><rsup|\<dagger\>>> and <math|\<psi\>>. The domain
    statement mirrors the one-particle identification and the second
    quantization of <math|H<rsub|1>>.
  </proof>

  <section|Stone\Uvon Neumann Uniqueness and Representation Choice>

  <\theorem>
    [Uniqueness of the CCR in one degree of freedom] For a system with one
    degree of freedom and irreducibility and regularity assumptions, the
    representation of the Weyl canonical commutation relations is unique up
    to unitary equivalence. In particular, the Schrödinger representation on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> and the momentum representation
    are unitarily equivalent.<footnote|See the Stone--von Neumann theorem:
    classical sources include <cite|svn-wiki> and expository mathematical
    treatments <cite|svnhistory>, <cite|summerssvn>.>
  </theorem>

  <\proof>
    The Weyl relations <math|>

    <\equation>
      W<around|(|\<xi\>|)>*W<around|(|\<eta\>|)>=e<rsup|-i*\<sigma\><around|(|\<xi\>,\<eta\>|)>/2>*W*<around|(|\<xi\>+\<eta\>|)>
    </equation>

    \ on a finite-dimensional symplectic space admit a unique (up to unitary
    equivalence) irreducible, strongly continuous representation. For one
    degree of freedom this identifies the Schrödinger representation on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> as unique up to unitary
    equivalence. Therefore the momentum and configuration realizations are
    unitarily equivalent, and the corresponding Fock constructions based on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> agree up to unitary equivalence.
  </proof>

  <section|Summary of the Factorization Picture>

  The operator <math|H<rsub|1>> on <math|L<rsup|2><around|(|\<bbb-R\>|)>>
  corresponds under the Fourier transform to multiplication by\ 

  <\equation>
    \<varepsilon\><around|(|p|)>=<frac|p<rsup|2>|2m>
  </equation>

  The bosonic Fock space over <math|L<rsup|2><around|(|\<bbb-R\>|)>> is
  equipped with creation and annihilation operators obeying the canonical
  commutation relations. The second quantization
  <math|H=d*\<Gamma\><around|(|h|)>> acts as an integral of
  <math|\<varepsilon\><around|(|p|)>> against the occupation number density
  <math|a<rsup|\<dagger\>><around|(|p|)>*a<around|(|p|)>>, hence as a
  factorized sum of independent harmonic-oscillator-type contributions for
  each momentum label, with energy per quantum
  <math|\<varepsilon\><around|(|p|)>> and no additive ground-state term. The
  unitary dynamics multiplies each mode by a phase
  <math|e<rsup|-i*t*\<varepsilon\><around|(|p|)>/\<hbar\>>>, and the
  position-space representation is obtained by inverse Fourier transform,
  giving <math|>

  <\equation>
    H=<big|int>\<psi\><rsup|\<dagger\>><around|(|x|)>*<around*|(|-<frac|\<hbar\><rsup|2>|2*m>*<frac|d<rsup|2>|d*x<rsup|2>>|)>*\<psi\><around|(|x|)>*<space|0.17em>d*x
  </equation>

  \ on the natural domain.<vspace|2fn>

  <\thebibliography|9>
    <bibitem|uiuc561>Second Quantization (PHYS 561 notes). University of
    Illinois. Available as a PDF.

    <bibitem|usp-3>Second Quantization (notes by G. T. Landi). Section on
    non-interacting systems and <math|H=<big|sum><rsub|k><frac|k<rsup|2>|2*m>*a<rsub|k><rsup|\<dagger\>>*a<rsub|k>>.

    <bibitem|libresecond>4.3: Second Quantization. Physics LibreTexts.

    <bibitem|scholarpedia>Second quantization. Scholarpedia.

    <bibitem|harvardfourier>Let's solve Schrödinger's equation for a particle
    on <math|\<bbb-R\>> with different boundary conditions (Fourier transform
    theorem and unitarity).

    <bibitem|kowalskispectral>E. Kowalski, Spectral theory in Hilbert spaces
    (ETH Zürich, FS 09).

    <bibitem|feldmanlaplacian>The Spectrum of Periodic Schrödinger Operators
    (Fourier transform unitarity and identification of
    <math|-<frac|1|2*m>*\<Delta\>> with a multiplication operator).

    <bibitem|svn-wiki>Stone\Uvon Neumann theorem (overview).

    <bibitem|svnhistory>A Selective History of the Stone\Uvon Neumann Theorem
    (Lionel).

    <bibitem|summerssvn>Summers, On the Stone\Uvon Neumann Uniqueness Theorem
    and Its Ramifications.

    <bibitem|taylorst>M. E. Taylor, The Spectral Theorem for Self-Adjoint and
    Unitary Operators.

    <bibitem|danaspec>Lecture Notes on the Spectral Theorem (Dana Williams).
  </thebibliography>
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
    <associate|auto-1|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-10|<tuple|3.3|7|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-11|<tuple|4|8|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-12|<tuple|4.1|8|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-13|<tuple|4.2|9|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-14|<tuple|5|9|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-15|<tuple|5.1|9|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-16|<tuple|6|10|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-17|<tuple|7|10|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-18|<tuple|62|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|1.1|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|1.2|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-5|<tuple|2.1|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-6|<tuple|2.2|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-7|<tuple|3|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-8|<tuple|3.1|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-9|<tuple|3.2|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-danaspec|<tuple|danaspec|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-feldmanlaplacian|<tuple|feldmanlaplacian|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-harvardfourier|<tuple|harvardfourier|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-kowalskispectral|<tuple|kowalskispectral|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-libresecond|<tuple|libresecond|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-scholarpedia|<tuple|scholarpedia|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-summerssvn|<tuple|summerssvn|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-svn-wiki|<tuple|svn-wiki|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-svnhistory|<tuple|svnhistory|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-taylorst|<tuple|taylorst|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-uiuc561|<tuple|uiuc561|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-usp-3|<tuple|usp-3|11|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-10|<tuple|10|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-11|<tuple|11|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-12|<tuple|12|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-13|<tuple|13|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-14|<tuple|14|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-15|<tuple|15|7|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-3|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-4|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-5|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-6|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-7|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-8|<tuple|8|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnote-9|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-1|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-10|<tuple|10|7|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-11|<tuple|11|8|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-12|<tuple|12|8|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-13|<tuple|13|9|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-14|<tuple|14|10|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-15|<tuple|15|10|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-3|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-4|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-5|<tuple|5|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-6|<tuple|6|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-7|<tuple|7|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-8|<tuple|8|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|footnr-9|<tuple|9|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      harvardfourier

      kowalskispectral

      feldmanlaplacian

      kowalskispectral

      feldmanlaplacian

      kowalskispectral

      taylorst

      danaspec

      uiuc561

      usp-3

      libresecond

      scholarpedia

      uiuc561

      scholarpedia

      libresecond

      uiuc561

      libresecond

      scholarpedia

      kowalskispectral

      feldmanlaplacian

      uiuc561

      usp-3

      scholarpedia

      uiuc561

      usp-3

      scholarpedia

      uiuc561

      scholarpedia

      libresecond

      usp-3

      scholarpedia

      uiuc561

      scholarpedia

      libresecond

      uiuc561

      scholarpedia

      libresecond

      uiuc561

      scholarpedia

      libresecond

      svn-wiki

      svnhistory

      summerssvn
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>One-Particle
      Structure on the Real Line> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Hilbert space, Fourier
      transform, and momentum representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Spectral resolution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Bosonic
      Fock Space and Mode Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Bosonic Fock space
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Number operator and
      occupation numbers <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Second
      Quantization of the Free Hamiltonian>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>One-body operator as an
      energy multiplier <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Many-body Hamiltonian as a
      factorized sum over modes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Harmonic oscillator type
      structure in each mode <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Free
      Field Representation on Fock Space>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Plane-wave label and
      occupation numbers <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Commutation structure and
      dynamics <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Field
      Representation in Position Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Configuration representation
      via inverse Fourier transform <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Stone\Uvon
      Neumann Uniqueness and Representation Choice>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Summary
      of the Factorization Picture> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>