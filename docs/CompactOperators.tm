<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Spectral Theory of Compact
  Operators>|<doc-author|<author-data|<author-name|The Collective
  Unconscious>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Spectral
    Theory of Matrices> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Compact
    Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Statement
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|3.2<space|2spc>Proof
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|2tab|Preliminary Lemmas
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|3.3<space|2spc>Invariant Subspaces
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|3.4<space|2spc>Invariant Subspaces
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.5<space|2spc>Operators with Compact Power
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>
  </table-of-contents>

  <section|Introduction>

  In functional analysis, compact operators are linear operators on Banach
  spaces that map bounded sets to relatively compact sets. In the case of a
  Hilbert space <math|H>, the compact operators are the closure of the finite
  rank operators in the uniform operator topology. In general, operators on
  infinite-dimensional spaces feature properties that do not appear in the
  finite-dimensional case, i.e. for matrices. The compact operators are
  notable in that they share as much similarity with matrices as one can
  expect from a general operator. In particular, the spectral properties of
  compact operators resemble those of square matrices. This article first
  summarizes the corresponding results from the matrix case before discussing
  the spectral properties of compact operators. The reader will see that most
  statements transfer verbatim from the matrix case. The spectral theory of
  compact operators was first developed by F. Riesz.

  <section|Spectral Theory of Matrices>

  The classical result for square matrices is the Jordan canonical form,
  which states the following:

  <\theorem>
    Let <math|A> be an <math|n\<times\>n> complex matrix, i.e. <math|A> a
    linear operator acting on <math|\<bbb-C\><rsup|n>>. If
    <math|\<lambda\><rsub|1>...*\<lambda\><rsub|k>> are the distinct
    eigenvalues of <math|A>, then <math|\<bbb-C\><rsup|n>> can be decomposed
    into the invariant subspaces of <math|A>:

    <\equation>
      \<bbb-C\><rsup|n>=<big|oplus><rsub|i=1><rsup|k>Y<rsub|i>
    </equation>

    The subspace <math|Y<rsub|i>=<text|Ker><around|(|\<lambda\><rsub|i>-A|)><rsup|m>>
    where Ker<math|<around|(|\<lambda\><rsub|i>-A|)><rsup|m>=<text|Ker><around|(|\<lambda\><rsub|i>-A|)><rsup|m+1>>.
    Furthermore, the poles of the resolvent function
    <math|\<zeta\>\<mapsto\><around|(|\<zeta\>-A|)><rsup|-1>> coincide with
    the set of eigenvalues of <math|A>.
  </theorem>

  <section|Compact Operators>

  <subsection|Statement>

  <\theorem>
    Let <math|X> be a Banach space, <math|C> be a compact operator acting on
    <math|X>, and <math|\<sigma\><around|(|C|)>> be the spectrum of <math|C>.

    <\enumerate>
      <item>Every nonzero <math|\<lambda\>\<in\>\<sigma\><around|(|C|)>> is
      an eigenvalue of <math|C>.

      <item>For all nonzero <math|\<lambda\>\<in\>\<sigma\><around|(|C|)>>,
      there exist <math|m> such that <text|Ker><math|<around|(|<around|(|\<lambda\>-C|)><rsup|m>|)>=<text|Ker><around|(|<around|(|\<lambda\>-C|)><rsup|m+1>|)>>,
      and this subspace is finite-dimensional.

      <item>The eigenvalues can only accumulate at 0. If the dimension of
      <math|X> is not finite, then <math|\<sigma\><around|(|C|)>> must
      contain 0.

      <item><math|\<sigma\><around|(|C|)>> is at most countably infinite.

      <item>Every nonzero <math|\<lambda\>\<in\>\<sigma\><around|(|C|)>> is a
      pole of the resolvent function <math|\<zeta\>\<mapsto\><around|(|\<zeta\>-C|)><rsup|-1>>.
    </enumerate>
  </theorem>

  <subsection|Proof>

  <subsubsection*|Preliminary Lemmas>

  The theorem claims several properties of the operator <math|\<lambda\>-C>
  where <math|\<lambda\>\<neq\>0>. Without loss of generality, it can be
  assumed that <math|\<lambda\>=1>. Therefore we consider <math|I-C>,
  <math|I> being the identity operator. The proof will require two lemmas.

  <\lemma>
    [Riesz's lemma] Let <math|X> be a Banach space and <math|Y\<subset\>X>,
    <math|Y\<neq\>X>, be a closed subspace. For all
    <math|\<varepsilon\>\<gtr\>0>, there exists <math|x\<in\>X> such that
    <math|<around|\<\|\|\>|x|\<\|\|\>>=1> and:

    <\equation>
      1-\<varepsilon\>\<leq\>d<around|(|x,Y|)>\<leq\>1
    </equation>

    where <math|d<around|(|x,Y|)>> is the distance from <math|x> to <math|Y>.
  </lemma>

  This fact will be used repeatedly in the argument leading to the theorem.
  Notice that when <math|X> is a Hilbert space, the lemma is trivial.

  <\lemma>
    If <math|C> is compact, then Ran<math|<around|(|I-C|)>> is closed.
  </lemma>

  <\proof>
    Let <math|<around|(|I-C|)>*x<rsub|n>\<to\>y> in norm. If
    <math|<around|{|x<rsub|n>|}>> is bounded, then compactness of <math|C>
    implies that there exists a subsequence <math|x<rsub|n<rsub|k>>> such
    that <math|C*x<rsub|n<rsub|k>>> is norm convergent. So
    <math|x<rsub|n<rsub|k>>=<around|(|I-C|)>*x<rsub|n<rsub|k>>+C*x<rsub|n<rsub|k>>>
    is norm convergent, to some <math|x>. This gives
    <math|<around|(|I-C|)>*x<rsub|n<rsub|k>>\<to\><around|(|I-C|)>*x=y>.

    The same argument goes through if the distances
    <math|d<around|(|x<rsub|n>,<text|Ker><around|(|I-C|)>|)>> is bounded. But
    <math|d<around|(|x<rsub|n>,<text|Ker><around|(|I-C|)>|)>> must be
    bounded. Suppose this is not the case. Pass now to the quotient map of
    <math|<around|(|I-C|)>>, still denoted by <math|<around|(|I-C|)>>, on
    <math|X/<text|Ker><around|(|I-C|)>>. The quotient norm on
    <math|X/<text|Ker><around|(|I-C|)>> is still denoted by
    <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>>>, and
    <math|<around|{|x<rsub|n>|}>> are now viewed as representatives of their
    equivalence classes in the quotient space.

    Take a subsequence <math|<around|{|x<rsub|n<rsub|k>>|}>> such that
    <math|<around|\<\|\|\>|x<rsub|n<rsub|k>>|\<\|\|\>>\<gtr\>k> and define a
    sequence of unit vectors by <math|z<rsub|n<rsub|k>>=x<rsub|n<rsub|k>>/<around|\<\|\|\>|x<rsub|n<rsub|k>>|\<\|\|\>>>.
    Again we would have <math|<around|(|I-C|)>*z<rsub|n<rsub|k>>\<to\><around|(|I-C|)>*z>
    for some <math|z>. Since <math|<around|\<\|\|\>|<around|(|I-C|)>*z<rsub|n<rsub|k>>|\<\|\|\>>=<around|\<\|\|\>|<around|(|I-C|)>*x<rsub|n<rsub|k>>|\<\|\|\>>/<around|\<\|\|\>|x<rsub|n<rsub|k>>|\<\|\|\>>\<to\>0>,
    we have <math|<around|(|I-C|)>*z=0> i.e.
    <math|z\<in\><text|Ker><around|(|I-C|)>>. Since we passed to the quotient
    map, <math|z=0>. This is impossible because <math|z> is the norm limit of
    a sequence of unit vectors. Thus the lemma is proven.
  </proof>

  <subsection|Invariant Subspaces>

  As in the matrix case, the above spectral properties lead to a
  decomposition of <math|X> into invariant subspaces of a compact operator
  <math|C>. Let <math|\<lambda\>\<neq\>0> be an eigenvalue of <math|C>; so
  <math|\<lambda\>> is an isolated point of <math|\<sigma\><around|(|C|)>>.
  Using the holomorphic functional calculus, define the Riesz projection
  <math|E<around|(|\<lambda\>|)>> by:

  <\equation>
    E<around|(|\<lambda\>|)>=<frac|<big|int><rsub|\<gamma\>><around|(|\<xi\>-C|)><rsup|-1>*d*\<xi\>|2*\<pi\>*i>*
  </equation>

  where <math|\<gamma\>> is a Jordan contour that encloses only
  <math|\<lambda\>> from <math|\<sigma\><around|(|C|)>>. Let <math|Y> be the
  subspace <math|Y=E<around|(|\<lambda\>|)>*X>.

  <math|C> restricted to <math|Y> is a compact invertible operator with
  spectrum <math|<around|{|\<lambda\>|}>>, therefore <math|Y> is
  finite-dimensional. Let <math|\<nu\>> be such that
  Ker<math|<around|(|\<lambda\>-C|)><rsup|\<nu\>>=<text|Ker><around|(|\<lambda\>-C|)><rsup|\<nu\>+1>>.
  By inspecting the Jordan form, we see that
  <math|<around|(|\<lambda\>-C|)><rsup|\<nu\>>=0> while
  <math|<around|(|\<lambda\>-C|)><rsup|\<nu\>-1>\<neq\>0>. The Laurent series
  of the resolvent mapping centered at <math|\<lambda\>> shows that:

  <\equation>
    E<around|(|\<lambda\>|)>*<around|(|\<lambda\>-C|)><rsup|\<nu\>>=<around|(|\<lambda\>-C|)><rsup|\<nu\>>*E<around|(|\<lambda\>|)>=0
  </equation>

  So <math|Y=<text|Ker><around|(|\<lambda\>-C|)><rsup|\<nu\>>>.

  The <math|E<around|(|\<lambda\>|)>> satisfy
  <math|E<around|(|\<lambda\>|)><rsup|2>=E<around|(|\<lambda\>|)>>, so that
  they are indeed projection operators or spectral projections. By definition
  they commute with <math|C>. Moreover <math|E<around|(|\<lambda\>|)>*E<around|(|\<mu\>|)>=0>
  if <math|\<lambda\>\<neq\>\<mu\>>.

  <\itemize>
    <item>Let <math|X<around|(|\<lambda\>|)>=E<around|(|\<lambda\>|)>*X> if
    <math|\<lambda\>> is a non-zero eigenvalue. Thus
    <math|X<around|(|\<lambda\>|)>> is a finite-dimensional invariant
    subspace, the generalised eigenspace of <math|\<lambda\>>.

    <item>Let <math|X<around|(|0|)>> be the intersection of the kernels of
    the <math|E<around|(|\<lambda\>|)>>. Thus <math|X<around|(|0|)>> is a
    closed subspace invariant under <math|C> and the restriction of <math|C>
    to <math|X<around|(|0|)>> is a compact operator with spectrum
    <math|<around|{|0|}>>.
  </itemize>

  <subsection|Invariant Subspaces>

  As in the matrix case, the above spectral properties lead to a
  decomposition of <math|X> into invariant subspaces of a compact operator
  <math|C>. Let <math|\<lambda\>\<neq\>0> be an eigenvalue of <math|C>; so
  <math|\<lambda\>> is an isolated point of <math|\<sigma\><around|(|C|)>>.
  Using the holomorphic functional calculus, define the Riesz projection
  <math|E<around|(|\<lambda\>|)>> by:

  <\equation>
    E<around|(|\<lambda\>|)>=<frac|<big|int><rsub|\<gamma\>><around|(|\<xi\>-C|)><rsup|-1>*d*\<xi\>|2*\<pi\>*i>*
  </equation>

  where <math|\<gamma\>> is a Jordan contour that encloses only
  <math|\<lambda\>> from <math|\<sigma\><around|(|C|)>>. Let <math|Y> be the
  subspace <math|Y=E<around|(|\<lambda\>|)>*X>.

  <math|C> restricted to <math|Y> is a compact invertible operator with
  spectrum <math|<around|{|\<lambda\>|}>>, therefore <math|Y> is
  finite-dimensional. Let <math|\<nu\>> be such that
  Ker<math|<around|(|\<lambda\>-C|)><rsup|\<nu\>>=<text|Ker><around|(|\<lambda\>-C|)><rsup|\<nu\>+1>>.
  By inspecting the Jordan form, we see that
  <math|<around|(|\<lambda\>-C|)><rsup|\<nu\>>=0> while
  <math|<around|(|\<lambda\>-C|)><rsup|\<nu\>-1>\<neq\>0>. The Laurent series
  of the resolvent mapping centered at <math|\<lambda\>> shows that:

  <\equation>
    E<around|(|\<lambda\>|)>*<around|(|\<lambda\>-C|)><rsup|\<nu\>>=<around|(|\<lambda\>-C|)><rsup|\<nu\>>*E<around|(|\<lambda\>|)>=0
  </equation>

  So <math|Y=<text|Ker><around|(|\<lambda\>-C|)><rsup|\<nu\>>>.

  The <math|E<around|(|\<lambda\>|)>> satisfy
  <math|E<around|(|\<lambda\>|)><rsup|2>=E<around|(|\<lambda\>|)>>, so that
  they are indeed projection operators or spectral projections. By definition
  they commute with <math|C>. Moreover <math|E<around|(|\<lambda\>|)>*E<around|(|\<mu\>|)>=0>
  if <math|\<lambda\>\<neq\>\<mu\>>.

  <\itemize>
    <item>Let <math|X<around|(|\<lambda\>|)>=E<around|(|\<lambda\>|)>*X> if
    <math|\<lambda\>> is a non-zero eigenvalue. Thus
    <math|X<around|(|\<lambda\>|)>> is a finite-dimensional invariant
    subspace, the generalised eigenspace of <math|\<lambda\>>.

    <item>Let <math|X<around|(|0|)>> be the intersection of the kernels of
    the <math|E<around|(|\<lambda\>|)>>. Thus <math|X<around|(|0|)>> is a
    closed subspace invariant under <math|C> and the restriction of <math|C>
    to <math|X<around|(|0|)>> is a compact operator with spectrum
    <math|<around|{|0|}>>.
  </itemize>

  <subsection|Operators with Compact Power>

  If <math|B> is an operator on a Banach space <math|X> such that
  <math|B<rsup|n>> is compact for some <math|n>, then the theorem proven
  above also holds for <math|B>.
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_67.tm>>
    <associate|auto-2|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_67.tm>>
    <associate|auto-3|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_67.tm>>
    <associate|auto-4|<tuple|3.1|2|../.TeXmacs/texts/scratch/no_name_67.tm>>
    <associate|auto-5|<tuple|3.2|2|../.TeXmacs/texts/scratch/no_name_67.tm>>
    <associate|auto-6|<tuple|3.2|2|../.TeXmacs/texts/scratch/no_name_67.tm>>
    <associate|auto-7|<tuple|3.3|3|../.TeXmacs/texts/scratch/no_name_67.tm>>
    <associate|auto-8|<tuple|3.4|4|../.TeXmacs/texts/scratch/no_name_67.tm>>
    <associate|auto-9|<tuple|3.5|4|../.TeXmacs/texts/scratch/no_name_67.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Spectral
      Theory of Matrices> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Compact
      Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Statement
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Proof
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|Preliminary Lemmas
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Invariant Subspaces
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Invariant Subspaces
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.5<space|2spc>Operators with Compact Power
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>
    </associate>
  </collection>
</auxiliary>