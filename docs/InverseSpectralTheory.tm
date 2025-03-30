<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Inverse Spectral Theory: Part
  I>|<doc-author|<author-data|<author-name|<with|font-series|bold|Hiroshi
  Isozaki>>|<\author-affiliation>
    Department of Mathematics

    Tokyo Metropolitan University

    Hachioji, Minami-Osawa 192-0397

    \ Japan<next-line>E-mail: isozakih@comp.metro-u.ac.jp
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    \;

    Many self-adjoint operators appearing in mathematical physics and
    geometry have their spectral data: eigenvalues, informations of
    eigenvectors, scattering matrices. A natural attempt is the
    reconstruction of the original operator in terms of its spectral data.
    The precursor of this inverse spectral problem goes back at least to the
    Sturm\ULiouville theory of differential operators. The systematic study
    of inverse spectral problems has become active from early 20th century,
    and the interest on this subject is unceasingly growing up since then.

    The aim of this article is to give a brief survey of the inverse spectral
    problem for self-adjoint differential operators: boundary value problems
    and scattering problems for Schrödinger operators, Laplace\UBeltrami
    operators on Riemannian manifolds. Both of the 1-dimensional and the
    multi-dimensional problems are discussed. There is so extensive
    literature on the inverse problem that our arguments must be restricted
    to limited aspects of the subject. The basic feature I would like to
    stress is:

    One-dimensional spectral problems are smoothly deformable like
    <math|C<rsup|\<infty\>>>-functions, while multi-dimensional problems are
    rigid like analytic functions (at least in Euclidean spaces).
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Inverse Eigenvalue Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Theorem of Borg\ULevinson
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Global structure of isospectral
    potentials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.2.1<space|2spc>Isospectral Deformation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.3<space|2spc>Inverse Scattering
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|2tab|1.3.1<space|2spc>Scattering problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|2tab|1.3.2<space|2spc>Spherically symmetric potentials
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|2tab|1.3.3<space|2spc>Gel'fand\ULevitan theory
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|1.4<space|2spc>Generalized sine transformation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|1.5<space|2spc>The core of Gel'fand\ULevitan theory
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|1.6<space|2spc>What is the hidden mechanism?
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>
  </table-of-contents>

  <section|The Inverse Eigenvalue Problem>

  <subsection|Theorem of Borg\ULevinson>

  Consider the simplest case of the Dirichlet (zero) boundary value problen
  <math|\<forall\>x\<in\>><math|<around|(|0,1|)>>:

  <\equation>
    V<around|(|x|)>*y<around*|(|x|)>-<wide|y|\<ddot\>><around*|(|x|)>=\<lambda\>*y<around*|(|x|)>
  </equation>

  where <math|V<around|(|x|)>> is a real-valued potential,
  <math|y<around*|(|x|)>> is the wave function, and <math|\<lambda\>>
  represents the eigenvalue.

  The boundary conditions are given by:

  <\equation>
    y<around|(|0|)>=y<around|(|1|)>=0
  </equation>

  If <math|V<around|(|x|)>> is real-valued, the solution has a set of
  eigenvalues:

  <\equation>
    \<lambda\><rsub|1><around|(|V|)>\<less\>\<lambda\><rsub|2><around|(|V|)>\<less\>\<cdots\>\<less\>\<lambda\><rsub|n><around|(|V|)>\<less\>\<cdots\>
  </equation>

  The first question of the inverse eigenvalue problem is:

  <with|font-series|bold|Question:> If <math|\<lambda\><rsub|n><around|(|V<rsub|1>|)>=\<lambda\><rsub|n><around|(|V<rsub|2>|)>>
  for all <math|n\<geq\>1>, does <math|V<rsub|1>> coincide with
  <math|V<rsub|2>>? The answer is easily seen to be
  <with|font-series|bold|negative>. You have only to take
  <math|V<rsub|2><around|(|x|)>=V<rsub|1>*<around|(|1-x|)>\<neq\>V<rsub|1><around|(|x|)>>
  as a counter example. A potential <math|V<around|(|x|)>> is said to be
  <with|font-shape|italic|even> if <math|V<around|(|x|)>=V*<around|(|1-x|)>>.
  This parity is the only symmetry that the above Dirichlet problem has. The
  following theorem due to Borg and Levinson is the first uniqueness result
  up to symmetry.

  <\theorem>
    <dueto|Borg--Levinson>If <math|V<rsub|1><around*|(|x|)>> and
    <math|V<rsub|2><around*|(|x|)>> are even then

    <\equation>
      \<lambda\><rsub|n><around|(|V<rsub|1>|)>=\<lambda\><rsub|n><around|(|V<rsub|2>|)>\<forall\>n\<geqslant\>1
    </equation>

    implies that <math|V<rsub|1><around*|(|x|)>=V<rsub|2><around*|(|x|)>>.
  </theorem>

  If the potential is not even, one needs some auxiliary condition to prove
  the uniqueness. The second theorem, also due to Borg and Levinson, shows
  that the values of the derivatives of the eigenfunctions at the boundary
  serve this purpose.

  Let <math|y<around|(|x,\<lambda\>|)>> satisfy (1.1) and

  <\equation>
    y<around|(|0,\<lambda\>|)>=0
  </equation>

  <\equation>
    <wide|y|\<dot\>><around|(|0,\<lambda\>|)>=1
  </equation>

  Put

  <\equation>
    k<rsub|n><around|(|V|)>=<wide|y|\<dot\>><around|(|1,\<lambda\><rsub|n><around|(|V|)>|)>
  </equation>

  <\theorem>
    <dueto|2nd Borg--Levinson>If it is true that
    <math|\<forall\>n\<geqslant\>1>

    <\equation>
      \<lambda\><rsub|n><around|(|V<rsub|1>|)>=\<lambda\><rsub|n><around|(|V<rsub|2>|)>
    </equation>

    and

    <\equation>
      k<rsub|n><around|(|V<rsub|1>|)>=k<rsub|n><around|(|V<rsub|2>|)>
    </equation>

    then

    <\equation>
      Volterra<rsub|1>=V<rsub|2>
    </equation>
  </theorem>

  <subsection|Global structure of isospectral potentials>

  The set of potentials having the same eigenvalues is parametrized by
  <math|<around|{|k<rsub|n><around|(|V|)>|}><rsub|n=1><rsup|\<infty\>>>,
  which makes it possible to deform continuously the potential keeping the
  eigenvalues fixed. Let us formulate it rigorously.

  Let <math|L<rsup|2><rsub|R><around|(|0,1|)>> be the set of all real-valued
  <math|L<rsup|2>>-functions on <math|<around|(|0,1|)>> then
  <math|\<lambda\><rsub|n><around|(|V|)>> has an asymptotic expansion\ 

  <\equation>
    \<lambda\><rsub|n><around|(|V|)>=n<rsup|2>*\<pi\><rsup|2>+<big|int><rsub|0><rsup|1>V<around|(|x|)>*d*x+h<rsub|n><around|(|V|)>
    </equation>

  which satisifes

  <\equation>
    <space|1em><big|sum><rsub|n=1><rsup|\<infty\>><around|\<nobracket\>|h<rsub|n><around|(|V|\<nobracket\>>|)><rsup|2>\<less\>\<infty\>\<forall\>V<around*|(|x|)>\<in\>L<rsup|2><rsub|\<bbb-R\>><around|(|0,1|)>
  </equation>

  With this in mind, we put

  <\equation>
    \<mu\><rsub|0><around|(|V|)>=<big|int><rsub|0><rsup|1>V<around|(|x|)>*d*x
  </equation>

  and let <math|\<mu\><around|(|V|)>=<around|(|\<mu\><rsub|0><around|(|V|)>,\<mu\><rsub|1><around|(|V|)>,\<mu\><rsub|2><around|(|V|)>,\<ldots\>|)>>.
  Then <math|\<mu\>> is a map

  <\equation>
    \<mu\>:L<rsup|2><rsub|R><around|(|0,1|)>\<rightarrow\>\<bbb-R\>\<times\>l<rsup|2>\<assign\>S
  </equation>

  We also put <math|\<kappa\><around|(|V|)>=<around|(|\<kappa\><rsub|1><around|(|V|)>,\<kappa\><rsub|2><around|(|V|)>,\<ldots\>|)>>,
  where

  <\equation>
    \<kappa\><rsub|n><around|(|V|)>=log <around|(|-1|)><rsup|n>*k<rsub|n><around|(|V|)>
  </equation>

  and let <math|l<rsup|2>> be defined by

  <\equation>
    l<rsup|2>\<ni\>\<alpha\>=<around|(|\<alpha\><rsub|1>,\<alpha\><rsub|2>,\<ldots\>|)><space|1em>\<Leftrightarrow\><space|1em><big|sum><rsub|n=1><rsup|\<infty\>>\<alpha\><rsub|n><rsup|2>\<less\>\<infty\>
  </equation>

  <\theorem>
    \<kappa\>\<times\>\<mu\>: L<rsup|2><rsub|R>(0, 1) \<rightarrow\>l<rsup|2>
    \<times\>S is a real analytic isomorphism.
  </theorem>

  <\definition>
    Here a map between real Hilbert spaces is said to be <strong|real
    analytic> if it is continuously Fréchet differentiable on the
    complexification of the real Hilbert spaces.
  </definition>

  Theorem 1.3 characterizes the Dirichlet spectral data, the eigenvalues and
  the derivatives at the boundary of the eigenfunctions. Let

  <\equation>
    M<around|(|q|)>=<around|{|V\<in\>L<rsup|2><rsub|R><around|(|0,1|)>:\<lambda\><rsub|n><around|(|q|)>=\<lambda\><rsub|n><around|(|V|)>\<forall\>n\<geqslant\>1,q\<in\>L<rsup|2><rsub|R><around|(|0,1|)>|}>
  </equation>

  <\theorem>
    M(q) is a real analytic submanifold of \ L<rsup|2><rsub|R>(0, 1) and
    \ \<kappa\> is a global coordinate system on \ M(q).
  </theorem>

  Thus we have the following\ 

  <\corollary>
    \ <math|V<around|(|x|)>> can be continuously reshaped while keeping its
    eigenvalues fixed.
  </corollary>

  <\proof>
    TODO: show how varying <math|\<kappa\><rsub|1><around|(|V|)>> can
    accomplish this.
  </proof>

  <subsubsection|Isospectral Deformation>

  It is well-known that for two bounded operators <math|A> and <math|B>

  <\equation>
    \<sigma\>*<around|(|A*B|)>\<setminus\><around|{|0|}>=\<sigma\>*<around|(|B*A|)>\<setminus\><around|{|0|}>
  </equation>

  where <math|\<sigma\><around|(|A|)>> denotes the spectrum of <math|A>. The
  proof of (2.1) is elementary for the finite dimensional case, and the
  infinite dimensional case uses the equation

  <\equation>
    \<lambda\>*<around|(|A*B+\<lambda\>|)><rsup|-1>+A*<around|(|B*A+\<lambda\>|)><rsup|-1>*B=1
  </equation>

  For unbounded operators, (2.1) is also true if <math|A> is a densely
  defined closed operator and <math|B=A<rsup|\<ast\>>>. This is particularly
  useful in the application to one-dimensional problems. In fact,
  Crum<rsup|<math|11>> used this method, by a straightforward computation, to
  deform and remove eigenvalues of Sturm\ULiouville operators.

  The <strong|commutation metho>d has a long history, precursors of which are
  seen in the works of Jacobi<rsup|<math|41>> and Darboux<rsup|<math|12>>. We
  elucidate it here formally.

  Let <math|V\<in\>L<rsup|2><rsub|R><around|(|0,1|)>> and
  <math|\<varphi\><rsub|n>> be a Dirichlet eigenfunction of
  <math|-d<rsup|2>/d*x<rsup|2>+V<around|(|x|)>> with eigenvalue
  <math|\<lambda\><rsub|n>>. Ignoring the question of domain of all relevant
  operators, we put formally

  <\equation>
    A=\<varphi\><rsub|n>*<frac|d|d*x><around*|(|<frac|1|\<varphi\><rsub|n>>|)>
  </equation>

  <\equation>
    A<rsup|\<ast\>>=-<frac|1|\<varphi\><rsub|n>>*<frac|d|d*x>*<around|(|\<varphi\><rsub|n>*\<cdummy\>|)>
  </equation>

  Using

  <\equation>
    V*\<varphi\><rsub|n>-\<varphi\><rsub|n><rprime|''>=\<lambda\><rsub|n>*\<varphi\><rsub|n>
  </equation>

  we have

  <\equation>
    A<rsup|\<ast\>>*A=-<frac|d<rsup|2>|d*x<rsup|2>>+V<around|(|x|)>-\<lambda\><rsub|n>
  </equation>

  Therefore we will get <math|\<sigma\>*<around|(|A<rsup|\<ast\>>*A|)>\<setminus\><around|{|0|}>=\<sigma\>*<around|(|A*A<rsup|\<ast\>>|)>\<setminus\><around|{|0|}>>.
  However, the potential of <math|A*A<rsup|\<ast\>>> is not in
  <math|L<rsup|2>> in neighborhoods of the zeros of
  <math|\<varphi\><rsub|n><around|(|x|)>>. This causes troubles.

  The remedy comes from the <strong|double commutator>. Namely by taking

  <\equation>
    u=<frac|1|\<varphi\><rsub|n>>*<around*|(|a+b*<big|int><rsub|0><rsup|x>\<varphi\><rsub|n><around|(|t|)><rsup|2>*d*t|)>
  </equation>

  and putting

  <\equation>
    B=u*<frac|d|d*x><around*|(|<frac|1|u>|)>
  </equation>

  <\equation>
    B<rsup|\<ast\>>=-<frac|1|u>*<frac|d|d*x>*<around|(|u\<cdot\>|)>
  </equation>

  we have

  <\equation>
    A<rsup|\<ast\>>*A=B<rsup|\<ast\>>*B
  </equation>

  Furthermore, we have

  <\equation*>
    *<frac|B<rsup|\<ast\>>|u>=0
  </equation*>

  This shows that <math|V<around|(|x|)>> and
  <math|V<around|(|x|)>-<frac|d<rsup|2>|d*x<rsup|2>>*log
  <around|(|u*\<varphi\><rsub|n>|)>> have the same Dirichlet eigenvalues
  <math|<around|{|\<lambda\><rsub|n>|}><rsub|n=1><rsup|\<infty\>>>.

  Let us note that this commutation method does not work in multidimension.
  We show in Section 4 that there is no analogue of isospectral deformation
  of <math|-\<Delta\>+V> like Theorem 1.4.

  <subsection|Inverse Scattering>

  <subsubsection|Scattering problem>

  The concept of scattering experiment is as follows. One puts a target and
  projects a beam of particles. By observing the scattered particles, one
  tries to investigate the target. In the case of potential scattering in
  quantum mechanics, this process is described by the following Schrödinger
  equation in <math|\<bbb-R\><rsup|3>>:

  <\equation>
    <around|(|-\<Delta\>+V<around|(|x|)>|)>*\<psi\>=E*\<psi\>,
  </equation>

  where <math|E\<gtr\>0> denotes the energy of scattering particles and
  <math|V<around|(|x|)>> is a real function, which is assumed to be rapidly
  decreasing.

  The equation (3.1) has an infinite number of solutions. However, the
  solution corresponding to the above scattering process can be chosen
  uniquely under a suitable boundary condition at infinity, and has the
  following asymptotic expansion:

  <\equation>
    \<psi\>\<sim\>e<rsup|i*<sqrt|E>*x\<cdot\>\<omega\>>+<frac|e<rsup|i*<sqrt|E>*r>|r>*f<around|(|E;\<theta\>,\<omega\>|)>
  </equation>

  as <math|r=<around|\||x|\|>\<rightarrow\>\<infty\>>, <math|\<theta\>=x/r>.
  Here the first term of the right-hand side of (3.2) represents the incident
  plane wave having direction <math|\<omega\>\<in\>S<rsup|2>>, and the second
  term represents the scattered spherical wave.
  <math|f<around|(|E;\<theta\>,\<omega\>|)>> is called the scattering
  amplitude. <math|<around|\||f<around|(|E;\<theta\>,\<omega\>|)>|\|><rsup|2>>
  is called the differential cross section and denotes the ratio of number of
  particles reflected to the <math|\<theta\>> direction to number of incident
  particles with direction <math|\<omega\>>. This is the physically observed
  quantity.

  Time-dependent picture visualizes the scattering process more clearly. Let
  <math|H=-\<Delta\>+V<around|(|x|)>>. Then the behavior of the particle is
  described by a solution of the time-dependent Schrödinger equation
  <math|i*\<hbar\>*\<partial\><rsub|t>*u=H*u>, namely
  <math|u<around|(|t|)>=e<rsup|-i*H*t/\<hbar\>>*u>. In the remote past and
  the remote future, this particle runs very far from the scattering center.
  Since the potential <math|V<around|(|x|)>> decays rapidly, the behavior of
  the particle is approximately governed by <math|H<rsub|0>=-\<Delta\>> as
  <math|t\<rightarrow\>\<pm\>\<infty\>>. More precisely, there exist
  <math|u<rsub|\<pm\>>> such that <math|<around*|\||e<rsup|-i*t*H/\<hbar\>>*u-e<rsup|-i*t*H<rsub|0>*u<rsub|\<pm\>>>|\|>\<rightarrow\>0>
  as <math|t\<rightarrow\>\<pm\>\<infty\>>. This means that the incoming free
  particle <math|e<rsup|-i*t*H<rsub|0>*u<rsub|->>> is scattered into
  <math|e<rsup|-i*t*H<rsub|0>*u<rsub|+>>> after the collision. The operator

  <\equation>
    S:u<rsub|->\<mapsto\>u<rsub|+>
  </equation>

  is called the <with|font-shape|italic|scattering operator>. The structure
  of <math|S> is seen more explicitly in...by passing to the Fourier
  transformation

  <\equation>
    \<cal-F\>*u<around|(|\<xi\>|)>=<wide|u|^><around|(|\<xi\>|)>=<around|(|2*\<pi\>|)><rsup|-3/2,.>*<big|int><rsub|\<bbb-R\><rsup|3>>e<rsup|-i*\<xi\>\<cdot\>x>*u<around|(|x|)>*d*x
  </equation>

  In fact, we have

  <\equation>
    <wide|u|^><rsub|+>*<around|(|<sqrt|E>*\<theta\>|)>=<wide|u|^><around|(|<sqrt|E>*\<theta\>|)>-<frac|<sqrt|E>|2*\<pi\>*i>*<big|int><rsub|S<rsup|2>>f<around|(|E;\<theta\>,\<omega\>|)>*<wide|u|^><around|(|<sqrt|E>*\<omega\>|)>*d*\<omega\>
  </equation>

  where <math|f<around|(|E;\<theta\>,\<omega\>|)>> is the scattering
  amplitude which appeared in (3.2). This means that the operator

  <\equation>
    <wide|S|^>=\<cal-F\>*S*\<cal-F\><rsup|\<ast\>>
  </equation>

  acts only on the variable <math|\<omega\>\<in\>S<rsup|2>>. This is
  physically natural, since <math|H<rsub|0>*<wide|S|^>*<wide|S|^><rsup|\<ast\>>=<around|\||\<xi\>|\|><rsup|2>>
  and the energy is conserved during the scattering process.

  Let <math|<wide|S|^><around|(|E|)>> be the integral operator on
  <math|L<rsup|2><around|(|S<rsup|2>|)>>:

  <\equation>
    <wide|S|^><around|(|E|)>*\<psi\><around|(|\<theta\>|)>=\<psi\><around|(|\<theta\>|)>-<frac|<sqrt|E>|2*\<pi\>*i>*<big|int><rsub|S<rsup|2>>f<around|(|E;\<theta\>,\<omega\>|)>*\<psi\><around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  Then <math|<wide|S|^>> is written as

  <\equation>
    <around|(|<wide|S|^>*u|)>*<around|(|<sqrt|E>*\<theta\>|)>=<around|(|<wide|S|^><around|(|E|)>*u|)>*<around|(|<sqrt|E>*\<theta\>|)>
  </equation>

  <math|<wide|S|^><around|(|E|)>> is a unitary operator on
  <math|L<rsup|2><around|(|S<rsup|2>|)>> and is called the S-matrix.

  The inverse problem of scattering is now formulated as follows:

  <\equation*>
    <text|Given the scattering amplitude >f<around|(|E;\<theta\>,\<omega\>|)>,<text|reconstruct
    the potential >V<around|(|x|)>.
  </equation*>

  Physically, the differential cross section is the only observable quantity.
  However, since <math|<wide|S|^><around|(|E|)>> is unitary,
  <math|f<around|(|E;\<theta\>,\<omega\>|)>> satisfies an integral equation.
  Using this equation one can construct <math|f<around|(|E;\<theta\>,\<omega\>|)>>
  from the square of its modulus when <math|<around|\||f<around|(|E;\<theta\>,\<omega\>|)>|\|>>
  is sufficiently small. [See Martin (Ref. 52).]

  However, when the differential cross section is not small, this is no
  longer true. [See Newton (Ref. 60).]

  <subsubsection|Spherically symmetric potentials>

  When the potential <math|V<around|(|x|)>> is spherically symmetric,
  <math|V<around|(|x|)>=V<around|(|<around|\||x|\|>|)>>, the above problem is
  reduced to the one on the interval <math|<around|(|0,\<infty\>|)>> by the
  well-known procedure of partial wave expansion.Let <math|k=<sqrt|E>> and
  <math|r=<around|\||x|\|>>. Then the solution <math|\<psi\>> of (3.1)
  depends only on <math|r> and the angle between <math|\<omega\>> and
  <math|x>. Letting <math|\<theta\>> denote this angle, we expand
  <math|\<psi\>> as

  <\equation>
    \<psi\>=<frac|1|k*r>*<big|sum><rsub|l=0><rsup|\<infty\>><around|(|2*l+1|)>*u<rsub|l><around|(|r,k|)>*P<rsub|l><around|(|cos
    \<theta\>|)>
  </equation>

  where <math|P<rsub|l>> is the Legendre polynomial. Then by (3.1) and (3.2),
  <math|u<rsub|l><around|(|r,k|)>> satisfies

  <\equation>
    -<frac|d<rsup|2>|d*r<rsup|2>>*u<rsub|l><around|(|r,k|)>+<around*|[|V<around|(|r|)>+<frac|l*<around|(|l+1|)>|r<rsup|2>>|]>*u<rsub|l><around|(|r,k|)>=k<rsup|2>*u<rsub|l><around|(|r,k|)>
  </equation>

  <\equation>
    u<rsub|l><around|(|0,k|)>=0
  </equation>

  <\equation>
    u<rsub|l><around|(|r,k|)>\<sim\>sin <around|(|k*r-l*\<pi\>/2+\<delta\><rsub|l>|)>*<space|1em><text|as><space|1em>r\<rightarrow\>\<infty\>
  </equation>

  for some <math|\<delta\><rsub|l>\<in\>\<bbb-R\>>. This is called the phase
  shift and the scattering amplitude is written as

  <\equation>
    f<around|(|k,\<theta\>|)>=<frac|1|k>*<big|sum><rsub|l=0><rsup|\<infty\>><around|(|2*l+1|)>*e<rsup|i*\<delta\><rsub|l>>*sin
    \<delta\><rsub|l>*P<rsub|l><around|(|cos \<theta\>|)>
  </equation>

  In the following we pick up the case <math|l=0>.

  <subsubsection|Gel'fand\ULevitan theory>

  Let us consider the scattering theory on the half line described by the
  following equation

  <\equation>
    -<frac|d<rsup|2>|d*x<rsup|2>>*\<psi\><around|(|x,k|)>+V<around|(|x|)>*\<psi\><around|(|x,k|)>=k<rsup|2>*\<psi\><around|(|x,k|)>,<space|1em>0\<less\>x\<less\>\<infty\>
  </equation>

  <\equation>
    \<psi\><around|(|0,k|)>=0,<space|1em>k\<in\>\<bbb-R\>
  </equation>

  If <math|V<around|(|x|)>> decays sufficiently rapidly at infinity, the
  solution <math|\<psi\><around|(|x,k|)>> has the following asymptotics

  <\equation>
    \<psi\><around|(|x,k|)>\<approx\>C<around|(|k|)>*sin
    <around|(|k*x-\<delta\><around|(|k|)>|)>=<frac|C<around|(|k|)>|2*i>*<around*|(|e<rsup|i*\<delta\><around|(|k|)>>*e<rsup|i*k*x>-e<rsup|-i*\<delta\><around|(|k|)>>*e<rsup|-i*k*x>|)>*<space|1em><text|as><space|1em>x\<rightarrow\>\<infty\>.
  </equation>

  The term <math|e<rsup|i*k*x>> represents the outgoing wave and the term
  <math|e<rsup|-i*k*x>> represents the incoming wave. The correspondence
  <math|e<rsup|i*\<delta\><around|(|k|)>>\<mapsto\>e<rsup|-2*i*\<delta\><around|(|k|)>>>
  then defines the S-matrix. Hence we put

  <\equation>
    S<around|(|k|)>=e<rsup|-2*i*\<delta\><around|(|k|)>>
  </equation>

  The inverse scattering problem is rephrased as

  <with|font-shape|italic|Given> <math|S<around|(|k|)>>,
  <with|font-shape|italic|reconstruct> <math|V<around|(|x|)>>.

  The first complete solution of the one-dimensional inverse problem was
  given by Gel'fand\ULevitan. They reconstructed <math|V<around|(|x|)>> from
  the spectral function, which is the density function in the generalized
  eigenfunction expansion theory for Sturm\ULiouville operators. Krein and
  Marchenko completed the inverse scattering by showing the passage from
  <math|S<around|(|k|)>> to the spectral function. The completed theory
  contains a characterization of the scattering matrix and the reconstruction
  procedure. It is summarized in the following theorem.

  <\theorem>
    <dueto|Gel'fand--Levitan--Krein--Marchenko>In order that a
    <math|\<bbb-C\>>-valued function <math|S<around|(|k|)>> defined on
    <math|\<bbb-R\>> be the scattering matrix of a Schrödinger operator
    <math|H=-<frac|d<rsup|2>|d*x<rsup|2>>+V<around|(|x|)>> on
    <math|<around|(|0,\<infty\>|)>> with Dirichlet boundary condition at 0
    and a real-valued potential <math|V<around|(|x|)>> satisfying

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><around|\||x*V<around|(|x|)>|\|>*d*x\<less\>\<infty\>
    </equation>

    it is necessary and sufficient that

    <\itemize>
      <item><math|S<around|(|k|)>\<in\>C<around|(|\<bbb-R\>|)>,<around|\||S<around|(|k|)>|\|>=1,S<around|(|k|)>=S*<around|(|-k|)>>

      <item><math|S<around|(|k|)>-1=<frac|e<rsup|-i*k*t>|2*\<pi\>*i>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|(|F<rsub|1><around|(|t|)>+F<rsub|2><around|(|t|)>|)>*d*t>

      \ where\ 

      <math|F<rsub|1><around|(|t|)>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>,F<rsub|2><around|(|t|)>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>
      and <math|L<rsup|\<infty\>><around|(|\<bbb-R\>|)>>

      <item><math|arg S(0+)-arg S<around|(|\<infty\>|)>+<frac|\<pi\>|2>*<around|(|S<around|(|0|)>-1|)>=2*\<pi\>*m>s
    </itemize>

    where <math|m> is a non-negative integer.

    If <math|m=0>, the potential <math|V<around|(|x|)>> is uniquely
    determined. If <math|m\<gtr\>0>, there exists an <math|m>-parameter
    family of potentials having the same <math|S<around|(|k|)>> as the
    S-matrix.
  </theorem>

  In the above theorem, <math|m> is the number of discrete eigenvalues of
  <math|-d<rsup|2>/d*x<rsup|2>+V<around|(|x|)>>. The deformation of the
  potential keeping the S-matrix fixed is carried out by the method of
  commutation in Section 2.

  For the proof, see e.g., Faddeev (Ref. 20), or Marchenko (Ref. 51).

  <subsection|Generalized sine transformation>

  To study the spectral structure of <math|H> and the properties of S-matrix,
  the generalized sine transformation plays a key role. Let us recall that
  for a self-adjoint operator <math|A>, the absolutely continuous subspace
  for <math|A>, <math|\<cal-A\><rsub|a*c><around|(|A|)>>, is the set of all
  <math|u> such that <math|<around|(|E<around|(|\<lambda\>|)>*u,u|)>> is
  absolutely continuous with respect to <math|d*\<lambda\>>, where\ 

  <\equation>
    A=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<lambda\>*d*E<around|(|\<lambda\>|)>
  </equation>

  Now let <math|\<psi\><around|(|x,k|)>> be the solution of the equation

  <\equation>
    -\<psi\><rprime|''><around|(|x,k|)>+V<around|(|x|)>*\<psi\><around|(|x,k|)>=k<rsup|2>*\<psi\><around|(|x,k|)>\<forall\>x\<gtr\>0
  </equation>

  with

  <\equation>
    \<psi\><around|(|0,k|)>=0,<space|1em>\<psi\><rprime|'><around|(|0,k|)>=1
  </equation>

  where <math|<rprime|'>=d/d*x>. Then <math|\<psi\><around|(|x,k|)>> behaves
  like

  <\equation>
    \<psi\><around|(|x,k|)>=<frac|A<around|(|k|)>|k>*sin
    <around|(|k*x-\<delta\><around|(|k|)>|)>+o<around|(|1|)>
  </equation>

  as <math|x\<rightarrow\>\<infty\>>. We define

  <\equation>
    \<cal-F\>*u<around|(|k|)>=<big|int><rsub|0><rsup|\<infty\>>u<around|(|x|)>*\<psi\><rsup|+><around|(|x,k|)>*d*x
  </equation>

  <\equation>
    \<psi\><rsup|+><around|(|x,k|)>=<frac|\<psi\><around|(|x,k|)>|M<around|(|k|)>>,<space|1em>M<around|(|k|)>=A<around|(|k|)>*e<rsup|i*\<delta\><around|(|k|)>>
  </equation>

  Then <math|\<cal-F\>> is a unitary from
  <math|\<cal-A\><rsub|a*c><around|(|H|)>> to
  <math|L<rsup|2><around|(|<around|(|0,\<infty\>|)>;2*k<rsup|2>/\<pi\>*d*k|)>>,
  and we have the inversion formula for <math|u\<in\>\<cal-A\><rsub|a*c><around|(|H|)>>

  <\equation>
    u=<frac|2|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsup|+><around|(|x,k|)>*\<cal-F\>*u<around|(|k|)>*k<rsup|2>*d*k
  </equation>

  Moreover, <math|\<cal-F\>> diagonalizes <math|H>:

  <\equation>
    <around|(|\<cal-F\>*H*u|)><around|(|k|)>=k<rsup|2>*<around|(|\<cal-F\>*u|)><around|(|k|)>
  </equation>

  When <math|V<around|(|x|)>=0>, <math|\<cal-F\>> reduces to the sine
  transformation

  <\equation>
    \<cal-F\><rsub|0>*u<around|(|k|)>=<big|int><rsub|0><rsup|\<infty\>>u<around|(|x|)>*sin
    <around|(|k*x|)><frac|d*x|k><text|>
  </equation>

  <subsection|The core of Gel'fand\ULevitan theory>

  Let us explain the essence of Gel'fand\ULevitan theory. Let
  <math|\<psi\><around|(|x,k|)>> be as in (3.17) and (3.18). Then
  <math|\<psi\><around|(|x,k|)>> is an even and entire function of
  <math|k\<in\>\<bbb-C\>> satisfying

  <\equation>
    \<psi\><around|(|x,k|)>=<frac|sin k*x|k>+o<around*|(|<frac|e<rsup|<around|\||<text|Im>k|\|>*x>|<around|\||k|\|>>|)>
    as<around|\||k|\|>\<rightarrow\>\<infty\>
  </equation>

  Here we recall the Paley\UWiener theorem. An entire function
  <math|F<around|(|z|)>> is said to be of exponential type <math|\<sigma\>>
  if for any <math|\<varepsilon\>\<gtr\>0>, there exists
  <math|C<rsub|\<varepsilon\>>\<gtr\>0> such that

  <\equation>
    <around|\||F<around|(|z|)>|\|>\<leq\>C<rsub|\<varepsilon\>>*e<rsup|<around|(|\<sigma\>+\<varepsilon\>|)><around|\||z|\|>>\<forall\>z\<in\>\<bbb-C\><text|>
  </equation>

  <\theorem>
    <dueto|Paley--Wiener><math|F<around|(|x|)>> in
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> is extended to an entire function
    of exponential type <math|\<sigma\>> if and only if there exists
    <math|h\<in\>L<rsup|2><around|(|-\<sigma\>,\<sigma\>|)>> such that

    <\equation>
      F<around|(|z|)>=<big|int><rsub|-\<sigma\>><rsup|\<sigma\>>h<around|(|\<xi\>|)>*e<rsup|i*z*\<xi\>>*d*\<xi\>
    </equation>
  </theorem>

  By virtue of Paley\UWiener theorem and (3.25),
  <math|\<psi\><around|(|x,k|)>> has the following representation

  <\equation>
    \<psi\><around|(|x,k|)>=<frac|sin k*x|k>+<big|int><rsub|0><rsup|\<infty\>>K<around|(|x,y|)><frac|sin
    k*y|k>*d*y
  </equation>

  We insert this expression to the equation (3.17). Then <math|K> is shown to
  satisfy the equation

  <\equation>
    <around|(|\<partial\><rsub|y><rsup|2>-\<partial\><rsub|x><rsup|2>+V<around|(|x|)>|)>*K<around|(|x,y|)>=0
  </equation>

  The crucial fact is

  <\equation>
    <frac|d|d*x>*K<around|(|x,x|)>=V<around|(|x|)>
  </equation>

  One can further derive the following equation

  <\equation>
    K<around|(|x,y|)>+\<Omega\><around|(|x,y|)>+<big|int><rsub|0><rsup|\<infty\>>K<around|(|x,t|)>*\<Omega\><around|(|t,y|)>*d*t=0\<forall\><space|1em>x\<gtr\>y
  </equation>

  where <math|\<Omega\><around|(|x,y|)>> is a function constructed from the
  S-matrix and informations of bound states. This is called the
  Gel'fand\ULevitan equation.

  Thus the scenario of the reconstruction of <math|V<around|(|x|)>> is as
  follows. From the scattering matrix and the bound states, one constructs
  <math|\<Omega\><around|(|x,y|)>>. Solving (3.29) one gets
  <math|K<around|(|x,y|)>>. The potential <math|V<around|(|x|)>> is obtained
  by (3.28).

  <subsection|What is the hidden mechanism?>

  This is truly an ingenious trick and it is not easy to find the key fact
  behind their theory. It is Kay and Moses who studied an algebraic aspect of
  the Gel'fand\ULevitan method.

  Let <math|H<rsub|0>> and <math|H> be two self-adjoint operators. A unitary
  operator <math|U> from <math|\<cal-A\><rsub|a*c><around|(|H<rsub|0>|)>> to
  <math|\<cal-A\><rsub|a*c><around|(|H|)>> is said to
  <with|font-shape|italic|intertwine> <math|H<rsub|0>> and <math|H> if it
  satisfies

  <\equation>
    H*U=U*H<rsub|0>
  </equation>

  An important example of intertwining operator for
  <math|H<rsub|0>=-\<Delta\>> and <math|H=-\<Delta\>+V<around|(|x|)>> is the
  wave operator

  <\equation>
    W<rsub|\<pm\>>=s-lim<rsub|t\<to\>\<pm\>\<infty\>>
    e<rsup|i*t*H>*e<rsup|-i*t*H<rsub|0>>
  </equation>

  Another important example of intertwining operator is the so called
  spectral representation. Let <math|A> be self-adjoint and <math|I> be its
  absolutely continuous spectrum, <math|I=\<sigma\><around|(|\<cal-A\><rsub|a*c><around|(|A|)>|)>>.
  A unitary operator <math|T> from <math|\<cal-A\><rsub|a*c><around|(|A|)>>
  to <math|L<rsup|2><around|(|I;h|)>>, <math|h> being an auxiliary Hilbert
  space, is called a spectral representation of <math|A> if

  <\equation>
    <around|(|T*A*u|)><around|(|\<lambda\>|)>=\<lambda\>*<around|(|T*u|)><around|(|\<lambda\>|)>
    \<forall\>\<lambda\>\<in\>I,u\<in\>\<cal-A\><rsub|a*c><around|(|A|)>
  </equation>

  For <math|H<rsub|0>=-d<rsup|2>/d*x<rsup|2>> and
  <math|H=-d<rsup|2>/d*x<rsup|2>+V<around|(|x|)>> on
  <math|<around|(|0,\<infty\>|)>>, the above (generalized) sine
  transformations <math|\<cal-F\><rsub|0>> and <math|\<cal-F\>> are spectral
  representations. It is obvious that <math|U=\<cal-F\><rsup|\<ast\>>*\<cal-F\><rsub|0>>
  intertwines <math|H<rsub|0>> and <math|H>.

  It is also evident that if <math|U> intertwines
  <math|H<rsub|0>=-d<rsup|2>/d*x<rsup|2>> and
  <math|H=-d<rsup|2>/d*x<rsup|2>+V<around|(|x|)>>, then its kernel
  <math|U*<around|(|x,y|)>> satisfies

  <\equation>
    <around|(|-\<partial\><rsub|y><rsup|2>+V<around|(|x|)>|)>*U*<around|(|x,y|)>=-\<partial\><rsub|y><rsup|2>*U*<around|(|x,y|)>
  </equation>

  The spectral representation for the one-dimensional Schrödinger operator
  <math|H> has the following distinguished property. Let
  <math|\<psi\><rsup|<around|(|+|)>><around|(|x,k|)>> be as in (3.21). Let

  <\equation>
    U*<around|(|x,y|)>=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsup|<around|(|+|)>><around|(|x,k|)>*sin
    k*y<frac|2*k<rsup|2>|\<pi\>>*d*k,<space|1em>\<rho\><around|(|k|)>=<frac|2*k<rsup|2>|\<pi\>>
  </equation>

  be the integral kernel of the intertwining operator
  <math|\<cal-F\><rsup|\<ast\>>*\<cal-F\><rsub|0>>. In view of the formula
  (3.26), we have

  <\equation>
    U*<around|(|x,y|)>=\<delta\>*<around|(|x-y|)>+\<eta\>*<around|(|x-y|)>*K<around|(|x,y|)>
  </equation>

  where <math|\<eta\><around|(|t|)>> is the Heaviside function. Namely,
  <math|U> is an integral operator of Volterra type. The key fact discovered
  by Kay\UMoses is the following theorem.

  <\theorem>
    Let <math|H<rsub|0>=-<frac|d<rsup|2>|d*x<rsup|2>>> be defined on
    <math|<around|(|0,\<infty\>|)>> with Dirichlet boundary condition, and
    let <math|H=H<rsub|0>+Q> be a self-adjoint perturbation of
    <math|H<rsub|0>>. Suppose <math|U=I+K> intertwines <math|H<rsub|0>> and
    <math|H> and that <math|U> is Volterra, i.e. <math|K<around|(|x,y|)>=0>
    if <math|x\<less\>y>. Then <math|Q> is an operator of multiplication by

    <\equation>
      q<around|(|x|)>=2*<frac|d|d*x>*K<around|(|x,x|)>
    </equation>

    For <math|x\<gtr\>y>, the following equation holds

    <\equation>
      <around|(|\<partial\><rsup|2><rsub|y>-\<partial\><rsup|2><rsub|x>|)>*K<around|(|x,y|)>=q<around|(|x|)>*K<around|(|x,y|)>
    </equation>
  </theorem>

  <with|font-series|bold|Proof.> Let us content ourselves by the formal
  proof, since we are mainly interested in the algebraic or operator
  theoretical aspect of the Gel'fand\ULevitan theory.

  Since <math|U<around|(|x,y|)>=\<delta\>*<around|(|x-y|)>+\<eta\>*<around|(|x-y|)>*K<around|(|x,y|)>>
  satisfies the wave equation

  <\equation>
    <around|(|\<partial\><rsup|2><rsub|y>-\<partial\><rsup|2><rsub|x>|)>*U<around|(|x,y|)>=-<big|int><rsub|0><rsup|\<infty\>>Q<around|(|x,z|)>*U<around|(|z,y|)>*d*z
  </equation>

  we have

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>Q<around|(|x,z|)>*U<around|(|z,y|)>*d*z=2*\<delta\>*<around|(|x-y|)>*<frac|d|d*x>*K<around|(|x,x|)>+\<eta\>*<around|(|x-y|)>*q<around|(|x|)>*C<around|(|x,y|)>
  </equation>

  Since <math|U> is Volterra, so is <math|U<rsup|-1>>. Hence by multiplying
  <math|U<rsup|-1>> to the above equation we have

  <\equation>
    Q<around|(|x,y|)>=2*\<delta\>*<around|(|x-y|)>*<frac|d|d*x>*K<around|(|x,x|)>+\<eta\>*<around|(|x-y|)>*C<around|(|x,y|)>
  </equation>

  However, since <math|Q> is self-adjoint, <math|C<around|(|x,y|)>=0>, which
  proves

  <\equation>
    Q<around|(|x,y|)>=2*\<delta\>*<around|(|x-y|)>*<frac|d|d*x>*K<around|(|x,x|)><space|1em>\<square\>
  </equation>

  Let us summarize the above arguments. In the one-dimensional case, the
  generalized eigenfunction <math|\<psi\><around|(|x,k|)>> of the Schrödinger
  operator <math|H=-d<rsup|2>/d*x<rsup|2>+V<around|(|x|)>> has the triangular
  expression (3.26). This makes the intertwining operator
  <math|\<cal-F\><rsup|\<ast\>>*\<cal-F\><rsub|0>> into Volterra type. The
  potential <math|V<around|(|x|)>> is reconstructed from the kernel of this
  Volterra operator.

  An excellent exposition of the one-dimensional inverse scattering is the
  one given by Faddeev. A historical survey by Newton in the foreword of the
  monograph of Chadan\USabatier contains an extensive literature up to 1977.
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
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|1.5|10>>
    <associate|auto-11|<tuple|1.6|11>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-4|<tuple|1.2.1|4>>
    <associate|auto-5|<tuple|1.3|6>>
    <associate|auto-6|<tuple|1.3.1|6>>
    <associate|auto-7|<tuple|1.3.2|7>>
    <associate|auto-8|<tuple|1.3.3|8>>
    <associate|auto-9|<tuple|1.4|9>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Inverse Eigenvalue Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Theorem of Borg\ULevinson
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Global structure of
      isospectral potentials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Isospectral Deformation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Inverse Scattering
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|1.3.1<space|2spc>Scattering problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.3.2<space|2spc>Spherically symmetric
      potentials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|1.3.3<space|2spc>Gel'fand\ULevitan theory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Generalized sine
      transformation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>The core of
      Gel'fand\ULevitan theory <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|1.6<space|2spc>What is the hidden
      mechanism? <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>
    </associate>
  </collection>
</auxiliary>