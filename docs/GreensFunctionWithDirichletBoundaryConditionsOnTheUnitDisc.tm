<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Green's function for the Laplace operator on the unit
  disk>>

  To compute the exact Green's function for the Laplace operator on the unit
  disk, we consider the boundary value problem for Laplace's equation where
  the boundary of the disk is held at zero potential, and there is a point
  source at a location within the disk.

  <with|font-series|bold|Problem Setup:> The Green's function
  <math|G<around|(|z,w|)>> on a unit disk centered at the origin in the
  complex plane satisfies:

  <\equation>
    \<Delta\>*G<around|(|z,w|)>=\<delta\>*<around|(|z-w|)>
  </equation>

  where <math|\<delta\>> is the Dirac delta function, <math|z> and <math|w>
  are points in the disk, and <math|\<Delta\>> is the Laplace operator.

  <with|font-series|bold|Solution in Polar Coordinates:> Since the domain is
  a unit disk, it's convenient to use polar coordinates. Let
  <math|z=r*e<rsup|i*\<theta\>>> and <math|w=\<rho\>*e<rsup|i*\<phi\>>>. The
  solution exploits the symmetry and the properties of the Laplace equation
  in polar coordinates.

  <with|font-series|bold|Green's Function Formula:> The Green's function in a
  unit disk with Dirichlet boundary conditions (potential zero at the
  boundary) is given by:

  <\equation>
    G<around|(|z,w|)>=-<frac|1|2*\<pi\>>*log
    <around*|\||<frac|z-w|1-<wide|w|\<bar\>>z>|\|>
  </equation>

  This formula uses the logarithmic potential and a correction term that
  ensures the Green's function vanishes at the boundary of the disk. The term
  <math|<frac|z-w|1-<wide|w|\<bar\>>z>> accounts for the mirror charge placed
  outside the disk to enforce the boundary condition.

  <with|font-series|bold|Breakdown:>

  <\itemize>
    <item><with|font-series|bold|Logarithmic Potential>: The
    <math|-<frac|1|2*\<pi\>>*log <around|\||z-w|\|>> term represents the
    fundamental solution to Laplace's equation in two dimensions,
    corresponding to the potential due to a point source.

    <item><with|font-series|bold|Mirror Charge Adjustment>: The
    <math|<frac|1|1-<wide|w|\<bar\>>z>> factor adjusts for the presence of
    the disk's boundary by introducing a mirror charge effect, ensuring the
    potential is zero on the boundary <math|<around|\||z|\|>=1>.
  </itemize>

  This Green's function is key in potential theory and electrostatics for
  modeling fields within circular regions and finds applications in various
  areas of physics and engineering where boundary value problems in circular
  geometries are prevalent.

  To connect the Green's function for the Laplace operator on the unit disk
  to the Legendre polynomials, we need to consider the series representation
  of the Green's function in terms of these polynomials. This relationship
  becomes evident when examining the azimuthal symmetry and the separation of
  variables technique used in polar coordinates.

  <with|font-series|bold|Expanded Form of Green's Function Using Legendre
  Polynomials:>

  In polar coordinates, <math|z=r*e<rsup|i*\<theta\>>> and
  <math|w=\<rho\>*e<rsup|i*\<phi\>>>, the complex variables <math|z> and
  <math|w> are represented in terms of their magnitudes <math|r> and
  <math|\<rho\>> and their angles <math|\<theta\>> and <math|\<phi\>>. The
  distance term in the Green's function can be expanded using the addition
  theorem for Legendre polynomials:

  <\equation>
    log <around*|\||<frac|z-w|1-<wide|w|\<bar\>>z>|\|>=log
    <around*|\||<frac|r*e<rsup|i*\<theta\>>-\<rho\>*e<rsup|i*\<phi\>>|1-\<rho\>*r*e<rsup|-i*<around|(|\<theta\>-\<phi\>|)>>>|\|>
  </equation>

  which can be written as\ 

  <\equation>
    log <around*|\||r*e<rsup|i*\<theta\>>-\<rho\>*e<rsup|i*\<phi\>>|\|>-log
    <around*|\||1-\<rho\>*r*e<rsup|-i*<around|(|\<theta\>-\<phi\>|)>>|\|>
  </equation>

  Using the Legendre polynomial expansion for <math|log <around|\||1-x|\|>>
  and the addition theorem, the terms can be expanded to:

  <\equation>
    log <sqrt|r<rsup|2>+\<rho\><rsup|2>-2*r*\<rho\>*cos
    <around|(|\<theta\>-p*h*i|)>>=log <sqrt|<around|(|r-\<rho\>|)><rsup|2>>+<big|sum><rsub|n=1><rsup|\<infty\>><frac|r<rsup|n>*\<rho\><rsup|n>|n>*P<rsub|n><around|(|cos
    <around|(|\<theta\>-\<phi\>|)>|)>
  </equation>

  where <math|P<rsub|n>> are Legendre polynomials.

  <\with|font-series|bold>
    <with|font-series|bold|Incorporating Orthogonality and Completeness:>
  </with>

  The Legendre polynomials <math|P<rsub|n><around|(|cos
  <around|(|\<theta\>-\<phi\>|)>|)>> are particularly useful because of their
  orthogonality and completeness, which allow the representation of the
  kernel of the Green's function as an infinite series:

  <\equation>
    G<around|(|z,w|)>=-<frac|1|2*\<pi\>>*<around*|(|log
    <sqrt|<around|(|r-\<rho\>|)><rsup|2>>+<big|sum><rsub|n=1><rsup|\<infty\>><frac|r<rsup|n>*\<rho\><rsup|n>|n>*P<rsub|n><around|(|cos
    <around|(|\<theta\>-\<phi\>|)>|)>|)>
  </equation>

  This series essentially decomposes the influence of the point source at
  <math|w> into a series of angular harmonics around the point <math|z>, with
  each term in the series corresponding to a Legendre polynomial. Each
  <math|P<rsub|n>> term in the series represents a mode of the potential
  influenced by the boundary conditions and the geometry of the problem
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