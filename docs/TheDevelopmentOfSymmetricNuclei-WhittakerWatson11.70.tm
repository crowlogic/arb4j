<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <section*|11.70. The development of a symmetric nucleus.>

  Following Hilbert's proof as written in
  <cite-detail|whittakerAndWatsonCourseOfModernAnalysis|11.70>. Let
  <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> be a complete set of
  orthogonal functions satisfying the homogeneous integral equation with
  symmetric nucleus

  <\equation>
    \<phi\><around|(|\<alpha\>|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<phi\><around|(|\<xi\>|)>*d*\<xi\>
  </equation>

  the corresponding characteristic numbers being
  <math|\<lambda\><rsub|1>,\<lambda\><rsub|2>,\<lambda\><rsub|3>,\<ldots\>>Now
  suppose that the series <math|<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>>
  is uniformly convergent when <math|0\<leqslant\>a\<leq\>\<alpha\>\<leq\>b\<leqslant\>\<infty\>>,<math|0\<leqslant\>a\<leq\>\<gamma\>\<leq\>b\<leqslant\>\<infty\>>.
  Then it will be shown that

  <\equation>
    K<around|(|\<alpha\>,\<gamma\>|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
  </equation>

  For consider the symmetric nucleus

  <\equation>
    H<around|(|\<alpha\>,\<gamma\>|)>=K<around|(|\<alpha\>,\<gamma\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
  </equation>

  If this nucleus is not identically zero, it will possess at least one
  characteristic number <math|\<mu\>>. Let
  <math|\<psi\><around|(|\<gamma\>|)>> be any solution of the equation

  <\equation>
    \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b>H<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
  </equation>

  which does not vanish identically. Multiply by
  <math|\<phi\><rsub|m><around|(|\<alpha\>|)>> and integrate term-by-term
  (which we may do since the series converges uniformly by hypothesis proved
  by other means), and get

  <\equation>
    <big|int><rsub|a><rsup|b>\<psi\><around|(|\<alpha\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)>*d*\<alpha\>=\<mu\>*<big|int><rsub|a><rsup|b><big|int><rsub|a><rsup|b><around*|[|K<around|(|\<alpha\>,\<xi\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)>|\<lambda\><rsub|n>>|]>*\<psi\><around|(|\<xi\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)>*d*\<xi\>*d*\<alpha\>=0
  </equation>

  Therefore <math|\<psi\><around|(|\<alpha\>|)>> is orthogonal to
  <math|\<phi\><rsub|1><around|(|\<alpha\>|)>,\<phi\><rsub|2><around|(|\<alpha\>|)>,\<ldots\>>;
  and so taking the equation

  <\equation>
    \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b><around*|[|K<around|(|\<alpha\>,\<xi\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)>|\<lambda\><rsub|n>>|]>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
  </equation>

  we have

  <\equation>
    \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
  </equation>

  Therefore <math|\<mu\>> is a characteristic number of
  <math|K<around|(|\<alpha\>,\<gamma\>|)>>, and so
  <math|\<psi\><around|(|\<alpha\>|)>> must be a linear combination of the
  functions <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> corresponding to
  this number; let

  <\equation>
    \<psi\><around|(|\<alpha\>|)>=<big|sum><rsub|m>a<rsub|m>*\<phi\><rsub|m><around|(|\<alpha\>|)>
  </equation>

  Multiply by <math|\<phi\><rsub|m><around|(|\<gamma\>|)>> and integrate;
  then since <math|\<psi\><around|(|\<alpha\>|)>> is orthogonal to all the
  functions <math|\<phi\><rsub|m><around|(|\<alpha\>|)>>, we see that
  <math|a<rsub|m>=0>, so, contrary to hypothesis,
  <math|\<psi\><around|(|\<alpha\>|)>=0>.

  The contradiction implies that the nucleus
  <math|H<around|(|\<alpha\>,\<gamma\>|)>> must be identically zero; that is
  to say, <math|K<around|(|\<alpha\>,\<gamma\>|)>> can be expanded in the
  given series, if it is uniformly convergent.

  <section|Explanation>

  <with|font-series|bold|Given:>

  <\itemize>
    <item>An orthogonal set of functions <math|\<phi\><rsub|n><around|(|\<alpha\>|)>>
    defined over an interval <math|<around|[|a,b|]>>.

    <item>A symmetric kernel <math|K<around|(|\<alpha\>,\<gamma\>|)>> defined
    over <math|<around|[|a,b|]>\<times\><around|[|a,b|]>>.

    <item>The series <math|<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>>
    uniformly converges to <math|K<around|(|\<alpha\>,\<gamma\>|)>>.
  </itemize>

  <with|font-series|bold|To Prove:>

  <\itemize>
    <item>The functions <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> are the
    unique eigenfunctions of the integral operator with kernel
    <math|K<around|(|\<alpha\>,\<gamma\>|)>>.
  </itemize>

  <with|font-series|bold|Proof:>

  <\enumerate>
    <item><with|font-series|bold|Uniform Convergence of Series
    Representation:>

    <\itemize>
      <item>By hypothesis, the series

      <\equation>
        K<around|(|\<alpha\>,\<gamma\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
      </equation>

      converges uniformly to <math|K<around|(|\<alpha\>,\<gamma\>|)>>.

      <item>This uniform convergence ensures that the series represents
      <math|K> accurately over the entire domain
      <math|<around|[|a,b|]>\<times\><around|[|a,b|]>>.
    </itemize>

    <item><with|font-series|bold|Orthogonality and Completeness:>

    <\itemize>
      <item>The functions <math|\<phi\><rsub|n>> are orthogonal, meaning:

      <\equation>
        <big|int><rsub|a><rsup|b>\<phi\><rsub|m><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<alpha\>|)>*d*\<alpha\>=0*<space|1em><text|for
        all >m\<neq\>n
      </equation>

      <item>Orthogonality implies that no <math|\<phi\><rsub|n>> can be
      represented by a linear combination of other <math|\<phi\><rsub|m>>s in
      the set.
    </itemize>

    <item><with|font-series|bold|Eigenfunction Equation:>

    <\itemize>
      <item>Each function <math|\<phi\><rsub|n>> satisfies the integral
      equation:

      <\equation>
        \<phi\><rsub|n><around|(|\<alpha\>|)>=\<lambda\><rsub|n>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)>*d*\<xi\>
      </equation>

      defining them as eigenfunctions of <math|K> with corresponding
      eigenvalues <math|\<lambda\><rsub|n>>.
    </itemize>

    <item><with|font-series|bold|Uniqueness:>

    <\itemize>
      <item>Assume there exists another function
      <math|\<psi\><around|(|\<alpha\>|)>> that is not a linear combination
      of <math|\<phi\><rsub|n>> and also satisfies the integral equation for
      some <math|\<lambda\>>:

      <\equation>
        \<psi\><around|(|\<alpha\>|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
      </equation>

      <item>Multiply both sides by <math|\<phi\><rsub|m><around|(|\<alpha\>|)>>
      and integrate:

      <\equation>
        <big|int><rsub|a><rsup|b>\<psi\><around|(|\<alpha\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)>*d*\<alpha\>=\<lambda\>*<big|int><rsub|a><rsup|b><big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)>*d*\<xi\>*d*\<alpha\>
      </equation>

      <item>Since <math|\<psi\>> is orthogonal to all <math|\<phi\><rsub|n>>,
      the left-hand side is zero, implying
      <math|\<psi\><around|(|\<alpha\>|)>> must be zero by the completeness
      of <math|\<phi\><rsub|n>>.
    </itemize>

    <item><with|font-series|bold|Conclusion:>

    <\itemize>
      <item>The set <math|\<phi\><rsub|n>> uniquely represents the kernel
      <math|K> via their series expansion. No other function set orthogonal
      to <math|\<phi\><rsub|n>> can satisfy the kernel's integral equation
      unless it is zero.

      <item>Therefore, <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> are the
      unique eigenfunctions of the integral operator defined by
      <math|K<around|(|\<alpha\>,\<gamma\>|)>>.
    </itemize>
  </enumerate>
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      whittakerAndWatsonCourseOfModernAnalysis
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|11.70.
      The development of a symmetric nucleus.>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Explanation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>