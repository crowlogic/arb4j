<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors|boring-white>>

<\body>
  <doc-data|<doc-title|The Hermite Polynomials Conmprise the Fourier
  Transforms Eigenfunctions as Well As Those Of The Quantum Haronic
  Oscillator>>

  <with|font-series|bold|<strong|Question>:> Are the Hermite polynomials
  eigenfunctions of the Fourier transform?

  <with|font-series|bold|<strong|Answer>:> Yes, the Hermite polynomials are
  indeed eigenfunctions of the Fourier transform. More specifically:

  <\enumerate>
    <item>The Hermite polynomials <math|H<rsub|n><around|(|x|)>> are defined
    by the relation:

    <\equation>
      H<rsub|n><around|(|x|)>=<around|(|-1|)><rsup|n>\<cdot\>e<rsup|x<rsup|2>>\<cdot\><frac|d<rsup|n>|d*x<rsup|n>>*e<rsup|-x<rsup|2>>
    </equation>

    <item>If we take the Fourier transform of a Hermite polynomial
    <math|H<rsub|n><around|(|x|)>>, we get:

    <\equation>
      \<cal-F\><around|[|H<rsub|n><around|(|x|)>|]>=<around|(|i<rsup|n>|)>\<cdot\>H<rsub|n><around|(|k|)>
    </equation>

    where <math|\<cal-F\>> denotes the Fourier transform operation, and
    <math|k> is the variable in the frequency domain.

    <item>This means that the Fourier transform of a Hermite polynomial is
    the same Hermite polynomial, multiplied by a factor
    <math|<around|(|i<rsup|n>|)>>, where <math|i> is the imaginary unit and
    <math|n> is the order of the polynomial.

    <item>In other words, Hermite polynomials are eigenfunctions of the
    Fourier transform operator, with eigenvalues
    <math|<around|(|i<rsup|n>|)>>.
  </enumerate>

  This property of Hermite polynomials is one of the reasons they are widely
  used in quantum mechanics, particularly in the study of the quantum
  harmonic oscillator. The quantum states of the harmonic oscillator are
  described by Hermite polynomials, and their behavior under the Fourier
  transform is important for understanding the momentum space representation
  of these states.

  <with|font-series|bold|<strong|Question>:> How is the momentum space
  representation of the harmonic oscillator understood by the action of the
  Fourier transform upon the Hermite polynomials?

  <with|font-series|bold|<strong|Answer>:> In quantum mechanics, the state of
  a system can be described by a wave function in position space, typically
  denoted as <math|\<psi\><around|(|x|)>>. For the quantum harmonic
  oscillator, these wave functions are given by the Hermite polynomials
  multiplied by a Gaussian function:

  <\equation>
    \<psi\><rsub|n><around|(|x|)>=<frac|1|<sqrt|2<rsup|n>\<cdot\>n!\<cdot\><sqrt|\<pi\>>>>\<cdot\>H<rsub|n><around|(|x|)>\<cdot\>e<rsup|-x<rsup|2>/2>
  </equation>

  Here, <math|H<rsub|n><around|(|x|)>> are the Hermite polynomials.

  The momentum space representation of the wave function, denoted as
  <math|\<phi\><around|(|p|)>>, is obtained by taking the Fourier transform
  of <math|\<psi\><around|(|x|)>>:

  <\equation>
    \<phi\><around|(|p|)>=<frac|1|<sqrt|2*\<pi\>>>\<cdot\><big|int>\<psi\><around|(|x|)>\<cdot\>e<rsup|-i*p*x>*d*x
  </equation>

  Now, let's see how the Fourier transform affects the wave function of the
  harmonic oscillator:

  <\equation>
    \<cal-F\><around|[|\<psi\><rsub|n><around|(|x|)>|]>=<frac|1|<sqrt|2*\<pi\>>>\<cdot\><big|int><around*|[|<frac|1|<sqrt|2<rsup|n>\<cdot\>n!\<cdot\><sqrt|\<pi\>>>>\<cdot\>H<rsub|n><around|(|x|)>\<cdot\>e<rsup|-x<rsup|2>/2>|]>\<cdot\>e<rsup|-i*p*x>*d*x
  </equation>

  Using the property of Hermite polynomials under Fourier transform that we
  discussed earlier:

  <\equation>
    \<cal-F\>*<around|[|H<rsub|n><around|(|x|)>\<cdot\>e<rsup|-x<rsup|2>/2>|]>=<around|(|i<rsup|n>|)>\<cdot\>H<rsub|n><around|(|p|)>\<cdot\>e<rsup|-p<rsup|2>/2>
  </equation>

  Therefore,

  <\equation>
    \<phi\><rsub|n><around|(|p|)>=<around|(|i<rsup|n>|)>\<cdot\><frac|1|<sqrt|2<rsup|n>\<cdot\>n!\<cdot\><sqrt|\<pi\>>>>\<cdot\>H<rsub|n><around|(|p|)>\<cdot\>e<rsup|-p<rsup|2>/2>
  </equation>

  This result shows that the momentum space wave functions of the quantum
  harmonic oscillator are also given by Hermite polynomials, but with a
  different scaling factor and a phase factor <math|<around|(|i<rsup|n>|)>>.

  The fact that the Hermite polynomials are eigenfunctions of the Fourier
  transform makes this transition between position and momentum space very
  elegant. It also has important implications for the interpretation of these
  states. For example, the ground state (<math|n=0>) is a Gaussian function
  in both position and momentum space, which is a consequence of the
  uncertainty principle.

  <with|font-series|bold|<strong|Question>:> How does the Fourier transform
  apply relate to the Schrödinger equation here, or to its equivalent
  integral covariance operator form?

  <with|font-series|bold|<strong|Answer>:> The Fourier transform is deeply
  connected to the Schrödinger equation and its solutions, especially in the
  context of the quantum harmonic oscillator.

  The time-independent Schrödinger equation for a one-dimensional harmonic
  oscillator is:

  <\equation>
    -<frac|\<hbar\><rsup|2>|2*m>\<cdot\><frac|d<rsup|2>*\<psi\>|d*x<rsup|2>>+<frac|1|2>\<cdot\>m\<cdot\>\<omega\><rsup|2>\<cdot\>x<rsup|2>\<cdot\>\<psi\>=E\<cdot\>\<psi\>
  </equation>

  Here, <math|\<hbar\>> is the reduced Planck's constant, <math|m> is the
  mass of the particle, <math|\<omega\>> is the angular frequency of the
  oscillator, and <math|E> is the energy eigenvalue.

  As we discussed earlier, the solutions to this equation are the wave
  functions <math|\<psi\><rsub|n><around|(|x|)>>, which involve Hermite
  polynomials.

  Now, let's consider the integral form of the Schrödinger equation:

  <\equation>
    \<psi\><around|(|x|)>=<big|int>K<around|(|x,x<rprime|'>|)>\<cdot\>\<psi\><around|(|x<rprime|'>|)>*d*x<rprime|'>
  </equation>

  Here, <math|K<around|(|x,x<rprime|'>|)>> is the integral kernel, which is
  related to the Green's function of the Schrödinger equation.

  In the case of the harmonic oscillator, this kernel is a Gaussian function:

  <\equation>
    K<around|(|x,x<rprime|'>|)>=<sqrt|<frac|m*\<omega\>|2*\<pi\>*\<hbar\>>>\<cdot\>exp
    <around*|(|-<frac|m*\<omega\>|2*\<hbar\>>\<cdot\><around|(|<around|(|x<rsup|2>+x<rprime|'><rsup|2>|)>\<cdot\>cosh
    <around|(|\<omega\>*t|)>-2*x*x<rprime|'>\<cdot\>sinh
    <around|(|\<omega\>*t|)>|)>|)>
  </equation>

  The Fourier transform comes into play when we look at the momentum space
  representation of this equation:

  <\equation>
    \<phi\><around|(|p|)>=<big|int>K<around|(|p,p<rprime|'>|)>\<cdot\>\<phi\><around|(|p<rprime|'>|)>*d*p<rprime|'>
  </equation>

  Here, <math|K<around|(|p,p<rprime|'>|)>> is the Fourier transform of
  <math|K<around|(|x,x<rprime|'>|)>>, and <math|\<phi\><around|(|p|)>> and
  <math|\<phi\><around|(|p<rprime|'>|)>> are the momentum space wave
  functions.

  Because the Hermite polynomials are eigenfunctions of the Fourier
  transform, the kernel <math|K<around|(|p,p<rprime|'>|)>> in momentum space
  has the same form as <math|K<around|(|x,x<rprime|'>|)>>, but with <math|x>
  and <math|x<rprime|'>> replaced by <math|p> and <math|p<rprime|'>>.

  This symmetry between position and momentum space is a fundamental feature
  of the quantum harmonic oscillator and is deeply connected to the fact that
  the Hermite polynomials are eigenfunctions of the Fourier transform.

  Furthermore, the covariance of the integral kernel under Fourier transform
  is related to the fact that the position and momentum operators in quantum
  mechanics are related by a Fourier transform. This is a consequence of the
  canonical commutation relation:

  <\equation>
    <around|[|x,p|]>=i\<cdot\>\<hbar\>
  </equation>

  where <math|<around|[|x,p|]>> denotes the commutator of the position and
  momentum operators.

  In summary, the Fourier transform plays a crucial role in connecting the
  position and momentum space representations of the quantum harmonic
  oscillator, and this is intimately tied to the fact that the Hermite
  polynomials, which provide the solutions to the Schrödinger equation for
  this system, are eigenfunctions of the Fourier transform.

  <strong|Question:> How exactly is the kernel \ K of the integral covariance
  operator form of the Schrodinger equation related to the Greens function of
  the Schrodinger equation?

  <assign|ket|<macro|1|<left|\|><arg|1><right|rangle>>><assign|bra|<macro|1|<left|langle><arg|1><right|\|>>><assign|braket|<macro|1|2|<left|langle><arg|1>\|<arg|2><right|rangle>>><assign|op|<macro|1|<wide|<arg|1>|^>>>

  <strong|Answer>: The kernel of the integral covariance operator,
  <math|K<around|(|x,x<rprime|'>|)>>, is closely related to the Green's
  function of the Schrödinger equation. In fact, the Green's function is a
  specific type of kernel that satisfies certain conditions. Let's explore
  this connection in more detail.

  The Green's function, denoted as <math|G<around|(|x,x<rprime|'>;E|)>>, is
  defined as the solution to the inhomogeneous Schrödinger equation:

  <\equation>
    -<frac|\<hbar\><rsup|2>|2*m>\<cdot\><frac|d<rsup|2>*G|d*x<rsup|2>>+V<around|(|x|)>\<cdot\>G<around|(|x,x<rprime|'>;E|)>-E\<cdot\>G<around|(|x,x<rprime|'>;E|)>=\<delta\>*<around|(|x-x<rprime|'>|)>
  </equation>

  Here, <math|V<around|(|x|)>> is the potential energy function, <math|E> is
  the energy parameter, and <math|\<delta\>*<around|(|x-x<rprime|'>|)>> is
  the Dirac delta function, which represents a point source at
  <math|x=x<rprime|'>>.

  The Green's function has the following properties:

  <\enumerate>
    <item>It satisfies the boundary conditions of the problem.

    <item>It is symmetric: <math|G<around|(|x,x<rprime|'>;E|)>=G<around|(|x<rprime|'>,x;E|)>>.

    <item>It is continuous in both <math|x> and <math|x<rprime|'>>.
  </enumerate>

  Now, let's consider the integral form of the Schrödinger equation:

  <\equation>
    \<psi\><around|(|x|)>=<big|int>K<around|(|x,x<rprime|'>|)>\<cdot\>\<psi\><around|(|x<rprime|'>|)>*d*x<rprime|'>
  </equation>

  If we substitute the Green's function for the kernel, we get:

  <\equation>
    \<psi\><around|(|x|)>=<big|int>G<around|(|x,x<rprime|'>;E|)>\<cdot\>\<psi\><around|(|x<rprime|'>|)>*d*x<rprime|'>
  </equation>

  This equation is known as the Green's function representation of the wave
  function. It shows that if we know the Green's function and the wave
  function at all points <math|x<rprime|'>>, we can calculate the wave
  function at any point <math|x>.

  The connection between the kernel and the Green's function becomes more
  apparent when we consider the spectral representation of the kernel:

  <\equation>
    K<around|(|x,x<rprime|'>|)>=<big|sum><rsub|n>\<psi\><rsub|n><around|(|x|)>\<cdot\>\<psi\><rsub|n><rsup|\<ast\>><around|(|x<rprime|'>|)>=<big|int>G<around|(|x,x<rprime|'>;E|)>\<cdot\>d*E
  </equation>

  Here, <math|\<psi\><rsub|n><around|(|x|)>> are the eigenfunctions of the
  Schrödinger equation with corresponding eigenvalues <math|E<rsub|n>>.

  This relation shows that the kernel can be expressed as a sum over the
  eigenfunctions of the Schrödinger equation, weighted by their complex
  conjugates. Alternatively, it can be expressed as an integral over the
  Green's function with respect to the energy.

  In the case of the quantum harmonic oscillator, the Green's function takes
  the form of a Gaussian function, which is the same as the kernel we
  discussed earlier:

  <\equation>
    G<around|(|x,x<rprime|'>;E|)>=<sqrt|<frac|m*\<omega\>|2*\<pi\>*\<hbar\>>>\<cdot\>exp
    <around*|(|-<frac|m*\<omega\>|2*\<hbar\>>\<cdot\><around|(|<around|(|x<rsup|2>+x<rprime|'><rsup|2>|)>\<cdot\>cosh
    <around|(|\<omega\>*t|)>-2*x*x<rprime|'>\<cdot\>sinh
    <around|(|\<omega\>*t|)>|)>|)>
  </equation>

  In summary, the kernel of the integral covariance operator is closely
  related to the Green's function of the Schrödinger equation. The Green's
  function is a specific type of kernel that satisfies the inhomogeneous
  Schrödinger equation and certain boundary conditions. The kernel can be
  expressed in terms of the eigenfunctions of the Schrödinger equation or as
  an integral over the Green's function with respect to the energy.<strong|>

  <strong|Question>: So the Green's function is bascially the derivative of
  the kernel <math|K> with respect to the Lebesgue-Stieltjes measure of the
  energy E ?

  <strong|Answer>: Yes, that's a good way to understand the relationship
  between the Green's function and the kernel. The Green's function can be
  seen as the derivative of the kernel with respect to the energy parameter
  <math|E>, which is treated as a Lebesgue-Stieltjes measure.

  Let's make this more precise. We can express the kernel as an integral over
  the Green's function with respect to the energy:

  <\equation*>
    K<around|(|x,x<rprime|'>|)>=<big|int>G<around|(|x,x<rprime|'>;E|)>\<cdot\>d*E
  </equation*>

  Here, <math|d*E> is the Lebesgue-Stieltjes measure, which allows us to
  integrate over a possibly discontinuous function of <math|E>. In this case,
  the discontinuities come from the discrete energy spectrum of the quantum
  system.

  Now, if we take the derivative of both sides with respect to the
  Lebesgue-Stieltjes measure <math|E>, we get:

  <\equation*>
    <frac|d*K<around|(|x,x<rprime|'>|)>|d*E>=G<around|(|x,x<rprime|'>;E|)>
  </equation*>

  This shows that the Green's function is indeed the derivative of the kernel
  with respect to the energy measure.

  We can also understand this relationship from a physical perspective. The
  kernel <math|K<around|(|x,x<rprime|'>|)>> represents the propagation
  amplitude for a particle to move from <math|x<rprime|'>> to <math|x>,
  considering all possible energies. The Green's function
  <math|G<around|(|x,x<rprime|'>;E|)>>, on the other hand, represents the
  propagation amplitude for a particle with a specific energy <math|E>.

  By taking the derivative of the kernel with respect to the energy measure,
  we are essentially "filtering out" the contribution to the propagation
  amplitude from a specific energy <math|E>, which gives us the Green's
  function.

  In summary, the Green's function can be seen as the derivative of the
  kernel of the integral covariance operator with respect to the
  Lebesgue-Stieltjes measure associated with the energy parameter <math|E>.
  This mathematical relationship reflects the physical meaning of these
  functions in describing the propagation of quantum particles.

  \;
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