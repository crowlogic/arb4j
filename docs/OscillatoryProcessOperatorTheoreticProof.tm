<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Proof Using Stone's Theorem and von Neumann's
  Commutant Theory for Oscillatory Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    <with|font-series|bold|(Characterization of Oscillatory Processes).> A
    curve <math|x<around|(|t|)>> in a Hilbert space <math|H> is oscillatory
    if and only if it is a deformed stationary curve
    <math|x<around|(|t|)>=<math-bf|A><rsub|t><around|[|y<around|(|t|)>|]>>,
    where <math|y<around|(|t|)>> is stationary and <math|<math-bf|A><rsub|t>>
    commutes with the shift group <math|<around|{|U<rsub|s>|}>>.

    \;
  </theorem>

  <\proof>
    We will proceed in steps, invoking Stone's spectral theorem and von
    Neumann's theory of commutants.

    <subsection*|Step 1: Stationary Process Representation via Stone's
    Theorem>

    Let <math|y<around|(|t|)>> be a continuous stationary curve in <math|H>.
    By Stone's theorem, there exists a unique projection-valued measure
    <math|E<around|(|\<cdummy\>|)>> on <math|\<bbb-R\>> such that

    <\equation>
      y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*E*<around|(|d*\<lambda\>|)>*y<rsub|0><text|>
    </equation>

    where

    <\equation>
      y<rsub|0>=y<around|(|0|)>
    </equation>

    The shift group <math|<around|{|U<rsub|s>|}><rsub|s\<in\>\<bbb-R\>>> acts
    by time translation:

    <\equation>
      U<rsub|s><around|[|y<around|(|t|)>|]>=y*<around|(|t+s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|t+s|)>>*E*<around|(|d*\<lambda\>|)>*y<rsub|0>
    </equation>

    The group can also be represented spectrally:

    <\equation>
      U<rsub|s>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*s>*E*<around|(|d*\<lambda\>|)>
    </equation>

    which is unitary and strongly continuous.

    <subsection*|Step 2: Oscillatory Processes as Deformed Stationary Curves>

    Let us consider Priestley's oscillatory process:

    <\equation>
      x<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*a<rsub|t><around|(|\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>*y<rsub|0>
    </equation>

    where each <math|a<rsub|t><around|(|\<lambda\>|)>> is a measurable
    function, and <math|E<around|(|\<cdummy\>|)>> is the same
    projection-valued measure as above.

    Define the operator

    <\equation>
      <math-bf|A><rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>a<rsub|t><around|(|\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>
    </equation>

    Then <math|x<around|(|t|)>> can be written as

    <\equation>
      x<around|(|t|)>=<math-bf|A><rsub|t><around|[|y<around|(|t|)>|]>
    </equation>

    Here, <math|y<around|(|t|)>> is the stationary process from Step 1, and
    <math|x<around|(|t|)>> is its deformation via <math|<math-bf|A><rsub|t>>.

    <subsection*|Step 3: Commutation with the Shift Group>

    For <math|x<around|(|t|)>> to be a deformed stationary curve in this
    sense, the operators <math|<math-bf|A><rsub|t>> must commute with the
    shift group:

    <\equation>
      <math-bf|A><rsub|t><around|[|U<rsub|s><around|[|h|]>|]>=U<rsub|s><around|[|<math-bf|A><rsub|t><around|[|h|]>|]><space|1em>\<forall\>h\<in\><math-up|Dom><around|(|<math-bf|A><rsub|t>|)>,s\<in\>\<bbb-R\>
    </equation>

    Because <math|<math-bf|A><rsub|t>> is defined through
    <math|E<around|(|\<cdummy\>|)>>, spectral calculus ensures

    <\equation>
      <math-bf|A><rsub|t>U<rsub|s>=U<rsub|s><math-bf|A><rsub|t>,
    </equation>

    since multiplication by <math|a<rsub|t><around|(|\<lambda\>|)>> and
    <math|e<rsup|i*\<lambda\>*s>> commute under the spectral integral.

    <subsection*|Step 4: Converse via von Neumann's Commutant Theory>

    Now suppose <math|x<around|(|t|)>=<math-bf|A><rsub|t><around|[|y<around|(|t|)>|]>>
    with <math|<math-bf|A><rsub|t>> commuting with <math|U<rsub|s>>. By von
    Neumann's theory of commutants, the set of all (possibly unbounded)
    closed operators on <math|H> which commute with the group
    <math|<around|{|U<rsub|s>|}>> are precisely the spectral integrals:

    <\equation>
      <math-bf|A><rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>a<rsub|t><around|(|\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>
    </equation>

    for some measurable <math|a<rsub|t><around|(|\<cdummy\>|)>>. Thus, any
    such deformation is an oscillatory process of the desired form.

    <subsection*|Step 5: Nondeterminism and Moving Average Representation>

    Suppose <math|y<around|(|t|)>> is purely nondeterministic, admitting a
    moving average representation (<cite|Karhunen>):

    <\equation>
      y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|t>f*<around|(|t-u|)>*<space|0.17em>\<xi\>*<around|(|d*u|)>
    </equation>

    where <math|\<xi\>> is a suitable random measure. Then

    <\equation>
      x<around|(|t|)>=<math-bf|A><rsub|t><around|[|y<around|(|t|)>|]>=<big|int><rsub|-\<infty\>><rsup|t>h<around|(|t,u|)>*<space|0.17em>\<xi\>*<around|(|d*u|)>
    </equation>

    <\equation>
      h<around|(|t,u|)>\<assign\><math-bf|A><rsub|t><around|(|f*<around|(|t-u|)>|)>
    </equation>

    Thus, any oscillatory process can be represented as a moving average of a
    purely nondeterministic process.
  </proof>

  <subsection*|Conclusion>

  By Stone's theorem and von Neumann's commutant theorem, oscillatory
  processes are precisely deformed stationary curves whose deformation
  operators commute with the shift group. This yields their spectral
  structure and moving average representations.

  <\thebibliography|9>
    <bibitem|Karhunen>K. Karhunen, Über lineare Methoden in der
    Wahrscheinlichkeitsrechnung, Ann. Acad. Sci. Fenn. Ser. A.I. Math.-Phys.
    No. 37 (1947), 79 pp.

    <bibitem|Masani>P. Masani, The normality of time-invariant, subordinative
    operators in a Hilbert space, Bull. Amer. Math. Soc. 71 (1965), 546\U550.

    <bibitem|Priestley>M. B. Priestley, Evolutionary spectra and
    non-stationary processes, J. Roy. Statist. Soc. Ser. B 27 (1965),
    204\U237.

    <bibitem|Riesz>F. Riesz and B. Sz.-Nagy, Leçons d'analyse fonctionnelle,
    Akad. Kiadó, Budapest, 1953; English transl., Ungar, New York, 1955.

    <bibitem|Dunford>N. Dunford and J. T. Schwartz, Linear Operators. II:
    Spectral Theory, Interscience, 1963.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|4|1>>
    <associate|auto-3|<tuple|7|1>>
    <associate|auto-4|<tuple|9|1>>
    <associate|auto-5|<tuple|10|2>>
    <associate|auto-6|<tuple|13|2>>
    <associate|auto-7|<tuple|13|2>>
    <associate|auto-8|<tuple|1|3>>
    <associate|auto-9|<tuple|?|3>>
    <associate|bib-Dunford|<tuple|Dunford|3>>
    <associate|bib-Karhunen|<tuple|Karhunen|3>>
    <associate|bib-Masani|<tuple|Masani|3>>
    <associate|bib-Priestley|<tuple|Priestley|3>>
    <associate|bib-Riesz|<tuple|Riesz|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Karhunen
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Step 1: Stationary Process Representation
      via Stone's Theorem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|Step 2: Oscillatory Processes as Deformed
      Stationary Curves <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|Step 3: Commutation with the Shift Group
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|Step 4: Converse via von Neumann's
      Commutant Theory <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|Step 5: Nondeterminism and Moving Average
      Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>