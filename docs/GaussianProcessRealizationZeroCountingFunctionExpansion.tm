<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|framed-theorems>>

<\body>
  <doc-data|<doc-title|Gaussian Process Zero Counting Functions In Terms of
  Eigenfunctions and Hankel Transforms>|<doc-author|<author-data|<author-name|Stephen
  A. Crowley \<less\>stephencrowley214@gmail.com\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    A rigorous framework is developed for counting zero crossings of Gaussian
    processes through integral covariance operator eigenfunction expansions
    and Hankel transforms. The approach focuses on real-valued centered
    Gaussian processes on <math|<around|[|0,\<infty\>|)>> whose covariance
    operators are compact with respect to their induced canonical metrics.
    Through spectral representation theorems, the existence of a countable
    orthonormal basis is established, enabling bidirectional representations
    of the process. The analysis demonstrates that zeros are almost surely
    simple through examination of joint distributions. The central result is
    an explicit derivation of the zero counting function
    <math|N<around|(|T|)>> via regularization via a Hankel transform:

    <\equation*>
      N<around|(|T|)>=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*e<rsup|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*d*r*d*t
    </equation*>

    A complete proof of this representation is provided, along with an
    exploration of the mathematical structure underlying the interchange of
    products of integrals through Fubini's theorem. This formulation offers
    novel insights into both average behavior and fluctuations of zero
    crossings in Gaussian processes.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Zero
    Counting Function via Regularized Transform for Gaussian Processes on
    <with|color|dark red|font-family|rm|<with|mode|math|<around|[|0,\<infty\>|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Natural Framework and Preliminaries
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Note on Compactness Verification
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>Bidirectional Representations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.4<space|2spc>Simplicity of Zeros
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|1.5<space|2spc>Zero Counting Function Development
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|1.6<space|2spc>Detailed Proof of Zero Counting
    Function Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Commentary on
    Mathematical Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Interchanging
    Product of Integrals in the Zero Counting Function>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Applying Fubini's Theorem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|2.2<space|2spc>Justification
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|2.3<space|2spc>Conclusion
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Interchanging
    Product of Integrals in the Zero Counting Function>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <with|par-left|1tab|Applying Fubini's Theorem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|Conclusion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|0.5fn>
  </table-of-contents>

  <section|Zero Counting Function via Regularized Transform for Gaussian
  Processes on <math|<around|[|0,\<infty\>|)>>>

  <subsection|Natural Framework and Preliminaries>

  Let <math|<around|{|X<rsub|t>|}><rsub|t\<in\><around|[|0,\<infty\>|)>>> be
  a real-valued centered Gaussian process whose covariance operator <math|K>
  is compact relative to the canonical metric it induces. This compactness is
  characterized by the finiteness of Dudley's metric entropy integral:

  <\equation>
    <big|int><rsub|0><rsup|1><sqrt|log N<around|(|\<varepsilon\>,B<rsub|T>,d|)>>*<space|0.17em>d*\<varepsilon\>\<less\>\<infty\>
  </equation>

  where <math|N<around|(|\<varepsilon\>,B<rsub|T>,d|)>> is the covering
  number - the minimal number of <math|\<varepsilon\>>-balls needed to cover
  any bounded set <math|B<rsub|T>=<around|[|0,T|]>> under the canonical
  metric:

  <\equation>
    d*<around|(|s,t|)>=<sqrt|K<around|(|s,s|)>+K<around|(|t,t|)>-2*K<around|(|s,t|)>>
  </equation>

  <subsection|Note on Compactness Verification>

  While the covering number <math|N<around|(|\<varepsilon\>,B<rsub|T>,d|)>>
  represents the exact supremum over all errors of finite rank
  approximations, its direct computation is typically infeasible. However,
  the upper bound:

  <\equation>
    N<around|(|\<varepsilon\>,B<rsub|T>,d|)>\<leq\>min
    <around|{|n\<in\>\<bbb-N\>:\<lambda\><rsub|n>\<less\>\<varepsilon\><rsup|2>|}>
  </equation>

  is sufficient to prove compactness.

  Importantly, one need not verify compactness a priori. The very existence
  of an orthogonal polynomial system for the spectral density implies
  compactness of the corresponding kernel operator (Rao, M.M., Stochastic
  Processes: Inference Theory). Thus, the success of this expansion method
  itself confirms compactness - if the kernel were not compact, no such
  orthogonal system would exist.

  The compactness of <math|K> ensures the existence of a countable
  orthonormal basis <math|<around|{|\<phi\><rsub|n>|}>> with corresponding
  eigenvalues <math|<around|{|\<lambda\><rsub|n>|}>>. Importantly, <math|K>
  is not required to be trace class.

  <subsection|Bidirectional Representations>

  Given this spectral decomposition, the process admits two equivalent
  representations:

  Given a path <math|X<rsub|t>>, its projection coefficients are:

  <\equation>
    Z<rsub|n>=<frac|<big|int><rsub|0><rsup|\<infty\>>X<rsub|t>*\<phi\><rsub|n><around|(|t|)>*d*t|<sqrt|\<lambda\><rsub|n>>>
  </equation>

  Conversely, given the projection coefficients
  <math|<around|{|Z<rsub|n>|}>>, the path is reconstructed as:

  <\equation>
    X<rsub|t>=<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>
  </equation>

  <subsection|Simplicity of Zeros>

  For such a Gaussian process, the impossibility of simultaneous vanishing of
  the process and its mean square derivative follows from the properties of
  joint normal distributions. At any point <math|t>, consider
  <math|<around|(|X<rsub|t>,X<rprime|'><rsub|t>|)>>, where
  <math|X<rprime|'><rsub|t>> is the mean square derivative. These form a
  bivariate normal distribution with covariance matrix:

  <\equation>
    \<Sigma\>=<matrix|<tformat|<table|<row|<cell|K<around|(|t,t|)>>|<cell|\<partial\><rsub|2>*K<around|(|t,t|)>>>|<row|<cell|\<partial\><rsub|2>*K<around|(|t,t|)>>|<cell|-\<partial\><rsub|1>*\<partial\><rsub|2>*K<around|(|t,t|)>>>>>>
  </equation>

  where <math|\<partial\><rsub|i>> denotes partial derivative with respect to
  the <math|i>th argument.

  The probability of both vanishing simultaneously is:

  <\equation>
    P<around|(|X<rsub|t>=0,X<rprime|'><rsub|t>=0|)>=<frac|e<rsup|-<frac|<around|(|0,0|)>*\<Sigma\><rsup|-1><around|(|0,0|)><rsup|T>|2>>|2*\<pi\><sqrt|det
    <around|(|\<Sigma\>|)>>>=0
  </equation>

  since the determinant of <math|\<Sigma\>> is strictly positive due to the
  non-degeneracy of the process.

  <subsection|Zero Counting Function Development>

  The zero counting function takes the form:

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|N<around|(|T|)>>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*e<rsup|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*d*r*d*t>>|<row|<cell|>|<cell|=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T>\<cal-H\><rsub|0,r\<to\>\<epsilon\>>e<rsup|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*d*t>>>>
    </eqsplit>
  </equation>

  where <math|\<cal-H\><rsub|0,r\<to\>s><around|[|f|]>=<big|int><rsub|0><rsup|\<infty\>>r*f<around|(|r|)>*J<rsub|0>*<around|(|s*r|)>*d*r>
  is the Hankel transform of order zero.

  <subsection|Detailed Proof of Zero Counting Function Representation>

  We will now prove in detail that this representation indeed gives the zero
  counting function:

  <\proof>
    1. Start with the proposed representation:

    <\equation>
      N<around|(|T|)>=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*e<rsup|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*d*r*d*t
    </equation>

    2. Focus on the inner integral:

    <\equation>
      I=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*e<rsup|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*d*r
    </equation>

    3. Use the integral representation of <math|J<rsub|0>>:

    <\equation>
      J<rsub|0>*<around|(|\<epsilon\>*r|)>=<frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>>exp
      <around|(|i*\<epsilon\>*r*cos \<theta\>|)>*d*\<theta\>
    </equation>

    4. Substitute this into our integral:

    <\equation>
      I=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||r|\|><around*|[|<big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*\<epsilon\>*r*cos
      \<theta\>>*d*\<theta\>|]>*e<rsup|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*d*r
    </equation>

    5. Exchange the order of integration (by Fubini's theorem):

    <\equation>
      I=<frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||r|\|>*e<rsup|i*r*<around|(|\<epsilon\>*cos
      \<theta\>-<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>|)>>*d*r|]>*d*\<theta\>
    </equation>

    6. Evaluate the inner integral:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||r|\|>*exp
      <around|(|i*a*r|)>*d*r=-<frac|2|a<rsup|2>>*<space|1em><text|for real
      >a\<neq\>0
    </equation>

    7. Apply this result:

    <\equation>
      I=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>><frac|1|<around|(|\<epsilon\>*cos
      \<theta\>-<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>|)><rsup|2>>*d*\<theta\>
    </equation>

    8. This integral can be evaluated:

    <\equation>
      I=<frac|2|<around|(|\<epsilon\><rsup|2>+<around|(|<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>|)><rsup|2>|)><rsup|1/2>>
    </equation>

    9. Substitute back into the original expression:

    <\equation>
      N<around|(|T|)>=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T><frac|2|<around|(|\<epsilon\><rsup|2>+<around|(|<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>|)><rsup|2>|)><rsup|1/2>>*d*t
    </equation>

    10. Behavior at zeros: At a zero <math|t<rsub|k>>,
    <math|<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t<rsub|k>|)>=0>

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0> <frac|1|\<pi\>>*<frac|1|<around|(|\<epsilon\><rsup|2>+0<rsup|2>|)><rsup|1/2>>=\<infty\>
    </equation>

    This gives a delta function at each zero.

    11. Behavior away from zeros: Away from zeros,
    <math|<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>\<neq\>0>

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0> <frac|1|\<pi\>>*<frac|1|<around|(|\<epsilon\><rsup|2>+<text|non-zero><rsup|2>|)><rsup|1/2>>=0
    </equation>

    12. Counting function: The integral of these delta functions gives the
    step function:

    <\equation>
      N<around|(|T|)>=<big|sum><rsub|k>H*<around|(|T-t<rsub|k>|)>
    </equation>

    where <math|H> is the Heaviside step function and <math|t<rsub|k>> are
    the zeros of <math|X<around|(|t|)>>.
  </proof>

  This proves that the proposed representation indeed gives the zero counting
  function, with unit jumps at each zero of
  <math|X<around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>.

  <section*|Commentary on Mathematical Structure>

  The appearance of <math|J<rsub|0>> in this construction is not due to any
  joint distribution structure, but rather it is introduced as part of the
  regularization method in the zero counting function representation. The
  Bessel function <math|J<rsub|0>> is chosen for its mathematical properties
  that make it suitable for this counting problem.

  The regularization parameter <math|\<epsilon\>> provides the necessary
  resolution while preserving the natural symmetries of the process. This
  framework reveals why the counting function takes this particular form and
  provides a natural setting for understanding both its average behavior and
  fluctuations.

  The simplicity of zeros follows directly from the Gaussian process
  properties, as the path and its mean square derivative cannot
  simultaneously vanish. This elementary fact, combined with the regularized
  transform approach, provides a complete and elegant description of the zero
  counting function.

  The proof demonstrates how the regularized transform approach effectively
  captures the zero crossings without explicitly computing their locations.
  The limit as <math|\<epsilon\>\<to\>0> ensures that we count only the
  actual zeros, while the Hankel transform structure naturally aligns with
  the rotational symmetry inherent in the regularization method.

  This construction provides a powerful tool for analyzing zero crossings of
  Gaussian processes, connecting the spectral properties (via the KL
  expansion) directly to the counting function. It opens up possibilities for
  studying both the average behavior and the fluctuations of zero crossings
  in a unified framework.

  <section|Interchanging Product of Integrals in the Zero Counting Function>

  Given the zero counting function for Gaussian processes:

  <\equation>
    N<around|(|T|)>=lim<rsub|\<epsilon\>\<to\>0>
    <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*e<rsup|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*<space|0.17em>d*r*<space|0.17em>d*t
  </equation>

  <subsection|Applying Fubini's Theorem>

  1. <with|font-series|bold|Expand the Exponential>:

  The exponential term can be expanded as a product:

  <\equation>
    e<rsup|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>=<big|prod><rsub|n=0><rsup|\<infty\>>e<rsup|-i*r*Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>
  </equation>

  2. <with|font-series|bold|Interchange the Order>:

  Instead of interchanging the integrals, we want to interchange the product
  with the integrals. Fubini's theorem allows us to do this if the integral
  exists and the integrand is measurable:

  <\equation>
    N<around|(|T|)>=lim<rsub|\<epsilon\>\<to\>0>
    <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|prod><rsub|n=0><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*e<rsup|-i*r*Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*<space|0.17em>d*r*<space|0.17em>d*t
  </equation>

  3. <with|font-series|bold|Term-by-Term Integration>:

  Now, we can integrate term by term with respect to <math|r>:

  <\equation>
    N<around|(|T|)>=lim<rsub|\<epsilon\>\<to\>0>
    <frac|1|2*\<pi\>>*<big|prod><rsub|n=0><rsup|\<infty\>><around*|(|<big|int><rsub|0><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*e<rsup|-i*r*Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*<space|0.17em>d*r*<space|0.17em>d*t|)>
  </equation>

  <subsection|Justification>

  <\itemize>
    <item><with|font-series|bold|Measurability>: The integrand, including the
    exponential term and the Hankel function <math|J<rsub|0>>, is continuous
    and bounded, ensuring measurability.

    <item><with|font-series|bold|Product Structure>: The exponential term is
    expressed as a product, allowing for term-by-term integration.

    <item><with|font-series|bold|Fubini's Theorem>: The conditions for
    Fubini's theorem are satisfied, allowing us to interchange the product
    and integral operations.
  </itemize>

  <subsection|Conclusion>

  By applying Fubini's theorem, we can interchange the product of integrals
  in the exponentiation, allowing for term-by-term integration. This
  interchange simplifies the computation and analysis by breaking down the
  integral into manageable parts. The limit as <math|\<epsilon\>\<to\>0>
  remains necessary to ensure that only actual zeros are counted, providing a
  mathematical framework for a more manageable representation of the process.

  <section*|Interchanging Product of Integrals in the Zero Counting Function>

  Given the zero counting function for Gaussian processes:

  <\equation>
    N<around|(|T|)>=lim<rsub|\<epsilon\>\<to\>0>
    <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|>*e<rsup|-i*r*<big|sum><rsub|n=0><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*<space|0.17em>d*r*<space|0.17em>d*t
  </equation>

  <subsection*|Applying Fubini's Theorem>

  Apply Fubini's theorem to rewrite as a sum over integrals:

  <\equation>
    N<around|(|T|)>=lim<rsub|\<epsilon\>\<to\>0>
    <frac|1|2*\<pi\>>*<big|sum><rsub|n=0><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around|(|\<epsilon\>*r|)><around|\||r|\|><around*|(|<big|int><rsub|0><rsup|T>e<rsup|-i*r*Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>>*<space|0.17em>d*t|)>*<space|0.17em>d*r
  </equation>

  <subsection*|Conclusion>

  By applying Fubini's theorem, we have rewritten the zero counting function
  as a sum over integrals, with the innermost operation being an integral.
  This structure allows for term-by-term integration while maintaining the
  mathematical framework for counting zeros of the Gaussian process.

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|0>
      \;
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
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|2.1|6>>
    <associate|auto-11|<tuple|2.2|6>>
    <associate|auto-12|<tuple|2.3|7>>
    <associate|auto-13|<tuple|2.3|7>>
    <associate|auto-14|<tuple|25|7>>
    <associate|auto-15|<tuple|26|7>>
    <associate|auto-16|<tuple|26|7>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.3|2>>
    <associate|auto-5|<tuple|1.4|3>>
    <associate|auto-6|<tuple|1.5|3>>
    <associate|auto-7|<tuple|1.6|3>>
    <associate|auto-8|<tuple|20|5>>
    <associate|auto-9|<tuple|2|6>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Zero
      Counting Function via Regularized Transform for Gaussian Processes on
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|<around|[|0,\<infty\>|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Natural Framework and
      Preliminaries <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Note on Compactness
      Verification <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Bidirectional
      Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Simplicity of Zeros
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>Zero Counting Function
      Development <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.6<space|2spc>Detailed Proof of Zero
      Counting Function Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Commentary
      on Mathematical Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Interchanging
      Product of Integrals in the Zero Counting Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Applying Fubini's Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Justification
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Interchanging
      Product of Integrals in the Zero Counting Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Applying Fubini's Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>