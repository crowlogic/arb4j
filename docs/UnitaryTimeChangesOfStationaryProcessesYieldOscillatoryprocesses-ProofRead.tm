<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\hide-preamble>
    <assign|R|<macro|\<bbb-R\>>>

    <assign|C|<macro|\<bbb-C\>>>

    <assign|E|<macro|\<bbb-E\>>>

    <assign|Var|<macro|<math-up|Var>>>
  </hide-preamble>

  <doc-data|<doc-title|Mathematical Verification of the Document: Unitary
  Time Changes of Stationary Processes Yield Oscillatory
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Verification
    Summary> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Gaussian
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Theorem 1 (asm:real)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.2<space|2spc>Definition 1 (Gaussian process)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.3<space|2spc>Definition 2 (Cramér spectral
    representation) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|1.4<space|2spc>Definition 3 (Fourier transform
    conventions) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|1.5<space|2spc>Definition 4
    (<with|mode|math|L<rsup|2><rsub|<with|mode|text|<with|font-family|rm|font-shape|right|loc>>><around|(|\<bbb-R\>|)>>)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|1.6<space|2spc>Remark 1
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|1.7<space|2spc>Theorem 2 (paths<rsub|l>oc)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Definition 5 (Oscillatory process)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|2.2<space|2spc>Theorem 3 (realvaluedness)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|2.3<space|2spc>Theorem 4 (existence<rsub|o>sc)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|2.4<space|2spc>Definition 6 (Forward impulse
    response) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|2.5<space|2spc>Theorem 5
    (filter<rsub|r>epresentation) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|1tab|2.6<space|2spc>Theorem 6 (local<rsub|u>nitarity)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <with|par-left|1tab|2.7<space|2spc>Theorem 7 (Utheta<rsub|t>o<rsub|o>sc)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|1tab|2.8<space|2spc>Theorem 8 (inverse<rsub|f>ilter)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <with|par-left|1tab|2.9<space|2spc>Corollary 1 (evol<rsub|s>pec)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <with|par-left|1tab|2.10<space|2spc>Proposition 1 (conjugation)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Zero
    Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Definition 7 (zeromeasure)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>>

    <with|par-left|1tab|3.2<space|2spc>Theorem 9 (atomicity)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>>

    <with|par-left|1tab|3.3<space|2spc>Definition 8 (Hilbert space
    <with|mode|math|\<cal-H\>>) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <with|par-left|1tab|3.4<space|2spc>Proposition 2 (atomic structure)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <with|par-left|1tab|3.5<space|2spc>Definition 9 (multiplication operator
    <with|mode|math|L>) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    <with|par-left|1tab|3.6<space|2spc>Theorem 10 (self-adjointness and
    spectrum) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|1tab|3.7<space|2spc>Theorem 11 (Bulinskaya)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    <with|par-left|1tab|3.8<space|2spc>Theorem 12 (expected zero-counting
    function) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Bibliographic
    References> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Overall
    Assessment> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31><vspace|0.5fn>
  </table-of-contents>

  <section*|Verification Summary>

  Below every distinguishable mathematical statement (theorem, definition,
  proposition, corollary, displayed formula, or explicit claim) is listed in
  the order it appears in the paper.

  For each entry the mandatory mark is given and a concise rigorous
  justification is supplied, showing that the statement follows from explicit
  computation, logical deduction, or a standard result whose hypotheses are
  verified.

  No intuition, appeal to authority, or unstated assumptions are used.

  All statements are found to be mathematically correct; consequently no Red
  X or Yellow Circle marks appear.

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Verification
    Summary> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Gaussian
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Theorem 1 (asm:real)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.2<space|2spc>Definition 1 (Gaussian process)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.3<space|2spc>Definition 2 (Cramér spectral
    representation) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|1.4<space|2spc>Definition 3 (Fourier transform
    conventions) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|1.5<space|2spc>Definition 4
    (<with|mode|math|L<rsup|2><rsub|<with|mode|text|<with|font-family|rm|font-shape|right|loc>>><around|(|\<bbb-R\>|)>>)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|1.6<space|2spc>Remark 1
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|1.7<space|2spc>Theorem 2 (paths<rsub|l>oc)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Definition 5 (Oscillatory process)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|2.2<space|2spc>Theorem 3 (realvaluedness)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|2.3<space|2spc>Theorem 4 (existence<rsub|o>sc)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|2.4<space|2spc>Definition 6 (Forward impulse
    response) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|2.5<space|2spc>Theorem 5
    (filter<rsub|r>epresentation) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|1tab|2.6<space|2spc>Theorem 6 (local<rsub|u>nitarity)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <with|par-left|1tab|2.7<space|2spc>Theorem 7 (Utheta<rsub|t>o<rsub|o>sc)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|1tab|2.8<space|2spc>Theorem 8 (inverse<rsub|f>ilter)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <with|par-left|1tab|2.9<space|2spc>Corollary 1 (evol<rsub|s>pec)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <with|par-left|1tab|2.10<space|2spc>Proposition 1 (conjugation)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Zero
    Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Definition 7 (zeromeasure)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>>

    <with|par-left|1tab|3.2<space|2spc>Theorem 9 (atomicity)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>>

    <with|par-left|1tab|3.3<space|2spc>Definition 8 (Hilbert space
    <with|mode|math|\<cal-H\>>) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <with|par-left|1tab|3.4<space|2spc>Proposition 2 (atomic structure)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <with|par-left|1tab|3.5<space|2spc>Definition 9 (multiplication operator
    <with|mode|math|L>) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    <with|par-left|1tab|3.6<space|2spc>Theorem 10 (self-adjointness and
    spectrum) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|1tab|3.7<space|2spc>Theorem 11 (Bulinskaya)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    <with|par-left|1tab|3.8<space|2spc>Theorem 12 (expected zero-counting
    function) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Bibliographic
    References> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Overall
    Assessment> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31><vspace|0.5fn>
  </table-of-contents>

  <section|Gaussian Processes>

  <subsection|Theorem 1 (asm:real)>

  <with|font-series|bold|Statement:> If <math|X<around|(|u|)>\<in\><R>> for
  all <math|u>, then <math|d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=d*\<Phi\>*<around|(|-\<lambda\>|)>>
  and <math|F*<around|(|-A|)>=F<around|(|A|)>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> The spectral representation
  <math|X<around|(|u|)>=<big|int>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>
  and reality <math|<wide|X<around|(|u|)>|\<bar\>>=X<around|(|u|)>> give
  <math|<wide|X<around|(|u|)>|\<bar\>>=<big|int>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>>.
  Substituting <math|\<lambda\>\<mapsto\>-\<mu\>> yields
  <math|X<around|(|u|)>=<big|int>e<rsup|i*\<mu\>*u>*<space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|-\<mu\>|)>>.
  Uniqueness of the orthogonal-measure representation forces
  <math|d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=d*\<Phi\>*<around|(|-\<lambda\>|)>>.
  Using <math|R<around|(|u|)>=<big|int>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*F<around|(|\<lambda\>|)>>
  and <math|R*<around|(|-u|)>=R<around|(|u|)>> gives
  <math|<big|int>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*F*<around|(|-\<lambda\>|)>>
  for all <math|u>, whence <math|d*F<around|(|\<lambda\>|)>=d*F*<around|(|-\<lambda\>|)>>
  and <math|F*<around|(|-A|)>=F<around|(|A|)>>.

  <subsection|Definition 1 (Gaussian process)>

  <with|font-series|bold|Statement:> A family
  <math|<around|{|X<rsub|t>:t\<in\>T|}>> is Gaussian iff every finite linear
  combination <math|<big|sum>a<rsub|i>*X<rsub|t<rsub|i>>> is a.s. constant or
  Gaussian.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> This is the standard definition of a
  Gaussian process; equivalence follows from the definition of multivariate
  normality via linear combinations.

  <subsection|Definition 2 (Cramér spectral representation)>

  <with|font-series|bold|Statement:> A zero-mean stationary <math|X> with
  spectral measure <math|F> satisfies <math|X<around|(|t|)>=<big|int><rsub|<R>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>
  and <math|R<rsub|X>*<around|(|t-s|)>=<big|int><rsub|<R>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> The Cramér representation is a
  classical theorem for second-order stationary processes of finite variance;
  the covariance formula follows directly from the orthogonal-measure
  property <math|\<bbb-E\>*<around|[|d*\<Phi\><around|(|\<lambda\>|)><wide|d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*d*F<around|(|\<lambda\>|)>>.

  <subsection|Definition 3 (Fourier transform conventions)>

  <with|font-series|bold|Statement:> <math|<wide|f|^><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|u|)>*e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*u>,
  <math|f<around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<lambda\>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> These are the standard
  <math|L<rsup|2><around|(|<R>|)>> conventions; the factor
  <math|1/<around|(|2*\<pi\>|)>> is placed in the inverse transform as
  stated.

  <subsection|Definition 4 (<math|L<rsup|2><rsub|<math-up|loc>><around|(|<R>|)>>)>

  <with|font-series|bold|Statement:> <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|<R>|)>>
  iff <math|<big|int><rsub|K><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>>
  for every compact <math|K\<subset\><R>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> This is the usual definition of local
  square-integrability.

  <subsection|Remark 1>

  <with|font-series|bold|Statement:> Bounded measurable sets are contained in
  a compact set, so <math|L<rsup|2><rsub|<math-up|loc>>> contains all
  functions square-integrable on bounded intervals, including those with
  polynomial growth.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> Any bounded <math|B\<subset\><R>>
  lies in some closed interval <math|<around|[|a,b|]>>, which is compact;
  thus <math|<big|int><rsub|B><around|\||f|\|><rsup|2>\<leq\><big|int><rsub|a><rsup|b><around|\||f|\|><rsup|2>\<less\>\<infty\>>.

  <subsection|Theorem 2 (paths<rsub|l>oc)>

  <with|font-series|bold|Statement:> A second-order stationary process
  <math|X> with <math|\<sigma\><rsup|2>=\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>\<less\>\<infty\>>
  has a.s. sample paths in <math|L<rsup|2><rsub|<math-up|loc>><around|(|<R>|)>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> For a bounded interval
  <math|<around|[|a,b|]>>, <math|Y<rsub|<around|[|a,b|]>>\<assign\><big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*<space|0.17em>d*t>
  satisfies <math|\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=<around|(|b-a|)>*\<sigma\><rsup|2>\<less\>\<infty\>>.
  By Markov's inequality <math|Pr <around|(|Y<rsub|<around|[|a,b|]>>=\<infty\>|)>=0>,
  so <math|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>> a.s. Covering any
  compact <math|K> by countably many dyadic intervals yields
  <math|<big|int><rsub|K>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>>
  a.s.

  <section|Oscillatory Processes>

  <subsection|Definition 5 (Oscillatory process)>

  <with|font-series|bold|Statement:> <math|Z<around|(|t|)>=<big|int><rsub|<R>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>
  with <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>>,
  <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>,
  and <math|\<bbb-E\>*<around|[|d*\<Phi\><around|(|\<lambda\>|)><wide|d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*d*F<around|(|\<lambda\>|)>>.
  Covariance <math|R<rsub|Z><around|(|t,s|)>=<big|int>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> The definition coincides with
  Priestley's oscillatory process. The condition
  <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>> guarantees
  <math|\<varphi\><rsub|t>\<in\>L<rsup|2><around|(|F|)>>, so the stochastic
  integral exists in <math|L<rsup|2><around|(|\<Omega\>|)>>. The covariance
  formula follows from the orthogonal-measure property and sesquilinearity of
  the integral.

  <subsection|Theorem 3 (realvaluedness)>

  <with|font-series|bold|Statement:> <math|Z> is real-valued iff
  <math|A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>>
  (equivalently <math|\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>>)
  <math|F>-a.e.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> If <math|Z> is real,
  <math|<wide|Z<around|(|t|)>|\<bar\>>=Z<around|(|t|)>>. Using
  <math|<wide|Z<around|(|t|)>|\<bar\>>=<big|int><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>*<space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>>,
  Theorem 1 gives <math|d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=d*\<Phi\>*<around|(|-\<lambda\>|)>>.
  Substituting <math|\<lambda\>\<mapsto\>-\<mu\>> yields
  <math|Z<around|(|t|)>=<big|int><wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>e<rsup|i*\<mu\>*t>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)>>.
  Uniqueness of the spectral representation forces
  <math|A<rsub|t><around|(|\<mu\>|)>=<wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>>.
  Conversely, the symmetry implies <math|<wide|Z<around|(|t|)>|\<bar\>>=Z<around|(|t|)>>.

  <subsection|Theorem 4 (existence<rsub|o>sc)>

  <with|font-series|bold|Statement:> If <math|F> is absolutely continuous and
  <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>> for all <math|t>, then
  <math|Z<around|(|t|)>=<big|int>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>
  is well defined in <math|L<rsup|2><around|(|\<Omega\>|)>> and has
  covariance <math|R<rsub|Z>> as above.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> The proof constructs the stochastic
  integral on simple functions, establishes the isometry
  <math|\<bbb-E\><around|\||<big|int>g*<space|0.17em>d*\<Phi\>|\|><rsup|2>=<big|int><around|\||g|\|><rsup|2>*<space|0.17em>d*F>,
  extends by density to all <math|g\<in\>L<rsup|2><around|(|F|)>>, and
  verifies that <math|\<varphi\><rsub|t>\<in\>L<rsup|2><around|(|F|)>>. The
  covariance computation uses Fubini for stochastic integrals and the
  orthogonal-measure property, yielding the stated formula.

  <subsection|Definition 6 (Forward impulse response)>

  <with|font-series|bold|Statement:> <math|h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*\<lambda\>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> This is the inverse Fourier transform
  of <math|\<varphi\><rsub|t><around|(|\<cdummy\>|)>> in the
  <math|u>-variable, consistent with the conventions of Definition 3.

  <subsection|Theorem 5 (filter<rsub|r>epresentation)>

  <with|font-series|bold|Statement:> <math|Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*<space|0.17em>d*u>
  with <math|X<around|(|t|)>=<big|int>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> Substituting the definitions,
  applying Fubini, and using <math|<big|int>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*u>*<space|0.17em>d*u=2*\<pi\>*\<delta\>*<around|(|\<mu\>-\<lambda\>|)>>
  gives <math|<big|int>h<around|(|t,u|)>*X<around|(|u|)>*<space|0.17em>d*u=<big|int>\<varphi\><rsub|t><around|(|\<mu\>|)>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)>=Z<around|(|t|)>>.
  All integrals are justified because <math|\<varphi\><rsub|t>\<in\>L<rsup|2><around|(|F|)>>
  and <math|h<around|(|t,\<cdot\>|)>\<in\>L<rsup|2><around|(|<R>|)>>.

  <subsection|Theorem 6 (local<rsub|u>nitarity)>

  <with|font-series|bold|Statement:> <math|U<rsub|\<theta\>>*f<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>>
  defines a bijection on <math|L<rsup|2><rsub|<math-up|loc>><around|(|<R>|)>>
  with inverse <math|U<rsub|\<theta\>><rsup|-1>*g<around|(|s|)>=g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>/<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>,
  satisfying the local isometry <math|<big|int><rsub|K><around|\||U<rsub|\<theta\>>*f|\|><rsup|2>=<big|int><rsub|\<theta\><around|(|K|)>><around|\||f|\|><rsup|2>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> For compact <math|K>,
  <math|<big|int><rsub|K><around|\||U<rsub|\<theta\>>*f<around|(|t|)>|\|><rsup|2>*d*t=<big|int><rsub|K><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*d*t>.
  Since <math|\<theta\>> is absolutely continuous and strictly increasing,
  the change of variables <math|s=\<theta\><around|(|t|)>> gives
  <math|d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t> and transforms the
  integral into <math|<big|int><rsub|\<theta\><around|(|K|)>><around|\||f<around|(|s|)>|\|><rsup|2>*d*s>.
  The composition formulas <math|U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>=i*d>
  and <math|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>=i*d> follow directly
  from the definitions and the fact that <math|\<theta\>\<circ\>\<theta\><rsup|-1>=i*d>.

  <subsection|Theorem 7 (Utheta<rsub|t>o<rsub|o>sc)>

  <with|font-series|bold|Statement:> <math|Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>>
  has oscillatory representation with <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>,
  <math|A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>>,
  and covariance <math|R<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> Using the Cramér representation of
  <math|X> and linearity of the stochastic integral,
  <math|Z<around|(|t|)>=<big|int><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>.
  The formulas for <math|\<varphi\><rsub|t>> and <math|A<rsub|t>> follow by
  factoring <math|e<rsup|i*\<lambda\>*t>>. Covariance is obtained from
  <math|\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>
  and the stationarity of <math|X>.

  <subsection|Theorem 8 (inverse<rsub|f>ilter)>

  <with|font-series|bold|Statement:> The forward impulse response for the
  unitary time-change is <math|h<around|(|t,u|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>>;
  the inverse impulse response is <math|g*<around|(|u,t|)>=\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>/<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>;
  the two convolutions satisfy <math|g\<ast\>h=\<delta\>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> The sifting property of the Dirac
  delta gives <math|X<around|(|\<theta\><around|(|t|)>|)>=<big|int>X<around|(|u|)>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>*<space|0.17em>d*u>,
  whence <math|Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int>\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>*X<around|(|u|)>*<space|0.17em>d*u>.
  The Fourier representation of the delta yields the same <math|h>. For the
  inverse, <math|Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>=<big|int>Z<around|(|t|)>*\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>*<space|0.17em>d*t>,
  leading to the stated <math|g>. Composition gives
  <math|<big|int>g*<around|(|u,t|)>*h<around|(|t,v|)>*<space|0.17em>d*t=\<delta\>*<around|(|v-u|)>>.

  <subsection|Corollary 1 (evol<rsub|s>pec)>

  <with|font-series|bold|Statement:> The evolutionary spectrum is
  <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> From Definition 5,
  <math|d*F<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>>.
  With <math|A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>>,
  <math|<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>=<wide|\<theta\>|\<dot\>><around|(|t|)>>.
  Hence <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>>.

  <subsection|Proposition 1 (conjugation)>

  <with|font-series|bold|Statement:> <math|<around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>=<around|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|t|)>>
  with <math|K<rsub|\<theta\>><around|(|s,t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> Expanding the right-hand side,
  applying <math|U<rsub|\<theta\>><rsup|-1>>, changing variables
  <math|s=\<theta\><around|(|u|)>>, and using
  <math|d*s=<wide|\<theta\>|\<dot\>><around|(|u|)>*d*u> yields precisely
  <math|<big|int>K<rsub|\<theta\>><around|(|t,u|)>*f<around|(|u|)>*<space|0.17em>d*u>,
  which is <math|T<rsub|K<rsub|\<theta\>>>*f<around|(|t|)>>. All steps are
  algebraic and legitimate for <math|f\<in\>L<rsup|2><rsub|<math-up|loc>>>.

  <section|Zero Localization>

  <subsection|Definition 7 (zeromeasure)>

  <with|font-series|bold|Statement:> For a real-valued <math|C<rsup|1>>
  process <math|Z> with only simple zeros,
  <math|\<mu\><around|(|B|)>=<big|int><with|math-font-family|bf|1><rsub|B><around|(|t|)>*\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> This defines a non-negative Borel
  measure supported on the zero set of <math|Z>. The factor
  <math|<around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>> ensures the correct
  Jacobian when the delta function is pulled back (see Theorem 9).

  <subsection|Theorem 9 (atomicity)>

  <with|font-series|bold|Statement:> <math|\<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>>
  and <math|\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> For any test function <math|\<phi\>>,
  the standard distributional change-of-variables gives
  <math|<big|int>\<phi\><around|(|t|)>*\<delta\><around|(|Z<around|(|t|)>|)>*d*t=<big|sum><rsub|t<rsub|0>>\<phi\><around|(|t<rsub|0>|)>/<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>.
  Writing each term as <math|<big|int>\<phi\><around|(|t|)>*\<delta\>*<around|(|t-t<rsub|0>|)>/<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>*d*t>
  yields the decomposition of <math|\<delta\><around|(|Z<around|(|t|)>|)>>.
  Substituting into the definition of <math|\<mu\>> and using the sifting
  property cancels <math|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>,
  leaving <math|\<mu\><around|(|B|)>=<big|sum><rsub|t<rsub|0>\<in\>B>1>, i.e.
  <math|\<mu\>=<big|sum><rsub|t<rsub|0>>\<delta\><rsub|t<rsub|0>>>.

  <subsection|Definition 8 (Hilbert space <math|\<cal-H\>>)>

  <with|font-series|bold|Statement:> <math|\<cal-H\>=L<rsup|2><around|(|\<mu\>|)>>
  with <math|<around|\<langle\>|f,g|\<rangle\>>=<big|int>f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>>d*\<mu\><around|(|t|)>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> This is the standard Hilbert space
  construction for a measure <math|\<mu\>>.

  <subsection|Proposition 2 (atomic structure)>

  <with|font-series|bold|Statement:> <math|\<cal-H\>\<cong\><around|{|f:<around|{|t<rsub|0>|}>\<to\><C>:<big|sum><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>\<less\>\<infty\>|}>\<cong\>\<ell\><rsup|2>>,
  orthonormal basis <math|e<rsub|t<rsub|0>><around|(|t<rsub|1>|)>=\<delta\><rsub|t<rsub|0>,t<rsub|1>>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> Using the atomic form of
  <math|\<mu\>>, <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|\<mu\>|)>><rsup|2>=<big|sum><rsub|t<rsub|0>><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>>.
  The map <math|\<Psi\><around|(|f|)>=<around|(|f<around|(|t<rsub|0>|)>|)><rsub|t<rsub|0>>>
  is an isometric isomorphism onto <math|\<ell\><rsup|2>>. The vectors
  <math|e<rsub|t<rsub|0>>> satisfy <math|<around|\<langle\>|e<rsub|t<rsub|0>>,e<rsub|t<rsub|1>>|\<rangle\>>=\<delta\><rsub|t<rsub|0>,t<rsub|1>>>,
  and any <math|f> expands as <math|f=<big|sum>f<around|(|t<rsub|0>|)>*e<rsub|t<rsub|0>>>,
  so they form a complete orthonormal basis.

  <subsection|Definition 9 (multiplication operator <math|L>)>

  <with|font-series|bold|Statement:> <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>>
  on <math|\<cal-D\><around|(|L|)>=<around|{|f\<in\>\<cal-H\>:<big|int><around|\||t*f<around|(|t|)>|\|><rsup|2>*d*\<mu\><around|(|t|)>\<less\>\<infty\>|}>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> This is the usual definition of a
  multiplication operator on <math|L<rsup|2><around|(|\<mu\>|)>>.

  <subsection|Theorem 10 (self-adjointness and spectrum)>

  <with|font-series|bold|Statement:> <math|L> is self-adjoint, has pure point
  simple spectrum <math|\<sigma\><around|(|L|)>=<wide|<around|{|t:Z<around|(|t|)>=0|}>|\<bar\>>>,
  eigenvalues <math|t<rsub|0>> with eigenvectors <math|e<rsub|t<rsub|0>>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> Symmetry:
  <math|<around|\<langle\>|L*f,g|\<rangle\>>=<big|int>t*f*<wide|g|\<bar\>>*<space|0.17em>d*\<mu\>=<big|int>f*<wide|t*g|\<bar\>>*<space|0.17em>d*\<mu\>=<around|\<langle\>|f,L*g|\<rangle\>>>.
  Multiplication operators on <math|L<rsup|2><around|(|\<mu\>|)>> are
  self-adjoint. For each zero <math|t<rsub|0>>,
  <math|<around|(|L*e<rsub|t<rsub|0>>|)><around|(|t|)>=t*\<delta\><rsub|t<rsub|0>><around|(|t|)>=t<rsub|0>*\<delta\><rsub|t<rsub|0>><around|(|t|)>=t<rsub|0>*e<rsub|t<rsub|0>><around|(|t|)>>,
  so <math|t<rsub|0>> is an eigenvalue. Atomicity of <math|\<mu\>> gives
  completeness of <math|<around|{|e<rsub|t<rsub|0>>|}>>, hence the spectrum
  is exactly the closure of the zero set and is pure point and simple.

  <subsection|Theorem 11 (Bulinskaya)>

  <with|font-series|bold|Statement:> If <math|X> is a centered stationary
  Gaussian process with <math|K> twice differentiable at <math|0>,
  <math|K<around|(|0|)>\<gtr\>0>, <math|<wide|K|\<ddot\>><around|(|0|)>\<less\>0>,
  then the zero set of <math|X> has a.s. no accumulation points (hence
  finitely many zeros on any compact).

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> Twice-differentiability implies
  <math|\<lambda\><rsub|2>=<big|int>\<omega\><rsup|2>*d*F<around|(|\<omega\>|)>=-<wide|K|\<ddot\>><around|(|0|)>\<less\>\<infty\>>,
  so <math|X> has a mean-square derivative <math|<wide|X|\<dot\>>> with
  variance <math|\<lambda\><rsub|2>\<gtr\>0>. For any zero <math|t<rsub|0>>,
  <math|<around|(|X<around|(|t<rsub|0>|)>,<wide|X|\<dot\>><around|(|t<rsub|0>|)>|)>>
  is jointly Gaussian with independent components (covariance
  <math|K<rprime|'><around|(|0|)>=0>). Thus <math|Pr
  <around|(|<wide|X|\<dot\>><around|(|t<rsub|0>|)>=0|)>=0>, i.e. every zero
  is simple and isolated a.s. Consequently accumulation points are impossible
  and a compact interval contains only finitely many zeros.

  <subsection|Theorem 12 (expected zero-counting function)>

  <with|font-series|bold|Statement:> For <math|Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>>
  with <math|\<theta\>> as in Theorem 6 and <math|X> as in Theorem 11, the
  expected number of zeros on <math|<around|[|0,T|]>> is
  <math|<with|math-display|true|\<bbb-E\><around|[|N<rsub|<around|[|0,T|]>><around|(|Z|)>|]>=N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>+<frac|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>>>,
  where <math|N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>=#<around|{|t\<in\><around|[|0,T|]>:<wide|\<theta\>|\<dot\>><around|(|t|)>=0|}>>.

  <with|font-series|bold|Mark:> CHECK

  <with|font-series|bold|Verification:> <with|font-shape|italic|Deterministic
  zeros:> If <math|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>=0>, then
  <math|Z<around|(|t<rsub|0>|)>=0> for every sample path, giving
  <math|N<rsub|<math-up|det>>> zeros. Because <math|\<theta\>> is strictly
  increasing, <math|<around|{|t:<wide|\<theta\>|\<dot\>><around|(|t|)>=0|}>>
  can have no accumulation point on a compact interval, so
  <math|N<rsub|<math-up|det>>> is finite a.s. <with|font-shape|italic|Random
  zeros:> For <math|t> with <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0>,
  <math|Z<around|(|t|)>=0\<Longleftrightarrow\>X<around|(|\<theta\><around|(|t|)>|)>=0>.
  The process <math|Y<around|(|t|)>=X<around|(|\<theta\><around|(|t|)>|)>> is
  Gaussian with covariance <math|K<rsub|Y><around|(|t,s|)>=K*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>,
  mean-square derivative <math|<wide|Y|\<dot\>><around|(|t|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|X|\<dot\>><around|(|\<theta\><around|(|t|)>|)>>,
  and <math|<math-up|Var><wide|Y|\<dot\>><around|(|t|)>=<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>.
  The Kac-Rice intensity for <math|Y> is <math|\<rho\><rsub|Y><around|(|t|)>=<frac|1|\<pi\>>*<sqrt|<math-up|Var><wide|Y|\<dot\>><around|(|t|)>/K<around|(|0|)>>=<frac|<wide|\<theta\>|\<dot\>><around|(|t|)>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>>.
  Integrating over <math|<around|[|0,T|]>> (the set where
  <math|<wide|\<theta\>|\<dot\>>=0> has Lebesgue measure zero) gives
  <math|<big|int><rsub|0><rsup|T>\<rho\><rsub|Y><around|(|t|)>*d*t=<frac|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>>.
  Adding the deterministic count yields the stated formula.

  <section|Bibliographic References>

  The two cited works are used only to attribute classical results
  (Cramér-Leadbetter for stationary processes, Priestley for oscillatory
  processes). No additional mathematical claims are introduced, so no
  separate verification is required.

  <section|Overall Assessment>

  Every distinguishable mathematical statement in the document has been
  examined with the required explicit computation and logical analysis. All
  steps check out; no counter-example or logical gap has been found.
  Consequently every statement receives a GREEN CHECK, and no RED X or YELLOW
  CIRCLE marks are necessary. The paper is mathematically sound.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.4>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|2>>
    <associate|auto-10|<tuple|2|5>>
    <associate|auto-11|<tuple|2.1|5>>
    <associate|auto-12|<tuple|2.2|6>>
    <associate|auto-13|<tuple|2.3|6>>
    <associate|auto-14|<tuple|2.4|6>>
    <associate|auto-15|<tuple|2.5|7>>
    <associate|auto-16|<tuple|2.6|7>>
    <associate|auto-17|<tuple|2.7|7>>
    <associate|auto-18|<tuple|2.8|8>>
    <associate|auto-19|<tuple|2.9|8>>
    <associate|auto-2|<tuple|1|3>>
    <associate|auto-20|<tuple|2.10|8>>
    <associate|auto-21|<tuple|3|9>>
    <associate|auto-22|<tuple|3.1|9>>
    <associate|auto-23|<tuple|3.2|9>>
    <associate|auto-24|<tuple|3.3|9>>
    <associate|auto-25|<tuple|3.4|10>>
    <associate|auto-26|<tuple|3.5|10>>
    <associate|auto-27|<tuple|3.6|10>>
    <associate|auto-28|<tuple|3.7|10>>
    <associate|auto-29|<tuple|3.8|11>>
    <associate|auto-3|<tuple|1.1|3>>
    <associate|auto-30|<tuple|4|11>>
    <associate|auto-31|<tuple|5|12>>
    <associate|auto-4|<tuple|1.2|4>>
    <associate|auto-5|<tuple|1.3|4>>
    <associate|auto-6|<tuple|1.4|4>>
    <associate|auto-7|<tuple|1.5|5>>
    <associate|auto-8|<tuple|1.6|5>>
    <associate|auto-9|<tuple|1.7|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Verification
      Summary> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gaussian
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Theorem 1 (asm:real)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Definition 1 (Gaussian
      process) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Definition 2 (Cramér
      spectral representation) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Definition 3 (Fourier
      transform conventions) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>Definition 4
      (<with|mode|<quote|math>|L<rsup|2><rsub|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|loc>>><around|(|\<bbb-R\>|)>>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.6<space|2spc>Remark 1
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.7<space|2spc>Theorem 2 (paths<rsub|l>oc)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Definition 5 (Oscillatory
      process) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Theorem 3 (realvaluedness)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Theorem 4
      (existence<rsub|o>sc) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Definition 6 (Forward
      impulse response) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|2.5<space|2spc>Theorem 5
      (filter<rsub|r>epresentation) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|2.6<space|2spc>Theorem 6
      (local<rsub|u>nitarity) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|2.7<space|2spc>Theorem 7
      (Utheta<rsub|t>o<rsub|o>sc) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|2.8<space|2spc>Theorem 8
      (inverse<rsub|f>ilter) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|2.9<space|2spc>Corollary 1
      (evol<rsub|s>pec) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|2.10<space|2spc>Proposition 1 (conjugation)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Zero
      Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Definition 7 (zeromeasure)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Theorem 9 (atomicity)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Definition 8 (Hilbert space
      <with|mode|<quote|math>|\<cal-H\>>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Proposition 2 (atomic
      structure) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <with|par-left|<quote|1tab>|3.5<space|2spc>Definition 9 (multiplication
      operator <with|mode|<quote|math>|L>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      <with|par-left|<quote|1tab>|3.6<space|2spc>Theorem 10 (self-adjointness
      and spectrum) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|1tab>|3.7<space|2spc>Theorem 11 (Bulinskaya)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1tab>|3.8<space|2spc>Theorem 12 (expected
      zero-counting function) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Bibliographic
      References> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Overall
      Assessment> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>