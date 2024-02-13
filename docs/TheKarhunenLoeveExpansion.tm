<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Karhunen-Loeve Expansion>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>>

  Let's recall the KL expansion from <cite-detail|stochasticFiniteElements|2.3.3>.

  <section|Karhunen-Loeve Expansion>

  Differentiating equation (2.26) with respect to <math|h<around|(|x|)>> and
  setting the result equal to zero, gives

  <\equation>
    <frac|\<mathd\> F|\<mathd\>*h<around|(|x|)>>=<big|int><rsub|D><big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<around|(|x<rsub|1>|)>*d*x<rsub|1>-\<lambda\>*h<around|(|x<rsub|2>|)>*d*x<rsub|2>=0
  </equation>

  which is satisfied when

  <\equation>
    <big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<around|(|x<rsub|2>|)>*d*x<rsub|2>=\<lambda\>*h<around|(|x<rsub|1>|)>
  </equation>

  <subsection|Uniqueness of the Expansion>

  The random variables appearing in an expansion of the kind given by
  equation (2.10) and the orthogonality and orthonormal functions
  <math|<around|{|f<rsub|n><around|(|x|)>|}>> and the constants
  <math|<around|{|\<lambda\><rsub|n>|}>> are respectively the eigenfunctions
  and the eigenvalues of the covariance kernel as given by equation (2.8).

  The "if" part is an immediate consequence of equation (2.11). To show the
  "only if" part, equation (2.12) can be used with
  <math|<around|\<langle\>|\<xi\><rsub|n>,\<xi\><rsub|m>|\<rangle\>>=\<delta\><rsub|n*m>>
  to obtain

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)>
  </equation>

  <subsection|Other Properties>

  In addition to the mean-square error minimizing property, the
  Karhunen-Loeve expansion has some additional desirable properties. Of
  these, the minimum representation entropy property is worth mentioning.
  These properties, however, are of no relevance to the present study and
  will not be discussed any further. A detailed study of the properties of
  the Karhunen-Loeve expansion is given by Devijver and Kittler (1982).

  <subsection|Solution of the Integral Equation>

  <subsubsection|Preliminary Remarks>

  The usefulness of the Karhunen-Loeve expansion hinges on the ability to
  solve the integral equation of the form

  <\equation>
    <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<around|(|x<rsub|2>|)>*d*x<rsub|2>=\<lambda\>*f<around|(|x<rsub|1>|)>,
  </equation>

  where <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> is an autocovariance
  function. Equation (2.33) is a homogeneous Fredholm integral equation of
  the second kind. The theory underlying this kind of equations has been
  extensively investigated and is well documented in a number of monographs
  (Mikhlin, 1957). Being an autocovariance function, the kernel
  <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> is bounded, symmetric, and
  positive definite. This fact simplifies the ensuing analysis considerably
  in...

  <subsubsection|Properties of the Expansion>

  The Karhunen-Loeve expansion guarantees a number of properties for the
  eigenfunctions and the eigenvalues that are solutions to equation (2.33).
  Specifically:

  <\enumerate>
    <item>The set <math|<around|{|f<rsub|j><around|(|x|)>|}>> of
    eigenfunctions is orthogonal and complete.

    <item>For each eigenvalue <math|\<lambda\><rsub|k>>, there correspond at
    most a finite number of linearly independent eigenfunctions.

    <item>There are at most a countably infinite set of eigenvalues.

    <item>The eigenvalues are all positive real numbers.

    <item>The kernel <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> admits the
    following uniformly convergent expansion:
  </enumerate>

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|k=1><rsup|\<infty\>>\<lambda\><rsub|k>*f<rsub|k><around|(|x<rsub|1>|)>*f<rsub|k><around|(|x<rsub|2>|)>
  </equation>

  The Karhunen-Loeve expansion of a process was derived based on the
  preceding analytical properties of its covariance function. These
  properties are independent of the stochastic nature of the process
  involved, which allows the expansion to be applied to a wide range of
  processes including nonstationary and multidimensional processes.
  <cite-detail|stochasticFiniteElements|2.3.3>

  <\bibliography|bib|tm-plain|../../../a/docs/refs2>
    <\bib-list|1>
      <bibitem*|1><label|bib-stochasticFiniteElements>Roger<nbsp>G.<nbsp>Ghanem<localize|
      and >Pol<nbsp>D.<nbsp>Spanos. <newblock><with|font-shape|italic|Stochastic
      finite elements: a spectral approach>. <newblock>Springer-Verlag,
      Berlin, Heidelberg, 1991.<newblock>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-3|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-4|<tuple|1.3|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-5|<tuple|1.3.1|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-6|<tuple|1.3.2|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-7|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|bib-stochasticFiniteElements|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticFiniteElements

      stochasticFiniteElements
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Karhunen-Loeve
      Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Uniqueness of the Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Other Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Solution of the Integral
      Equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.3.1<space|2spc>Preliminary Remarks
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|1.3.2<space|2spc>Properties of the
      Expansion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>