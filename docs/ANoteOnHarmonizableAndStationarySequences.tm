<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|A NOTE ON HARMONIZABLE AND STATIONARY
  SEQUENCES>|<doc-author|<author-data|<author-name|JOSE L. ABREU>>>>

  In this paper we prove that harmonizable Hilbert sequences are projections
  of stationary ones, and we use this result to give a sufficient condition
  for a harmonizable sequence to be deterministic.

  Z will denote the set of integers; <math|T<rsup|n>> the n-dimensional torus
  for <math|n=1,2,\<ldots\>> and <math|C<around|(|T<rsup|n>|)>> the space of
  continuous complex valued functions on <math|T<rsup|n>>. For every
  <math|f,g\<in\>C<around|(|T|)>>, <math|f\<otimes\>g> will denote the tensor
  product of <math|f> and <math|g>, i.e. <math|<around|(|f\<otimes\>g|)><around|(|s,t|)>=f<around|(|s|)>*g<around|(|t|)>>
  for <math|s,t\<in\>T>. It is clear that
  <math|f\<otimes\>g\<in\>C<around|(|T<rsup|2>|)>> whenever
  <math|f,g\<in\>C<around|(|T|)>>. c.l.s will stand for closed linear span
  and l.s. for linear span.

  Let <math|H> be a Hilbert space with inner product <math|(,)> and let
  <math|x<rsub|n>\<in\>H> for <math|n\<in\>Z>. Define
  <math|H<rsub|\<infty\>><around|(|x|)>=<text|c.l.s.><around|{|x<rsub|n>:n\<in\>Z|}>>;
  <math|H<rsub|n><around|(|x|)>=<text|c.l.s.><around|{|x<rsub|k>:k\<leq\>n|}>>
  for each <math|n\<in\>Z>, and <math|H<rsub|-\<infty\>><around|(|X|)>=\<cap\><rsub|n\<in\>Z>H<rsub|n><around|(|x|)>>.
  The Hilbert sequence <math|<around|{|x<rsub|n>|}>> is deterministic if
  <math|H<rsub|-\<infty\>><around|(|x|)>=H<rsub|\<infty\>><around|(|x|)>>,
  and it is linearly free if <math|H<rsub|-\<infty\>><around|(|x|)>=<around|{|0|}>>.

  The covariance of a Hilbert sequence <math|<around|{|x<rsub|n>|}>> is
  defined by <math|B<around|(|m,n|)>=<around|(|x<rsub|m>,x<rsub|n>|)>> for
  <math|m,n\<in\>Z>. The Hilbert sequence <math|<around|{|x<rsub|n>|}>> is
  stationary if its covariance depends only on the difference <math|m-n>.

  A Hilbert sequence <math|<around|{|x<rsub|n>|}>> is called harmonizable
  <cite|cramer1|cramer2> if for some complex valued Borel measure
  <math|\<mu\>> on <math|T<rsup|2>>

  <\equation>
    <around|(|x<rsub|m>,x<rsub|n>|)>=<big|int><big|int><rsub|T<rsup|2>>e<rsup|2*\<pi\>*i*<around|(|m*x-n*y|)>>*d*\<mu\><around|(|x,y|)>
  </equation>

  for every <math|m,n\<in\>Z>. <math|\<mu\>> is called the covariance measure
  of <math|<around|{|x<rsub|n>|}>>.

  A Hilbert sequence <math|<around|{|x<rsub|n>|}>> is stationary if and only
  if it is harmonizable and its covariance measure is concentrated on the
  diagonal of <math|T<rsup|2>>.

  <\theorem>
    If <math|<around|{|x<rsub|n>|}>> is a harmonizable Hilbert sequence then
    there exists a Hilbert space <math|H<rprime|'>> containing
    <math|H<rsub|\<infty\>><around|(|x|)>> as a subspace, and a stationary
    Hilbert sequence <math|<around|{|z<rsub|n>|}>\<subset\>H<rprime|'>> such
    that if <math|P:H<rprime|'>\<to\>H<rsub|\<infty\>><around|(|x|)>> is the
    orthogonal projection, then <math|x<rsub|n>=P*z<rsub|n>> for every
    <math|n\<in\>Z>.
  </theorem>

  <\proof>
    Let <math|\<mu\>> be the covariance measure of
    <math|<around|{|x<rsub|n>|}>>, and let <math|<around|\||\<mu\>|\|>>
    denote the total variation of <math|\<mu\>>. Then
    <math|<around|\||\<mu\>|\|>> is a positive, finite and symmetric Borel
    measure on <math|T<rsup|2>>. Let <math|\<mu\><rsub|0>> be the finite
    positive Borel measure on <math|T> defined by

    <\equation>
      \<mu\><rsub|0><around|(|\<Delta\>|)>=<around|\||\<mu\>|\|>*<around|(|\<Delta\>\<times\>T|)>=<frac|1|2>*<around|(|<around|\||\<mu\>|\|>*<around|(|\<Delta\>\<times\>T|)>+<around|\||\<mu\>|\|>*<around|(|T\<times\>\<Delta\>|)>|)>
    </equation>

    for each Borel subset <math|\<Delta\>> of <math|T>. Then for every
    continuous complex valued function <math|f> on <math|T>, we have

    <\equation>
      <big|int><rsub|T>f*d*\<mu\><rsub|0>=<frac|1|2>*<big|int><big|int><rsub|T<rsup|2>>f\<otimes\>1*d*<around|\||\<mu\>*<around|\||+<frac|1|2>*<big|int><big|int><rsub|T<rsup|2>>1\<otimes\>f*d|\|>*\<mu\>|\|>.
    </equation>

    Let <math|\<phi\>\<in\>C<around|(|T|)>>. Then

    <\equation>
      0\<leq\><big|int><big|int><rsub|T<rsup|2>>\<phi\>\<otimes\>\<phi\>*d*\<mu\>\<leq\><big|int><big|int><rsub|T<rsup|2>><around|\||\<phi\>\<otimes\>\<phi\>|\|>*d<around|\||\<mu\>|\|>
    </equation>

    But <math|<around|\||\<phi\><around|(|t|)>*\<phi\><around|(|s|)>|\|>\<leq\><frac|1|2>*<around|(|<around|\||\<phi\><around|(|t|)>|\|><rsup|2>+<around|\||\<phi\><around|(|s|)>|\|><rsup|2>|)>>
    for <math|t,s\<in\>T>. Therefore

    <\equation>
      <big|int><big|int><rsub|T<rsup|2>><around|\||\<phi\>\<otimes\>\<phi\>|\|>*d<around|\||\<mu\>|\|>\<leq\><frac|1|2>*<big|int><big|int><rsub|T<rsup|2>><around|\||\<phi\>|\|><rsup|2>\<otimes\>1*d<around|\||\<mu\>|\|>+<frac|1|2>*<big|int><big|int><rsub|T<rsup|2>>1\<otimes\><around|\||\<phi\>|\|><rsup|2>*d<around|\||\<mu\>|\|>
    </equation>

    and in using (3) we obtain

    <\equation>
      <big|int><big|int><rsub|T<rsup|2>>\<phi\>\<otimes\>\<phi\>*d*\<mu\>\<leq\><big|int><rsub|T><around|\||\<phi\>|\|><rsup|2>*d*\<mu\><rsub|0>
    </equation>

    Let <math|\<mu\><rsub|1>> be the Borel measure on <math|T<rsup|2>> which
    is concentrated in the diagonal and satisfies

    <\equation>
      <big|int><big|int><rsub|T<rsup|2>>f*<around|(|x,y|)>*d*\<mu\><rsub|1><around|(|x,y|)>=<big|int><rsub|T>f*<around|(|x,x|)>*d*\<mu\><rsub|0><around|(|x|)>
    </equation>

    for every <math|f\<in\>C<around|(|T<rsup|2>|)>>. Now define
    <math|\<mu\><rsub|2>=\<mu\><rsub|1>-\<mu\>>. From (6) it follows that

    <\equation>
      0\<leq\><big|int><big|int><rsub|T<rsup|2>>\<phi\>\<otimes\>\<phi\>*d*\<mu\><rsub|2>
    </equation>

    for every <math|\<phi\>\<in\>C<around|(|T|)>>. Therefore
    <math|\<mu\><rsub|2>> is the covariance measure of some harmonizable
    Hilbert sequence <math|<around|{|y<rsub|n>|}>>. (For example let
    <math|<around|(|f,g|)><rsub|2>=<big|int><big|int><rsub|T<rsup|2>>f\<otimes\><wide|g|\<bar\>>*d*\<mu\><rsub|2>>
    for <math|f,g\<in\>C<around|(|T|)>>. Let
    ker<math|\<mu\><rsub|2>=<around|{|f\<in\>C<around|(|T|)>:<around|(|f,f|)><rsub|2>=0|}>>
    and define <math|H<rprime|''>> to be the Hilbert space obtained by
    completing <math|C<around|(|T|)>/<text|ker>\<mu\><rsub|2>> with respect
    to the norm <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|2>=<around|(|f,f|)><rsub|2><rsup|1/2>>.
    Then let <math|y<rsub|n>> be the image of the function
    <math|x\<mapsto\>e<rsup|2*\<pi\>*i*n*x>> under the canonical map
    <math|C<around|(|T|)>\<to\>H<rprime|''>> for each <math|n\<in\>Z>.) Now
    put <math|H<rsub|\<infty\>><around|(|y|)>=<text|c.l.s.><around|{|y<rsub|n>:n\<in\>Z|}>>
    and let <math|H<rprime|'>=H<rsub|\<infty\>><around|(|x|)>\<oplus\>H<rsub|\<infty\>><around|(|y|)>>.
    Identify <math|H<rsub|\<infty\>><around|(|x|)>> with the subspace
    <math|H<rsub|\<infty\>><around|(|x|)>\<oplus\><around|{|0|}>> of
    <math|H<rprime|'>>. <math|(,)<rsub|1>> will denote the innerproduct in
    <math|H<rprime|'>> and <math|(,)<rsub|2>> will denote the innerproduct in
    <math|H<rsub|\<infty\>><around|(|y|)>>.

    Let <math|z<rsub|n>=x<rsub|n>+y<rsub|n>> for each <math|n\<in\>Z>. Then
    <math|<around|(|z<rsub|m>,z<rsub|n>|)><rsub|1>=<around|(|x<rsub|m>,x<rsub|n>|)>+<around|(|y<rsub|m>,y<rsub|n>|)><rsub|2>>
    for <math|m,n\<in\>Z>. Hence the covariance measure of
    <math|<around|{|z<rsub|n>|}>> is <math|\<mu\>+\<mu\><rsub|2>=\<mu\><rsub|1>>
    which shows that <math|<around|{|z<rsub|n>|}>> is stationary.

    Finally, if <math|P:H<rprime|'>\<to\>H<rsub|\<infty\>><around|(|x|)>>
    denotes the orthogonal projection onto
    <math|H<rsub|\<infty\>><around|(|x|)>>, it is obvious by construction
    that <math|x<rsub|n>=P*z<rsub|n>> for each <math|n\<in\>Z>.
  </proof>

  We have shown that harmonizable Hilbert sequences are projections of
  stationary Hilbert sequences. Furthermore, the measure
  <math|\<mu\><rsub|0>> determining the covariance of the stationary sequence
  obtained is given by <math|\<mu\><rsub|0><around|(|\<Delta\>|)>=<around|\||\<mu\>|\|>*<around|(|\<Delta\>\<times\>T|)>>
  for each Borel set <math|\<Delta\>\<subset\>T>, where <math|\<mu\>> is the
  covariance measure of the harmonizable Hilbert sequence.

  <\proposition>
    Let <math|H<rprime|'>> and <math|H<rprime|''>> be two Hilbert spaces and
    <math|A:H<rprime|'>\<to\>H<rprime|''>> a bounded linear transformation.
    Let <math|<around|{|x<rsub|n>|}>\<subset\>H<rprime|'>> be a deterministic
    Hilbert sequence. Then <math|<around|{|A*x<rsub|n>|}>\<subset\>H<rprime|''>>
    is also a deterministic Hilbert sequence.
  </proposition>

  <\proof>
    l.s.<math|<around|{|A*x<rsub|n>;n\<leq\>k|}>=A<around|(|<text|l.s.><around|{|x<rsub|n>:n\<leq\>k|}>|)>>
    for every <math|k>. Since <math|A> is continuous it follows that

    <\equation>
      <text|c.l.s.><around|{|A*x<rsub|n>:n\<leq\>k|}>\<supset\>A<around|(|<text|c.l.s.><around|{|x<rsub|n>:n\<leq\>k|}>|)>*<space|1em>k\<in\>Z
    </equation>

    But since <math|<around|{|x<rsub|n>|}>> is deterministic,
    <math|H<rsub|k><around|(|x|)>=H<rsub|-\<infty\>><around|(|x|)>> and
    therefore

    <\equation>
      <text|c.l.s.><around|{|A*x<rsub|n>:n\<leq\>k|}>\<supset\>A<around|(|H<rsub|-\<infty\>><around|(|x|)>|)>
    </equation>

    and since <math|A<around|(|H<rsub|-\<infty\>><around|(|x|)>|)>> is dense
    in c.l.s.<math|<around|{|A*x<rsub|n>:n\<in\>Z|}>> it follows that for
    every <math|k\<in\>Z>

    <\equation>
      <text|c.l.s.><around|{|A*x<rsub|n>:n\<leq\>k|}>=<text|c.l.s.><around|{|A*x<rsub|n>:n\<in\>Z|}>
    </equation>

    therefore <math|<around|{|A*x<rsub|n>|}>> is deterministic.
  </proof>

  Combining this proposition with the previous theorem we obtain that if the
  stationary sequence <math|<around|{|z<rsub|n>|}>>, whose projection onto
  <math|H<rsub|\<infty\>><around|(|x|)>> is <math|<around|{|x<rsub|n>|}>>, is
  deterministic, then <math|<around|{|x<rsub|n>|}>> is deterministic too.

  A well-known result for stationary sequences <cite|doob|rozanov> says that
  a necessary and sufficient condition for <math|<around|{|z<rsub|n>|}>> to
  be deterministic is that

  <\equation>
    <big|int><rsub|0><rsup|1>log G<rprime|'><around|(|t|)>*d*t=-\<infty\>
  </equation>

  where <math|G<around|(|t|)>=\<mu\><rsub|0><around|(|<around|[|0,t|)>|)>>
  for every <math|t\<in\><around|(|0,1|]>>. We just proved:

  <\corollary>
    If <math|<around|{|x<rsub|n>|}>> is a harmonizable Hilbert sequence whose
    covariance measure is <math|\<mu\>>, then a sufficient condition for
    <math|<around|{|x<rsub|n>|}>> to be deterministic is that

    <\equation>
      <big|int><rsub|0><rsup|1>log G<rprime|'><around|(|t|)>*d*t=-\<infty\>
    </equation>

    where

    <\equation>
      G<around|(|t|)>=<around|\||\<mu\>|\|>*<around|(|<around|[|0,t|)>\<times\>T|)>\<forall\>t\<in\><around|(|0,1|]>
    </equation>
  </corollary>

  This result was proved by Cramér <cite|cramer1|cramer2> and later by Dudley
  <cite|dudley> using a different approach, this new proof shows clearly that
  it is essentially an application of the results known for stationary
  sequences.

  The characterization of linearly free and deterministic Hilbert sequences
  in terms of their covariance distributions has been studied by Dudley
  <cite|dudley>. Whether deterministic harmonizable Hilbert sequences can be
  characterized analytically or not seems to be an open problem.

  To conclude this paper we prove that it is not necessary for a Hilbert
  sequence to be harmonizable in order to be the projection of a stationary
  Hilbert sequence.

  Let <math|<around|{|e<rsub|n>|}>>, <math|n\<in\>Z> be an orthonormal
  sequence in a Hilbert space <math|H>. Define the Hilbert sequence
  <math|<around|{|x<rsub|n>|}>> as follows: <math|x<rsub|n>=0> if
  <math|n\<leq\>0>; <math|x<rsub|n>=e<rsub|n>> if <math|n\<gtr\>0>.

  Let <math|P:H\<to\>H<rsub|\<infty\>><around|(|x|)>> be the projection
  operator onto <math|H<rsub|\<infty\>><around|(|x|)>=<text|c.l.s.><around|{|e<rsub|n>:n\<gtr\>0|}>>.
  Then <math|x<rsub|n>=P*e<rsub|n>> for every <math|n\<in\>Z>.
  <math|<around|{|e<rsub|n>|}>> is obviously a stationary Hilbert sequence.
  However, <math|<around|{|x<rsub|n>|}>> is not harmonizable. Indeed, suppose
  <math|\<mu\>> is the covariance measure of <math|<around|{|x<rsub|n>|}>>.
  The Fourier coefficients of <math|\<mu\>> are

  <\equation>
    <wide|\<mu\>|^><around|(|m,n|)>=<big|int><big|int><rsub|T<rsup|2>>e<rsup|2*\<pi\>*i*<around|(|m*x+n*y|)>>*d*\<mu\><around|(|x,y|)>=<around|(|x<rsub|m>,x<rsub|-n>|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1>|<cell|<text|if
    >m=-n\<gtr\>0>>|<row|<cell|0>|<cell|<text|otherwise>.>>>>>|\<nobracket\>>
  </equation>

  Thus <math|<wide|\<mu\>|^><around|(|m,n|)>> vanishes outside the cone
  <math|<around|{|<around|(|m,n|)>\<in\>Z<rsup|2>:m=-n\<gtr\>0|}>>. Therefore
  by a theorem of Bochner (see <cite|helson> or <cite|bochner>), it follows
  that <math|\<mu\>> is absolutely continuous with respect to Lebesgue
  measure and, by the Riemann-Lebesgue lemma,
  <math|<wide|\<mu\>|^><around|(|m,n|)>\<to\>0> as
  <math|m<rsup|2>+n<rsup|2>\<to\>\<infty\>>. This is false according to (11).
  Hence <math|<around|{|x<rsub|n>|}>> is not harmonizable.

  This paper is part of the Ph.D. Thesis which was presented by the author to
  the department of Mathematics of the Massachusetts Institute of Technology
  on June, 1970. The author wishes to express his gratitude to Dr. Richard M.
  Dudley for his guidance in the preparation of the original manuscript.

  <\with|par-mode|left>
    <\padded-left-aligned>
      FACULTAD DE CIENCIAS E<next-line>INSTITUTO DE GEOFÍSICA DE
      LA<next-line>UNIVERSIDAD NACIONAL AUTÓNOMA DE MÉXICO.
    </padded-left-aligned>
  </with>

  <\thebibliography|99>
    <bibitem|cramer1>H. Cramér, On some classes of non-stationary stochastic
    processes. Proc. IV Berkeley Symp. on Math. Stat. Prob. 2, 57-78. Univ.
    of California Press.

    <bibitem|cramer2>H. Cramér, On the structure of purely non-deterministic
    stochastic processes, Ark. Mat. 4 (1961), 249-66.

    <bibitem|doob>J. L. Doob, Stochastic Processes, Wiley, New York, 1953.

    <bibitem|rozanov>Y. A. Rozanov. Stationary Random Processes, Holden-Day,
    San Francisco, Cal., 1967.

    <bibitem|dudley>R. M. Dudley, Prediction theory for non-stationary
    sequences. Proc. V. Berkeley Symp. on Math. Stat. Prob. 2, 223-34. Univ.
    of California Press.

    <bibitem|helson>H. Helson and D. Lowdenslager, Prediction theory and
    Fourier Series in several variables, Acta Math. 99 (1968), 165-202.

    <bibitem|bochner>S. Bochner, Boundary values of analytic functions in
    several variables and almost periodic functions. Ann. Math. 45 (1944),
    708-22.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|15|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-bochner|<tuple|bochner|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-cramer1|<tuple|cramer1|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-cramer2|<tuple|cramer2|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-doob|<tuple|doob|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-dudley|<tuple|dudley|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-helson|<tuple|helson|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-rozanov|<tuple|rozanov|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      cramer1

      cramer2

      doob

      rozanov

      cramer1

      cramer2

      dudley

      dudley

      helson

      bochner
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>