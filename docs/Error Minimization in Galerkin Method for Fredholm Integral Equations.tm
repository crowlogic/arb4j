<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Error Minimization in Galerkin Method for Type-1
  Fredholm Integral Equations>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>>

  <section|Introduction>

  This document outlines the principles behind error minimization in the
  Galerkin method applied to Fredholm integral equations of the second kind,
  providing a theoretical basis for the method's efficiency in approximating
  solutions. <cite-detail|stochasticFiniteElements|2.3.3>

  <section|Preliminaries>

  The Fredholm integral equation of the first kind is given by:

  <\equation>
    \<phi\><around|(|x|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|x,y|)>*\<phi\><around|(|y|)>*d*y
  </equation>

  where <math|K<around|(|x,y|)>> is a kernel function, <math|\<lambda\>> a
  scalar, <math|f<around|(|x|)>> is a known function, and
  <math|\<phi\><around|(|x|)>> the unknown function to be determined.

  <section|Galerkin Method and Error Minimization>

  <subsection|Approximation of the Solution>

  We approximate <math|\<phi\><around|(|x|)>> as a sum of basis functions:

  <\equation>
    \<phi\><rsub|N><around|(|x|)>=<big|sum><rsub|n=1><rsup|N>a<rsub|n>*\<psi\><rsub|n><around|(|x|)>
  </equation>

  where <math|<around|{|\<psi\><rsub|n>|}>> are the basis functions, and
  <math|<around|{|a<rsub|n>|}>> are coefficients.

  <subsection|Formulation of the Galerkin Method>

  The Galerkin method seeks to find the coefficients
  <math|<around|{|a<rsub|n>|}>> by enforcing orthogonality of the residual to
  the subspace spanned by the basis functions:

  <\equation>
    <big|int><rsub|a><rsup|b><around*|(|\<phi\><rsub|N><around|(|x|)>-\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|x,y|)>*\<phi\><rsub|N><around|(|y|)>*d*y-f<around|(|x|)>|)>*\<psi\><rsub|m><around|(|x|)>*d*x=0<space|1em>\<forall\>m
  </equation>

  <subsection|Error Minimization>

  The error, defined as

  <\equation>
    E=<around|\<\|\|\>|\<phi\>-\<phi\><rsub|N>|\<\|\|\>>
  </equation>

  is minimized by the choice of <math|<around|{|a<rsub|n>|}>> due to the
  orthogonality condition. The Galerkin method ensures that the error in the
  approximation is orthogonal to the subspace spanned by the basis functions,
  leading to the minimization of the error in the energy norm associated with
  the problem.

  <subsection|Proof Sketch for Error Minimization>

  <subsubsection|Define the Energy Norm>

  Let <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|E>> be the energy norm
  defined by

  <\equation>
    <around|\<\|\|\>|v|\<\|\|\>><rsub|E><rsup|2>=<around|\<langle\>|v,v|\<rangle\>><rsub|E>
  </equation>

  where <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>><rsub|E>>
  is an inner product on the space.

  <subsubsection|Orthogonality and Minimization>

  Show that for any function <math|v> in the subspace spanned by
  <math|<around|{|\<psi\><rsub|n>|}>>, the error

  <\equation>
    E=<around|\<\|\|\>|\<phi\>-\<phi\><rsub|N>|\<\|\|\>><rsub|E>
  </equation>

  is minimized when <math|\<phi\><rsub|N>> is the Galerkin approximation.
  This is due to the orthogonality of the residual to the subspace, implying

  <\equation>
    <around|\<langle\>|\<phi\>-\<phi\><rsub|N>,v|\<rangle\>><rsub|E>=0
  </equation>

  <subsubsection|Energy Norm Minimization>

  Demonstrate that the energy norm of the error is minimized by comparing\ 

  <\equation>
    <around|\<\|\|\>|\<phi\>-\<phi\><rsub|N>|\<\|\|\>><rsub|E>
  </equation>

  \ with

  <\equation>
    <around|\<\|\|\>|\<phi\>-v|\<\|\|\>><rsub|E>
  </equation>

  <math|\<forall\>v\<in\>E> leading to the conclusion that the Galerkin
  approximation minimizes the error among all possible choices in the
  subspace.

  <section|Conclusion>

  The Galerkin method's effectiveness in solving Fredholm integral equations
  lies in its ability to minimize the approximation error in a specific
  energy norm, making it a powerful tool for numerical solutions to integral
  equations.

  <\bibliography|bib|tm-plain|refs2>
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
    <associate|auto-10|<tuple|3.4.3|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-11|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-12|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-4|<tuple|3.1|1|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-5|<tuple|3.2|1|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-6|<tuple|3.3|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-7|<tuple|3.4|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-8|<tuple|3.4.1|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-9|<tuple|3.4.2|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|bib-stochasticFiniteElements|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_27.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticFiniteElements
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Galerkin
      Method and Error Minimization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Approximation of the
      Solution <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Formulation of the Galerkin
      Method <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Error Minimization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Proof Sketch for Error
      Minimization <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|3.4.1<space|2spc>Define the Energy Norm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|3.4.2<space|2spc>Orthogonality and
      Minimization <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|3.4.3<space|2spc>Energy Norm Minimization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>