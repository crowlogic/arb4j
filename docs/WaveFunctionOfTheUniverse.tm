<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <\padded-center>
    <with|font-series|bold|Wave function of the Universe>

    <vspace*|5mm>J. B. Hartle<next-line><with|font-shape|italic|Enrico Fermi
    Institute, University of Chicago, Chicago, Illinois
    60637><next-line>and<next-line><with|font-shape|italic|Institute for
    Theoretical Physics, University of California, Santa Barbara, California
    93106>

    <vspace*|5mm>S. W. Hawking<next-line><with|font-shape|italic|Department
    of Applied Mathematics and Theoretical Physics, Silver Street, Cambridge,
    England><next-line>and<next-line><with|font-shape|italic|Institute for
    Theoretical Physics, University of California, Santa Barbara, California
    93106>

    \;

    Originally published in Physical Review D, Volume 28, Number 12 on Dec.
    15th 1983

    <vspace*|5mm>(Received 29 July 1983)

    (Refurbished by Stephen Crowley on <date|> )
  </padded-center>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|II. QUANTUM GRAVITY
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|A. Wave
    functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|B. Wheeler-DeWitt equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|V.
    MINISUPERSPACE MODEL> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|VI.
    GROUND-STATE COSMOLOGICAL WAVE FUNCTION>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <with|par-left|1tab|A. The matter wave function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>
  </table-of-contents>

  <section|Introduction>

  In any attempt to apply quantum mechanics to the Universe as a whole the
  specification of the possible quantum-mechanical states which the Universe
  can occupy is of central importance. This specification determines the
  possible dynamical behavior of the Universe. Moreover, if the uniqueness of
  the present Universe is to find any explanation in quantum gravity it can
  only come from a restriction on the possible states available.

  In quantum mechanics the state of a system is specified by giving its wave
  function on an appropriate configuration space. The possible wave functions
  can be constructed from the fundamental quantum-mechanical amplitude for a
  complete history of the system which may be regarded as the starting point
  for quantum theory. For example, in the case of a single particle a history
  is a path <math|x<around|(|t|)>> and the amplitude for a particular path is
  proportional to

  <\equation>
    e<rsup|i*S<around*|[|x<around|(|t|)>|]>>
  </equation>

  where <math|S<around*|[|x<around|(|t|)>|]>> is the classical action. From
  this basic amplitude, the amplitude for more restricted observations can be
  constructed by superposition. In particular, the amplitude that the
  particle, having been prepared in a certain way, is located at position
  <math|x<around*|(|t|)>> and nowhere else at time <math|t> is

  <\equation>
    \<psi\><around|(|x<around*|(|t|)>|)>=N<around*|(|x<around*|(|t|)>|)>*<big|int>*e<rsup|i*S<around*|[|x<around|(|t|)>|]>>\<cal-D\>*x<around|(|t|)>
  </equation>

  Here, <math|N<around*|(|x<around*|(|t|)>|)>> is a normalizing factor and
  the sum is over a class of paths which intersect <math|x> at time <math|t>
  and which are weighted in a way that reflects the preparation of the
  system. <math|\<psi\><around|(|x,t|)>> is the wave function for the state
  determined by this preparation. As an example, if the particle were
  previously localized at <math|x<rprime|'>> at time <math|t<rprime|'>> one
  would sum over all paths which start at <math|x<rprime|'>> at
  <math|t<rprime|'>> and end at <math|x> at <math|t> thereby obtaining the
  propagator <math|<around|\<langle\>|x,t\|x<rprime|'>,t<rprime|'>|\<rangle\>>>.
  The oscillatory integral in Eq. (1.2) is not well defined but can be made
  so by rotating the time to imaginary values.

  An alternative way of calculating quantum dynamics is to use the
  Schrödinger equation,

  <\equation>
    i*\<hbar\>*<wide|\<psi\>|\<dot\>><around*|(|x<around*|(|t|)>|)>=H*\<psi\><around*|(|x<around*|(|t|)>|)>
  </equation>

  This follows from Eq. (1.2) by varying the end conditions on the path
  integral. For a particular state specified by a weighting of paths
  <math|C>, the path integral (1.2) may be looked upon as providing the
  boundary conditions for the solution of Eq. (1.3).

  A state of particular interest in any quantum-mechanical theory is the
  ground state, or state of minimum excitation. This is naturally defined by
  the path integral, made definite by a rotation to Euclidean time, over the
  class of paths which have vanishing action in the far past. Thus, for the
  ground state at <math|t=0> one would write\ 

  <\equation>
    \<psi\><rsub|0><around|(|x<around*|(|0|)>|)>=N*<big|int>*e<rsup|-I<around*|[|x<around|(|\<tau\>|)>|]>>\<delta\>
    x<around*|(|\<tau\>|)><label|1.4>
  </equation>

  where <math|I<around*|[|x<around|(|\<tau\>|)>|]>> is the Euclidean action
  obtained from <math|S> by sending <math|t\<rightarrow\>-i*\<tau\>> and
  adjusting the sign so that it is positive.

  In cases where there is a well-defined time and a corresponding
  time-independent Hamiltonian, this definition of the ground state coincides
  with the lowest eigenfunction of the Hamiltonian. To see this specialize
  the path-integral expression for the propagator
  <math|<around|\<langle\>|x<rprime|''>,t<rprime|''>\|x<rprime|'>,t<rprime|'>|\<rangle\>>>
  to <math|t=0> and <math|x<rprime|'>=0> and insert a complete set of energy
  eigenstates between the initial and final state. One has

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|x,0\|0,s|\<rangle\>><label|1.5>>|<cell|=<big|sum><rsub|n>\<psi\><rsub|n><around|(|x|)>*e<rsup|-i*E<rsub|n>*0>\<psi\><rsup|\<ast\>><rsub|n><around|(|0|)>*e<rsup|-i*E<rsub|n>*s>=<big|int>*e<rsup|i*S<around|[|x<around|(|t|)>|]>>\<cal-D\>*x<around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n>\<psi\><rsub|n><around|(|x|)>*e<rsup|0>
    \<psi\><rsup|\<ast\>><rsub|n><around|(|0|)>*e<rsup|-i*E<rsub|n>*s>=<big|int>*e<rsup|i*S<around|[|x<around|(|t|)>|]>>\<cal-D\>*x<around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n>\<psi\><rsub|n><around|(|x|)>1*
    \<psi\><rsup|\<ast\>><rsub|n><around|(|0|)>*e<rsup|-i*E<rsub|n>*s>=<big|int>*e<rsup|i*S<around|[|x<around|(|t|)>|]>>\<cal-D\>*x<around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n>\<psi\><rsub|n><around|(|x|)>*\<psi\><rsup|\<ast\>><rsub|n><around|(|0|)>*e<rsup|-i*E<rsub|n>*s>=<big|int>*e<rsup|i*S<around|[|x<around|(|t|)>|]>>\<cal-D\>*x<around|(|t|)>>>>>>
  </equation>

  where <math|\<psi\><rsub|n><around|(|x|)>> are the time-independent energy
  eigenfunctions. Rotate <math|t<rprime|'>\<rightarrow\>-i*\<tau\>> in
  (<reference|1.5>) and take the limit as
  <math|\<tau\><rprime|'>\<rightarrow\>-\<infty\>>. <em|In the sum only the
  lowest eigenfunction (normalized to zero energy) survives.<\footnote>
    In the long-time limit, all terms with <math|e<rsup|-i*E<rsub|n>*s>> for
    <math|E<rsub|n>\<gtr\>0> vanish, leaving only the ground state term
    <math|e<rsup|0>=1>, which does not decay.
  </footnote>> The path integral becomes the path integral on the right of
  (<reference|1.4>) so that the equality is demonstrated.

  The case of quantum fields is a straightforward generalization of quantum
  particle mechanics. The wave function is a functional of the field
  configuration on a space-like surface of constant time, that is
  <math|\<Psi\><around|[|\<phi\><around|(|x<around*|(|t|)>|)>|]>>. The
  functional <math|\<Psi\>> gives the amplitude that a particular field
  distribution <math|\<phi\><around|(|x<around*|(|t|)>|)>> occurs on this
  space-like surface. The rest of the formalism is similarly generalized. For
  example, for the ground-state wave function one has

  <\equation>
    \<Psi\><rsub|0><around|[|\<phi\><around|(|x<around*|(|t|)>|)>,0|]>=N*<big|int>*e<rsup|-I<around|[|\<varphi\><around|(|x|)>|]>>\<cal-D\>*\<phi\><around|(|x<around*|(|t|)>|)><label|1.6>
  </equation>

  where the integral is over all Euclidean field configurations for
  <math|\<tau\>\<less\>0> which match <math|\<phi\><around|(|x<around*|(|0|)>|)>>
  on the surface <math|\<tau\>=0> and leave the action finite at Euclidean
  infinity.

  In the case of quantum gravity new features enter. For definiteness and
  simplicity we shall restrict our attention throughout this paper to
  spatially closed universes. For these there is no well-defined intrinsic
  measure of the location of a spacelike surface in the spacetime beyond that
  contained in the intrinsic or extrinsic geometry of the surface itself. One
  therefore labels the wave function by the three-metric <math|h<rsub|i*j>>
  writing <math|\<Psi\><around*|(|x<around*|(|t|)>|)>=\<Psi\><around|[|h<rsub|i*j><around*|(|x<around*|(|t|)>|)>|]>>.
  Quantum dynamics is supplied by the functional integral

  <\equation>
    \<Psi\><around|[|h<rsub|i*j><around*|(|x<around*|(|t|)>|)>|]>=N*<big|int>*e<rsup|i*S<rsub|E><around|[|g<rsub|i*j><around*|(|x<around*|(|t|)>|)>|]>>\<cal-D\>*g<rsub|i*j><around|(|x<around*|(|t|)>|)><label|1.7>
  </equation>

  <math|S<rsub|E>> is the classical action for gravity including a
  cosmological constant <math|A> and <em|the functional integral is over all
  four-geometries with a spacelike boundary on which the induced metric is
  <math|h<rsub|i*j>> and which to the past of that surface satisfy some
  appropriate condition to define the state>. In particular for the amplitude
  to go from a three-geometry <math|h<rsub|i*j><rprime|'>> on an initial
  spacelike surface to a three-geometry <math|h<rsub|i*j><rprime|''>> on a
  final spacelike surface is

  <\equation>
    <around|\<langle\>|h<rsub|i*j><rprime|''>\|h<rsub|i*j><rprime|'>|\<rangle\>>=<big|int>*e<rsup|i*S<rsub|E><around|[|g<rsub|i*j><around*|(|x<around*|(|t|)>|)>|]>>\<cal-D\>*g<rsub|i*j><around|(|x<around*|(|t|)>|)>
  </equation>

  where the sum is <samp|over all four-geometries which match
  <math|h<rsub|i*j><rprime|'>> on the initial surface and
  <math|h<rsub|i*j><rprime|''>> on the final surface>. Here one clearly sees
  that one cannot specify time in these states. The proper time between the
  surfaces depends on the four-geometries in the sum.

  As in the mechanics of a particle the functional integral (<reference|1.7>)
  implies a differential equation on the wave function. This is the
  Wheeler-DeWitt equation<rsup|<math|2>> which we shall derive from this
  point of view in Sec. II. With a simple choice of factor ordering it is

  <\equation>
    <around*|[|-G<rsub|i*j*k*l>*<frac|\<delta\><rsup|2>|\<delta\>*h<rsub|i*j>*<around*|(|x<around*|(|t|)>|)>\<delta\>*h<rsub|k*l><around*|(|x<around*|(|t|)>|)>>-<sqrt|h<around*|(|x<around*|(|t|)>|)>>*<around*|(|
    <rsup|3>R<around|(|h<around*|(|x<around*|(|t|)>|)>|)>+2*\<Lambda\>|)>|]>*\<Psi\><around|[|h<rsub|i*j><around*|(|x<around*|(|t|)>|)>|]>=0
  </equation>

  where <math|G<rsub|i*j*k*l>> is the metric on superspace,

  <\equation>
    G<rsub|i*j*k*l><around*|(|x<around*|(|t|)>|)>=<frac|h<rsub|i*k>*<around*|(|x<around*|(|t|)>|)>h<rsub|j*l><around*|(|x<around*|(|t|)>|)>+h<rsub|i*l><around*|(|x<around*|(|t|)>|)>*h<rsub|j*k><around*|(|x<around*|(|t|)>|)>-h<rsub|i*j>*<around*|(|x<around*|(|t|)>|)>h<rsub|k*l><around*|(|x<around*|(|t|)>|)>|2<sqrt|h<around*|(|x<around*|(|t|)>|)>>>*
  </equation>

  and <math|<rsup|<around|(|3|)>>R> is the scalar curvature of the intrinsic
  geometry of the three-surface. <em|The problem of specifying cosmological
  states is the same as specifying boundary conditions for the solution of
  the Wheeler-DeWitt equation>. A natural first question to ask is what
  boundary conditions specify the ground state?

  In the quantum mechanics of closed universes we do not expect to find a
  notion of ground state as a state of lowest energy. There is no natural
  definition of energy for a closed universe just as there is no independent
  standard of time. Indeed in a certain sense the total energy for a closed
  universe is always zero\Vthe gravitational energy cancelling the matter
  energy. It is still reasonable, however, to expect to be able to define a
  state of minimum excitation corresponding to the classical notion of a
  geometry of high symmetry. This paper contains a proposal for the
  definition of such a ground-state wave function for closed universes. The
  proposal is to extend to gravity the Euclidean-functional-integral
  construction of nonrelativistic quantum mechanics and field theory [Eqs.
  (<reference|1.4>) and (<reference|1.6>)]. Thus, we write for the
  ground-state wave function

  <\equation>
    \<Psi\><rsub|0><around|[|h<rsub|i*j><around*|(|x<around*|(|0|)>|)>,0|]>=N*<big|int>*e<rsup|-I<rsub|E><around|[|g<around*|(|x<around*|(|0|)>|)>|]>>\<delta\>*g<around*|(|x<around*|(|0|)>|)><label|1.11>
  </equation>

  where <math|I<rsub|E>> is the Euclidean action for gravity including a
  cosmological constant <math|\<Lambda\>>. The Euclidean four-geometries
  summed over must have a boundary on which the induced metric is
  <math|h<rsub|i*j>>. The remaining specification of the class of geometries
  which are summed over determines the ground state. Our proposal is that the
  sum should be over compact geometries. This means that the Universe does
  not have any boundaries in space or time (at least in the Euclidean regime)
  (cf. Ref. 3). There is thus no problem of boundary conditions. One can
  interpret the functional integral over all compact four-geometries bounded
  by a given three-geometry as giving the amplitude for that three-geometry
  to arise from a zero three-geometry, i.e., a single point. In other words,
  the ground state is the amplitude for the Universe to appear from
  nothing.<rsup|<math|4>> In the following we shall elaborate on this
  construction and show in simple models that it indeed supplies reasonable
  wave functions for a state of minimum excitation.The specification of the
  ground-state wave function is a constraint on the other states allowed in
  the theory. They must be such, for example, as to make the Wheeler-DeWitt
  equation Hermitian in an appropriate norm. In analogy with ordinary quantum
  mechanics one would expect to be able to use these constraints to
  extrapolate the boundary conditions which determine the excited states of\ 

  the theory from those fixed for the ground state by Eq. (<reference|1.7>).
  Thus, one can in principle determine all the allowed cosmological states.

  <em|The wave functions which result from this specification will not vanish
  on the singular, zero-volume three-geometries which correspond to the
  big-bang singularity>. This is analogous to the behavior of the wave
  function of the electron in the hydrogen atom. In a classical treatment,
  the situation in which the electron is at the proton is singular. However,
  in a quantum-mechanical treatment the wave function in a state of zero
  angular momentum is finite and nonzero at the proton. This does not cause
  any problems in the case of the hydrogen atom. In the case of the Universe
  we would interpret the fact that the wave function can be finite and
  nonzero at the zero three-geometry as allowing the possibility of
  topological fluctuations of the three-geometry. This will be discussed
  further in Sec. VIII.

  After a general discussion of this proposal for the ground-state wave
  function we shall implement it in a minisuperspace model. The geometrical
  degrees of freedom in the model are restricted to spatially homogeneous,
  isotropic, closed universes with <math|S<rsup|3>> topology, the matter
  degrees of freedom to a single, homogeneous, conformally invariant scalar
  field and the cosmological constant is assumed to be positive. A
  semiclassical evaluation of the functional integral for the ground-state
  wave function shows that it indeed does possess characteristics appropriate
  to a \Pstate of minimum excitation.\Q

  <subsection*|II. QUANTUM GRAVITY>

  In this section we shall review the basic principles and machinery of
  quantum gravity with which we shall explore the wave functions for closed
  universes. For simplicity we shall represent the matter degrees of freedom
  by a single scalar field <math|\<phi\>>, more realistic cases being
  straightforward generalizations. We shall approach this review from the
  functional-integral point of view although we shall arrive at many
  canonical results. None of these are new and for different approaches to
  the same ends the reader is referred to the standard literature.\ 

  <section*|A. Wave functions>

  Our starting point is the quantum-mechanical amplitude for the occurrence
  of a given spacetime and a given field history. This is

  <\equation>
    e<rsup|i*S<around|[|\<b-g\><around*|(|x<around*|(|t|)>|)>,\<b-phi\><around*|(|x<around*|(|t|)>|)>|]>><label|2.1>
  </equation>

  where <math|S<around|[|\<b-g\><around*|(|x<around*|(|t|)>|)>,\<b-phi\><around*|(|x<around*|(|t|)>|)>|]>>
  is the total classical action for gravity coupled to a scalar field. We are
  envisaging here a fixed manifold although there is no real reason that
  amplitudes for different manifolds may not be considered provided a rule is
  given for their relative phases. Just as the interesting observations of a
  particle are not typically its entire history but rather observations of
  position at different times, so also the interesting quantum-mechanical
  questions for gravity correspond to observations of spacetime and field on
  different spacelike surfaces. Following the general rules of quantum
  mechanics the amplitudes for these more restricted sets of observations are
  obtained from (<reference|2.1>) by summing over the unobserved quantities.

  It is easy to understand what is meant by fixing the field on a given
  spacelike surface. What is meant by fixing the four-geometry is less
  obvious. Consider all four-geometries in which a given spacelike surface
  occurs but whose form is free to vary off the surface. By an appropriate
  choice of gauge near the surface (e.g., Gaussian normal coordinates) all
  these four-geometries can be expressed so that the only freedom in the
  four-metric is the specification of the three-metric
  <math|h<rsub|i*j><around*|(|x<around*|(|t|)>|)>> in the surface. Specifying
  the three-metric is therefore what we mean by fixing the four-geometry on a
  spacelike surface. The situation is not unlike gauge theories. There a
  history is specified by a vector potential
  <math|A<rsub|\<mu\>><around|(|x<around*|(|t|)>|)>> but by an appropriate
  gauge transformation <math|A<rsub|0><around|(|x<around*|(|t|)>|)>> can be
  made to vanish so that the field on a surface can be completely specified
  by the <math|A<rsub|i><around|(|x<around*|(|t|)>|)>>.

  As an example of the quantum-mechanical superposition principle the
  amplitude for the three-geometry and field to be fixed on two spacelike
  surfaces is

  <\equation>
    <around|\<langle\>|h<rsub|i*j><rprime|''>,\<b-phi\><rprime|''>\|h<rsub|i*j><rprime|'>,\<b-phi\><rprime|'>|\<rangle\>>=<big|int>*e<rsup|i*S<around|[|\<b-g\><around*|(|x<around*|(|t|)>|)>,\<b-phi\><around*|(|x<around*|(|t|)>|)>|]>>\<cal-D\>*g<around*|(|x<around*|(|t|)>|)>*\<cal-D\>*\<b-phi\><around*|(|x<around*|(|t|)>|)>
  </equation>

  where the integral is over all four-geometries and field configurations
  which match the given values on the two spacelike surfaces. This is the
  natural analog of the propagator <math|K<around|(|x<rprime|''>,t<rprime|''>\|x<rprime|'>,t<rprime|'>|)>>
  in the quantum mechanics of a single particle. We note again that the
  proper time between the two surfaces is not specified. Rather it is summed
  over in the sense that the separation between the surfaces depends on the
  four-geometry being summed over. It is not that one could not ask for the
  amplitude to have the three-geometry and field fixed on two surfaces and
  the proper time between them. One could. Such an amplitude, however, would
  not correspond to fixing observations on just two surfaces but rather would
  involve a set of intermediate observations to determine the time. It would
  therefore not be the natural analog of the propagator.

  Wave functions <math|\<Psi\>> are defined by

  <\equation>
    \<Psi\><around|[|h<rsub|i*j><around*|(|x<around*|(|t|)>|)>,\<b-phi\><around*|(|x<around*|(|t|)>|)>|]>=*<big|int><rsub|\<cal-C\>>e<rsup|i*S<around|[|\<b-g\>,\<b-phi\>|]>>\<cal-D\>*g<around*|(|x<around*|(|t|)>|)>*\<cal-D\>*\<b-phi\><around*|(|x<around*|(|t|)>|)><label|2.3>
  </equation>

  <em|The sum is over a class <math|\<cal-C\>> of spacetimes with a compact
  boundary on which the induced metric is <math|h<rsub|i*j>> and field
  configurations which match <math|\<b-phi\>> on the boundary>. The remaining
  specification of the class <math|C> is the specification of the state.\ 

  If the Universe is in a quantum state specified by a wave function
  <math|\<Psi\>> then that wave function describes the correlations between
  observables to be expected in that state. For example, in the semiclassical
  wave function describing a universe like our own, one would expect
  <math|\<Psi\>> to be large when <math|\<phi\>> is small and the spatial
  volume is big, and small when <math|\<phi\>> denotes quantities are
  oppositely correlated<\footnote>
    This is similar to the relationship of a covariance function and the
    spectral density of a Gaussian process.
  </footnote>. This is the only interpretative structure we shall propose or
  need.

  <subsection*|B. Wheeler-DeWitt equation>

  A differential equation for <math|\<Psi\>> can be derived by varying the
  end conditions on the path integral (<reference|2.3>) which defines it. To
  carry out this derivation first recall that the gravitational action
  appropriate to keeping the three-geometry fixed on a boundary is

  <\equation>
    l<rsup|2>*S<rsub|E>=2*<big|int><rsub|\<partial\>*M>*<space|0.17em><sqrt|h<around*|(|x<around*|(|t|)>|)>>*K
    <around*|(|x<around*|(|t|)>|)>d<rsup|3>*x<around*|(|t|)>+<big|int><rsub|M><sqrt|-g<around*|(|x<around*|(|t|)>|)>>*<around|(|R-2*\<Lambda\>|)>d<rsup|4>*x<around*|(|t|)><label|2.4>
  </equation>

  The second term is integrated over spacetime and the first over its
  boundary. <math|K> is the trace of the extrinsic curvature
  <math|K<rsub|i*j>> of the boundary three-surface. If its unit normal is
  <math|n<rsup|i>>, <math|K<rsub|i*j>=-\<nabla\><rsub|i>*n<rsub|j>> in the
  usual Lorentzian convention. <math|l> is the Planck length
  <math|<sqrt|16*\<pi\>*G>> in the units with <math|\<hbar\>=c=1> we use
  throughout. Introduce coordinates so that the boundary is a constant
  <math|t> surface and write the metric in the standard 3 + 1 decomposition:

  <\equation>
    d*s<rsup|2>=-<around|(|N<rsup|2>-N<rsub|i>*N<rsup|i>|)>*d*t<rsup|2>+2*N<rsub|i>*d*x<rsup|i>*d*t+h<rsub|i*j><around*|(|x<around*|(|t|)>|)>*d*x<rsup|i>*d*x<rsup|j>
  </equation>

  The action (<reference|2.4>) becomes

  <\equation>
    l<rsup|2>*S<rsub|E>=<big|int>*<space|0.17em><sqrt|h<around*|(|x<around*|(|t|)>|)>>*N*<around|[|K<rsub|i*j>*K<rsup|i*j>-K<rsup|2>+<rsup|3>R<around|(|h<around*|(|x<around*|(|t|)>|)>|)>-2*\<Lambda\>|]>d<rsup|4>*x<around*|(|t|)>
  </equation>

  where explicitly

  <\equation>
    K<rsub|i*j>=<frac|1|N>*<around*|(|-<frac|1|2>*<frac|\<partial\>*h<rsub|i*j><around*|(|x<around*|(|t|)>|)>|\<partial\>*t>+N<rsub|<around|(|i\|j|)>>|)>
  </equation>

  and a stroke and <math|<rsup|3>R> denote the covariant derivative and
  scalar curvature constructed from the three-metric <math|h<rsub|i*j>>. The
  matter action <math|S<rsub|M>> can similarly be expressed as a function of
  <math|N>, <math|N<rsub|i>>, <math|h<rsub|i*j>>, and the matter field.

  The functional integral defining the wave function contains an integral
  over <math|N>. By varying <math|N> at the surface we push it forward or
  backward in time. Since the wave function does not depend on time we must
  have

  <\equation>
    0=<big|int><around*|(|<frac|\<delta\>*S|\<delta\>*N>|)>*e<rsup|i*S*<around|[|g<around*|(|x<around*|(|t|)>|)>,\<phi\><around*|(|x<around*|(|t|)>|)>|]>>\<delta\>*S*x<around*|(|t|)>\<delta\>*\<phi\><around*|(|x<around*|(|t|)>|)><label|2.8>
  </equation>

  More precisely, the value of the integral (<reference|2.3>) should be left
  unchanged by an infinitesimal translation of the integration variable
  <math|N>. If the measure is invariant under translation this leads to
  (<reference|2.8>). If it is not, there will be in addition a divergent
  contribution to the relation which must be suitably regulated to zero or
  cancel divergences arising from the calculation of the right-hand side of
  (<reference|2.8>).

  Classically the field equation <math|H=<frac|\<delta\>*S|\<delta\>*N>=0> is
  the Hamiltonian constraint for general relativity. It is

  <\equation>
    H<around*|(|x<around*|(|t|)>|)>=<sqrt|h<around*|(|x<around*|(|t|)>|)>>*<around|(|K<rsup|2><around*|(|x<around*|(|t|)>|)>-K<rsub|i*j>*<around*|(|x<around*|(|t|)>|)>K<rsup|i*j><around*|(|x<around*|(|t|)>|)>+R<rsup|<around|(|3|)>><around*|(|h<around*|(|x<around*|(|t|)>|)>|)>-2*\<Lambda\>|)>-<sqrt|h>*T<rsup|n><rsub|m>
  </equation>

  where <math|T<rsup|n><rsub|m>> is the stress-energy tensor of the matter
  field projected in the direction normal to the surface. Equation
  (<reference|2.8>) shows how <math|H=0> is enforced as an operator identity
  for the wave function. More explicitly one can note that the
  <math|K<rsub|i*j>> involve only first-time derivatives of the
  <math|h<rsub|i*j>> and therefore may be completely expressed in terms of
  the momentum <math|\<pi\><rsup|i*j>> conjugate to the <math|h<rsub|i*j>>
  which follow from the Lagrangian in (<reference|2.6>):

  <\equation>
    \<pi\><rsup|i*j>=-<sqrt|h>*<around|(|K<rsup|i*j>-h<rsup|i*j>*K|)>
  </equation>

  In a similar manner the energy of the matter field can be expressed in
  terms of the momentum conjugate to the field <math|\<phi\>> and the field
  itself. Equation (<reference|2.8>) thus implies the operator identity
  <math|H<around|(|\<Psi\>\|h<rsub|i*j>,\<pi\><rsup|i*j>,\<phi\>,\<pi\><rsub|\<phi\>>|)>=0>
  with the replacements

  <\equation>
    \<pi\><rsup|i*j>=-i*<frac|\<delta\>|\<delta\>*h<rsub|i*j>>,<space|1em>\<pi\><rsub|\<phi\>>=-i*<frac|\<delta\>|\<delta\>*\<phi\>>
  </equation>

  These replacements may be viewed as arising directly from the functional
  integral, e.g., from the observation that when the time derivatives in the
  exponent are written in differenced form

  <\equation>
    -i*<big|int>\<delta\>*h<rsub|i*j><around*|(|x<around*|(|t|)>|)>*\<delta\>*K<rsup|i*j><around*|(|x<around*|(|t|)>|)>=-i*<big|int>\<delta\>*\<phi\><around*|(|x<around*|(|t|)>|)>*\<delta\>*\<pi\><rsub|\<phi\>><around*|(|x<around*|(|t|)>|)>
  </equation>

  Alternatively, <em|they are the standard representation of the canonical
  commutation relations of <math|\<phi\>> and <math|\<pi\><rsub|\<phi\>>>>.

  In translating a classical equation like
  <math|<frac|\<delta\>*S|\<delta\>*N>=0> into an operator identity there is
  always the question of factor ordering. This will not be important for us
  so making a convenient choice we obtain

  <\equation>
    <frac|\<delta\><rsup|2>|\<delta\>*h<rsub|i*j>*\<delta\>*h<rsub|k*l>><around*|(|<sqrt|h>*<around*|(|2*\<Lambda\>+l<rsup|2>T<rsub|n
    n><around*|[|-i<frac|\<delta\>|\<delta\>*\<phi\>>,\<phi\>|]>-<rsup|>\<threesuperior\>R<around*|(|h|)>|)>*\<Psi\><around|[|h<rsub|i*j>,\<phi\>|]>-*G<rsub|i*j*k*l>|)>\<times\>\<Psi\><around*|(|h<rsub|i
    j>,\<phi\>|)>=0<label|2.13>
  </equation>

  This is the Wheeler-DeWitt equation which wave functions for closed
  universes must satisfy. There are also the other constraints of the
  classical theory, but the operator versions of these express the gauge
  invariance of the wave function rather than any dynamical
  information<math|<rsup|>>. We should emphasize that the ground-state wave
  function constructed by a Euclidean functional-integral prescription [Eq.
  (<reference|1.11>)] will satisfy the Wheeler-DeWitt equation in the form
  (<reference|2.13>). Indeed, this can be demonstrated explicitly by
  repeating the steps in the above demonstration starting with the Euclidean
  functional integral.

  <with|font-series|bold|C. Boundary conditions>

  The quantity <math|G<rsub|i*j*k*l>> can be viewed as a metric on
  superspace\Vthe space of all three-geometries (no connection with
  supersymmetry). It has signature (...,+,+,...,+,+) and the Wheeler-DeWitt
  equation is therefore a \Phyperbolic\Q equation on superspace. It would be
  natural, therefore, to expect to impose boundary conditions on two
  \Pspacelike surfaces\Q in superspace. A convenient choice for the timelike
  direction is <math|<sqrt|h>> and we therefore expect to impose boundary
  conditions at the upper and lower limits of the range of <math|<sqrt|h>>.
  The upper limit is infinity. The lower limit is zero because if <math|h> is
  positive definite or degenerate, <math|<sqrt|h>\<geq\>0>. Positive-definite
  metrics are everywhere spacelike surfaces; degenerate metrics may signal
  topology change. Summarizing the remaining functions of <math|h<rsub|i*j>>
  by the conformal metric <math|<wide|h|~><rsub|i*j>=<frac|h<rsub|i*j>|h<rsup|1/3>>>
  we may write an important boundary condition on <math|\<Psi\>> as

  <\equation>
    \<Psi\><around|[|<wide|h|~><rsub|i*j><around*|(|x|)>,<sqrt|h<around*|(|x|)>>,\<phi\><around*|(|x|)>|]>=0,<space|1em><sqrt|h<around*|(|x|)>>\<less\>0<label|2.14>
  </equation>

  Because <math|<sqrt|h>> has a semidefinite range it is for many purposes
  convenient to introduce a representation in which <math|<sqrt|h>> is
  replaced by its canonically conjugate variable
  <math|-<frac|4*\<pi\>|K<rsup|2>>*> which has an infinite range. The
  advantages of this representation have been extensively discussed. In the
  case of pure gravity since <math|-4*\<pi\>*K<rsup|-2>> and
  <math|h<rsup|1/2>> are conjugate, we can write for the transformation to
  the representation where <math|<wide|h|~><rsub|i*j>> and <math|K> are
  definite

  <\equation>
    \<Phi\><around|[|<wide|h|~><rsub|i*j><around*|(|x|)>,K<around*|(|x|)>|]>=<big|int><rsub|0><rsup|\<infty\>>*e<rsup|<frac|i|3>*4*\<pi\><rsup|-2>*<big|int><sqrt|h<around*|(|x|)>>*K<around*|(|x|)>d<rsup|3>x>**\<Psi\><around|[|<wide|h|~><rsub|i*j><around*|(|x|)>|]>\<delta\>*<sqrt|h<around*|(|x|)>><label|2.15>
  </equation>

  and inversely,

  <\equation>
    \<Psi\><around|[|<wide|h|~><rsub|i*j><around*|(|x|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>*e<rsup|-<frac|i|3>*4*\<pi\><rsup|-2>*<big|int>*<sqrt|h<around*|(|x|)>>*K<around*|(|x|)>d<rsup|3>*x>*\<Phi\><around|[|<wide|h|~><rsub|i*j><around*|(|x|)>,K<around*|(|x|)>|]>\<delta\>*K<around*|(|x|)><label|2.16>
  </equation>

  In each case the functional integrals are over the values of
  <math|h<rsup|1/2>> or <math|K> at each point of the spacelike hypersurface
  and we have indicated limits of integration. The condition
  (<reference|2.14>) implies through (<reference|2.15>) that
  <math|\<Phi\><around|[|<wide|h|~><rsub|i*j>,K|]>> is analytic in the
  lower-half <math|K> plane. The contour in (<reference|2.16>) can thus be
  distorted into the lower-half <math|K> plane. Conversely, if we are given
  <math|\<Phi\><around|[|<wide|h|~><rsub|i*j>,K|]>> we can reconstruct the
  wave function <math|\<Psi\>> which satisfies the boundary condition
  (<reference|2.14>) by carrying out the integration in (<reference|2.16>)
  over a contour which lies below any singularities of
  <math|\<Phi\><around|[|<wide|h|~><rsub|i*j>,K|]>> in <math|K>. In the
  presence of matter <math|K> and <math|<wide|h|~><rsub|i*j>> remain
  convenient labels for the wave functional provided the labels for the
  matter-field amplitudes <math|\<phi\>> are chosen so that a multiple of
  <math|K> is canonically conjugate to <math|h<rsup|1/2>>. In cases where the
  matter-field action itself involves the scalar curvature this means that
  the label <math|\<phi\>> will be the field amplitude rescaled by some power
  of <math|h<rsup|1/2>>. For example, in the case of a conformally invariant
  scalar field the appropriate label is <math|\<phi\>=\<varphi\>*h<rsup|1/6>>.
  With this understanding we can write for the functionals

  <\equation>
    \<Psi\><around*|(|x|)>=\<Psi\><around|[|<wide|h|~><rsub|i*j><around*|(|x|)>,\<phi\><around*|(|x|)>|]>,<space|1em>\<Phi\><around*|(|x|)>=\<Phi\><around|[|<wide|h|~><rsub|i*j><around*|(|x|)>,K<around*|(|x|)>,\<phi\><around*|(|x|)>|]>
  </equation>

  and the transformation formulas (<reference|2.15>) and (<reference|2.16>)
  remain unchanged.\ 

  <with|font-series|bold|D. Hermiticity>

  The introduction of wave functions as functional integrals [Eq.
  (<reference|2.3>)] allows the definition of a scalar product with a simple
  geometric interpretation in terms of sums over spacetime histories.
  Consider a wave function <math|\<Psi\>> defined by the integral

  <\equation>
    \<Psi\><around|[|h<rsub|i*j><around*|(|x|)>,\<phi\><around*|(|x|)>|]>=N*<big|int><rsub|C>*e<rsup|i*S<around|[|g<around*|(|x|)>,\<phi\><around*|(|x|)>|]>>\<delta\>*g<around*|(|x<around*|(|t|)>|)>*\<delta\>*\<phi\><around*|(|x<around*|(|t|)>|)>
  </equation>

  over a class of four-geometries and fields <math|C>, and a second wave
  function <math|\<Psi\><rprime|'>> defined by a similar sum over a class
  <math|C<rprime|'>>. The scalar product

  <\equation>
    <around|(|\<Psi\><rprime|'>,\<Psi\>|)>=<big|int>*\<Psi\><rprime|'><around|[|h<rsub|i*j><around*|(|x<around*|(|t|)>|)>,\<phi\><around*|(|x<around*|(|t|)>|)>|]><rsup|\<ast\>>*\<Psi\><around|[|h<rsub|i*j><around*|(|x<around*|(|t|)>|)>,\<phi\><around*|(|x<around*|(|t|)>|)>|]>\<delta\>*h*<around*|(|x<around*|(|t|)>|)>\<delta\>*\<phi\><around*|(|x<around*|(|t|)>|)><label|2.19>
  </equation>

  has the geometric interpretation of a sum over all histories

  <\equation>
    <around|(|\<Psi\><rprime|'>,\<Psi\>|)>=N<rprime|'>*N*<big|int>e<rsup|i*S<around|[|g<around*|(|x<around*|(|t|)>|)>,\<phi\><around*|(|x<around*|(|t|)>|)>|]>>\<delta\>*g*<around*|(|x<around*|(|t|)>|)>\<delta\>*\<phi\><around*|(|x<around*|(|t|)>|)>*<label|2.20>
  </equation>

  where the sum is over histories which lie in class <math|C> to the past of
  the surface and in the time reversed of class <math|C<rprime|'>> to its
  future.

  The scalar product (<reference|2.19>) is not the product that would be
  required by canonical theory to define the Hilbert space of physical
  states. That would presumably involve integration over a hypersurface in
  the space of all three-geometries rather than over the whole space as in
  (<reference|2.19>). Rather, Eq. (<reference|2.19>) is a mathematical
  construction made natural by the functional-integral formulation of quantum
  gravity.

  In gravity we expect the field equations to be satisfied as identities. An
  extension of the argument leading to Eq. (<reference|2.8>) will give

  <\equation>
    <big|int>*H<around|(|x|)>*e<rsup|i*S<around|[|g<around*|(|x|)>,\<phi\><around*|(|x|)>|]>>\<delta\>*g<around*|(|x|)>*\<delta\>*\<phi\><around*|(|x|)>=0<label|2.21>
  </equation>

  \;

  for any class of geometries summed over and for any intermediate spacelike
  surface on which <math|H<around|(|x|)>> is evaluated. Equation
  (<reference|2.21>) can be evaluated for the particular sum which enters Eq.
  (<reference|2.20>). <math|H<around|(|x|)>> can be interpreted in the scalar
  product as an operator acting on either <math|\<Psi\><rprime|'>> or
  <math|\<Psi\>>. Thus,

  <\equation>
    <around|(|H*\<Psi\><rprime|'>,\<Psi\>|)>=<around|(|\<Psi\><rprime|'>,H*\<Psi\>|)>=0.
  </equation>

  The Wheeler-DeWitt operator must therefore be Hermitian in the scalar
  product (2.19).

  Since the Wheeler-DeWitt operator is a second-order functional-differential
  operator, the requirement of Hermiticity will essentially be a requirement
  that certain surface terms on the boundary of the space of three-metrics
  vanish and, in particular, at <math|h<rsup|1/2>=0> and
  <math|h<rsup|1/2>=\<infty\>>. As in ordinary quantum mechanics these
  conditions will prove useful in providing boundary conditions for the
  solution of the equation.

  <with|font-series|bold|III. GROUND-STATE WAVE FUNCTION>

  In this section, we shall put forward in detail our proposal for the
  ground-state wave function for closed cosmologies. The wave function
  depends on the topology and the three-metric of the spacelike surface and
  on the values of the matter field on the surface. For simplicity we shall
  begin by considering only <math|S<rsup|3>> topology. If the topology of the
  four-geometry is not that of a product of a three-surface with the real
  line or the circle, the volume will vanish. As a result, the topology of
  the three-geometry will change. One cannot calculate the amplitude for such
  topology change from the Wheeler-DeWitt equation but one can do so using
  the Euclidean functional integral. We shall estimate the amplitude in some
  simple cases in Sec. VIII.

  A qualitative discussion of the expected behavior of the wave function at
  large three-volumes can be given on the basis of the semiclassical
  approximation when <math|\<Lambda\>\<gtr\>0> as follows. The four-sphere
  has the largest volume of any real solution to <math|<around|(|4.2|)>>. As
  the volume of the three-geometry becomes large one will reach
  three-geometries with no longer fit anywhere in the four-sphere. We then
  expect that the stationary-phase geometries become complex. The
  ground-state wave function will be a real combination of two expansions
  like <math|<around|(|4.1|)>> evaluated at the complex-conjugate
  stationary-phase four-geometries. We thus expect the wave function to
  oscillate as the volume of the three-geometry becomes large. If it
  oscillates without being strongly damped this corresponds to a universe
  which expands without limit.

  The above considerations are only qualitative but do suggest how the
  behavior of the ground-state wave function determines the boundary
  conditions for the Wheeler-DeWitt equation. In the following we shall make
  these considerations concrete in a minisuperspace model.

  <section*|V. MINISUPERSPACE MODEL>

  It is particularly straightforward to construct minisuperspace models using
  the functional-integral approach to quantum gravity. One simply restricts
  the functional integral to the restricted degrees of freedom to be
  quantized. In this and the following sections, we shall illustrate the
  general discussion of those proceeding with a particularly simple
  minisuperspace model. In it we restrict the cosmological constant to be
  positive and the four-geometries to be spatially homogeneous, isotropic,
  and closed so that they are characterized by a single scale factor. An
  explicit metric in a useful coordinate system is

  <\equation>
    d*s<rsup|2>=\<sigma\><rsup|2>*<around*|[|-N<around|(|t|)><rsup|2>*d*t<rsup|2>+a<around|(|t|)><rsup|2>*d*\<Omega\><rsub|3><rsup|2>|]>,
  </equation>

  where <math|N<around|(|t|)>> is the lapse function and
  <math|\<sigma\><rsup|2>=1/2*\<Lambda\>>. For the matter degrees of freedom,
  we take a single conformally invariant scalar field which, consistent with
  the geometry, is always spatially homogeneous,
  <math|\<phi\><around|(|t|)>>. The wave function is then a function of only
  two variables:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Psi\>=\<Psi\><around|(|a,\<phi\>|)>>>|<row|<cell|\<Phi\>=\<Phi\><around|(|K,\<phi\>|)>>>>>>
  </equation>

  Models of this general structure have been considered previously by DeWitt,
  Isham and Nelson, and Blyth and Isham.

  To simplify the subsequent discussion we introduce the following
  definitions and rescalings of variables:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<phi\>=<sqrt|a*<around*|(|2*\<pi\>*\<sigma\><rsup|2>|)>>>>|<row|<cell|\<Lambda\>=3*<frac|A|\<sigma\><rsup|2>>>>|<row|<cell|H<rsup|2>=<around|\||\<Lambda\>|\|>>>>>>
  </equation>

  The Lorentzian action keeping <math|X> and <math|a> fixed on the boundaries
  is

  <\equation>
    S=<frac|1|2>*<big|int>*<frac|a|N>*<around|(|<wide|X|\<dot\>><rsup|2>-X<rsup|2>|)>d*t-<frac|1|2>*<big|int><frac|a*<wide|a|\<dot\>><rsup|2>|N>+<frac|N|a>-<frac|\<Lambda\>*a<rsup|3>|3>d*t*
  </equation>

  From this action the momenta <math|\<pi\><rsub|a>=-<frac|a*<wide|a|\<dot\>>|N>>
  and <math|\<pi\><rsub|X>=<frac|a*<wide|X|\<dot\>>|N>> conjugate to <math|a>
  and <math|X> can be constructed in the usual way. The Hamiltonian
  constraint then follows by varying the action with respect to the lapse
  function and expressing the result in terms of <math|a,X>, and their
  conjugate momenta. One finds

  <\equation>
    <around*|(|1-\<tau\><rsup|2>*a<rsup|2>+<frac|a<rsup|4>|4>*X<rsup|2>+<frac|X<rsup|2>|2>|)>=0
  </equation>

  The Wheeler-DeWitt equation is the operator expression of this classical
  constraint. There is the usual operator-ordering problem in passing from
  classical to quantum relations but its particular resolution will not be
  central to our subsequent semiclassical considerations. A class wide enough
  to remind oneself that the issue exists can be encompassed by writing

  <\equation>
    \<tau\><rsup|2>=-<frac|1|<sqrt|p>>*<frac|\<partial\><rsup|2>|\<partial\>*a<rsup|2>>*<sqrt|p>
  </equation>

  although this is certainly not the most general form possible. In passing
  from the classical constraint to its quantum operator one must also
  consider the possibility of a matter-energy correction term. This will lead
  to an addition to the quantum constant in the equation. Thus we write for
  the arbitrary version of <math|S<rsup|2>>,

  <\equation>
    <around*|(|*<space|0.17em><frac|p|a>*<frac|\<partial\>|\<partial\>*a>*<frac|p|a><frac|\<partial\>|\<partial\>*a>-a<rsup|2>+a<rsup|4>-<frac|X<rsup|2>|2>|)>*\<Psi\><around|(|a,X|)>=0
  </equation>

  A useful property stemming from the conformal invariance of the scalar
  field is that this equation separates. If we assume reasonable behavior for
  the function <math|\<Psi\>> in the amplitude of the scale field we can
  expand in harmonic-oscillator eigenstates

  <\equation>
    \<Psi\><around|(|a,X|)>=<big|sum><rsub|n>c<rsub|n><around|(|a|)>*u<rsub|n><around|(|X|)>
  </equation>

  where

  <\equation>
    u<rsub|n><around|(|X|)>=<around*|(|<frac|1|2>*d<rsup|2>*X<rsup|2>+X<rsup|2>|)>*u<rsub|X>=<around|(|n+<frac|1|2>|)>*\<hbar\>*u<rsub|X>
  </equation>

  The consequent equation for the <math|c<rsub|n><around|(|a|)>> is

  <\equation>
    <frac|1|2>*<around*|(|-<frac|1|a>*p<frac|d|d*a>*p<frac|d*c<rsub|n>|d*a>+<around|(|a<rsup|2>-\<Lambda\>*a<rsup|4>|)>*c<rsub|n>|)>=<around|(|n+<frac|1|2>|)>*\<epsilon\>*c<rsub|n>
  </equation>

  For small <math|a> this equation has solutions of the form

  <\equation>
    c<rsub|n>=a<rsup|p-1>
  </equation>

  If <math|p> is an integer then there may be a log(<math|a>) factor. For
  large <math|\<alpha\>> the possible behaviors are

  <\equation>
    c<rsub|n>\<sim\>a<rsup|-p/2+1>*exp <around*|(|\<pm\>i<frac|1|3>*H*a<rsup|3>|)>
  </equation>

  To construct the solution of Eq. (5.11) which corresponds to the ground
  state of the minisuperspace model we turn to our Euclidean
  functional-integral prescription as applied to this minisuperspace model,
  the prescription of Sec. III for <math|\<Psi\><rsub|0><around|(|x<rsub|0>|)>>
  which sums over all those Euclidean geometries and field configurations
  which are represented in the minisuperspace and which satisfy the
  ground-state boundary conditions. The geometrical sum would be over compact
  geometries of the form

  <\equation>
    d*s<rsup|2>=\<sigma\><rsup|2>*<around*|(|\<tau\><rsup|2>*d*\<tau\><rsup|2>+a<rsup|2><around|(|\<tau\>|)>*d*\<Omega\><rsub|3><rsup|2>|)>
  </equation>

  for which <math|a<around|(|\<tau\>|)>> matches the prescribed value of
  <math|a<rsub|0>> on the hypersurface of interest. The prescription for the
  matter field would be to sum over homogeneous fields
  <math|X<around|(|\<tau\>|)>> which match the prescribed value
  <math|X<rsub|0>> on the surface and which are regular on the compact
  geometry. Explicitly we could write

  <\equation>
    \<Psi\><rsub|0><around|(|a<rsub|0>,X<rsub|0>|)>=<big|int>\<cal-D\>*a*exp
    <around|(|-I<around|[|a,X|]>|)>,
  </equation>

  where, defining <math|d*\<eta\>=d*\<tau\>/a>, the action is

  <\equation>
    I=<frac|1|2>*<big|int>d*\<eta\>*<around*|[|<around*|(|<frac|d*a|d*\<eta\>>|)><rsup|2>-a<rsup|2>+a<rsup|4><around*|(|<frac|d*X|d*\<eta\>>|)><rsup|2>+X<rsup|2>|]>
  </equation>

  A conformal rotation [in this case of <math|a<around|(|\<eta\>|)>>] is
  necessary to make the functional integral in (5.15) converge.

  An alternative way of constructing the ground-state wave function for the
  minisuperspace model is to work in the <math|K> representation. Here,
  introducing

  <\equation>
    k=-<frac|\<partial\>*F|\<partial\>*a>
  </equation>

  as a simplifying measure of <math|K>, one would have

  <\equation>
    \<Psi\><rsub|0><around|(|a<rsub|0>,X<rsub|0>|)>=<big|int>\<cal-D\>*a*exp
    <around|(|-I<rprime|'><around|[|a,X|]>|)>
  </equation>

  The sum is over the same class of geometries and fields as in (5.15) except
  they must now assume the given value of <math|k> on the bounding
  three-surface. That is, on the boundary they must satisfy

  <\equation>
    k<rsub|0>=<frac|1|3>*<frac|d*a|d*\<tau\>>
  </equation>

  The action <math|I<rprime|'>> appropriate for holding <math|k> fixed on the
  boundary is

  <\equation>
    I<rprime|'>=k<rsub|0>*a<rsub|0><rsup|3>+H
  </equation>

  [cf. Eq. (3.6)]. Once <math|\<Psi\><rsub|0><around|(|a<rsub|0>,X<rsub|0>|)>>
  has been computed, the ground-state wave function
  <math|\<Psi\><rsub|0><around|(|k<rsub|0>,X<rsub|0>|)>> may be recovered by
  carrying out the contour integral

  <\equation>
    \<Psi\><rsub|0><around|(|a<rsub|0>,X<rsub|0>|)>=<frac|1|2*\<pi\>*i>*<big|int>d*k<rsub|0>*e<rsup|k<rsub|0>*a<rsub|0><rsup|3>>*\<Psi\><rsub|0><around|(|k<rsub|0>,X<rsub|0>|)>
  </equation>

  where the contour runs from <math|-\<infty\>> to <math|+\<infty\>> to the
  right of any singularities of <math|\<Psi\><rsub|0><around|(|k<rsub|0>,X<rsub|0>|)>>.

  From the general point of view there is no difference between computing
  <math|\<Psi\><rsub|0><around|(|k<rsub|0>,X<rsub|0>|)>> directly from (5.15)
  or via the <math|K> representation from (5.21). In Sec. VI we shall
  calculate the semiclassical approximation to
  <math|\<Psi\><rsub|0><around|(|a<rsub|0>,X<rsub|0>|)>> both ways with the
  aim of advancing arguments that the rules of Sec. III define a wave
  function which may reasonably be considered as the state of minimal
  excitation and of displaying the boundary conditions under which Eq. (5.11)
  is to be solved.

  <section*|VI. GROUND-STATE COSMOLOGICAL WAVE FUNCTION>

  In this section, we shall evaluate the ground-state wave function for our
  minisuperspace model and show that it possesses properties appropriate to a
  state of minimum excitation. We shall first evaluate the steepest-descents
  semiclassical approximation from the functional integral as approximation
  to IV. We shall then solve the Wheeler-DeWitt equation with the boundary
  conditions implied by the semiclassical approximation to obtain the precise
  wave function.

  It is the exponent of the semiclassical approximation which will be most
  important in its interpretation. We shall calculate only this exponent of
  the prefactor of action and leave the determination of the detailed
  equation (4.14) to the solution of the differential equation itself. Thus,
  for example, if there were a single real Euclidean extremum of least action
  we would write for the semiclassical-approximation to the functional
  integral in Eq. (5.15)

  <\equation>
    \<Psi\><rsub|0><around|(|a<rsub|0>,X<rsub|0>|)>=N*e<rsup|-I>
  </equation>

  Here, <math|I<around|(|a<rsub|0>,X<rsub|0>|)>> is the action (5.16) which
  is evaluated at the extremum of the functional integral and under the
  boundary conditions specified out in (5.11) and which match the arguments
  of the wave function on a fixed-<math|\<eta\>> hypersurface.

  <subsection*|A. The matter wave function>

  A considerable simplification in evaluating the ground-state wave function
  arises from the fact that the energy-momentum tensor of an extremizing
  conformally invariant field vanishes in the compact geometries considered
  over as a consequence of the ground-state boundary conditions. One can see
  this because the conformal transformations of the class we are considering
  are space. A conformal invariant wave function is therefore flat space
  which is a constant scalar field relies only on solution of the conformally
  invariant wave function in flat space which is a constant on the boundary
  three-sphere. This energy-momentum tensor of this field is zero. The
  implies that it is zero in any geometry of the class (5.14) because the
  energy-momentum tensor of a conformally invariant field scales by a power
  of the conformal factor under a conformal transformation.

  More explicitly in the minisuperspace model we can show that the matter and
  gravitational functional integrals in (5.15) may be evaluated separately.
  The ground-state boundary conditions imply that geometries in the sum are
  conformal to half of a Euclidean Einstein-static universe, i.e., that the
  range of <math|\<eta\>> is <math|<around|(|-\<infty\>,0|)>>. The boundary
  conditions at infinity are that <math|X<around|(|\<eta\>|)>> and
  <math|a<around|(|\<eta\>|)>> vanish. The boundary conditions at
  <math|\<eta\>=0> are that <math|a<around|(|0|)>> and <math|X<around|(|0|)>>
  match.
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
    <associate|1.11|<tuple|11|4>>
    <associate|1.4|<tuple|4|2>>
    <associate|1.5|<tuple|5|3>>
    <associate|1.6|<tuple|6|3>>
    <associate|1.7|<tuple|7|3>>
    <associate|2.1|<tuple|12|6>>
    <associate|2.13|<tuple|24|8>>
    <associate|2.14|<tuple|25|9>>
    <associate|2.15|<tuple|26|9>>
    <associate|2.16|<tuple|27|9>>
    <associate|2.19|<tuple|30|10>>
    <associate|2.20|<tuple|31|10>>
    <associate|2.21|<tuple|32|10>>
    <associate|2.3|<tuple|14|6>>
    <associate|2.4|<tuple|15|7>>
    <associate|2.8|<tuple|19|7>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|11|5>>
    <associate|auto-3|<tuple|11|6>>
    <associate|auto-4|<tuple|2|7>>
    <associate|auto-5|<tuple|33|11>>
    <associate|auto-6|<tuple|53|15>>
    <associate|auto-7|<tuple|54|15>>
    <associate|footnote-1|<tuple|1|3>>
    <associate|footnote-2|<tuple|2|7>>
    <associate|footnr-1|<tuple|1|3>>
    <associate|footnr-2|<tuple|2|7>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|II. QUANTUM GRAVITY
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|A.
      Wave functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|B. Wheeler-DeWitt equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|V.
      MINISUPERSPACE MODEL> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|VI.
      GROUND-STATE COSMOLOGICAL WAVE FUNCTION>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|A. The matter wave function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>
    </associate>
  </collection>
</auxiliary>