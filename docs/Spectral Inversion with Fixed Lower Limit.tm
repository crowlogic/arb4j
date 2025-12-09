<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\with|color|charcoal>
    <padded-center|<with|font-size|2|font-series|bold|color|gold|Measure-Theoretic
    Derivation of Spectral Inversion Formulas><next-line><vspace*|1em>
    <with|font-size|1.19|Complete mathematical exposition of orthogonal
    random measures and spectral inversion> ><vspace|2em>

    <section|1. Orthogonal Random Measures>

    <\definition>
      Let <math|<around|(|\<Omega\>,\<cal-F\>,P|)>> be a complete probability
      space and <math|<around|(|\<bbb-R\>,\<cal-B\><around|(|\<bbb-R\>|)>|)>>
      be the real line with its Borel <math|\<sigma\>>-algebra. A
      <with|color|gold|font-series|bold|complex orthogonal random measure>
      <math|\<Phi\>> is a mapping <math|\<Phi\>:\<cal-B\><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<Omega\>,\<cal-F\>,P|)>>
      satisfying:

      <\enumerate>
        <item><with|font-series|bold|Additivity:> For disjoint sets
        <math|A<rsub|1>,A<rsub|2>,\<ldots\>\<in\>\<cal-B\><around|(|\<bbb-R\>|)>>:

        <\equation>
          \<Phi\><around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>A<rsub|n>|)>=<big|sum><rsub|n=1><rsup|\<infty\>>\<Phi\><around|(|A<rsub|n>|)>
        </equation>

        where convergence is in <math|L<rsup|2>> norm

        <item><with|font-series|bold|Orthogonality:> For any
        <math|A,B\<in\>\<cal-B\><around|(|\<bbb-R\>|)>>:

        <\equation>
          \<bbb-E\><around|[|\<Phi\><around|(|A|)><wide|\<Phi\><around|(|B|)>|\<bar\>>|]>=\<mu\>*<around|(|A\<cap\>B|)>
        </equation>

        for a unique positive measure <math|\<mu\>> called the
        <with|color|gold|font-series|bold|structural measure>
      </enumerate>
    </definition>

    <subsection|Integration with Respect to Orthogonal Random Measures>

    For <math|f\<in\>L<rsup|2><around|(|\<mu\>|)>>, the stochastic integral
    <math|<big|int>f<around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>
    is defined as the <math|L<rsup|2>>-limit of simple function
    approximations.

    <\itemize>
      <item><with|font-series|bold|Isometry:>
      <math|\<bbb-E\><around*|[|<around*|\||<big|int>f<around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=<big|int><around|\||f<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>>

      <item><with|font-series|bold|Linearity:>
      <math|<big|int><around|(|a*f+b*g|)>*<space|0.17em>d*\<Phi\>=a*<big|int>f*<space|0.17em>d*\<Phi\>+b*<big|int>g*<space|0.17em>d*\<Phi\>>

      <item><with|font-series|bold|Continuity:> The mapping
      <math|f\<mapsto\><big|int>f*<space|0.17em>d*\<Phi\>> is an isometry
      from <math|L<rsup|2><around|(|\<mu\>|)>> to
      <math|L<rsup|2><around|(|\<Omega\>,\<cal-F\>,P|)>>
    </itemize>

    <section|2. Spectral Representation Theorem>

    <\theorem>
      [Spectral Representation] Let <math|<around|{|\<xi\><around|(|t|)>:t\<in\>\<bbb-R\>|}>>
      be a mean-square continuous second-order stationary process with
      covariance function <math|r<around|(|t|)>>. Then there exists a unique
      complex orthogonal random measure <math|\<Phi\>> such that:

      <\equation>
        \<xi\><around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      The covariance function has the representation:

      <\equation>
        r<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>
      </equation>

      where <math|\<mu\>> is the structural measure of <math|\<Phi\>> with
      <math|\<mu\><around|(|\<bbb-R\>|)>=r<around|(|0|)>>.
    </theorem>

    <\proof>
      The proof relies on the fact that <math|r<around|(|t|)>> is positive
      definite, so by Bochner's theorem, there exists a unique finite
      positive measure <math|\<mu\>> such that
      <math|r<around|(|t|)>=<big|int>e<rsup|i*t*\<lambda\>>*d*\<mu\><around|(|\<lambda\>|)>>.
      The orthogonal random measure <math|\<Phi\>> is constructed via the
      isometric isomorphism between <math|L<rsup|2><around|(|\<mu\>|)>> and
      the Hilbert space <math|H<around|(|\<xi\>|)>=<wide|<text|span>|\<bar\>><around|{|\<xi\><around|(|t|)>:t\<in\>\<bbb-R\>|}>>.
    </proof>

    <section|3. Cumulative Spectral Distribution and Measure>

    <\definition>
      The <with|color|gold|font-series|bold|cumulative spectral distribution
      function> <math|F:\<bbb-R\>\<to\>\<bbb-R\>> is defined as:

      <\equation>
        F<around|(|\<lambda\>|)>=\<mu\><around|(|<around|(|-\<infty\>,\<lambda\>|]>|)>=\<bbb-E\><around|[|<around|\||\<Phi\><around|(|<around|(|-\<infty\>,\<lambda\>|]>|)>|\|><rsup|2>|]>
      </equation>

      The <with|color|gold|font-series|bold|cumulative orthogonal random
      measure> is:

      <\equation>
        \<Phi\><around|(|\<lambda\>|)>=\<Phi\><around|(|<around|(|-\<infty\>,\<lambda\>|]>|)>
      </equation>
    </definition>

    <subsection|Properties>

    <\enumerate>
      <item><math|F> is non-decreasing and right-continuous

      <item><math|lim<rsub|\<lambda\>\<to\>-\<infty\>>
      F<around|(|\<lambda\>|)>=0> and <math|lim<rsub|\<lambda\>\<to\>\<infty\>>
      F<around|(|\<lambda\>|)>=r<around|(|0|)>>

      <item>For <math|\<lambda\><rsub|1>\<less\>\<lambda\><rsub|2>>:
      <math|F<around|(|\<lambda\><rsub|2>|)>-F<around|(|\<lambda\><rsub|1>|)>=\<mu\><around|(|<around|(|\<lambda\><rsub|1>,\<lambda\><rsub|2>|]>|)>>

      <item><math|\<Phi\><around|(|\<lambda\><rsub|2>|)>-\<Phi\><around|(|\<lambda\><rsub|1>|)>=\<Phi\><around|(|<around|(|\<lambda\><rsub|1>,\<lambda\><rsub|2>|]>|)>>
    </enumerate>

    <section|4. Derivation of Spectral Inversion Formulas>

    <subsection|The Fourier-Stieltjes Inversion Theorem>

    Since <math|r<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*d*F<around|(|\<lambda\>|)>>
    and <math|F> is of bounded variation, we apply the Fourier-Stieltjes
    inversion:

    For continuity points <math|a\<less\>b> of <math|F>:

    <\equation>
      F<around|(|b|)>-F<around|(|a|)>=<frac|1|2*\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T><rsup|T><frac|e<rsup|-i*t*a>-e<rsup|-i*t*b>|i*t>*r<around|(|t|)>*<space|0.17em>d*t
    </equation>

    <subsection|Single Frequency Increment from <math|-\<infty\>>>

    To obtain <math|F<around|(|\<lambda\>|)>> from the base frequency
    <math|-\<infty\>>, set <math|a=-\<infty\>> and <math|b=\<lambda\>>:

    <\equation>
      F<around|(|\<lambda\>|)>-F*<around|(|-\<infty\>|)>=<frac|1|2*\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T><rsup|T><frac|e<rsup|-i*t*<around|(|-\<infty\>|)>>-e<rsup|-i*t*\<lambda\>>|i*t>*r<around|(|t|)>*<space|0.17em>d*t
    </equation>

    Since <math|F*<around|(|-\<infty\>|)>=0> and the boundary term
    <math|e<rsup|i*t*\<infty\>>> contributes 1 (representing the starting
    point of the cumulative measure):

    <\equation>
      F<around|(|\<lambda\>|)>=<frac|1|2*\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T><rsup|T><frac|1-e<rsup|-i*t*\<lambda\>>|i*t>*r<around|(|t|)>*<space|0.17em>d*t
    </equation>

    For the orthogonal random measure:

    <\equation>
      \<Phi\><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*\<pi\>>*<big|int><rsub|-T><rsup|T><frac|1-e<rsup|-i*t*\<lambda\>>|i*t>*\<xi\><around|(|t|)>*<space|0.17em>d*t
    </equation>

    <subsection|Derivation of Real Trigonometric Form>

    Substitute Euler's formula <math|e<rsup|-i*t*\<lambda\>>=cos
    <around|(|t*\<lambda\>|)>-i*sin <around|(|t*\<lambda\>|)>>:

    <\equation>
      <frac|1-e<rsup|-i*t*\<lambda\>>|i*t>=<frac|1-cos
      <around|(|t*\<lambda\>|)>+i*sin <around|(|t*\<lambda\>|)>|i*t>=<frac|1-cos
      <around|(|t*\<lambda\>|)>|i*t>+<frac|sin <around|(|t*\<lambda\>|)>|t>
    </equation>
  </with>

  <with|font-series|bold|color|charcoal|Symmetry Analysis for
  <math|<big|int><rsub|-T><rsup|T>>:>

  <\with|color|charcoal>
    <\enumerate>
      <item><with|font-series|bold|First term>: <math|<frac|1-cos
      <around|(|t*\<lambda\>|)>|t>*r<around|(|t|)>>

      <\itemize>
        <item><math|1-cos <around|(|t*\<lambda\>|)>> is even

        <item><math|t> is odd

        <item><math|r<around|(|t|)>> is even (covariance function)

        <item>Product is <with|color|gold|font-series|bold|odd>
        \<rightarrow\> integral over <math|<around|[|-T,T|]>> equals
        <with|color|gold|font-series|bold|0>
      </itemize>

      <item><with|font-series|bold|Second term>: <math|<frac|sin
      <around|(|t*\<lambda\>|)>|t>*r<around|(|t|)>>

      <\itemize>
        <item><math|sin <around|(|t*\<lambda\>|)>> is odd

        <item><math|t> is odd

        <item><math|r<around|(|t|)>> is even

        <item>Product is <with|color|gold|font-series|bold|even>
        \<rightarrow\> <math|<big|int><rsub|-T><rsup|T>=2*<big|int><rsub|0><rsup|T>>
      </itemize>
    </enumerate>

    <subsection|Final Real Form>

    Combining these results:

    <\equation>
      F<around|(|\<lambda\>|)>=<frac|1|\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|0><rsup|T><frac|sin <around|(|t*\<lambda\>|)>|t>*r<around|(|t|)>*<space|0.17em>d*t
    </equation>

    <\equation>
      \<Phi\><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|\<pi\>>*<big|int><rsub|0><rsup|T><frac|sin
      <around|(|t*\<lambda\>|)>|t>*\<xi\><around|(|t|)>*<space|0.17em>d*t
    </equation>

    <section|5. Alternative Representations>

    <subsection|Dirichlet Kernel Form>

    Using the identity <math|<frac|sin <around|(|t*\<lambda\>|)>|t>=<big|int><rsub|0><rsup|\<lambda\>>cos
    <around|(|t*\<omega\>|)>*<space|0.17em>d*\<omega\>>:

    <\equation>
      F<around|(|\<lambda\>|)>=<frac|2|\<pi\>>*<big|int><rsub|0><rsup|\<lambda\>><around*|(|<big|int><rsub|0><rsup|\<infty\>>cos
      <around|(|t*\<omega\>|)>*r<around|(|t|)>*<space|0.17em>d*t|)>*d*\<omega\>
    </equation>

    <subsection|Spectral Density Representation>

    When <math|F> is absolutely continuous with spectral density <math|f>:

    <\equation>
      F<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<lambda\>>f<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>
    </equation>

    <\equation>
      f<around|(|\<lambda\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*t*\<lambda\>>*r<around|(|t|)>*<space|0.17em>d*t
    </equation>

    <section|6. Mathematical Interpretation>

    <\itemize>
      <item><with|font-series|bold|mode|math|F<around|(|\<lambda\>|)>>:
      Cumulative spectral distribution - total spectral power up to frequency
      <math|\<lambda\>>

      <item><with|font-series|bold|mode|math|\<Phi\><around|(|\<lambda\>|)>>:
      Cumulative orthogonal random measure - random spectral content up to
      <math|\<lambda\>>

      <item>Both are cumulative measures starting from 0 at <math|-\<infty\>>

      <item>The measure-theoretic framework ensures rigorous treatment of
      infinite-dimensional stochastic integrals
    </itemize>
  </with>
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-10|<tuple|4.4|4|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-11|<tuple|5|5|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-12|<tuple|5.1|5|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-13|<tuple|5.2|5|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-14|<tuple|6|5|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-2|<tuple|1.1|1|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-3|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-4|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-5|<tuple|3.1|2|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-6|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-7|<tuple|4.1|3|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-8|<tuple|4.2|3|../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-9|<tuple|4.3|4|../.TeXmacs/texts/scratch/no_name_28.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>1.
      Orthogonal Random Measures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Integration with Respect to
      Orthogonal Random Measures <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>2.
      Spectral Representation Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>3.
      Cumulative Spectral Distribution and Measure>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>4.
      Derivation of Spectral Inversion Formulas>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>The Fourier-Stieltjes
      Inversion Theorem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Single Frequency Increment
      from <with|mode|<quote|math>|-\<infty\>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>Derivation of Real
      Trigonometric Form <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|4.4<space|2spc>Final Real Form
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>5.
      Alternative Representations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Dirichlet Kernel Form
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Spectral Density
      Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>6.
      Mathematical Interpretation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>