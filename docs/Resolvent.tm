<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|The Historical Development of the Resolvent in
  Functional Analysis>|<doc-date|>>

  The term "resolvent" was coined by Hilbert for the operator first used by
  Fredholm in the late 19th century. Fredholm initiated a study of integral
  equations arising out of the study of partial differential equations. A
  parameter <math|\<lambda\>> was part of the integral equation, and this
  parameter had originally come out of separation of variables, the technique
  created by Fourier at the beginning of the 19th century to solve PDEs.

  The Fredholm integral equation of the second kind is formulated as

  <\equation>
    g<around|(|t|)>=f<around|(|t|)>+\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|s,t|)>*f<around|(|s|)>*d*s,
  </equation>

  where <math|g> is a given function, <math|K> a given kernel function,
  <math|\<lambda\>> a given parameter, and <math|f> is a function to be
  determined. It does not take much to see how this is related to the
  resolvent of the integral operator. Fredholm studied his equation by
  discretizing it and dealing with determinants of infinite matrices through
  limits; and he studied the dependence on the parameter <math|\<lambda\>>.
  It was in this context that the "resolvent" arose through looking at the
  dependence of the determinant on the parameter <math|\<lambda\>>. These
  techniques were new in the late 19th century when Fredholm did his work.

  It was realized that the solution as a function of <math|\<lambda\>> could
  be extended into the complex plane, and that the singularities of this
  function gave a lot of information about the problem at hand. For symmetric
  <math|K>, the singularities in <math|\<lambda\>> were real, were of first
  order, and the sum of the residues was the Fourier series of <math|g> with
  respect to the eigenfunctions of the problem.

  Hilbert incorporated Fredholm's resolvent into early analysis of operators
  on a Hilbert space. Fredholm was the first to give a general definition of
  a linear operator, and that was also incorporated into the early work. The
  use of Complex Analysis in connection with the resolvent also drove people
  in this direction. That brought linear operators, resolvent analysis, and
  complex analysis of the resolvent into the early work of Hilbert. Using
  this, Hilbert was able to give some of the earliest general proofs of
  <math|L<rsup|2>> convergence of generalized orthogonal function expansions
  arising out of Fourier Analysis of PDEs. General Operator Algebras and
  Spectral Theorem were not far behind.

  As a simple example, consider the operator
  <math|L*f=<frac|1|i>*f<rprime|'>> on the domain
  <math|\<cal-D\><around|(|A|)>\<subset\>L<rsup|2>*<around|[|0,2*\<pi\>|]>>
  consisting of all absolutely continuous functions <math|f> on
  <math|<around|[|0,2*\<pi\>|]>> with <math|f<around|(|0|)>=f*<around|(|2*\<pi\>|)>>
  and <math|f<rprime|'>\<in\>L<rsup|2>>. This is a selfadjoint operator with
  resolvent <math|<around|(|L-\<lambda\>*I|)><rsup|-1>*g> obtained by solving
  for <math|f> such that

  <\equation>
    <around|(|L-\<lambda\>*I|)>*f=g.
  </equation>

  The solution of this equation exists for all
  <math|\<lambda\>\<ne\>0,\<pm\>1,\<pm\>2,\<cdots\>>, and is given by solving
  a first order ODE problem for <math|f> as a function of <math|g>:

  <\equation>
    f=R<around|(|\<lambda\>|)>*g=<frac|e<rsup|i*\<lambda\>*x>|e<rsup|-2*\<pi\>*i*\<lambda\>>-1>*<big|int><rsub|0><rsup|2*\<pi\>>i*e<rsup|-i*\<lambda\>*t>*g<around|(|t|)>*d*t+e<rsup|i*\<lambda\>*x>*<big|int><rsub|0><rsup|x>i*e<rsup|-i*\<lambda\>*t>*g<around|(|t|)>*d*t.
  </equation>

  The resolvent has first order poles at every eigenvalue, and the residue at
  an integer <math|n> is

  <\equation>
    -<frac|1|2*\<pi\>>*e<rsup|i*n*x>*<big|int><rsub|0><rsup|2*\<pi\>>e<rsup|-i*n*t>*f<around|(|t|)>*d*t.
  </equation>

  The negative of the sum of all residues is the Fourier transform for
  <math|f>! You can imagine that such things might pique the imagination of
  early people in the field. Early proofs of the convergence of generalized
  Fourier expansions followed this procedure, and showed that the sum of the
  residues in the finite plane could be traded for a single residue at
  infinity, which could be shown to be the negative of the identity operator:

  <\equation>
    lim<rsub|\<lambda\>\<rightarrow\>\<pm\>i*\<infty\>>
    \<lambda\>*R<around|(|\<lambda\>|)>*f=lim<rsub|\<lambda\>\<rightarrow\>\<pm\>i*\<infty\>>
    <frac|\<lambda\>|<around|(|A-\<lambda\>*I|)>>*f=-f
  </equation>

  <\equation>
    \<Longrightarrow\><big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>>f<around|(|t|)>*e<rsup|-i*n*t>*d*t*e<rsup|i*n*x>=f<around|(|x|)>.
  </equation>

  This works for generalized Fourier series arising out of general equations.
  Adaptations can be used to prove pointwise convergence as well as the
  expected <math|L<rsup|2>> convergence. These are the types of problems that
  Functional Analysis was originally created to solve.

  The set of singularities of the resolvent was named "spectrum" by Hilbert.
  Wirtinger had earlier used the term "bandespectrum" because he saw a
  resemblance between the discrete singular values and optical atomic
  spectral bands. Oddly, the spectrum of operators would be found to be
  actual atomic spectrum in Quantum. So the name was also a nice fit for its
  later application to the new Quantum Theory that came a couple of decades
  later. Hilbert does not reference Wirtinger directly, but he probably saw
  the term in Wirtinger's work.

  <vspace*|1em><no-indent>(From J. Dieudonne, "A History of Functional
  Analysis," p. 150.)
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