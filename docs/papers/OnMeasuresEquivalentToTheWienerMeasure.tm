<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  \;

  <doc-data|<doc-title|Notes on Measures Equivalent to Wiener
  Measure<footnote|This work was supported by AFOSR Contract AF 49 (638) 1517
  and Tri Service Contract Nonr 225(83).>>|<doc-author|<author-data|<author-name|Thomas
  Kailath<next-line>Stanford University>>>>

  Recently, Shepp<nbsp><cite|shepp1966> has given, among several other
  results, a simple condition for the equivalence of a Gaussian measure to
  Wiener measure. His proof is ingenious but long. The purpose of this note
  is to record a somewhat simpler proof of this result which was obtained
  independently. The proof uses a reproducing kernel Hilbert space (RKHS)
  criterion, due to Oodaira<nbsp><cite|oodaira1963>, for the equivalence of
  Gaussian measures.

  We first state Shepp's theorem (in a terminology more familiar to
  engineers):

  <\theorem>
    [Shepp's Theorem]<label|thm:shepp> Discrimination between a zero-mean
    Gaussian process with covariance function <math|R<around|(|t,s|)>> and a
    Wiener process with covariance function <math|min <around|(|t,s|)>>,
    <math|0\<leq\>t,s\<leq\>T>, will be nonsingular if and only if there
    exists a unique, symmetric, square-integrable function <math|K> on
    <math|<around|[|0,T|]>\<times\><around|[|0,T|]>>,

    <\equation>
      K<around|(|t,s|)>=K<around|(|s,t|)>,<space|2em><big|iint><rsub|<around|[|0,T|]><rsup|2>>K<rsup|2><around|(|t,s|)>*<space|0.17em>d*t*<space|0.17em>d*s\<less\>\<infty\><label|eq:K_def>
    </equation>

    such that

    <\equation>
      R<around|(|t,s|)>-min <around|(|t,s|)>=<big|iint><rsub|<around|[|0,T|]><rsup|2>>K<around|(|u,v|)>*<space|0.17em>d*u*<space|0.17em>d*v<label|eq:R_minus_min>
    </equation>

    and

    <\equation>
      1*<text|is not an eigenvalue of >K<around|(|u,v|)>.<label|eq:no_eigenvalue_1>
    </equation>
  </theorem>

  <\remark>
    That is, the measures corresponding to these two processes will be
    equivalent.
  </remark>

  As mentioned above, this result will be obtained by direct application of
  the following theorem of Oodaira<nbsp><cite|oodaira1963>:

  <\theorem>
    [Oodaira]<label|thm:oodaira> Discrimination between zero-mean Gaussian
    processes with covariance functions <math|R<rsub|1><around|(|t,s|)>>,
    <math|R<rsub|2><around|(|t,s|)>>, <math|t,s\<in\><around|[|0,T|]>>, will
    be nonsingular if and only if

    <\enumerate>
      <item><math|R<rsub|1>-R<rsub|2>> belongs to the direct product space
      <math|H<around|(|R<rsub|2>|)>\<otimes\>H<around|(|R<rsub|2>|)>>, where
      <math|H<around|(|R<rsub|2>|)>> is the reproducing kernel Hilbert space
      (RKHS) of <math|R<rsub|2>>;

      <item>There exist positive constants <math|c<rsub|1>,c<rsub|2>\<gtr\>0>
      such that <math|c<rsub|1>*R<rsub|2>\<leq\>R<rsub|1>\<leq\>c<rsub|2>*R<rsub|2>>.
    </enumerate>
  </theorem>

  We apply this theorem to <math|R<rsub|1><around|(|t,s|)>=R<around|(|t,s|)>>
  and <math|R<rsub|2><around|(|t,s|)>=min <around|(|t,s|)>>,
  <math|0\<leq\>t,s\<leq\>T>. The calculation of
  <math|H<around|(|R<rsub|2>|)>\<otimes\>H<around|(|R<rsub|2>|)>> is
  straightforward and actually available in the literature on RKHS (see,
  e.g., Parzen<nbsp><cite|parzen1963>, p.<nbsp>164):

  A function <math|g<around|(|t,s|)>>, <math|0\<leq\>t,s\<leq\>T>, will
  belong to <math|H<around|(|R<rsub|2>|)>\<otimes\>H<around|(|R<rsub|2>|)>>,
  where <math|R<rsub|2><around|(|t,s|)>=min <around|(|t,s|)>>, if and only if

  <\equation>
    <big|iint><rsub|<around|[|0,T|]><rsup|2>><around*|\||<frac|\<partial\><rsup|2>*g<around|(|t,s|)>|\<partial\>*t*\<partial\>*s>|\|><rsup|2>*d*t*<space|0.17em>d*s\<less\>\<infty\><label|eq:rkhs_condition>
  </equation>

  It follows that conditions<nbsp><eqref|eq:K_def>
  and<nbsp><eqref|eq:R_minus_min> are equivalent to condition<nbsp>(i) of
  Theorem<nbsp><reference|thm:oodaira>. To show the equivalence
  of<nbsp><eqref|eq:no_eigenvalue_1> and condition<nbsp>(ii), proceed as
  follows.

  The inner product in <math|H<around|(|R<rsub|2>|)>> is

  <\equation>
    <around|(|f,g|)><rsub|H<around|(|R<rsub|2>|)>>=<big|int><rsub|0><rsup|T>f<rprime|'><around|(|t|)>*g<rprime|'><around|(|t|)>*d*t<label|eq:rkhs_inner>
  </equation>

  where the primes denote differentiation with respect to <math|t>.

  Let the (orthonormalized) eigenfunctions and eigenvalues of the
  (Hilbert-Schmidt) kernel <math|K<around|(|t,s|)>> be given by

  <\equation>
    <big|int><rsub|0><rsup|T>K<around|(|t,s|)>*\<psi\><rsub|j><around|(|s|)>*d*s=\<lambda\><rsub|j>*\<psi\><rsub|j><around|(|t|)>,<space|2em>j=1,2,\<ldots\><label|eq:K_eigen>
  </equation>

  and define

  <\equation>
    \<Phi\><rsub|j><around|(|t|)>=<big|int><rsub|0><rsup|T>\<psi\><rsub|j><around|(|s|)>*d*s,<space|2em>j=1,2,\<ldots\><label|eq:Phi_def>
  </equation>

  It is easy to verify that

  <\align>
    <tformat|<table|<row|<cell|<around|(|min
    <around|(|t,s|)>,\<Phi\><rsub|j><around|(|s|)>|)><rsub|H<around|(|R<rsub|2>|)>>>|<cell|=<big|int><rsub|0><rsup|T>\<psi\><rsub|j><around|(|s|)>*d*s=\<Phi\><rsub|j><around|(|t|)><eq-number><label|eq:min_phi_inner>>>|<row|<cell|<around*|(|<big|iint><rsub|<around|[|0,T|]><rsup|2>>K<around|(|u,v|)>*<space|0.17em>d*u*<space|0.17em>d*v,\<Phi\><rsub|j><around|(|s|)>|)><rsub|H<around|(|R<rsub|2>|)>>>|<cell|=\<lambda\><rsub|j>*\<Phi\><rsub|j><around|(|t|)><eq-number><label|eq:K_phi_inner>>>>>
  </align>

  Taking inner products with <math|\<psi\><rsub|j>> in
  <math|H<around|(|R<rsub|2>|)>>, the condition

  <\equation>
    c<rsub|1>*min <around|(|t,s|)>\<leq\>min
    <around|(|t,s|)>-<big|iint><rsub|<around|[|0,T|]><rsup|2>>K<around|(|u,v|)>*<space|0.17em>d*u*<space|0.17em>d*v\<leq\>c<rsub|2>*min
    <around|(|t,s|)><label|eq:ineq_min_K>
  </equation>

  becomes

  <\equation>
    c<rsub|1>*\<Phi\><rsub|j><around|(|t|)>\<leq\><around|(|1-\<lambda\><rsub|j>|)>*\<Phi\><rsub|j><around|(|t|)>\<leq\>c<rsub|2>*\<Phi\><rsub|j><around|(|t|)>,<space|2em>j=1,2,\<ldots\><label|eq:ineq_Phi>
  </equation>

  Taking inner products with <math|\<psi\><rsub|j>> again gives

  <\equation>
    c<rsub|1>\<leq\>1-\<lambda\><rsub|j>\<leq\>c<rsub|2><label|eq:ineq_lambda>
  </equation>

  i.e.,

  <\equation>
    1-c<rsub|2>\<leq\>\<lambda\><rsub|j>\<leq\>1-c<rsub|1>\<less\>1<label|eq:lambda_bounds>
  </equation>

  which is equivalent to condition<nbsp><eqref|eq:no_eigenvalue_1>.

  The above arguments establish the equivalence of the RKHS conditions to the
  requirements on <math|K> and the eigenvalues, thus proving the theorem.

  <section*|Additional Remarks>

  If the process with covariance <math|R> has a nonzero mean
  <math|m<around|(|t|)>>, <math|0\<leq\>t\<leq\>T>, then for nonsingular
  detection <math|m<around|(|t|)>> must belong to
  <math|H<around|(|R<rsub|2>|)>>, which in turn will only be true if
  <math|<frac|d*m<around|(|t|)>|d*t>> is square integrable on
  <math|<around|(|0,T|)>> (see, e.g., Parzen<nbsp><cite|parzen1963>,
  p.<nbsp>159).

  This condition, due to Parzen<nbsp><cite|parzen1961>, has also been
  obtained in a different way by Shepp<nbsp><cite|shepp1966>, Eq.<nbsp>1.3.
  In his paper, Shepp treats several questions related to Wiener measure.
  Some of these results (Eqs.<nbsp>5.6, 5.14, 5.15, 6.8\U6.10) can again be
  obtained by RKHS methods. The expansion theorems in
  Shepp<nbsp><cite|shepp1966>, Theorems<nbsp>2 and<nbsp>3, can also be
  generalized by such methods. Details will be given in a later paper.

  <\thebibliography|9>
    <bibitem|capon1964>Capon, J. (1964). Radon-Nikodym Derivatives of
    Stationary Gaussian Measures. <em|Ann. Math. Statist.>
    <with|font-series|bold|35>, 517\U531.

    <bibitem|oodaira1963>Oodaira, H. (1963). Equivalence and singularity of
    Gaussian Measures. Ph.D. thesis, Department of Mathematics, Michigan
    State University.

    <bibitem|parzen1961>Parzen, E. (1961). An approach to time-series
    analysis. <em|Ann. Math. Statist.> <with|font-series|bold|32>, 951\U989.

    <bibitem|parzen1963>Parzen, E. (1963). Probability density functionals
    and reproducing kernel Hilbert spaces (Ch. II). In <em|Time Series
    Analysis> (ed. by M. Rosenblatt), Wiley, New York.

    <bibitem|shepp1966>Shepp, L. A. (1966). Radon-Nikodym derivatives of
    Gaussian measures. <em|Ann. Math. Statist.> <with|font-series|bold|37>,
    321\U354.
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
    <associate|auto-1|<tuple|13|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-2|<tuple|13|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-capon1964|<tuple|capon1964|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-oodaira1963|<tuple|oodaira1963|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-parzen1961|<tuple|parzen1961|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-parzen1963|<tuple|parzen1963|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-shepp1966|<tuple|shepp1966|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:K_def|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:K_eigen|<tuple|6|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:K_phi_inner|<tuple|9|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:Phi_def|<tuple|7|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:R_minus_min|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:ineq_Phi|<tuple|11|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:ineq_lambda|<tuple|12|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:ineq_min_K|<tuple|10|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:lambda_bounds|<tuple|13|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:min_phi_inner|<tuple|8|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:no_eigenvalue_1|<tuple|3|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:rkhs_condition|<tuple|4|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:rkhs_inner|<tuple|5|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|footnote-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|footnr-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:oodaira|<tuple|3|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:shepp|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      shepp1966

      oodaira1963

      oodaira1963

      parzen1963

      parzen1963

      parzen1961

      shepp1966

      shepp1966
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Additional
      Remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>