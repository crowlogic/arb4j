<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Constructive Solution for the Exact Eigenfunctions
  of Stationary Gaussian Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley \<less\>stephencrowley214@gmail.com\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    An effective(constructive) method, not limited to compact intervals or
    square-integrable kernels, and yielding exact eigenfunctions for
    stationary Gaussian processes through uniform expansions, is presented
    for stationary Gaussian processes. While Mercer's theorem guarantees
    existence and Aronszajn's theory provides the RKHS framework, they are
    both ineffective in the sense that don't provide a method to actually
    generate the basis, whereas this theorem does. Therefore, this is
    complete solution for all stationary Gaussian processes since the
    triangularity of the eigenfunction expansion means that the
    eigenfunctions are expressible as finite linear combinations of the basis
    functions derived from the orthogonal complement of the Fourier
    transforms of the spectral density and its square root and therefore they
    are exact, not requiring us to truncate the expansion of each
    eigenfunction which would be the case if an arbitary orthonormal basis
    had been used to derive the expansion rather than the one derived via
    this procedure involving the polynomials orthogonal to the spectral
    density and its square root.
  </abstract>

  <section|Novel Double Gram-Schmidt Method for Eigenfunction Expansion>

  <\theorem>
    <dueto|Double Gram-Schmidt Expansion>Let <math|K*<around|(|t-s|)>> be the
    kernel of a stationary Gaussian process with spectral density
    <math|S<around|(|\<omega\>|)>>. Then there exist two orthonormal bases
    <math|<around|{|\<phi\><rsub|n>|}><rsub|n=0><rsup|\<infty\>>> and
    <math|<around|{|\<psi\><rsub|n>|}><rsub|n=0><rsup|\<infty\>>> constructed
    through a double Gram-Schmidt process such that:

    <\enumerate>
      <item><math|K*<around|(|t-s|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*\<phi\><rsub|n>*<around|(|t-s|)>>
      where <math|\<lambda\><rsub|n>=<around|\<langle\>|K,\<phi\><rsub|n>|\<rangle\>>>

      <item><math|g<around|(|t|)>=\<cal-F\><around|[|<sqrt|S<around|(|\<omega\>|)>>|]>=<big|sum><rsub|n=0><rsup|\<infty\>>\<gamma\><rsub|n>*\<psi\><rsub|n><around|(|t|)>>
      where <math|\<gamma\><rsub|n>=<around|\<langle\>|g,\<psi\><rsub|n>|\<rangle\>>>

      <item><math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|n><around|(|t|)>*\<phi\><rsub|k><around|(|t|)>*d*t=0>
      for all <math|n\<gtr\>k>
    </enumerate>
  </theorem>

  <\proof>
    We proceed in several steps:

    <with|font-series|bold|Step 1:> First, we establish the existence of
    orthogonal polynomials in the spectral domain. Define for
    <math|n\<geq\>0>:

    <\equation>
      p<rsub|n><around|(|\<omega\>|)>=\<omega\><rsup|n>-<big|sum><rsub|k=0><rsup|n-1><frac|<around|\<langle\>|\<omega\><rsup|n>,p<rsub|k>|\<rangle\>><rsub|S>|<around|\<\|\|\>|p<rsub|k>|\<\|\|\>><rsub|S><rsup|2>>*p<rsub|k><around|(|\<omega\>|)>
    </equation>

    where

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>><rsub|S>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|\<omega\>|)>*g<around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>
    </equation>

    Similarly for the spectral factor:

    <\equation>
      q<rsub|n><around|(|\<omega\>|)>=\<omega\><rsup|n>-<big|sum><rsub|k=0><rsup|n-1><frac|<around|\<langle\>|\<omega\><rsup|n>,q<rsub|k>|\<rangle\>><rsub|<sqrt|S>>|<around|\<\|\|\>|q<rsub|k>|\<\|\|\>><rsub|<sqrt|S>><rsup|2>>*q<rsub|k><around|(|\<omega\>|)>
    </equation>

    where

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>><rsub|<sqrt|S>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|\<omega\>|)>*g<around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>
    </equation>

    <with|font-series|bold|Step 2:> By the standard properties of
    Gram-Schmidt orthogonalization:

    <\equation*>
      <around|\<langle\>|p<rsub|n>,p<rsub|m>|\<rangle\>><rsub|S>=0*<space|1em><text|and><space|1em><around|\<langle\>|q<rsub|n>,q<rsub|m>|\<rangle\>><rsub|<sqrt|S>>=0*<space|1em><text|for
      >n\<neq\>m
    </equation*>

    <with|font-series|bold|Step 3:> Define the Fourier transforms:

    <\equation>
      <text|<math|<wide|p|^><rsub|n><around|(|t|)>=\<cal-F\><around|[|p<rsub|n><around|(|\<omega\>|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*e<rsup|i*t*\<omega\>>*d*\<omega\>>>
    </equation>

    <\equation>
      <wide|q|^><rsub|n><around|(|t|)>=\<cal-F\><around|[|q<rsub|n><around|(|\<omega\>|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>q<rsub|n><around|(|\<omega\>|)>*e<rsup|i*t*\<omega\>>*d*\<omega\>
    </equation>

    <with|font-series|bold|Step 4:> Apply second Gram-Schmidt process in time
    domain:

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=<frac|<wide|p|^><rsub|n><around|(|t|)>-<big|sum><rsub|k=0><rsup|n-1><around|\<langle\>|<wide|p|^><rsub|n>,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k><around|(|t|)>|<around|\<\|\|\>|<wide|p|^><rsub|n>-<big|sum><rsub|k=0><rsup|n-1><around|\<langle\>|<wide|p|^><rsub|n>,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k>|\<\|\|\>>>
    </equation>

    <\equation>
      \<psi\><rsub|n><around|(|t|)>=<frac|<wide|q|^><rsub|n><around|(|t|)>-<big|sum><rsub|k=0><rsup|n-1><around|\<langle\>|<wide|q|^><rsub|n>,\<psi\><rsub|k>|\<rangle\>>*\<psi\><rsub|k><around|(|t|)>|<around|\<\|\|\>|<wide|q|^><rsub|n>-<big|sum><rsub|k=0><rsup|n-1><around|\<langle\>|<wide|q|^><rsub|n>,\<psi\><rsub|k>|\<rangle\>>*\<psi\><rsub|k>|\<\|\|\>>>
    </equation>

    <with|font-series|bold|Step 5:> The crucial triangular structure follows
    from Parseval's theorem:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|n><around|(|t|)>*\<phi\><rsub|k><around|(|t|)>*d*t=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>q<rsub|n><around|(|\<omega\>|)><wide|p<rsub|k><around|(|\<omega\>|)>|\<bar\>><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>
    </equation>

    For <math|n\<gtr\>k>, <math|q<rsub|n><around|(|\<omega\>|)>> is
    orthogonal to all polynomials of degree less than <math|n> with respect
    to <math|<sqrt|S<around|(|\<omega\>|)>>>, including
    <math|p<rsub|k><around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>>.
    Therefore:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|n><around|(|t|)>*\<phi\><rsub|k><around|(|t|)>*d*t=0*<space|1em>\<forall\><text|>n\<gtr\>k
    </equation>

    <with|font-series|bold|Step 6:> The convergence of the expansions follows
    from the completeness of polynomials in
    <math|L<rsup|2><around|(|\<bbb-R\>,S<around|(|\<omega\>|)>|)>> and
    <math|L<rsup|2><around|(|\<bbb-R\>,<sqrt|S<around|(|\<omega\>|)>>|)>>
    respectively.
  </proof>
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
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Novel
      Double Gram-Schmidt Method for Eigenfunction Expansion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>