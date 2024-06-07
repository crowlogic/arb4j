<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <\theorem>
    <dueto|Stone <cite|Stone1932> and von Neumann <cite|vonNeumann1932>>Let
    <math|U<around|(|t|)>> and <math|V<around|(|t|)>> be (continuous) unitary
    representations of <math|\<bbb-R\><rsup|d>> on <math|\<cal-H\>>
    satisfying the Weyl relations (3). Then there is a Hilbert space
    <math|\<cal-K\>> and a unitary map <math|T:\<cal-H\>\<to\>L<rsup|2><around|(|\<bbb-R\><rsup|d>,\<cal-K\>|)>>
    that transforms <math|U<around|(|t|)>> and <math|V<around|(|t|)>> to the
    Schrödinger representation. The representation is irreducible if and only
    if <math|\<cal-K\>> is one dimensional.
  </theorem>

  For systems with infinitely many degrees of freedom, the analog of the
  Schrödinger representation is called the Fock representation (see, for
  instance, Streater and Wightman <cite|StreaterWightman1964>). However,
  there are infinitely many other inequivalent irreducible representations as
  well (Gårding and Wightman <cite|GardingWightman1954>) and according to a
  theorem of Haag (see Streater and Wightman <cite|StreaterWightman1964>)
  these cannot be avoided in nontrivial field theories. As mentioned earlier,
  the maps <math|T> implementing other representations of the Weyl relations
  are related to Fourier integral operators.

  Mackey <cite|Mackey1969> has given an important reformulation of the
  Stone\Uvon Neumann theorem. One represents the position observables by
  orthogonal projections <math|P<rsub|E>> in Hilbert space <math|\<cal-H\>>
  for any (Borel) set <math|E\<subseteq\>Q>, where <math|Q> represents
  position space. One requires <math|E\<mapsto\>P<rsub|E>> to be a
  (projection-valued) measure. (For <math|Q=\<bbb-R\><rsup|3>>, an example of
  these are the spectral projections associated with the usual position
  operators, i.e., with <math|\<cal-H\>=L<rsup|2><around|(|\<bbb-R\><rsup|3>|)>>,

  <\equation>
    P<rsub|E>*\<psi\>=\<chi\><rsub|E>*\<psi\>
  </equation>

  where <math|\<chi\><rsub|E>> is the characteristic function of
  <math|E\<subseteq\>\<bbb-R\><rsup|3>>.) If a group <math|G> acts on
  <math|Q>, the momentum observables will arise as a representation
  <math|U<around|(|g|)>> of <math|G> on <math|\<cal-H\>>. (For example, if
  <math|G=\<bbb-R\><rsup|3>=Q>, we obtain <math|U<around|(|g|)>> as described
  earlier.) The position and momentum are linked by

  <\equation>
    U<around|(|g|)>*P<rsub|E>*U<around|(|g|)><rsup|-1>=P<rsub|g\<cdot\>E>
  </equation>

  where <math|g\<cdot\>E> is the translate of <math|E> under <math|g> in the
  given action. Equations (5) are an abstract form of the Weyl relations (3)
  [or the Heisenberg relations (1)]. One calls a projection-valued measure
  and a representation satisfying (5) a system of imprimitivity. Mackey then
  proves a general result of which the Stone\Uvon Neumann theorem is a
  special case.

  Besides <math|G=\<bbb-R\><rsup|d>>, one wishes to take the Euclidean group
  for <math|G> and still impose (5). This leads to what is referred to as the
  Mackey\UWightman system.analysis. Since one should only work with
  expectation values, one should only require <math|U<around|(|g|)>> to be a
  projective representation. As Bargmann has shown, we can then adjust things
  so that we have a true representation of the covering group
  <math|<wide|G|~>=\<bbb-R\><rsup|3>\<times\>S*U<around|(|2|)>>. Mackey and
  Wightman then use the generalized Stone\Uvon Neumann theorem to show that
  if we have a system of imprimitivity based on <math|\<bbb-R\><rsup|3>> for
  <math|<wide|G|~>>, then it is unitarily equivalent to the system,

  <\equation>
    P<rsub|E>*f=\<chi\><rsub|E>*f
  </equation>

  and

  <\equation>
    <around|(|U<rsub|<around|(|a,A|)>>*f|)><around|(|x|)>=D<rsub|A>*f*<around|(|A<rsup|-1>*<around|(|x-a|)>|)>
  </equation>

  on <math|L<rsup|2><around|(|\<bbb-R\><rsup|3>,\<cal-K\>|)>>, where
  <math|a\<in\>\<bbb-R\><rsup|3>>, <math|A\<in\>S*U<around|(|2|)>> (which by
  projection to <math|S*O<around|(|3|)>>, acts on <math|\<bbb-R\><rsup|3>>),
  and <math|D<rsub|A>> is a unitary representation of
  <math|S*U<around|(|2|)>> on <math|\<cal-K\>>.

  Thus the unitary representations of <math|S*U<around|(|2|)>> classify
  Euclidean invariant systems. In quantum mechanics texts, the irreducible
  unitary representations of <math|S*U<around|(|2|)>> are shown to be of
  dimension <math|n>, <math|n=1,2,3,\<ldots\>> and correspond to particles of
  spin <math|s=n/2>.

  By analogy with the classical case, one can show that a quantum dynamical
  system with Hamiltonian operator <math|H<rsub|op>> is Euclidean invariant
  on <math|\<bbb-R\><rsup|3>> when <math|H<rsub|op>> is a function of the
  Laplacian; the relevant fact from operator theory is that every translation
  and rotational invariant operator on <math|\<bbb-R\><rsup|n>> is a function
  of the Laplacian.

  We can go to the Galilei group and the Lorentz group as in the classical
  case. For the Galilei case we are again forced into
  <math|H<rsub|op>=-<around|(|1/2*m|)>*\<Delta\>> acting on spin wave
  functions. For the case of the Lorentz group things are more interesting.
  Here <math|H<rsub|op>> depends on the spin and one recovers, for example,
  the Klein\UGordon and Dirac operators, as Bargmann and Wigner have shown.
  Any such <math|H<rsub|op>> satisfies

  <\equation>
    H<rsub|op><rsup|2>=m<rsup|2>*c<rsup|4>-c<rsup|2>*\<Delta\>
  </equation>

  the mass-energy relation, independent of spin. (Mass-zero particles, e.g.,
  the photon and neutrino are exceptional in that they are not localizable in
  the sense that their position operators have the form previously described,
  so this case is dealt with separately.) We refer the reader to Varadarajan
  <cite|Varadarajan1968> for details of the aforementioned results and the
  appropriate references.
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

<\auxiliary>
  <\collection>
    <\associate|bib>
      Stone1932

      vonNeumann1932

      StreaterWightman1964

      GardingWightman1954

      StreaterWightman1964

      Mackey1969

      Varadarajan1968
    </associate>
  </collection>
</auxiliary>