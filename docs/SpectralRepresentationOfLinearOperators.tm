<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectral Representation of Linear Operators in Terms
  of Eigenfunctions>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  This document provides a detailed mathematical treatment of the spectral
  representation of linear operators in Hilbert spaces, focusing on operators
  that can be expressed as functions of their eigenfunctions.

  <section|Mathematical Preliminaries>

  Let <math|H> be a Hilbert space over the field of complex numbers, and let
  <math|L:D<around|(|L|)>\<subseteq\>H\<rightarrow\>H> be a linear operator
  with domain <math|D<around|(|L|)>> and range in <math|H>. Assume <math|L>
  is self-adjoint and has a complete set of eigenfunctions
  <math|<around|{|\<phi\><rsub|n>|}>\<subseteq\>H> with corresponding
  eigenvalues <math|<around|{|\<lambda\><rsub|n>|}>\<subseteq\>\<bbb-R\>>.

  <section|Spectral Representation>

  The action of <math|L> on any <math|f\<in\>D<around|(|L|)>> can be
  expressed in terms of its eigenfunctions and eigenvalues. If <math|f> is
  represented as

  <\equation>
    f=<big|sum><rsub|n>c<rsub|n>*\<phi\><rsub|n>
  </equation>

  where <math|c<rsub|n>> are complex coefficients, then the action of
  <math|L> on <math|f> is given by

  <\equation>
    L*f=L<around*|(|<big|sum><rsub|n>c<rsub|n>*\<phi\><rsub|n>|)>=<big|sum><rsub|n>c<rsub|n>*L*\<phi\><rsub|n>=<big|sum><rsub|n>c<rsub|n>*\<lambda\><rsub|n>*\<phi\><rsub|n>
  </equation>

  <section|Operator Expression>

  The operator <math|L> itself can be represented in the form of a series
  involving its eigenfunctions and eigenvalues:

  <\equation>
    L=<big|sum><rsub|n>\<lambda\><rsub|n>*<around|\<langle\>|\<phi\><rsub|n>,\<cdummy\>|\<rangle\>>*\<phi\><rsub|n>
  </equation>

  where <math|<around|\<langle\>|\<phi\><rsub|n>,\<cdot\>|\<rangle\>>>
  denotes the inner product in <math|H>. This series converges in the strong
  operator topology on <math|D<around|(|L|)>>.

  <section|Applications in Quantum Mechanics>

  In quantum mechanics, such representations are crucial for describing
  observables in quantum systems. For example, the Hamiltonian of a quantum
  harmonic oscillator can be expressed in terms of Hermite polynomials, which
  are its eigenfunctions.

  <section|Conclusion>

  The spectral representation of linear operators in terms of eigenfunctions
  and eigenvalues is a fundamental concept in functional analysis and quantum
  mechanics. It provides a powerful framework for understanding and computing
  the action of operators in Hilbert spaces.
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
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|1>>
    <associate|auto-5|<tuple|5|2>>
    <associate|auto-6|<tuple|6|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mathematical
      Preliminaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Spectral
      Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Operator
      Expression> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Applications
      in Quantum Mechanics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>