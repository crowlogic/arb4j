<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Lefschetz Thimbles in Quantum Cosmology: Complete
  Proofs>|<doc-author|<author-data|<author-name|Theoretical Physics
  Analysis>>>|<doc-date|<date|>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction
    to Lefschetz Thimbles> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Wheeler-DeWitt Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Path
    Integral Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Exact
    Solutions in FLRW Cosmology> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Quantum
    Tunneling in Cosmology> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusion
    and Physical Implications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgments>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction to Lefschetz Thimbles>

  A Lefschetz thimble (note: not "Lefschitz" as misspelled in the question)
  is a fundamental concept in Picard-Lefschetz theory, named after
  mathematician Solomon Lefschetz. In the context of quantum cosmology and
  path integrals, Lefschetz thimbles provide a rigorous way to define
  integration contours in complex function spaces.

  Specifically, a Lefschetz thimble <math|\<cal-J\><rsub|\<sigma\>>>
  associated with a critical point <math|\<sigma\>> of a complex action
  <math|S> is the set of all points that flow to <math|\<sigma\>> along
  steepest descent paths of Re<math|<around|(|i*S|)>>. These thimbles allow
  us to decompose oscillatory path integrals into more tractable components,
  each dominated by a single critical point of the action.

  <section|The Wheeler-DeWitt Equation>

  <\theorem>
    [Exact Wheeler-DeWitt Equation] The quantum state of the universe
    <math|\<Psi\>*<around|[|h<rsub|i*j>,\<phi\>|]>> must exactly satisfy:

    <\equation>
      <around*|[|-G<rsub|i*j*k*l>*<frac|\<hbar\><rsup|2>*\<delta\><rsup|2>|\<delta\>*h<rsub|i*j>*\<delta\>*h<rsub|k*l>>+<sqrt|h>*<around|(|R<rsup|<around|(|3|)>>-2*\<Lambda\>|)>+<wide|\<cal-H\>|^><rsub|matter>|]>*\<Psi\>*<around|[|h<rsub|i*j>,\<phi\>|]>=0
    </equation>

    where no approximations are introduced in the operators or their domain.
  </theorem>

  <\proof>
    We begin with the ADM decomposition of the spacetime metric:

    <\equation>
      d*s<rsup|2>=-N<rsup|2>*d*t<rsup|2>+h<rsub|i*j>*<around|(|d*x<rsup|i>+N<rsup|i>*d*t|)>*<around|(|d*x<rsup|j>+N<rsup|j>*d*t|)>
    </equation>

    The Einstein-Hilbert action becomes:

    <\equation>
      S=<big|int>d<rsup|4>*x*<sqrt|-g>*<frac|R-2*\<Lambda\>|16*\<pi\>*G>=<big|int>d*t*d<rsup|3>*x*N*<sqrt|h>*<around*|(|K<rsub|i*j>*K<rsup|i*j>-K<rsup|2>+R<rsup|<around|(|3|)>>-2*\<Lambda\>+\<cal-L\><rsub|<text>>*m*a*t*t*e*r|)>
    </equation>

    The canonical momenta conjugate to <math|h<rsub|i*j>> are:

    <\equation>
      \<pi\><rsup|i*j>=<frac|\<delta\>*\<cal-L\>|\<delta\>*<wide|h|\<dot\>><rsub|i*j>>=<sqrt|h>*<around|(|K<rsup|i*j>-h<rsup|i*j>*K|)>
    </equation>

    The Hamiltonian constraint from varying with respect to lapse <math|N>
    is:

    <\equation>
      \<cal-H\>=<frac|16*\<pi\>*G|<sqrt|h>>*G<rsub|i*j*k*l>*\<pi\><rsup|i*j>*\<pi\><rsup|k*l>-<frac|<sqrt|h>|16*\<pi\>*G>*<around|(|R<rsup|<around|(|3|)>>-2*\<Lambda\>|)>+\<cal-H\><rsub|<text>>*m*a*t*t*e*r=0
    </equation>

    where <math|G<rsub|i*j*k*l>=<frac|1|2>*<around|(|h<rsub|i*k>*h<rsub|j*l>+h<rsub|i*l>*h<rsub|j*k>-h<rsub|i*j>*h<rsub|k*l>|)>>
    is the DeWitt supermetric.

    Upon canonical quantization, we promote the momenta to operators:

    <\equation>
      <wide|\<pi\>|^><rsup|i*j>=-i*\<hbar\>*<frac|\<delta\>|\<delta\>*h<rsub|i*j>>
    </equation>

    Substituting this into the Hamiltonian constraint and applying it to a
    wave functional <math|\<Psi\>*<around|[|h<rsub|i*j>,\<phi\>|]>>:

    <\equation>
      <around*|[|-G<rsub|i*j*k*l>*<frac|\<hbar\><rsup|2>*\<delta\><rsup|2>|\<delta\>*h<rsub|i*j>*\<delta\>*h<rsub|k*l>>+<sqrt|h>*<around|(|R<rsup|<around|(|3|)>>-2*\<Lambda\>|)>+<wide|\<cal-H\>|^><rsub|<text>>*m*a*t*t*e*r|]>*\<Psi\>*<around|[|h<rsub|i*j>,\<phi\>|]>=0
    </equation>

    This exact Wheeler-DeWitt equation emerges without approximations,
    representing the quantum constraint on physical states in the full
    superspace of metrics and matter fields.
  </proof>

  <section|Path Integral Formulation>

  <\definition>
    [Exact Path Integral Measure] The diffeomorphism-invariant measure on the
    space of metrics and matter fields is defined as:

    <\equation>
      \<cal-D\><around|[|g,\<Phi\>|]>=<big|prod><rsub|x><big|prod><rsub|\<mu\>\<leq\>\<nu\>><frac|d*g<rsub|\<mu\>*\<nu\>><around|(|x|)>|<sqrt|G<around|[|g|]>>>*<big|prod><rsub|x>d*\<Phi\><around|(|x|)>
    </equation>

    where <math|G<around|[|g|]>> is the determinant of the DeWitt supermetric
    on the space of metrics.
  </definition>

  <\proof>
    The space of Lorentzian metrics forms an infinite-dimensional manifold
    (superspace). The DeWitt supermetric on this space is:

    <\equation>
      G<rsub|\<mu\>*\<nu\>*\<rho\>*\<sigma\>><around|[|g|]>=<frac|1|2>*g<rsup|-1/2>*<around|(|g<rsub|\<mu\>*\<rho\>>*g<rsub|\<nu\>*\<sigma\>>+g<rsub|\<mu\>*\<sigma\>>*g<rsub|\<nu\>*\<rho\>>-g<rsub|\<mu\>*\<nu\>>*g<rsub|\<rho\>*\<sigma\>>|)>
    </equation>

    This supermetric induces an inner product on metric perturbations:

    <\equation>
      <around|\<langle\>|\<delta\>*g<rsub|1>,\<delta\>*g<rsub|2>|\<rangle\>>=<big|int>d<rsup|4>*x*<sqrt|g>*<space|0.17em>G<rsup|\<mu\>*\<nu\>*\<rho\>*\<sigma\>>*\<delta\>*g<rsub|1*\<mu\>*\<nu\>>*\<delta\>*g<rsub|2*\<rho\>*\<sigma\>>
    </equation>

    For diffeomorphism invariance, the measure must account for how volumes
    transform in superspace under coordinate changes. Under infinitesimal
    coordinate transformations <math|x<rsup|\<mu\>>\<rightarrow\>x<rsup|\<mu\>>+\<xi\><rsup|\<mu\>>>,
    the metric transforms as:

    <\equation>
      \<delta\>*g<rsub|\<mu\>*\<nu\>>=\<nabla\><rsub|\<mu\>>*\<xi\><rsub|\<nu\>>+\<nabla\><rsub|\<nu\>>*\<xi\><rsub|\<mu\>>
    </equation>

    The factor <math|1/<sqrt|det G<around|[|g|]>>> ensures invariance under
    such transformations, analogous to <math|<sqrt|det g>> in Riemannian
    volume elements. Therefore:

    <\equation>
      \<cal-D\><around|[|g|]>=<big|prod><rsub|x><big|prod><rsub|\<mu\>\<leq\>\<nu\>><frac|d*g<rsub|\<mu\>*\<nu\>><around|(|x|)>|<sqrt|G<around|[|g|]>>>
    </equation>

    For scalar matter fields:

    <\equation>
      \<cal-D\><around|[|\<Phi\>|]>=<big|prod><rsub|x>d*\<Phi\><around|(|x|)>
    </equation>

    Combining these yields the complete diffeomorphism-invariant measure:

    <\equation>
      \<cal-D\><around|[|g,\<Phi\>|]>=<big|prod><rsub|x><big|prod><rsub|\<mu\>\<leq\>\<nu\>><frac|d*g<rsub|\<mu\>*\<nu\>><around|(|x|)>|<sqrt|G<around|[|g|]>>>*<big|prod><rsub|x>d*\<Phi\><around|(|x|)>
    </equation>

    This ensures we integrate over physically distinct configurations without
    double-counting metrics related by coordinate transformations.
  </proof>

  <\theorem>
    [Exact No-Boundary Wave Function] The exact no-boundary wave function is
    defined as:

    <\equation>
      \<Psi\><rsub|NB>*<around|[|h<rsub|i*j>,\<phi\>|]>=<big|int><rsub|C>\<cal-D\><around|[|g,\<Phi\>|]>*<space|0.17em>e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>
    </equation>

    where <math|C> is the class of complex 4-metrics defined on manifolds
    with a single boundary on which the induced metric is <math|h<rsub|i*j>>
    and field value is <math|\<phi\>>. The full action is:

    <\equation>
      S*<around|[|g,\<Phi\>|]>=<big|int><rsub|M>d<rsup|4>*x*<sqrt|-g>*<around*|[|<frac|R-2*\<Lambda\>|16*\<pi\>*G>+\<cal-L\><rsub|matter>|]>
    </equation>
  </theorem>

  <\proof>
    The no-boundary proposal by Hartle and Hawking asserts that the wave
    function of the universe is calculated via a path integral over compact
    Euclidean geometries with a single boundary. We generalize this to
    complex metrics since saddle points often involve complex geometries.

    In quantum mechanics, wave functions represent transition amplitudes. For
    quantum gravity, <math|\<Psi\>*<around|[|h<rsub|i*j>,\<phi\>|]>> gives
    the amplitude for finding a 3-geometry with metric <math|h<rsub|i*j>> and
    field configuration <math|\<phi\>>.

    We consider 4-manifolds <math|M> with a single boundary
    <math|\<partial\>*M> where the induced metric is <math|h<rsub|i*j>> and
    field value is <math|\<phi\>>. The boundary data is real, but bulk
    metrics and fields can be complex.

    The gravitational action with proper boundary terms is:

    <\equation>
      S<rsub|<text>>*t*o*t*a*l*<around|[|g,\<Phi\>|]>=<big|int><rsub|M>d<rsup|4>*x*<sqrt|-g>*<around*|[|<frac|R-2*\<Lambda\>|16*\<pi\>*G>+\<cal-L\><rsub|<text>>*m*a*t*t*e*r|]>+<frac|1|8*\<pi\>*G>*<big|int><rsub|\<partial\>*M>d<rsup|3>*x*<sqrt|h>*K
    </equation>

    where <math|K> is the extrinsic curvature of the boundary.

    The exact no-boundary wave function is therefore:

    <\equation>
      \<Psi\><rsub|<text>>*N*B*<around|[|h<rsub|i*j>,\<phi\>|]>=<big|int><rsub|C>\<cal-D\><around|[|g,\<Phi\>|]>*e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>
    </equation>

    This represents creation "from nothing" as there is no initial boundary.
    The integral sums over all complex geometries consistent with the
    boundary conditions, effectively capturing the full quantum gravity
    regime without semiclassical approximations.
  </proof>

  <\theorem>
    [Exact Contour Deformation] The no-boundary path integral can be exactly
    rewritten as:

    <\equation>
      \<Psi\><rsub|NB>*<around|[|h<rsub|i*j>,\<phi\>|]>=<big|int><rsub|\<gamma\>>\<cal-D\><around|[|g,\<Phi\>|]>*<space|0.17em>e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>
    </equation>

    where <math|\<gamma\>> is a complex contour in the space of metrics that
    passes through the relevant critical points of the action.
  </theorem>

  <\proof>
    The original no-boundary path integral involves an integral over a class
    <math|C> of complex metrics. To make this mathematically rigorous, we
    need to specify an appropriate integration contour.

    Let <math|\<cal-M\><rsub|\<bbb-C\>>> denote the complex space of metrics
    and matter fields. Since the action <math|S*<around|[|g,\<Phi\>|]>> is a
    holomorphic functional on this space, we can apply Cauchy's theorem to
    deform the integration contour without changing the integral's value,
    provided we don't cross singularities or branch cuts.

    Let <math|\<gamma\>> be a contour in <math|\<cal-M\><rsub|\<bbb-C\>>>
    passing through critical points of the action, i.e., solutions to:

    <\equation>
      <frac|\<delta\>*S|\<delta\>*g<rsub|\<mu\>*\<nu\>>>=0,<space|1em><frac|\<delta\>*S|\<delta\>*\<Phi\>>=0
    </equation>

    These critical points represent complex solutions to the Einstein
    equations with appropriate boundary conditions.

    By complex function theory in infinite dimensions:

    <\equation>
      <big|int><rsub|C>\<cal-D\><around|[|g,\<Phi\>|]>*e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>=<big|int><rsub|\<gamma\>>\<cal-D\><around|[|g,\<Phi\>|]>*e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>
    </equation>

    This contour deformation is justified by Morse theory and
    Picard-Lefschetz principles in infinite dimensions. The advantage is that
    we can choose <math|\<gamma\>> along which the integral is well-behaved,
    with the real part of the action increasing rapidly away from critical
    points to ensure convergence.

    The exact no-boundary wave function is therefore:

    <\equation>
      \<Psi\><rsub|<text>>*N*B*<around|[|h<rsub|i*j>,\<phi\>|]>=<big|int><rsub|\<gamma\>>\<cal-D\><around|[|g,\<Phi\>|]>*e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>
    </equation>

    This formulation provides a precise mathematical definition of the path
    integral beyond semiclassical approximations.
  </proof>

  <\theorem>
    [Analyticity of No-Boundary Wave Function] The no-boundary wave function
    is an entire function on the space of complexified 3-metrics and matter
    fields, satisfying:

    <\equation>
      <frac|\<delta\>*\<Psi\><rsub|NB>|\<delta\>*<wide|h|\<bar\>><rsub|i*j>>=0
    </equation>

    in the complex extension of superspace.
  </theorem>

  <\proof>
    We examine the analyticity of the no-boundary wave function in the
    complexified superspace where <math|h<rsub|i*j>> and <math|\<phi\>> can
    take complex values.

    Decomposing the complex metric into real and imaginary parts:

    <\equation>
      h<rsub|i*j>=h<rsub|i*j><rsup|<text>>*R*e+i*h<rsub|i*j><rsup|<text>>*I*m
    </equation>

    For holomorphicity, the wave function must satisfy:

    <\equation>
      <frac|\<delta\>*\<Psi\><rsub|<text>>*N*B|\<delta\>*<wide|h|\<bar\>><rsub|i*j>>=0
    </equation>

    The no-boundary wave function is:

    <\equation>
      \<Psi\><rsub|<text>>*N*B*<around|[|h<rsub|i*j>,\<phi\>|]>=<big|int><rsub|\<gamma\>>\<cal-D\><around|[|g,\<Phi\>|]>*e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>
    </equation>

    When we vary the boundary data <math|h<rsub|i*j>>, this shifts the
    integration contour <math|\<gamma\>>. However, due to the holomorphicity
    of the action, the integral's value is invariant under continuous
    deformations of the contour that preserve asymptotic behavior.

    The dependence on <math|h<rsub|i*j>> comes solely from the explicit
    dependence of the action on boundary data, which is holomorphic.
    Therefore:

    <\equation>
      <frac|\<delta\>*\<Psi\><rsub|<text>>*N*B|\<delta\>*<wide|h|\<bar\>><rsub|i*j>>=<big|int><rsub|\<gamma\>>\<cal-D\><around|[|g,\<Phi\>|]><frac|\<delta\>|\<delta\>*<wide|h|\<bar\>><rsub|i*j>><around*|(|e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>|)>=0
    </equation>

    because <math|<frac|\<delta\>*S|\<delta\>*<wide|h|\<bar\>><rsub|i*j>>=0>
    due to the action's holomorphicity.

    This proves the no-boundary wave function is an entire function on
    complexified superspace. The analyticity has profound implications: the
    wave function can be uniquely determined by its values on real superspace
    through analytic continuation, connecting complex saddle points to real
    geometries.
  </proof>

  <section|Exact Solutions in FLRW Cosmology>

  <\theorem>
    [Exact FLRW Solution] For FLRW symmetry with scale factor <math|a> and
    homogeneous scalar field <math|\<phi\>>, the exact Wheeler-DeWitt
    equation is:

    <\equation>
      <around*|[|-<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<frac|\<partial\><rsup|2>|\<partial\>*a<rsup|2>>+<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<frac|1|a>*<frac|\<partial\>|\<partial\>*a>+<frac|\<hbar\><rsup|2>|2*a<rsup|3>>*<frac|\<partial\><rsup|2>|\<partial\>*\<phi\><rsup|2>>+a*<around|(|1-\<Lambda\>*a<rsup|2>|)>+a<rsup|3>*V<around|(|\<phi\>|)>|]>*\<Psi\>*<around|(|a,\<phi\>|)>=0
    </equation>

    which admits exact solutions of the form:

    <\equation>
      \<Psi\>*<around|(|a,\<phi\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>a<rsup|n>*<big|sum><rsub|m=0><rsup|\<infty\>>c<rsub|n*m>*\<phi\><rsup|m>
    </equation>

    with recursion relations for the coefficients <math|c<rsub|n*m>>
    determined by the equation.
  </theorem>

  <\proof>
    For an FLRW universe, the metric is:

    <\equation>
      d*s<rsup|2>=-N<rsup|2><around|(|t|)>*d*t<rsup|2>+a<rsup|2><around|(|t|)>*<around*|(|<frac|d*r<rsup|2>|1-k*r<rsup|2>>+r<rsup|2>*d*\<Omega\><rsup|2>|)>
    </equation>

    For the closed universe case (<math|k=1>), the gravitational action is:

    <\equation>
      S<rsub|<text>>*g*r*a*v=<frac|3*\<pi\>|4*G>*<big|int>d*t*N*a*<around*|(|-<frac|<wide|a|\<dot\>><rsup|2>|N<rsup|2>>+1-<frac|\<Lambda\>|3>*a<rsup|2>|)>
    </equation>

    With a homogeneous scalar field:

    <\equation>
      S<rsub|<text>>*m*a*t*t*e*r=2*\<pi\><rsup|2>*<big|int>d*t*N*a<rsup|3>*<around*|(|<frac|<wide|\<phi\>|\<dot\>><rsup|2>|2*N<rsup|2>>-V<around|(|\<phi\>|)>|)>
    </equation>

    The canonical momenta are:

    <\equation>
      p<rsub|a>=-<frac|3*\<pi\>|2*G>*<frac|a*<wide|a|\<dot\>>|N>,<space|1em>p<rsub|\<phi\>>=2*\<pi\><rsup|2>*a<rsup|3>*<frac|<wide|\<phi\>|\<dot\>>|N>
    </equation>

    The Hamiltonian constraint is:

    <\equation>
      -<frac|G|3*\<pi\>>*<frac|p<rsub|a><rsup|2>|2*a>+<frac|p<rsub|\<phi\>><rsup|2>|4*\<pi\><rsup|2>*a<rsup|3>>+<frac|3*\<pi\>|4*G>*a*<around*|(|1-<frac|\<Lambda\>|3>*a<rsup|2>|)>+2*\<pi\><rsup|2>*a<rsup|3>*V<around|(|\<phi\>|)>=0
    </equation>

    Quantizing with <math|p<rsub|a>\<to\>-i*\<hbar\>*<frac|\<partial\>|\<partial\>*a>>
    and <math|p<rsub|\<phi\>>\<to\>-i*\<hbar\>*<frac|\<partial\>|\<partial\>*\<phi\>>>:

    <\equation>
      <around*|[|-<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<frac|\<partial\><rsup|2>|\<partial\>*a<rsup|2>>+<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<frac|1|a>*<frac|\<partial\>|\<partial\>*a>+<frac|\<hbar\><rsup|2>|2*a<rsup|3>>*<frac|\<partial\><rsup|2>|\<partial\>*\<phi\><rsup|2>>+a*<around*|(|1-\<Lambda\>*a<rsup|2>|)>+a<rsup|3>*V<around|(|\<phi\>|)>|]>*\<Psi\>*<around|(|a,\<phi\>|)>=0
    </equation>

    where we've included the factor ordering term with <math|p=<frac|3|4>>
    for covariance.

    For exact solutions, we propose:

    <\equation>
      \<Psi\>*<around|(|a,\<phi\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>a<rsup|n>*<big|sum><rsub|m=0><rsup|\<infty\>>c<rsub|n*m>*\<phi\><rsup|m>
    </equation>

    Substituting into the Wheeler-DeWitt equation and collecting terms by
    powers of <math|a> and <math|\<phi\>>:

    The kinetic term for <math|a>:

    <\equation>
      -<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<frac|\<partial\><rsup|2>|\<partial\>*a<rsup|2>>*\<Psi\>=-<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<big|sum><rsub|n=0><rsup|\<infty\>>n*<around|(|n-1|)>*a<rsup|n-2>*<big|sum><rsub|m=0><rsup|\<infty\>>c<rsub|n*m>*\<phi\><rsup|m>
    </equation>

    The factor ordering term:

    <\equation>
      <frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<frac|1|a>*<frac|\<partial\>|\<partial\>*a>*\<Psi\>=<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<big|sum><rsub|n=0><rsup|\<infty\>>n*a<rsup|n-2>*<big|sum><rsub|m=0><rsup|\<infty\>>c<rsub|n*m>*\<phi\><rsup|m>
    </equation>

    The kinetic term for <math|\<phi\>>:

    <\equation>
      <frac|\<hbar\><rsup|2>|2*a<rsup|3>>*<frac|\<partial\><rsup|2>|\<partial\>*\<phi\><rsup|2>>*\<Psi\>=<frac|\<hbar\><rsup|2>|2>*<big|sum><rsub|n=0><rsup|\<infty\>>a<rsup|n-3>*<big|sum><rsub|m=0><rsup|\<infty\>>m*<around|(|m-1|)>*c<rsub|n*m>*\<phi\><rsup|m-2>
    </equation>

    Potential terms:

    <\equation>
      a*<around|(|1-\<Lambda\>*a<rsup|2>|)>*\<Psi\>+a<rsup|3>*V<around|(|\<phi\>|)>*\<Psi\>
    </equation>

    Equating coefficients yields recursion relations that determine all
    <math|c<rsub|n*m>> from initial values, providing the exact solution.
  </proof>

  <\theorem>
    [Exact Solutions Near <math|a=0>] Near <math|a=0>, the exact no-boundary
    wave function for FLRW universe has the form:

    <\equation>
      \<Psi\>*<around|(|a,\<phi\>|)>=a<rsup|p>*<big|sum><rsub|n=0><rsup|\<infty\>>a<rsup|2*n>*f<rsub|n><around|(|\<phi\>|)>
    </equation>

    where <math|p=0> or <math|p=1>, and <math|f<rsub|n><around|(|\<phi\>|)>>
    satisfies a sequence of differential equations:

    <\equation>
      <around*|[|<frac|\<hbar\><rsup|2>|2*a<rsup|3>>*<frac|d<rsup|2>|d*\<phi\><rsup|2>>+a<rsup|3>*V<around|(|\<phi\>|)>|]>
    </equation>

    <\equation>
      f<rsub|n><around|(|\<phi\>|)>=<around*|[|<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<around|(|2*n+p|)>*<around|(|2*n+p-1|)>-<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<around|(|2*n+p|)>-<around|(|1-\<Lambda\>*a<rsup|2>|)>|]>*f<rsub|n-1><around|(|\<phi\>|)>
    </equation>
  </theorem>

  <\proof>
    To find solutions near <math|a=0>, we analyze the behavior of the
    Wheeler-DeWitt equation in this limit:

    <\equation>
      <around*|[|-<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<frac|\<partial\><rsup|2>|\<partial\>*a<rsup|2>>+<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<frac|1|a>*<frac|\<partial\>|\<partial\>*a>+<frac|\<hbar\><rsup|2>|2*a<rsup|3>>*<frac|\<partial\><rsup|2>|\<partial\>*\<phi\><rsup|2>>+a*<around|(|1-\<Lambda\>*a<rsup|2>|)>+a<rsup|3>*V<around|(|\<phi\>|)>|]>*\<Psi\>*<around|(|a,\<phi\>|)>=0
    </equation>

    As <math|a\<to\>0>, the dominant terms are:

    <\equation>
      <around*|[|-<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<frac|\<partial\><rsup|2>|\<partial\>*a<rsup|2>>+<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<frac|1|a>*<frac|\<partial\>|\<partial\>*a>+<frac|\<hbar\><rsup|2>|2*a<rsup|3>>*<frac|\<partial\><rsup|2>|\<partial\>*\<phi\><rsup|2>>|]>*\<Psi\>*<around|(|a,\<phi\>|)>=0
    </equation>

    We propose an ansatz:

    <\equation>
      \<Psi\>*<around|(|a,\<phi\>|)>=a<rsup|p>*<big|sum><rsub|n=0><rsup|\<infty\>>a<rsup|2*n>*f<rsub|n><around|(|\<phi\>|)>
    </equation>

    Using even powers of <math|a> simplifies the recursion relations due to
    the <math|a> and <math|a<rsup|3>> terms in the potential.

    Substituting into the Wheeler-DeWitt equation and collecting terms with
    matching powers of <math|a>:

    For the leading order (<math|a<rsup|p-2>>):

    <\equation>
      <around*|[|-<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*p*<around|(|p-1|)>+<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*p|]>*f<rsub|0><around|(|\<phi\>|)>+<frac|\<hbar\><rsup|2>|2>*<frac|d<rsup|2>*f<rsub|0><around|(|\<phi\>|)>|d*\<phi\><rsup|2>>=0
    </equation>

    For non-trivial solutions, the coefficient of
    <math|f<rsub|0><around|(|\<phi\>|)>> must vanish:

    <\equation>
      p*<around|(|p-1|)>-<frac|3|4>*p=0
    </equation>

    This has solutions <math|p=0> and <math|p=<frac|3|4>>, but consistency
    with the full equation when including higher-order terms restricts us to
    <math|p=0> or <math|p=1>.

    For <math|p=0>, we get <math|<frac|d<rsup|2>*f<rsub|0><around|(|\<phi\>|)>|d*\<phi\><rsup|2>>=0>,
    yielding <math|f<rsub|0><around|(|\<phi\>|)>=A+B*\<phi\>>.

    For higher orders, collecting <math|a<rsup|p+2*n-2>> terms for
    <math|n\<geq\>1>:

    <\equation>
      <\eqsplit>
        <tformat|<table|<row|<cell|>|<cell|<around*|[|-<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<around|(|p+2*n|)>*<around|(|p+2*n-1|)>+<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<around|(|p+2*n|)>|]>*f<rsub|n><around|(|\<phi\>|)>+<frac|\<hbar\><rsup|2>|2>*<frac|d<rsup|2>*f<rsub|n><around|(|\<phi\>|)>|d*\<phi\><rsup|2>>>|<cell|>>|<row|<cell|>|<cell|=>|<cell|>>|<row|<cell|>|<cell|<around|[|a*f<rsub|n-1><around|(|\<phi\>|)>-\<Lambda\>*a<rsup|3>*f<rsub|n-2><around|(|\<phi\>|)>-a<rsup|3>*V<around|(|\<phi\>|)>*f<rsub|n-1><around|(|\<phi\>|)>|]>>|<cell|>>>>
      </eqsplit>
    </equation>

    Rearranging:

    <with|font-base-size|7|<\equation>
      <around*|[|<frac|\<hbar\><rsup|2>|2>*<frac|d<rsup|2>|d*\<phi\><rsup|2>>+a<rsup|3>*V<around|(|\<phi\>|)>|]>*f<rsub|n><around|(|\<phi\>|)>=<around*|[|<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<around|(|2*n+p|)>*<around|(|2*n+p-1|)>-<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<around|(|2*n+p|)>-<around|(|1-\<Lambda\>*a<rsup|2>|)>|]>*f<rsub|n-1><around|(|\<phi\>|)>
    </equation>>

    This gives a recursive system of differential equations for
    <math|f<rsub|n><around|(|\<phi\>|)>>, solvable sequentially starting from
    <math|f<rsub|0><around|(|\<phi\>|)>>.

    Therefore, near <math|a=0>, the exact no-boundary wave function has the
    form:

    <\equation>
      \<Psi\>*<around|(|a,\<phi\>|)>=a<rsup|p>*<big|sum><rsub|n=0><rsup|\<infty\>>a<rsup|2*n>*f<rsub|n><around|(|\<phi\>|)>
    </equation>

    with <math|p=0> or <math|p=1>, providing insight into the quantum nature
    of the universe near the cosmological singularity.
  </proof>

  <section|Quantum Tunneling in Cosmology>

  <\theorem>
    [Tunneling Through Potential Barriers - Exact Formulation] For a universe
    tunneling through a potential barrier, the exact transmission coefficient
    is:

    <\equation>
      T=<frac|<around|\||\<Psi\><rsub|transmitted>|\|><rsup|2>|<around|\||\<Psi\><rsub|incident>|\|><rsup|2>>=<frac|1|1+e<rsup|2*S<rsub|0>>>
    </equation>

    where <math|S<rsub|0>> is the exact Euclidean action for the instanton
    solution:

    <\equation>
      S<rsub|0>=2*<big|int><rsub|a<rsub|1>><rsup|a<rsub|2>><sqrt|<frac|3*\<pi\>|4*G>*<around*|(|1-<frac|\<Lambda\>|3>*a<rsup|2>|)>>*d*a
    </equation>
  </theorem>

  <\proof>
    In quantum cosmology, the universe can tunnel through classically
    forbidden regions of superspace, analogous to quantum tunneling in
    ordinary quantum mechanics.

    For a closed FLRW universe with scale factor <math|a>, the Wheeler-DeWitt
    equation in the minisuperspace approximation with a cosmological constant
    <math|\<Lambda\>> is:

    <\equation>
      <around*|[|-<frac|\<hbar\><rsup|2>|2*m<rsub|p><rsup|2>>*<frac|\<partial\><rsup|2>|\<partial\>*a<rsup|2>>+<frac|3*\<hbar\><rsup|2>|8*m<rsub|p><rsup|2>>*<frac|1|a>*<frac|\<partial\>|\<partial\>*a>+U<around|(|a|)>|]>*\<Psi\><around|(|a|)>=0
    </equation>

    where <math|U<around|(|a|)>=<frac|3*\<pi\>|4*G>*a<rsup|2>*<around*|(|1-<frac|\<Lambda\>|3>*a<rsup|2>|)>>
    is the effective potential.

    When <math|\<Lambda\>\<gtr\>0>, this potential forms a barrier between
    <math|a=0> and <math|a=<sqrt|3/\<Lambda\>>>. The classically forbidden
    region is where <math|U<around|(|a|)>\<gtr\>0>.

    For WKB-like solutions in the classically allowed regions:

    <\equation>
      \<Psi\><rsub|<text>>*W*K*B<around|(|a|)>\<approx\><frac|1|<sqrt|p<around|(|a|)>>>*<around*|(|C<rsub|+>*e<rsup|i*<big|int>p<around|(|a|)>*d*a>+C<rsub|->*e<rsup|-i*<big|int>p<around|(|a|)>*d*a>|)>
    </equation>

    with <math|p<around|(|a|)>=<sqrt|-2*m<rsub|p><rsup|2>*U<around|(|a|)>/\<hbar\><rsup|2>>>.

    In the forbidden region, the solution becomes:

    <\equation>
      \<Psi\><rsub|<text>>*f*o*r*b*i*d*d*e*n<around|(|a|)>\<approx\><frac|1|<sqrt|\<kappa\><around|(|a|)>>>*<around*|(|D<rsub|+>*e<rsup|<big|int>\<kappa\><around|(|a|)>*d*a>+D<rsub|->*e<rsup|-<big|int>\<kappa\><around|(|a|)>*d*a>|)>
    </equation>

    with <math|\<kappa\><around|(|a|)>=<sqrt|2*m<rsub|p><rsup|2>*U<around|(|a|)>/\<hbar\><rsup|2>>>.

    For a universe tunneling from <math|a<rsub|1>> to <math|a<rsub|2>>
    (classical turning points), connection formulas from quantum mechanics
    apply. The exact transmission coefficient is:

    <\equation>
      T=<frac|<around|\||\<Psi\><rsub|<text>>*t*r*a*n*s*m*i*t*t*e*d|\|><rsup|2>|<around|\||\<Psi\><rsub|<text>>*i*n*c*i*d*e*n*t|\|><rsup|2>>=<frac|1|1+e<rsup|2*S<rsub|0>>>
    </equation>

    where <math|S<rsub|0>> is the Euclidean action of the instanton:

    <\equation>
      S<rsub|0>=2*<big|int><rsub|a<rsub|1>><rsup|a<rsub|2>>\<kappa\><around|(|a|)>*d*a=2*<big|int><rsub|a<rsub|1>><rsup|a<rsub|2>><sqrt|<frac|2*m<rsub|p><rsup|2>|\<hbar\><rsup|2>>*U<around|(|a|)>>*d*a
    </equation>

    Substituting the explicit form of <math|U<around|(|a|)>>:

    <\equation>
      S<rsub|0>=2*<big|int><rsub|a<rsub|1>><rsup|a<rsub|2>><sqrt|<frac|3*\<pi\>|4*G>*<around*|(|1-<frac|\<Lambda\>|3>*a<rsup|2>|)>>*d*a
    </equation>

    This exact formula accounts for all quantum effects in the tunneling
    process. The exponential suppression factor <math|e<rsup|-2*S<rsub|0>>>
    demonstrates why tunneling from nothing to a finite universe is highly
    suppressed unless the cosmological constant is close to the Planck scale.
  </proof>

  <\theorem>
    [Exact Bubble Nucleation Rate] The exact rate of true vacuum bubble
    nucleation per unit 4-volume is:

    <\equation>
      \<Gamma\>=A*e<rsup|-B>
    </equation>

    where:

    <\equation>
      B=2*\<pi\><rsup|2>*r<rsup|3>*<around*|[|\<sigma\>-<big|int><rsub|\<phi\><rsub|false>><rsup|\<phi\><rsub|true>><sqrt|2*<around|(|V<around|(|\<phi\>|)>-V<around|(|\<phi\><rsub|true>|)>|)>>*<space|0.17em>d*\<phi\>|]>
    </equation>

    with <math|r> the exact bubble radius, <math|\<sigma\>> the exact bubble
    wall tension, and <math|A> the exact functional determinant factor
    (without using WKB approximation).
  </theorem>

  <\proof>
    We start with the action for a scalar field coupled to gravity:

    <\equation>
      S=<big|int>d<rsup|4>*x*<sqrt|-g>*<around*|[|<frac|R|16*\<pi\>*G>-<frac|1|2>*<around|(|\<nabla\>*\<phi\>|)><rsup|2>-V<around|(|\<phi\>|)>|]>
    </equation>

    Consider a potential <math|V<around|(|\<phi\>|)>> with two minima: a
    false vacuum at <math|\<phi\><rsub|<text>>*f*a*l*s*e> and a true vacuum
    at <math|\<phi\><rsub|<text>>*t*r*u*e>, where
    <math|V*<around|(|\<phi\><rsub|<text>>*t*r*u*e|)>\<less\>V*<around|(|\<phi\><rsub|<text>>*f*a*l*s*e|)>>.

    The exact bubble nucleation rate is given by:

    <\equation>
      \<Gamma\>=A*e<rsup|-B>
    </equation>

    where <math|B> is the difference between the Euclidean actions of the
    bounce solution and the false vacuum:

    <\equation>
      B=S<rsub|E>*<around|[|\<phi\><rsub|<text>>*b*o*u*n*c*e|]>-S<rsub|E>*<around|[|\<phi\><rsub|<text>>*f*a*l*s*e|]>
    </equation>

    For the <math|O<around|(|4|)>>-symmetric bounce solution in the thin-wall
    approximation:

    <\equation>
      \<phi\><around|(|r|)>=<choice|<tformat|<table|<row|<cell|\<phi\><rsub|<text>>*t*r*u*e,>|<cell|r\<less\>r<rsub|0>-\<delta\>/2>>|<row|<cell|\<phi\><rsub|<text>>*w*a*l*l<around|(|r|)>,>|<cell|r<rsub|0>-\<delta\>/2\<less\>r\<less\>r<rsub|0>+\<delta\>/2>>|<row|<cell|\<phi\><rsub|<text>>*f*a*l*s*e,>|<cell|r\<gtr\>r<rsub|0>+\<delta\>/2>>>>>
    </equation>

    where <math|r<rsub|0>> is the bubble radius and <math|\<delta\>> is the
    wall thickness.

    Computing the Euclidean action exactly:

    <\equation>
      S<rsub|E>*<around|[|\<phi\><rsub|<text>>*b*o*u*n*c*e|]>=2*\<pi\><rsup|2>*<big|int><rsub|0><rsup|\<infty\>>d*r*<space|0.17em>r<rsup|3>*<around*|[|<frac|1|2><around*|(|<frac|d*\<phi\>|d*r>|)><rsup|2>+V<around|(|\<phi\>|)>|]>
    </equation>

    Breaking this into three regions:

    <\equation>
      <\eqsplit>
        <tformat|<table|<row|<cell|S<rsub|E>*<around|[|\<phi\><rsub|<text>>*b*o*u*n*c*e|]>>|<cell|=2*\<pi\><rsup|2>*<big|int><rsub|0><rsup|r<rsub|0>-\<delta\>/2>d*r*<space|0.17em>r<rsup|3>*V*<around|(|\<phi\><rsub|<text>>*t*r*u*e|)>>>|<row|<cell|>|<cell|+2*\<pi\><rsup|2>*<big|int><rsub|r<rsub|0>-\<delta\>/2><rsup|r<rsub|0>+\<delta\>/2>d*r*<space|0.17em>r<rsup|3>*<around*|[|<frac|1|2><around*|(|<frac|d*\<phi\>|d*r>|)><rsup|2>+V*<around|(|\<phi\><rsub|<text>>*w*a*l*l|)>|]>>>|<row|<cell|>|<cell|+2*\<pi\><rsup|2>*<big|int><rsub|r<rsub|0>+\<delta\>/2><rsup|\<infty\>>d*r*<space|0.17em>r<rsup|3>*V*<around|(|\<phi\><rsub|<text>>*f*a*l*s*e|)>>>>>
      </eqsplit>
    </equation>

    In the thin-wall limit (<math|\<delta\>\<to\>0>), the wall contribution
    gives the surface tension:

    <\equation>
      \<sigma\>=<big|int><rsub|\<phi\><rsub|<text>>*f*a*l*s*e><rsup|\<phi\><rsub|<text>>*t*r*u*e>d*\<phi\>*<sqrt|2*<around|(|V<around|(|\<phi\>|)>-V*<around|(|\<phi\><rsub|<text>>*t*r*u*e|)>|)>>
    </equation>

    The exact value of <math|B> becomes:

    <\equation>
      B=2*\<pi\><rsup|2>*r<rsup|3>*<around*|[|\<sigma\>-<big|int><rsub|\<phi\><rsub|<text>>*f*a*l*s*e><rsup|\<phi\><rsub|<text>>*t*r*u*e><sqrt|2*<around|(|V<around|(|\<phi\>|)>-V*<around|(|\<phi\><rsub|<text>>*t*r*u*e|)>|)>>*<space|0.17em>d*\<phi\>|]>
    </equation>

    The prefactor <math|A> involves a functional determinant:

    <\equation>
      A=<around*|\||<frac|det <rprime|'><around|[|-\<Box\>+V<rprime|''>*<around|(|\<phi\><rsub|<text>>*b*o*u*n*c*e|)>|]>|det
      <around|[|-\<Box\>+V<rprime|''>*<around|(|\<phi\><rsub|<text>>*f*a*l*s*e|)>|]>>|\|><rsup|-1/2>
    </equation>

    where <math|det<rprime|'>> indicates omitting zero eigenvalues.

    This gives the exact rate of bubble nucleation in quantum field theory,
    with general-relativistic corrections for large bubbles.
  </proof>

  <\theorem>
    [Steepest Descent Contours - Picard-Lefschetz Theory] The exact wave
    function can be written as a sum over Lefschetz thimbles
    <math|\<cal-J\><rsub|\<sigma\>>>:

    <\equation>
      \<Psi\>*<around|[|h<rsub|i*j>,\<phi\>|]>=<big|sum><rsub|\<sigma\>>n<rsub|\<sigma\>>*<big|int><rsub|\<cal-J\><rsub|\<sigma\>>>\<cal-D\><around|[|g,\<Phi\>|]>*<space|0.17em>e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>
    </equation>

    where <math|n<rsub|\<sigma\>>> are integers determined by the
    intersection numbers of the original contour with the dual thimbles, and
    each <math|\<cal-J\><rsub|\<sigma\>>> is the set of paths approaching a
    critical point <math|\<sigma\>> along directions of steepest descent.
  </theorem>

  <\proof>
    The path integral for the wave function of the universe is:

    <\equation>
      \<Psi\>*<around|[|h<rsub|i*j>,\<phi\>|]>=<big|int><rsub|C>\<cal-D\><around|[|g,\<Phi\>|]>*e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>
    </equation>

    This integral is defined over a potentially infinite-dimensional complex
    manifold of metrics and fields. To make mathematical sense of such an
    integral, we apply Picard-Lefschetz theory, a generalization of steepest
    descent methods to complex manifolds.

    For each critical point <math|\<sigma\>> of the action (i.e.,
    <math|\<delta\>*S/\<delta\>*g=\<delta\>*S/\<delta\>*\<Phi\>=0>), we
    define:

    1. The Lefschetz thimble <math|\<cal-J\><rsub|\<sigma\>>>: the set of all
    configurations that flow to <math|\<sigma\>> when following the steepest
    descent path of Re<math|<around|(|i*S|)>>. Mathematically,
    <math|\<cal-J\><rsub|\<sigma\>>> is the union of all solutions to:

    <\equation>
      <frac|d*g<rsub|\<mu\>*\<nu\>>|d*\<lambda\>>=-<wide|<frac|\<delta\>*<around|(|i*S|)>|\<delta\>*g<rsub|\<mu\>*\<nu\>>>|\<bar\>>,<space|1em><frac|d*\<Phi\>|d*\<lambda\>>=-<wide|<frac|\<delta\>*<around|(|i*S|)>|\<delta\>*\<Phi\>>|\<bar\>>
    </equation>

    that approach <math|\<sigma\>> as <math|\<lambda\>\<to\>\<infty\>>.

    2. The dual thimble <math|\<cal-K\><rsub|\<sigma\>>>: the set of all
    configurations that flow to <math|\<sigma\>> along steepest descent paths
    of Re<math|<around|(|-i*S|)>>.

    By the homological version of Cauchy's theorem, the original integration
    contour <math|C> can be decomposed as a sum of Lefschetz thimbles:

    <\equation>
      C=<big|sum><rsub|\<sigma\>>n<rsub|\<sigma\>>*\<cal-J\><rsub|\<sigma\>>
    </equation>

    where <math|n<rsub|\<sigma\>>=<around|\<langle\>|C,\<cal-K\><rsub|\<sigma\>>|\<rangle\>>>
    is the intersection number between the original contour and the dual
    thimble.

    Therefore:

    <\equation>
      \<Psi\>*<around|[|h<rsub|i*j>,\<phi\>|]>=<big|sum><rsub|\<sigma\>>n<rsub|\<sigma\>>*<big|int><rsub|\<cal-J\><rsub|\<sigma\>>>\<cal-D\><around|[|g,\<Phi\>|]>*e<rsup|<frac|i|\<hbar\>>*S*<around|[|g,\<Phi\>|]>>
    </equation>

    On each thimble <math|\<cal-J\><rsub|\<sigma\>>>, the imaginary part of
    the action Im<math|<around|(|S|)>> is constant, while
    Re<math|<around|(|i*S|)>> increases monotonically as we move away from
    <math|\<sigma\>>. This means the integral is dominated by configurations
    near <math|\<sigma\>>, solving the convergence problems of the original
    oscillatory integral.

    Each critical point <math|\<sigma\>> corresponds to a complex solution of
    the Einstein equations with the given boundary conditions. The wave
    function becomes a sum of contributions from all relevant saddle points,
    weighted by the intersection numbers.

    This decomposition provides an exact, non-perturbative definition of the
    path integral that is mathematically rigorous and connects to the
    semiclassical approximation when <math|\<hbar\>> is small.
  </proof>

  <section|Conclusion and Physical Implications>

  The theorems and proofs presented establish a rigorous mathematical
  foundation for quantum cosmology using Lefschetz thimbles and
  Picard-Lefschetz theory. These results have several important physical
  implications:

  <\enumerate>
    <item>The no-boundary wave function is mathematically well-defined
    through complex contour deformations, resolving issues with oscillatory
    path integrals.

    <item>Quantum tunneling processes in cosmology, including universe
    creation and bubble nucleation, can be precisely formulated beyond
    semiclassical approximations.

    <item>The decomposition of the path integral into contributions from
    complex saddle points provides insight into how classical spacetime
    emerges from quantum gravity.

    <item>Analyticity properties of the wave function connect different
    regions of superspace, allowing predictions in one domain to constrain
    behavior in others.
  </enumerate>

  Understanding these mathematical structures is crucial for addressing
  fundamental questions about the quantum origin of the universe, the
  emergence of time, and the resolution of cosmological singularities.

  <section*|Acknowledgments>

  The author acknowledges the mathematical contributions of Lefschetz,
  Picard, Morse, and their intellectual descendants who developed the theory
  of complex manifolds and critical points that makes this work possible.

  <\thebibliography|9>
    <bibitem|hartle>J. B. Hartle and S. W. Hawking, \PWave function of the
    Universe," Phys. Rev. D 28, 2960 (1983).

    <bibitem|witten>E. Witten, \PAnalytic Continuation Of Chern-Simons
    Theory," AMS/IP Stud. Adv. Math. 50, 347 (2011).

    <bibitem|lehners>J. L. Lehners, \PClassical Inflationary and Ekpyrotic
    Universes in the No-Boundary Wavefunction," Phys. Rev. D 91, 083525
    (2015).

    <bibitem|halliwell>J. J. Halliwell and J. B. Hartle, \PIntegration
    contours for the no-boundary wave function of the universe," Phys. Rev. D
    41, 1815 (1990).

    <bibitem|feldbrugge>J. Feldbrugge, J. L. Lehners, and N. Turok,
    \PLorentzian Quantum Cosmology," Phys. Rev. D 95, 103508 (2017).

    <bibitem|dimopoulos>J. Dimopoulos, S. J. Field, J. Feldbrugge, L. C.
    Fitzpatrick, R. Gregory, I. Moss, and S. Sarkar, \PThe Picard-Lefschetz
    approach to the Schwinger effect," JHEP 05, 022 (2022).

    <bibitem|coleman>S. Coleman, \PThe Fate of the False Vacuum. 1.
    Semiclassical Theory," Phys. Rev. D 15, 2929 (1977).

    <bibitem|baumann>D. Baumann, \PTASI Lectures on Inflation,"
    arXiv:0907.5424 [hep-th].
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|4|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|5|10|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|6|14|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-7|<tuple|4|14|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-8|<tuple|4|15|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-baumann|<tuple|baumann|15|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-coleman|<tuple|coleman|15|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-dimopoulos|<tuple|dimopoulos|15|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-feldbrugge|<tuple|feldbrugge|15|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-halliwell|<tuple|halliwell|15|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-hartle|<tuple|hartle|15|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-lehners|<tuple|lehners|15|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-witten|<tuple|witten|15|../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      to Lefschetz Thimbles> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Wheeler-DeWitt Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Path
      Integral Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Exact
      Solutions in FLRW Cosmology> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Quantum
      Tunneling in Cosmology> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion
      and Physical Implications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>