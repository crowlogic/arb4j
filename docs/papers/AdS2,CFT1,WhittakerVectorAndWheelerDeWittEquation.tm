<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\padded-center>
    <with|font-size|1.41|AdS<rsub|<math|2>>/CFT<rsub|<math|1>>, Whittaker
    vector and Wheeler-DeWitt equation>

    Tadashi Okazaki<footnote|tadashiokazaki@phys.ntu.edu.tw>

    <\with|font-shape|italic>
      Department of Physics and Center for Theoretical Sciences

      National Taiwan University, Taipei 10617, Taiwan\ 
    </with>
  </padded-center>

  <abstract-data|<\abstract>
    We study the energy representation of conformal quantum mechanics as the
    Whittaker vector without specifying classical Lagrangian. We show that a
    generating function of expectation values among two excited states of the
    dilatation operator in conformal quantum mechanics is a solution to the
    Wheeler-DeWitt equation and it corresponds to the AdS<rsub|<math|2>>
    partition function evaluated as the minisuperspace wave function in
    Liouville field theory. We also show that the dilatation expectation
    values in conformal quantum mechanics lead to the asymptotic smoothed
    counting function of the Riemann zeros.
  </abstract>>

  The holographic principle <cite|'tHooft:1993gx|Susskind:1994vu> states that
  quantum gravity on <math|<around|(|d+1|)>>-dimensional manifold can be
  described by a theory on its <math|d>-dimensional boundary. The
  AdS<rsub|<math|d+1>>/CFT<rsub|<math|d>> correspondence
  <cite|Maldacena:1997re> which is one of the greatest productions of string
  theory provides the most successful realization as the relationship between
  effective gauge theories of the brane dynamics and string theory on the
  near horizon AdS geometry. The AdS<rsub|<math|2>>/CFT<rsub|<math|1>> could
  conceivably be the most significant case in that all the extremal black
  holes contain an AdS<rsub|<math|2>> factor in their near horizon geometry
  <cite|Kunduri:2007vf|Figueras:2008qh>. In spite of a lot of interesting
  works <cite|Strominger:1998yg|Maldacena:1998uz|Nakatsu:1998st|Townsend:1998qp|Spradlin:1999bn|Cadoni:1999ja|Blum:1999pc|NavarroSalas:1999up|Caldarelli:2000xk|Cadoni:2000gm|Bellucci:2002va|Strominger:2003tm|Leiva:2003kd|Giveon:2004zz|Azeyanagi:2007bj|Alishahiha:2008tv|Gupta:2008ki|Hartman:2008dq|Galajinsky:2008ce|Sen:2008vm|Sen:2008yk|Sen:2011cn|Chamon:2011xk|MolinaVilaplana:2012xe|Jackiw:2012ur>
  it would be fair to say that we have not yet gained a fully satisfactory
  understanding of the correspondence due to the peculiarities of the
  AdS<rsub|<math|2>>/CFT<rsub|<math|1>>, including the fact that only the
  AdS<rsub|<math|2>> has two disconnected boundaries and it is a
  long-standing question whether the dual CFT<rsub|<math|1>> description is a
  single CFT or two systems living on the two boundaries.

  In this letter we study conformal quantum mechanics (CQM) without
  specifying classical Lagrangian description. One important consequence is a
  generic evidence of the AdS<rsub|<math|2>>/CFT<rsub|<math|1>> as the
  relationship between a generating function of the dilatation expectation
  values in the boundary CQM and a partition function of the bulk
  AdS<rsub|<math|2>>. We show that the expectation values are not associated
  with the ground state but with two excited states in the correspondence.
  Our result is in favor of the statement
  <cite|Zamolodchikov:2001ah|Sen:2008vm|Balasubramanian:1998sn|Balasubramanian:1998de|Balasubramanian:2010ys>
  that the dual CFT<rsub|<math|1>>'s on two boundaries of AdS<rsub|<math|2>>
  space-time are excited and entangled. We also claim that the energies on
  the boundary CQM would be responsible for the AdS<rsub|<math|2>> radius so
  that the ground state would correspond to a flat space in the bulk with an
  infinitely large AdS<rsub|<math|2>> radius.

  Another intriguing thing is the speculative implication of the resulting
  expectation values of the dilatation operator in CQM. When we consider the
  DFF-model <cite|deAlfaro:1976je> as CQM, the dilatation operator takes the
  form of <math|x*p>. Such operator has been proposed as a strong candidate
  for the realization of the Hilbert-Pólya conjecture that the imaginary part
  of the non-trivial Riemann zeros are eigenvalues of a self-adjoint operator
  (see <cite|MR1694895|berry1999h|MR1684543|MR2443603|Sierra:2011tb|MR2812337>
  and references therein). Unlike a lot of efforts undertaken thus far we
  here propose a novel approach to obtain the counts of the Riemann zeros
  from CQM point of view. The fact that the operator <math|x*p> is the
  dilatation operator in CQM rather than the Hamiltonian enables us to jump
  into a fairly general setting beyond the operator with the form of
  <math|x*p>. We show that the expectation values of the dilatation operator
  in CQM naturally lead to the asymptotic form of the smoothed counting
  function of the Riemann zeros.

  We shall begin by considering CQM that is invariant under the conformal
  symmetric transformation of the time coordinate <math|t>
  <cite|deAlfaro:1976je>

  <\align>
    <tformat|<table|<row|<cell|\<delta\>*t>|<cell|=\<epsilon\><rsub|1>+\<epsilon\><rsub|2>*t+\<epsilon\><rsub|3>*t<rsup|2><eq-number><label|conf1c>>>>>
  </align>

  where <math|\<epsilon\><rsub|1>>, <math|\<epsilon\><rsub|2>> and
  <math|\<epsilon\><rsub|3>> are identified with the infinitesimal parameters
  of the translation, the dilatation and the conformal boost transformation
  respectively. The corresponding generators, the Hamiltonian
  <math|H=i*d/d*t>, the dilatation operator <math|D=i*t*<around*|(|d/d*t|)>>,
  and the conformal boost operator <math|K=i*t<rsup|2>*<around*|(|d/d*t|)>>
  obey the commutation relations

  <\align>
    <tformat|<table|<row|<cell|<around|[|H,D|]>>|<cell|=i*H<eq-number><label|conf1e1>>>|<row|<cell|<around|[|K,D|]>>|<cell|=-i*K<eq-number><label|conf1e2>>>|<row|<cell|<around|[|H,K|]>>|<cell|=2*i*D<eq-number><label|conf1e3>>>>>
  </align>

  of <math|S*L<around|(|2,\<bbb-R\>|)>>, which we call the one-dimensional
  conformal group. Hence the Hilbert space of conformal quantum mechanical
  system exhibits the <math|S*L<around|(|2,\<bbb-R\>|)>> conformal symmetry
  and the physical states would be classified by its irreducible
  representation. Since we wish to make all integrals convergent, we require
  the unitarity of the representation. The classification of the irreducible
  unitary representations of <math|S*L<around|(|2,\<bbb-R\>|)>> was studied
  in <cite|Bargmann:1946me> and the irreducible unitary representation of
  <math|S*L<around|(|2,\<bbb-R\>|)>> conformal group as a function of the
  continuous time coordinate <math|t> can be generalized by taking the
  principal spherical series of the representation which is induced by the
  one-dimensional representation of the Borel subgroup. Let
  <math|V<rsub|\<lambda\>>> be a set of the irreducible unitary
  representations of <math|S*L<around|(|2,\<bbb-R\>|)>> with weight
  <math|\<lambda\>>. Then the Hamiltonian <math|H>, the dilatation operator
  <math|D> and the conformal boost operator <math|K> can be expressed as

  <\align>
    <tformat|<table|<row|<cell|H>|<cell|=i*<frac|d|d*t><eq-number><label|conf1d1>>>|<row|<cell|D>|<cell|=i*t*<frac|d|d*t>+<frac|\<lambda\>|2*i><eq-number><label|conf1d2>>>|<row|<cell|K>|<cell|=i*t<rsup|2>*<frac|d|d*t>+<frac|1|i>*\<lambda\>*t<eq-number><label|conf1d3>>>>>
  </align>

  satisfying the commutation relations (<reference|conf1e1>),
  (<reference|conf1e2>) and (<reference|conf1e3>). The unitarity implies that
  <math|<frac|1|2>*<around|(|\<lambda\>+1|)>> is pure imaginary. The finite
  conformal transformation is

  <\align>
    <tformat|<table|<row|<cell|t<rsup|n>>|<cell|\<rightarrow\><frac|<around|(|\<alpha\>*t+\<beta\>|)><rsup|n>|<around|(|\<gamma\>*t+\<delta\>|)><rsup|\<lambda\>+n>><eq-number><label|conf1a>>>>>
  </align>

  where the parameters <math|\<alpha\>>, <math|\<beta\>>, <math|\<gamma\>>
  and <math|\<delta\>> are the elements of real two by two matrices with
  determinant one

  <\align>
    <tformat|<table|<row|<cell|A>|<cell|=<around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<alpha\>>|<cell|\<gamma\>>>|<row|<cell|\<beta\>>|<cell|\<delta\>>>>>>|)>,>|<cell|\<alpha\>*\<delta\>-\<beta\>*\<gamma\>>|<cell|=1<eq-number><label|conf1b>>>>>
  </align>

  which forms the one-dimensional conformal group
  <math|S*L<around|(|2,\<bbb-R\>|)>>. The quadratic Casimir operator is given
  by

  <\align>
    <tformat|<table|<row|<cell|<label|conf1e>\<cal-C\><rsub|2>>|<cell|=H*K-i*D-D<rsup|2>>>|<row|<cell|>|<cell|=<frac|\<lambda\><rsup|2>|4>+<frac|\<lambda\>|2><eq-number>>>>>
  </align>

  Let us define the ground state <math|<around|\||0|\<rangle\>><rsub|\<Delta\>>>
  by

  <\align>
    <tformat|<table|<row|<cell|H\|0\<rangle\><rsub|\<Delta\>>>|<cell|=0<eq-number><label|conf1f1>>>|<row|<cell|D\|0\<rangle\><rsub|\<Delta\>>>|<cell|=\<Delta\>\|0\<rangle\><rsub|\<Delta\>><eq-number><label|conf1f2>>>>>
  </align>

  From the equations (<reference|conf1e>)-(<reference|conf1f2>) we see that
  the eigenvalue <math|\<Delta\>> of the ground state
  <math|<around|\||0|\<rangle\>><rsub|\<Delta\>>> is
  <math|\<Delta\>=<frac|\<lambda\>|2*i>> and we thus write the ground state
  as <math|<around|\||0|\<rangle\>><rsub|\<lambda\>>>. Now consider the
  energy eigenstate obeying

  <\align>
    <tformat|<table|<row|<cell|H\|E\<rangle\>=E\|E\<rangle\>.<eq-number><label|conf1f3>>>>>
  </align>

  This eigenvector <math|<around|\||E|\<rangle\>>> is known as the Whittaker
  vector in the representation theory of <math|S*L<around|(|2,\<bbb-R\>|)>>
  <cite|MR0271275|MR0311838|MR507800>. Given eigenvalue <math|E> and
  irreducible representation with weight <math|\<lambda\>>, there is a unique
  Whittaker vector and we can write

  <\align>
    <tformat|<table|<row|<cell|<around|\||E|\<rangle\>><rsub|\<lambda\>>>|<cell|=-<big|sum><rsub|k><big|sum><rsub|n>C<rsub|k>*<frac|<around|(|-E*K|)><rsup|n>|n!\<lambda\>*<around|(|\<lambda\>-1|)>*\<cdots\>*<around|(|\<lambda\>-n+1|)>>\|0\<rangle\><rsub|\<lambda\>,k><eq-number><label|conf1g3>>>>>
  </align>

  where <math|k> parametrizes the degenerate ground states which might arise
  from some symmetries in the theories and <math|C<rsub|k>> is the weighted
  coefficient for <math|k>-th ground state. For simplicity let us assume the
  vanishing of tunneling amplitudes; <math|<rsub|\<lambda\>,l><around|\<langle\>|0\|0|\<rangle\>><rsub|\<lambda\>,k>=\<delta\><rsub|l,k>>
  and the normalization of the ground states;
  <math|<big|sum><rsub|k><around|\||C<rsub|k>|\|><rsup|2>=1> so that we shall
  omit the indices <math|k>. Correspondingly we can take the dual energy
  eigenstate vector <math|<rsub|\<lambda\>><around|\<langle\>|E|\|>> as the
  dual Whittaker vector which satisfies the relation <footnote|The choice of
  pair of the Whittaker vector and the dual Whittaker vector results in the
  consistent Hamiltonian reduction. >

  <\align>
    <tformat|<table|<row|<cell|<rsub|\<lambda\>>\<langle\>E\|K>|<cell|=E<rsub|\<lambda\>><around|\<langle\>|E|\|><eq-number><label|conf1h1>>>>>
  </align>

  and it can be represented by

  <\equation>
    <rsub|\<lambda\>><around|\<langle\>|E|\|>\<assign\>-<rsub|\<lambda\>>\<langle\>0\|<big|sum><rsub|k,n>C<rsub|k><rsup|\<ast\>>*<frac|<around|(|-E*H|)><rsup|n>|n!\<lambda\>*<around|(|\<lambda\>-1|)>*\<cdots\>*<around|(|\<lambda\>-n+1|)>><label|conf1h2>
  </equation>

  With the Whittaker vector <math|<around|\||E|\<rangle\>><rsub|\<lambda\>>>
  and its dual vector <math|<rsub|\<lambda\>><around|\<langle\>|E|\|>> as the
  energy eigenstate vector and its dual vector in conformal quantum
  mechanics, we will consider the situation where the theory is coupled to
  two-dimensional bulk theory to investigate the
  AdS<rsub|<math|2>>/CFT<rsub|<math|1>> correspondence. Let us consider the
  function defined by

  <\align>
    <tformat|<table|<row|<cell|W<rsub|\<lambda\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\>|)>>|<cell|\<assign\><rsub|\<lambda\>><around*|\<langle\>|E<rsub|L><around|\||e<rsup|-2*i*\<phi\>*D>|\|>*E<rsub|R>|\<rangle\>><rsub|\<lambda\>><eq-number><label|conf1h3>>>>>
  </align>

  where <math|E<rsub|L>,E<rsub|R>> are the eigenvalues of the Whittaker
  vector (<reference|conf1f3>) and the dual Whittaker vector
  (<reference|conf1h1>) respectively. Here <math|\<phi\>> is regarded as the
  restriction of some bulk field in AdS<rsub|<math|2>> space-time on the
  boundary that is coupled to the dilatation operator <math|D> in conformal
  quantum mechanics on the boundaries. By acting the quadratic Casimir
  operator (<reference|conf1e>) on the function (<reference|conf1h3>), one
  obtains the differential equation

  <\align>
    <tformat|<table|<row|<cell|<around*|[|<frac|1|2>*<frac|\<partial\><rsup|2>|\<partial\>*\<phi\><rsup|2>>-<frac|\<partial\>|\<partial\>*\<phi\>>-2*E<rsub|L>*E<rsub|R>*e<rsup|2*\<phi\>>|]>*W<rsub|\<lambda\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\>|)>>|<cell|=<around*|(|<frac|\<lambda\><rsup|2>|2>+\<lambda\>|)>*W<rsub|\<lambda\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\>|)><eq-number><label|conf1h4>>>>>
  </align>

  The function <math|W<rsub|\<lambda\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\>|)>>
  is known as the <math|S*L<around|(|2,\<bbb-R\>|)>> Whittaker function
  <cite|MR0271275|MR0311838|MR507800|MR1729357>. At first sight one might
  expect that the Whittaker function <math|W<rsub|\<lambda\>,E<rsub|L>,E<rsub|R>>>
  plays a role of the generating function of the expectation values of the
  operator <math|D>. However, the unitarity asserts that the eigenvalue
  <math|\<Delta\>> of the operator <math|D> associated with the ground state
  <math|<around|\||0|\<rangle\>><rsub|\<lambda\>>> are not real-valued
  observables. Alternatively if we consider a shifted operator
  <math|<around*|(|D-<frac|i|2>|)>>, the corresponding eigenvalues would
  provide real-valued physical quantities. Furthermore in a more precise
  treatment one can express the bulk filed <math|\<phi\>> as
  <math|\<beta\>*\<phi\><rsub|0>> where <math|\<phi\><rsub|0>> is the
  time-dependent part while <math|\<beta\>> is the time-independent part.
  Instead of the Whittaker function (<reference|conf1h3>) let us consider the
  function

  <\align>
    <tformat|<table|<row|<cell|\<Psi\><rsub|\<lambda\>,\<beta\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\><rsub|0>|)>\<assign\><rsub|\<lambda\>><around|\<langle\>|E<rsub|L><around|\||e<rsup|-2*i*\<beta\>*\<phi\><rsub|0>*<around|(|D-<frac|i|2>|)>>|\|>*E<rsub|R>|\<rangle\>><rsub|\<lambda\>><eq-number><label|conf1h5>>>>>
  </align>

  Applying the quadratic Casimir operator (<reference|conf1e>) on the
  function (<reference|conf1h5>), we get

  <\align>
    <tformat|<table|<row|<cell|<around*|[|<frac|1|2>*<frac|\<partial\><rsup|2>|\<partial\>*\<phi\><rsub|0><rsup|2>>-2*\<beta\><rsup|2>*E<rsub|L>*E<rsub|R>*e<rsup|2*\<beta\>*\<phi\><rsub|0>>|]>*\<Psi\><rsub|\<lambda\>,\<beta\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\><rsub|0>|)>>|<cell|=<frac|1|2>*\<beta\><rsup|2>*<around*|(|\<lambda\>+1|)><rsup|2>*\<Psi\><rsub|\<lambda\>,\<beta\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\><rsub|0>|)><eq-number><label|conf1h6>>>>>
  </align>

  We see that the equation (<reference|conf1h6>) is the Wheeler-DeWitt
  equation that is encountered in the minisuperspace approximation of
  Liouville field theory (LFT).

  Local properties of LFT can be described by the Lagrangian

  <\align>
    <tformat|<table|<row|<cell|\<cal-L\>>|<cell|=<frac|1|4*\<pi\>>*\<partial\><rsup|\<mu\>>*\<phi\>*\<partial\><rsub|\<mu\>>*\<phi\>+\<mu\>*e<rsup|2*b*\<phi\>><eq-number><label|lft1a1>>>>>
  </align>

  where <math|b> is the dimensionless coupling constant and <math|\<mu\>> is
  the cosmological coupling constant. The equation of motion is

  <\align>
    <tformat|<table|<row|<cell|\<Delta\>*\<phi\>>|<cell|=4*\<pi\>*b*\<mu\>*e<rsup|2*b*\<phi\>><eq-number><label|lft1a2>>>>>
  </align>

  In two dimensions it is always possible to make any metric
  <math|g<rsub|\<mu\>*\<nu\>>> conformally flat by coordinate redefinition
  <math|g<rsub|\<mu\>*\<nu\>>=e<rsup|2*b*\<phi\>>*\<eta\><rsub|\<mu\>*\<nu\>>>.
  Furthermore, in two dimensions, the curvature can be determined by the
  scalar curvature. Equation (<reference|lft1a2>) asserts that the curvature
  is a negative constant <math|-8*\<pi\>*b<rsup|2>*\<mu\>> and
  <math|g<rsub|\<mu\>*\<nu\>>> describes a two-dimensional surface with
  constant negative curvature, thus the corresponding Lorentzian surface can
  be identified with AdS<rsub|<math|2>> space-time locally.

  In order to quantize LFT via canonical quantization, we shall employ the
  Fourier decomposition of the Liouville field <math|\<phi\>> and its
  canonical momentum <math|\<Pi\>> on the cylinder

  <\align>
    <tformat|<table|<row|<cell|<label|lft1a3>\<phi\>*<around|(|t,\<sigma\>|)>>|<cell|=\<phi\><rsub|0><around|(|t|)>+<big|sum><rsub|n\<neq\>0><frac|i|n>*<around*|[|a<rsub|n><around|(|t|)>*e<rsup|-i*n*\<sigma\>>+b<rsub|n><around|(|t|)>*e<rsup|i*n*\<sigma\>>|]>>>|<row|<cell|\<Pi\><around|(|t,\<sigma\>|)>>|<cell|=p<rsub|0><around|(|t|)>+<big|sum><rsub|n\<neq\>0><around*|[|a<rsub|n><around|(|t|)>*e<rsup|-i*n*\<sigma\>>+b<rsub|n><around|(|t|)>*e<rsup|i*n*\<sigma\>>|]><eq-number>>>>>
  </align>

  with <math|a<rsub|n><rsup|\<dag\>>=a<rsub|-n>>,
  <math|b<rsub|n><rsup|\<dag\>>=b<rsub|-n>>. The canonical relation

  <\align>
    <tformat|<table|<row|<cell|<around|[|\<phi\>*<around|(|t,\<sigma\>|)>,\<Pi\><around|(|t,\<sigma\><rprime|'>|)>|]>=i*\<delta\>*<around|(|\<sigma\>-\<sigma\><rprime|'>|)><eq-number><label|lft1a4>>>>>
  </align>

  leads to the commutation relations

  <\equation>
    <around|[|\<phi\><rsub|0>,p<rsub|0>|]>=i
  </equation>

  <\equation>
    <around|[|a<rsub|n>,a<rsub|m>|]>=<frac|n|2>*\<delta\><rsub|n,-m>
  </equation>

  <\equation>
    <around|[|b<rsub|n>,b<rsub|m>|]>=<frac|n|2>*\<delta\><rsub|n,-m>
  </equation>

  \;

  which imply that <math|a<rsub|n>,b<rsub|n>> are creation operators while
  <math|a<rsub|-n>,b<rsub|-n>> are annihilation operators. The spectrum of
  LFT has been discussed in the minisuperspace approximation
  <cite|Seiberg:1990eb>. The minisuperspace approximation was originally
  proposed in quantum gravity <cite|DeWitt:1967yk|Misner:1972js> where the
  problem is simplified by only treating the zero mode and truncating the
  higher excited modes. Whether physics in minisuperspace quantization gives
  a faithful properties of quantum gravity remains an open question, however,
  it has been discussed that the minisuperspace approximation would be exact
  in pure two-dimensional gravity <cite|Moore:1991ir|Fateev:2000ik>.
  Replacing the canonical momentum <math|p<rsub|0>=<frac|<wide|\<phi\>|\<dot\>><rsub|0>|2*\<pi\>>>
  with differential operator <math|-i*<around|(|\<partial\>/\<partial\>*\<phi\><rsub|0>|)>>,
  we obtain the minisuperspace Schrödinger equation

  <\align>
    <tformat|<table|<row|<cell|<around*|[|-<frac|1|2>*<frac|\<partial\><rsup|2>|\<partial\>*\<phi\><rsub|0><rsup|2>>+2*\<pi\>*\<mu\>*e<rsup|2*b*\<phi\><rsub|0>>|]>*\<Psi\><rsub|P><around|(|\<phi\><rsub|0>|)>>|<cell|=2*P<rsup|2>*\<Psi\><rsub|P><around|(|\<phi\><rsub|0>|)><eq-number><label|lft1a6>>>>>
  </align>

  where <math|P> is the Liouville momentum, the eigenvalue of the Hamiltonian
  and <math|\<Psi\><rsub|P><around|(|\<phi\><rsub|0>|)>> is the
  minisuperspace wave function. For <math|\<phi\><rsub|0>\<rightarrow\>-\<infty\>>
  the interaction is small and the wave function is a linear combination of
  <math|e<rsup|\<pm\>i*P*\<phi\><rsub|0>>>. Because of the complete
  reflection potential at <math|\<phi\><rsub|0>\<rightarrow\>0>, <math|P> is
  restricted to be positive so that the incoming wave uniquely determines the
  reflected wave.

  The function <math|\<Psi\><rsub|\<lambda\>,\<beta\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\><rsub|0>|)>>
  in CQM plays a role of the generating function of the expectation values
  evaluated among two excited states. On the other hand, the Liouville wave
  function <math|\<Psi\><rsub|P><around|(|\<phi\><rsub|0>|)>> would be
  regarded as the partition function of AdS<rsub|<math|2>>, which is a
  function of the boundary values in the sense that a partition function
  generically transforms as a wave function under a change of polarization on
  field space specified at a boundary <cite|Aganagic:2003qj|KashaniPoor:2006nc|Cheng:2010yw|Beem:2012mb>
  and LFT describes AdS<rsub|<math|2>> space-time in the classical solution.
  Therefore we come to the interesting conclusion that AdS<rsub|<math|2>>
  bulk mode <math|\<phi\>> that behaves as the zero-mode
  <math|\<phi\><rsub|0>> near the boundary is dual to a source term
  <math|\<phi\><rsub|0>*<around|(|D-<frac|i|2>|)>> in the CQM on the boundary
  of AdS<rsub|<math|2>> via AdS<rsub|<math|2>>/CFT<rsub|<math|1>>
  correspondence

  <\align>
    <tformat|<table|<row|<cell|<label|ads2cft1a0>\<Psi\><rsub|\<lambda\>,\<beta\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\><rsub|0>|)>>|<cell|=<around*|\<langle\>|E<rsub|L><around*|\||e<rsup|-2*i*\<beta\>*\<phi\><rsub|0>*<around*|(|D-<frac|i|2>|)>>|\|>*E<rsub|R>|\<rangle\>><rsub|<math-up|CQM>>>>|<row|<cell|>|<cell|=Z<rsub|<math-up|AdS><rsub|2>><around|(|\<phi\>|\|><rsub|<math-up|bdy>>=\<phi\><rsub|0>)=\<Psi\><rsub|P><around|(|\<phi\><rsub|0>|)><eq-number>>>>>
  </align>

  We observe that the expectation values in the CQM are evaluated between two
  excited states defined by the Whittaker vector (<reference|conf1f3>) and
  the dual Whittaker vector (<reference|conf1h1>) in the correspondence
  (<reference|ads2cft1a0>). The two distinct states in the correspondence
  (<reference|ads2cft1a0>) would would enable us to have two independent
  dynamical systems. This is consistent to the statement
  <cite|Azeyanagi:2007bj|Sen:2008vm|Balasubramanian:2010ys|Chamon:2011xk>
  that unlike higher dimensional cases AdS<rsub|<math|2>> in the global
  coordinate has two boundaries and the dual conformal field theory of
  asymptotically AdS<rsub|<math|2>> is realized as two systems or two copies
  of CFT<rsub|<math|1>> on the two boundaries although we cannot exclude the
  possibility of a single CFT<rsub|<math|1>> as the dual description. The
  appearance of the excited states could also be in favor of the statement
  that in the Lorentzian AdS/CFT operator expectation values in excited CFT
  states differ from vacuum expectation values due to the existence of
  normalizable propagating states in the bulk
  <cite|Balasubramanian:1998sn|Balasubramanian:1998de>.

  The comparison of the two Wheeler-DeWitt equations (<reference|conf1h6>)
  and (<reference|lft1a6>) identifies the coupling constant <math|b> in LFT
  with the constant parameter <math|\<beta\>> in CQM and establishes the
  dictionary of parameters between the bulk LFT of AdS<rsub|<math|2>> and the
  boundary CQM as

  <\align>
    <tformat|<table|<row|<cell|<frac|\<pi\>*\<mu\>|b<rsup|2>>>|<cell|=E<rsub|L>*E<rsub|R><eq-number><label|cor1>>>|<row|<cell|<frac|P<rsup|2>|b<rsup|2>>>|<cell|=-<frac|1|4>*<around*|(|\<lambda\>+1|)><rsup|2>=<around*|(|\<Delta\>-<frac|i|2>|)><rsup|2><eq-number><label|cor2>>>>>
  </align>

  Therefore the relations (<reference|cor1>) and (<reference|cor2>) indicate
  that the quantum gravity on AdS<rsub|<math|2>> can be described by two
  conformal quantum mechanical systems on the boundary with energies
  <math|E<rsub|L>> and <math|E<rsub|R>> as a holographic principle
  <cite|'tHooft:1993gx|Susskind:1994vu>.

  The equation (<reference|cor1>) says that the excited states with
  non-vanishing energy eigenvalues <math|E<rsub|L>>, <math|E<rsub|R>> in the
  boundary CQM are needed to realize negative constant curvature of
  AdS<rsub|<math|2>> space-time which is generated by the non-trivial
  interaction term with finite and non-vanishing parameters <math|b>,
  <math|\<mu\>> in two-dimensional gravity theory. It is illustrative to
  compare our result with the analogous statement in the
  AdS<rsub|<math|3>>/CFT<rsub|<math|2>> that the AdS<rsub|<math|3>> radius
  <math|l<rsub|3>> is represented by the central charge <math|c> of the
  CFT<rsub|<math|2>> through the Brown-Henneaux relation
  <math|c=<frac|3*l<rsub|3>|2*G<rsub|3>>> <cite|Brown:1986nw> where
  <math|G<rsub|3>> is the three-dimensional Newton constant. Instead of the
  central charge the energies of the states play an important role in the
  AdS<rsub|<math|2>>/CFT<rsub|<math|1>>, however, the relation between the
  AdS<rsub|<math|2>> radius and the energies is even more attractive in that
  one of the other parameters in LFT necessarily comes about. In terms of the
  coupling constant <math|b> controlling the quantum effect in LFT we can
  write the AdS<rsub|<math|2>> radius <math|l<rsub|2>> as

  <\align>
    <tformat|<table|<row|<cell|<frac|1|<sqrt|E<rsub|L>*E<rsub|R>>>>|<cell|=2*b<rsup|2>*l<rsub|2><eq-number><label|cor3>>>>>
  </align>

  The semiclassical analysis in LFT is valid for small <math|b>, and
  accordingly our formula (<reference|cor3>) would reflect the fact that the
  ground states with vanishing energies in the boundary CQM force the
  AdS<rsub|<math|2>> radius to go to infinity and the classical
  AdS<rsub|<math|2>> geometry then becomes flat space-time.

  We see from the equation (<reference|cor2>) that the Liouville momentum
  <math|P> in two-dimensional gravity theory corresponds to the conformal
  dimension of the ground state in the dual CQM. As we have discussed, the
  unitarity condition in CQM requires that
  <math|<frac|1|2>*<around|(|\<lambda\>+1|)>> is pure imaginary. This is
  consistent to the fact that the Liouville momentum <math|P> is real in the
  dual two-dimensional gravity theory.

  We would like to emphasize that the correspondence (<reference|ads2cft1a0>)
  and the dictionaries (<reference|cor1>), (<reference|cor2>),
  (<reference|cor3>) are quite universal since we have not specified the
  conformal quantum mechanical systems so far. However, if we contain more
  specific information characterizing dynamical properties and symmetries,
  there would be more fruitful statements (the GKP-Witten relation
  <cite|Gubser:1998bc|Witten:1998qj>) in the
  AdS<rsub|<math|2>>/CFT<rsub|<math|1>> as the extension of the relation
  (<reference|ads2cft1a0>)

  <\align>
    <tformat|<table|<row|<cell|<around*|\<langle\>|e<rsup|h<rsub|0>*\<cal-O\>>|\<rangle\>><rsub|<math-up|CQM>>>|<cell|=Z<rsub|<math-up|AdS><rsub|2>><around|(|h|\|><rsub|<math-up|bdy>>=h<rsub|0>)<eq-number><label|ads2cft1b0>>>>>
  </align>

  where <math|h<rsub|0>> is some function of the boundary values for the bulk
  field <math|h> while <math|\<cal-O\>> is the dual operator in CQM. For a
  non-flat space the left values in the correspondence
  (<reference|ads2cft1b0>) are generally presumed to be computed between two
  excited states from the relation (<reference|cor3>). It would be
  interesting that there has been proposals for such relation associated with
  the DFF-model in <cite|Chamon:2011xk> and with the counting of microstates
  of BPS extremal black holes in <cite|Sen:2008yk|Sen:2008vm>.

  We now consider the resulting expectation values

  <\align>
    <tformat|<table|<row|<cell|<rsub|\<lambda\>><around|\<langle\>|E<rsub|L><around|\||<around*|(|D-<frac|i|2>|)>|\|>*E<rsub|R>|\<rangle\>><rsub|\<lambda\>>>|<cell|=<frac|i|2>*<frac|\<delta\>|\<delta\>*\<phi\>>*\<Psi\><rsub|\<lambda\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\>|)><around*|\||<rsub|\<phi\>=0>|\<nobracket\>><eq-number><label|conf1h7b>>>>>
  </align>

  and its possible application to one of the deepest mathematical problem,
  the Riemann hypothesis. The equation (<reference|conf1h6>) has two linearly
  independent solutions, which are known to be cylindric functions
  <cite|gradshteyn2000table>. By requiring the unitarity we can write the
  solutions as

  <\align>
    <tformat|<table|<row|<cell|\<Psi\><rsub|\<lambda\>,E<rsub|L>,E<rsub|R>><around|(|\<phi\>|)>>|<cell|=<frac|1|i>*K<rsub|\<lambda\>+1>*<around*|(|2*<sqrt|E<rsub|L>*E<rsub|R>>*e<rsup|\<phi\>>|)><eq-number><label|conf1h8>>>>>
  </align>

  where <math|K<rsub|\<nu\>><around|(|z|)>> is the Macdonald function. We
  should note that the Macdonald functions of purely imaginary order
  <math|\<lambda\>+1> with positive argument are real. The prefactor
  <math|<frac|1|i>> in the generating function (<reference|conf1h8>)
  guarantees the reality condition of the expectation values in CQM. Making
  use of the recurrence relation

  <\align>
    <tformat|<table|<row|<cell|K<rsub|\<nu\>-1><around|(|z|)>+K<rsub|\<nu\>+1><around|(|z|)>>|<cell|=-2*<frac|d|d*z>*K<rsub|\<nu\>><around|(|z|)><eq-number><label|conf1h9>>>>>
  </align>

  and the formula (<reference|conf1h7b>) we can write the expectation values
  between the excited states as

  <\align>
    <tformat|<table|<row|<cell|<rsub|\<lambda\>><around|\<langle\>|E<rsub|L><around|\||<around*|(|D-<frac|i|2>|)>|\|>*E<rsub|R>|\<rangle\>><rsub|\<lambda\>>>|<cell|=-<frac|z|4>*<around*|(|K<rsub|\<lambda\>><around|(|z|)>+K<rsub|\<lambda\>+2><around|(|z|)>|)><eq-number><label|conf1i1>>>>>
  </align>

  where <math|z=2*<sqrt|E<rsub|L>*E<rsub|R>>>. Let us now consider a one
  particle conformal quantum mechanical model known as the DFF-model
  <cite|deAlfaro:1976je>

  <\equation>
    S=<frac|1|2>*<big|int>*<around*|(|<wide|x|\<dot\>><around*|(|t|)><rsup|2>-<frac|g|x<around*|(|t|)><rsup|2>>|)>d*t<label|dff1>
  </equation>

  with <math|g> being a dimensionless coupling constant. For the DFF-model
  the dilatation operator can be expressed as
  <math|D=-<frac|1|2>*x*p+<frac|i|4>> where <math|p> is the canonical
  momentum and the equation (<reference|conf1i1>) becomes

  <\align>
    <tformat|<table|<row|<cell|<rsub|\<lambda\>><around|\<langle\>|E<rsub|L><around|\||<around*|(|x*p+<frac|i|2>|)>|\|>*E<rsub|R>|\<rangle\>><rsub|\<lambda\>>>|<cell|=<frac|z|2>*<around*|(|K<rsub|\<lambda\>><around|(|z|)>+K<rsub|\<lambda\>+2><around|(|z|)>|)><eq-number><label|conf1i2>>>>>
  </align>

  It is speculated that the Riemann zeros would be realized as eigenvalues of
  the operator which takes the form of <math|x*p>
  <cite|MR1694895|berry1999h|MR1684543> as a promising candidate of the
  Riemann operator in the Hilbert-Pólya conjecture whose eigenvalues are the
  imaginary part of the non-trivial Riemann zeros. Berry and Keating
  <cite|berry1999h|MR1684543> identified the operator <math|x*p> with the
  Hamiltonian and imposed the conditions <math|<around|\||x|\|>\<ge\>l<rsub|x>>,
  <math|<around|\||p|\|>\<ge\>l<rsub|p>> so that
  <math|l<rsub|x>*l<rsub|p>=2*\<pi\>*\<hbar\>> in the phase space. Then they
  found that the semiclassical number <math|N<around|(|E|)>> of states with
  the energy between <math|0> and <math|E> is given by the area in the phase
  space divided by the Planck cell <math|h=2*\<pi\>>

  <\align>
    <tformat|<table|<row|<cell|N<around|(|E|)>>|<cell|=<frac|E|2*\<pi\>>*<around*|(|log
    <frac|E|2*\<pi\>>-1|)>+\<cal-O\><around|(|1|)><eq-number><label|rh1a>>>>>
  </align>

  and observed that (<reference|rh1a>) precisely coincides with the
  asymptotics of the smoothed counting function of the number of Riemann
  zeros <cite|MR0466039>. Connes <cite|MR1694895> introduced the constraints
  <math|<around|\||x|\|>\<le\>\<Lambda\>>,
  <math|<around|\||p|\|>\<le\>\<Lambda\>> where <math|\<Lambda\>> is a common
  cutoff and counted the number of such semiclassical states as

  <\align>
    <tformat|<table|<row|<cell|N<around|(|E|)>>|<cell|=<frac|E|\<pi\>>*log
    \<Lambda\>-<frac|E|2*\<pi\>>*<around*|(|log
    <frac|E|2*\<pi\>>-1|)><eq-number><label|rh1b>>>>>
  </align>

  He interpreted the counting formula (<reference|rh1b>) as missing spectral
  lines associated to the smooth Riemann zeros which arise in the limit
  <math|\<Lambda\>\<rightarrow\>\<infty\>>, however, it was reinterpreted as
  a finite size correction from a physical system later in <cite|MR2443603>.
  According to these semiclassical proposals of the Hilbert-Pólya conjecture
  it has been desirable to replace these artificially imposed semiclassical
  regularizations of the operator <math|x*p> with the proper quantum
  treatment which naturally generates a discrete spectrum. In order to obtain
  the discrete spectrum via quantization, there has been proposed various
  attempts including the modifications of the <math|x*p> operator (see, e.g.,
  <cite|Sierra:2011tb|MR2812337>) and the adoption of the regularization
  methods (see, e.g., <cite|MR2443603>). Nevertheless, these attempts seem to
  be quite artificial and difficult fo find the quantum mechanical
  explanation to follow these ideas.

  Here we wish to propose a novel perspective to acquire the distribution of
  the spectrum of the Riemann operator from conformal quantum mechanics point
  of view. Consider now the eigenfunction
  <math|\<Phi\><rsub|\<rho\>><around|(|x|)>> of the operator
  <math|<around*|(|x*p+<frac|i|2>|)>> in the equation (<reference|conf1i2>)
  satisfying

  <\equation>
    <around*|[|<frac|1|i>*x*<frac|d|d*x>+<frac|i|2>|]>*\<Phi\><rsub|\<rho\>><around|(|x|)>=\<rho\>*\<Phi\><rsub|\<rho\>><around|(|x|)><label|conf1i3>
  </equation>

  They take the form

  <\equation>
    \<Phi\><rsub|\<rho\>><around|(|x|)>=C*x<rsup|<frac|1|2>+i*\<rho\>><label|conf1i4>
  </equation>

  \;

  with <math|C> a constant of integration. The non-trivial zeros of the
  Riemann zeta function <math|\<zeta\><around|(|s|)>> which is conjectured to
  be <math|s=<frac|1|2>+i*\<rho\>>, <math|\<rho\>\<in\>\<bbb-R\>> in the
  Riemann hypothesis appears in the power <math|x<rsup|s>> of the
  eigenfunction <math|\<Phi\><rsub|\<rho\>><around|(|x|)>>. The eigenvalues
  <math|\<rho\>> of the operator <math|<around*|(|x*p+<frac|i|2>|)>> which
  would be the candidates of the Riemann zeros can be continuous in the
  position eigenfunction. This is the same situation as has been already
  discussed in many literatures.

  However, in CQM the operator <math|<around*|(|x*p+<frac|i|2>|)>> should not
  be recognized as the Hamiltonian but rather as the dilatation operator
  whose expectation values can be measured by the energy eigenstates as

  <\align>
    <tformat|<table|<row|<cell|D<around|(|z;\<rho\>|)>>|<cell|=<frac|z|2>*<around*|(|K<rsub|1-i*\<rho\>><around|(|z|)>+K<rsub|1+i*\<rho\>><around|(|z|)>|)><eq-number><label|conf1i50>>>>>
  </align>

  Note that the expression (<reference|conf1i50>) can evidently be lifted to
  arbitrary conformal quantum mechanical systems by qualifying <math|\<rho\>>
  as the eigenvalue of the operator <math|-2*<around*|(|D-<frac|i|2>|)>>.
  Although almost all quantum approaches so far have tried to identify the
  operator <math|x*p> with the Hamiltonian and simultaneously diagonalize it
  with the position <math|x> or the momentum <math|p>, CQM would provide an
  alternative avenue to the Riemann hypothesis as the diagonalization of the
  dilatation operator. We observe that the ground state
  <math|<around|\||0|\<rangle\>><rsub|\<lambda\>>> is the eigenfunction of
  both of the Hamiltonian and the dilatation operator. Since the excited
  states are not eigenvectors of the dilatation operator, the limit
  <math|E<rsub|L>>, <math|E<rsub|R>\<rightarrow\>0> of the expectation values
  (<reference|conf1i50>) would naturally give rise to the eigenfunction of
  the operator <math|-2*<around*|(|D-<frac|i|2>|)>> multiplied by its
  eigenvalue <math|\<rho\>>. In other words, the limit in which
  <math|z=2*<sqrt|E<rsub|L>*E<rsub|R>>> goes to zero yields the definite
  eigenvalue <math|\<rho\>> and the distribution function
  <math|D<around|(|\<rho\>|)>> of the ground state. Hence the expectation
  values (<reference|conf1i50>) are in some sense the regularized functions
  which produce the distribution of the eigenvalues <math|\<rho\>> as

  <\align>
    <tformat|<table|<row|<cell|\<rho\>*D<around|(|\<rho\>|)>>|<cell|=lim<rsub|z\<rightarrow\>0>
    <frac|z|2>*<around*|(|K<rsub|1-i*\<rho\>><around|(|z|)>+K<rsub|1+i*\<rho\>><around|(|z|)>|)><eq-number><label|conf1i5>>>>>
  </align>

  where we have used the relation <math|\<lambda\>=-<around|(|1+i*\<rho\>|)>>
  and the formula <math|K<rsub|\<nu\>><around|(|z|)>=K<rsub|-\<nu\>><around|(|z|)>>.
  The asymptotic behavior of the Macdonald function

  <\align>
    <tformat|<table|<row|<cell|K<rsub|1+i*\<rho\>><around|(|z|)>\<sim\><sqrt|<frac|\<pi\>|z>>*e<rsup|-<frac|\<pi\>|2>*\<rho\>><around*|(|<frac|2*\<rho\>|z*e>|)><rsup|i*\<rho\>><eq-number><label|conf1i6>>>>>
  </align>

  for large <math|\<rho\>> allows us to write (<reference|conf1i5>) as

  <\align>
    <tformat|<table|<row|<cell|\<rho\>*D<around|(|\<rho\>|)>>|<cell|=lim<rsub|z\<rightarrow\>0>
    <sqrt|\<pi\>*z>*e<rsup|-<frac|\<pi\>|2>*\<rho\>>*cos
    <around*|[|\<rho\>*ln <around*|(|<frac|2*\<rho\>|z*e>|)>|]><eq-number><label|conf1i7>>>>>
  </align>

  The semiclassical distribution of (<reference|conf1i7>) for large
  <math|\<rho\>> is realized when the cosine function is at its maximum

  <\equation>
    cos <around*|[|\<rho\>*ln <around*|(|<frac|2*\<rho\>|z*e>|)>|]>=1<label|conf1i8>
  </equation>

  <\align>
    <tformat|<table|<row|<cell|<frac|\<rho\>|\<pi\>>*<around*|[|ln
    <around*|(|<frac|\<rho\>|E<rsub|L>*E<rsub|R>>|)>-1|]>>|<cell|=2*n,\<forall\>n\<in\>\<bbb-Z\><eq-number><label|conf1i9>>>>>
  </align>

  Since the expression (<reference|conf1i9>) diverges when
  <math|E<rsub|L>,E<rsub|R>\<rightarrow\>0>, a low energy cutoff is required
  to make sense of the expression (<reference|conf1i9>). Let us introduce the
  cutoff <math|\<Lambda\>> such that <math|E<rsub|L>*E<rsub|R>=2*\<pi\>/\<Lambda\>>.
  Then we obtain the behavior of the large eigenvalues <math|\<rho\>> as

  <\align>
    <tformat|<table|<row|<cell|N<around|(|\<rho\>|)>>|<cell|=<frac|\<rho\>|2*\<pi\>>*ln
    \<Lambda\>+<frac|\<rho\>|2*\<pi\>>*<around*|(|ln
    <frac|\<rho\>|2*\<pi\>>-1|)><eq-number><label|conf1i10>>>>>
  </align>

  Remarkably the first term is a continuum in the limit
  <math|\<Lambda\>\<rightarrow\>\<infty\>> while the second term leads to the
  asymptotics of the counting function of the Riemann zeros as in
  (<reference|rh1a>) and (<reference|rh1b>). It would be interesting to note
  that the equation (<reference|conf1i10>) also counts the large conformal
  dimensions for the ground state in CQM. Combining the semiclassical
  realization (<reference|conf1i10>) of the counting Riemann zeros with our
  proposed holographic correspondence (<reference|cor2>) would indicate
  underlying profound relation among essential ingredients in number theory,
  in quantum mechanics and in gravity.

  <subsection*|Acknowledgments>

  The author would like to thank Pei-Ming Ho, Kazuo Hosomichi, Takeo Inami
  and Dharmesh Jain for communications and discussions and Yu Nakayama for
  enlightening comments and remarks about Liouville field theory and Michael
  Berry, Jon Keating, Paul Townsend and especially Germán Sierra for helpful
  comments and explanations of their works on Riemann zeros. This work was
  supported by National Taiwan University and the National Center for
  Theoretical Science (NCTS).

  <\bibliography|bib|tm-plain|../../../Documents/a.bbl>
    <with|polhk|<macro|1|<setbox>0=<arg|1><ooalign|<hidewidth>
    <lower>1.5ex<text|`><hidewidth><crcr><unhbox>0>>|cprime|<macro|<math|<rprime|'>>>|href|<macro|1|2|<arg|2>>|<\bib-list|10>
      <bibitem*|1><label|bib-'tHooft:1993gx>G.<nbsp>'t<nbsp>Hooft,
      \PDimensional reduction in quantum gravity,\Q in
      <with|font-shape|italic|Salamfest 1993:0284-296>, pp.<nbsp>0284\U296,
      1993. <newblock><hlink|<with|font-family|tt|gr-qc/9310026>|http://xxx.lanl.gov/abs/gr-qc/9310026>.

      <bibitem*|2><label|bib-Susskind:1994vu>L.<nbsp>Susskind, \PThe World as
      a hologram,\Q <with|font-shape|italic|J.Math.Phys.>
      <with|font-series|bold|36> (1995) 6377\U6396,
      <hlink|<with|font-family|tt|hep-th/9409089>|http://xxx.lanl.gov/abs/hep-th/9409089>.

      <bibitem*|3><label|bib-Maldacena:1997re>J.<nbsp>M. Maldacena, \PThe
      Large N limit of superconformal field theories and supergravity,\Q
      <with|font-shape|italic|Adv.Theor.Math.Phys.> <with|font-series|bold|2>
      (1998) 231\U252, <hlink|<with|font-family|tt|hep-th/9711200>|http://xxx.lanl.gov/abs/hep-th/9711200>.

      <bibitem*|4><label|bib-Kunduri:2007vf>H.<nbsp>K. Kunduri,
      J.<nbsp>Lucietti, and H.<nbsp>S. Reall, \PNear-horizon symmetries of
      extremal black holes,\Q <with|font-shape|italic|Class. Quant. Grav.>
      <with|font-series|bold|24> (2007) 4169\U4190,
      <hlink|<with|font-family|tt|0705.4214>|http://xxx.lanl.gov/abs/0705.4214>.

      <bibitem*|5><label|bib-Figueras:2008qh>P.<nbsp>Figueras, H.<nbsp>K.
      Kunduri, J.<nbsp>Lucietti, and M.<nbsp>Rangamani, \PExtremal vacuum
      black holes in higher dimensions,\Q <with|font-shape|italic|Phys.Rev.>
      <with|font-series|bold|D78> (2008) 044042,
      <hlink|<with|font-family|tt|0803.2998>|http://xxx.lanl.gov/abs/0803.2998>.

      <bibitem*|6><label|bib-Strominger:1998yg>A.<nbsp>Strominger, \PAdS(2)
      quantum gravity and string theory,\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|9901> (1999) 007,
      <hlink|<with|font-family|tt|hep-th/9809027>|http://xxx.lanl.gov/abs/hep-th/9809027>.

      <bibitem*|7><label|bib-Maldacena:1998uz>J.<nbsp>M. Maldacena,
      J.<nbsp>Michelson, and A.<nbsp>Strominger, \PAnti-de Sitter
      fragmentation,\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|9902> (1999) 011,
      <hlink|<with|font-family|tt|hep-th/9812073>|http://xxx.lanl.gov/abs/hep-th/9812073>.

      <bibitem*|8><label|bib-Nakatsu:1998st>T.<nbsp>Nakatsu and
      N.<nbsp>Yokoi, \PComments on Hamiltonian formalism of AdS / CFT
      correspondence,\Q <with|font-shape|italic|Mod.Phys.Lett.>
      <with|font-series|bold|A14> (1999) 147\U160,
      <hlink|<with|font-family|tt|hep-th/9812047>|http://xxx.lanl.gov/abs/hep-th/9812047>.

      <bibitem*|9><label|bib-Townsend:1998qp>P.<nbsp>Townsend, \PThe M(atrix)
      model / AdS(2) correspondence,\Q <hlink|<with|font-family|tt|hep-th/9903043>|http://xxx.lanl.gov/abs/hep-th/9903043>.

      <bibitem*|10><label|bib-Spradlin:1999bn>M.<nbsp>Spradlin and
      A.<nbsp>Strominger, \PVacuum states for AdS(2) black holes,\Q
      <with|font-shape|italic|JHEP> <with|font-series|bold|9911> (1999) 021,
      <hlink|<with|font-family|tt|hep-th/9904143>|http://xxx.lanl.gov/abs/hep-th/9904143>.

      <bibitem*|11><label|bib-Cadoni:1999ja>M.<nbsp>Cadoni and
      S.<nbsp>Mignemi, \PAsymptotic symmetries of AdS(2) and conformal group
      in d = 1,\Q <with|font-shape|italic|Nucl. Phys.>
      <with|font-series|bold|B557> (1999) 165\U180,
      <hlink|<with|font-family|tt|hep-th/9902040>|http://xxx.lanl.gov/abs/hep-th/9902040>.

      <bibitem*|12><label|bib-Blum:1999pc>J.<nbsp>D. Blum, \PSupersymmetric
      quantum mechanical description of four-dimensional black holes,\Q
      <with|font-shape|italic|JHEP> <with|font-series|bold|0001> (2000) 006,
      <hlink|<with|font-family|tt|hep-th/9907101>|http://xxx.lanl.gov/abs/hep-th/9907101>.

      <bibitem*|13><label|bib-NavarroSalas:1999up>J.<nbsp>Navarro-Salas and
      P.<nbsp>Navarro, \PAdS(2) / CFT(1) correspondence and near extremal
      black hole entropy,\Q <with|font-shape|italic|Nucl. Phys.>
      <with|font-series|bold|B579> (2000) 250\U266,
      <hlink|<with|font-family|tt|hep-th/9910076>|http://xxx.lanl.gov/abs/hep-th/9910076>.

      <bibitem*|14><label|bib-Caldarelli:2000xk>M.<nbsp>Caldarelli,
      G.<nbsp>Catelani, and L.<nbsp>Vanzo, \PAction, Hamiltonian and CFT for
      2-D black holes,\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|10> (2000) 005,
      <hlink|<with|font-family|tt|hep-th/0008058>|http://xxx.lanl.gov/abs/hep-th/0008058>.

      <bibitem*|15><label|bib-Cadoni:2000gm>M.<nbsp>Cadoni, P.<nbsp>Carta,
      D.<nbsp>Klemm, and S.<nbsp>Mignemi, \PAdS(2) gravity as conformally
      invariant mechanical system,\Q <with|font-shape|italic|Phys. Rev.>
      <with|font-series|bold|D63> (2001) 125021,
      <hlink|<with|font-family|tt|hep-th/0009185>|http://xxx.lanl.gov/abs/hep-th/0009185>.

      <bibitem*|16><label|bib-Bellucci:2002va>S.<nbsp>Bellucci,
      A.<nbsp>Galajinsky, E.<nbsp>Ivanov, and S.<nbsp>Krivonos, \PAdS(2) /
      CFT(1), canonical transformations and superconformal mechanics,\Q
      <with|font-shape|italic|Phys.Lett.> <with|font-series|bold|B555> (2003)
      99\U106, <hlink|<with|font-family|tt|hep-th/0212204>|http://xxx.lanl.gov/abs/hep-th/0212204>.

      <bibitem*|17><label|bib-Strominger:2003tm>A.<nbsp>Strominger, \PA
      Matrix model for AdS(2),\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|0403> (2004) 066,
      <hlink|<with|font-family|tt|hep-th/0312194>|http://xxx.lanl.gov/abs/hep-th/0312194>.

      <bibitem*|18><label|bib-Leiva:2003kd>C.<nbsp>Leiva and M.<nbsp>S.
      Plyushchay, \PConformal symmetry of relativistic and nonrelativistic
      systems and Ads / CFT correspondence,\Q <with|font-shape|italic|Annals
      Phys.> <with|font-series|bold|307> (2003) 372\U391,
      <hlink|<with|font-family|tt|hep-th/0301244>|http://xxx.lanl.gov/abs/hep-th/0301244>.

      <bibitem*|19><label|bib-Giveon:2004zz>A.<nbsp>Giveon and A.<nbsp>Sever,
      \PStrings in a 2-d extremal black hole,\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|0502> (2005) 065,
      <hlink|<with|font-family|tt|hep-th/0412294>|http://xxx.lanl.gov/abs/hep-th/0412294>.

      <bibitem*|20><label|bib-Azeyanagi:2007bj>T.<nbsp>Azeyanagi,
      T.<nbsp>Nishioka, and T.<nbsp>Takayanagi, \PNear Extremal Black Hole
      Entropy as Entanglement Entropy via AdS(2)/CFT(1),\Q
      <with|font-shape|italic|Phys.Rev.> <with|font-series|bold|D77> (2008)
      064005, <hlink|<with|font-family|tt|0710.2956>|http://xxx.lanl.gov/abs/0710.2956>.

      <bibitem*|21><label|bib-Alishahiha:2008tv>M.<nbsp>Alishahiha and
      F.<nbsp>Ardalan, \PCentral Charge for 2D Gravity on AdS(2) and
      AdS(2)/CFT(1) Correspondence,\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|08> (2008) 079,
      <hlink|<with|font-family|tt|0805.1861>|http://xxx.lanl.gov/abs/0805.1861>.

      <bibitem*|22><label|bib-Gupta:2008ki>R.<nbsp>K. Gupta and A.<nbsp>Sen,
      \PAds(3)/CFT(2) to Ads(2)/CFT(1),\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|0904> (2009) 034,
      <hlink|<with|font-family|tt|0806.0053>|http://xxx.lanl.gov/abs/0806.0053>.

      <bibitem*|23><label|bib-Hartman:2008dq>T.<nbsp>Hartman and
      A.<nbsp>Strominger, \PCentral Charge for AdS(2) Quantum Gravity,\Q
      <with|font-shape|italic|JHEP> <with|font-series|bold|04> (2009) 026,
      <hlink|<with|font-family|tt|0803.3621>|http://xxx.lanl.gov/abs/0803.3621>.

      <bibitem*|24><label|bib-Galajinsky:2008ce>A.<nbsp>Galajinsky,
      \PParticle dynamics on AdS(2) x S**2 background with two-form flux,\Q
      <with|font-shape|italic|Phys.Rev.> <with|font-series|bold|D78> (2008)
      044014, <hlink|<with|font-family|tt|0806.1629>|http://xxx.lanl.gov/abs/0806.1629>.

      <bibitem*|25><label|bib-Sen:2008vm>A.<nbsp>Sen, \PQuantum Entropy
      Function from AdS(2)/CFT(1) Correspondence,\Q
      <with|font-shape|italic|Int.J.Mod.Phys.> <with|font-series|bold|A24>
      (2009) 4225\U4244, <hlink|<with|font-family|tt|0809.3304>|http://xxx.lanl.gov/abs/0809.3304>.

      <bibitem*|26><label|bib-Sen:2008yk>A.<nbsp>Sen, \PEntropy Function and
      AdS(2) / CFT(1) Correspondence,\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|0811> (2008) 075,
      <hlink|<with|font-family|tt|0805.0095>|http://xxx.lanl.gov/abs/0805.0095>.

      <bibitem*|27><label|bib-Sen:2011cn>A.<nbsp>Sen, \PState Operator
      Correspondence and Entanglement in <math|A*d*S<rsub|2>/C*F*T<rsub|1>>,\Q
      <with|font-shape|italic|Entropy> <with|font-series|bold|13> (2011)
      1305\U1323, <hlink|<with|font-family|tt|1101.4254>|http://xxx.lanl.gov/abs/1101.4254>.

      <bibitem*|28><label|bib-Chamon:2011xk>C.<nbsp>Chamon, R.<nbsp>Jackiw,
      S.-Y. Pi, and L.<nbsp>Santos, \PConformal quantum mechanics as the
      CFT<rsub|<math|1>> dual to AdS<rsub|<math|2>>,\Q
      <with|font-shape|italic|Phys.Lett.> <with|font-series|bold|B701> (2011)
      503\U507, <hlink|<with|font-family|tt|1106.0726>|http://xxx.lanl.gov/abs/1106.0726>.

      <bibitem*|29><label|bib-MolinaVilaplana:2012xe>J.<nbsp>Molina-Vilaplana
      and G.<nbsp>Sierra, \PAn <math|x*p> model on <math|A*d*S<rsub|2>>
      spacetime,\Q <with|font-shape|italic|Nucl. Phys.>
      <with|font-series|bold|B877> (2013) 107\U123,
      <hlink|<with|font-family|tt|1212.2436>|http://xxx.lanl.gov/abs/1212.2436>.

      <bibitem*|30><label|bib-Jackiw:2012ur>R.<nbsp>Jackiw and S.-Y. Pi,
      \PConformal Blocks for the 4-Point Function in Conformal Quantum
      Mechanics,\Q <with|font-shape|italic|Phys.Rev.>
      <with|font-series|bold|D86> (2012) 045017,
      <hlink|<with|font-family|tt|1205.0443>|http://xxx.lanl.gov/abs/1205.0443>.

      <bibitem*|31><label|bib-Zamolodchikov:2001ah>A.<nbsp>B. Zamolodchikov
      and A.<nbsp>B. Zamolodchikov, \PLiouville field theory on a
      pseudosphere,\Q <hlink|<with|font-family|tt|hep-th/0101152>|http://xxx.lanl.gov/abs/hep-th/0101152>.

      <bibitem*|32><label|bib-Balasubramanian:1998sn>V.<nbsp>Balasubramanian,
      P.<nbsp>Kraus, and A.<nbsp>E. Lawrence, \PBulk versus boundary dynamics
      in anti-de Sitter space-time,\Q <with|font-shape|italic|Phys. Rev.>
      <with|font-series|bold|D59> (1999) 046003,
      <hlink|<with|font-family|tt|hep-th/9805171>|http://xxx.lanl.gov/abs/hep-th/9805171>.

      <bibitem*|33><label|bib-Balasubramanian:1998de>V.<nbsp>Balasubramanian,
      P.<nbsp>Kraus, A.<nbsp>E. Lawrence, and S.<nbsp>P. Trivedi,
      \PHolographic probes of anti-de Sitter space-times,\Q
      <with|font-shape|italic|Phys. Rev.> <with|font-series|bold|D59> (1999)
      104021, <hlink|<with|font-family|tt|hep-th/9808017>|http://xxx.lanl.gov/abs/hep-th/9808017>.

      <bibitem*|34><label|bib-Balasubramanian:2010ys>V.<nbsp>Balasubramanian,
      J.<nbsp>Parsons, and S.<nbsp>F. Ross, \PStates of a chiral 2d CFT,\Q
      <with|font-shape|italic|Class. Quant. Grav.> <with|font-series|bold|28>
      (2011) 045004, <hlink|<with|font-family|tt|1011.1803>|http://xxx.lanl.gov/abs/1011.1803>.

      <bibitem*|35><label|bib-deAlfaro:1976je>V.<nbsp>de<nbsp>Alfaro,
      S.<nbsp>Fubini, and G.<nbsp>Furlan, \PConformal Invariance in Quantum
      Mechanics,\Q <with|font-shape|italic|Nuovo Cim.>
      <with|font-series|bold|A34> (1976) 569.

      <bibitem*|36><label|bib-MR1694895>A.<nbsp>Connes, \PTrace formula in
      noncommutative geometry and the zeros of the Riemann zeta function,\Q
      <with|font-shape|italic|Selecta Math. (N.S.)> <with|font-series|bold|5>
      (1999), no.<nbsp>1 29\U106.

      <bibitem*|37><label|bib-berry1999h>M.<nbsp>V. Berry and J.<nbsp>P.
      Keating, \PH= xp and the riemann zeros,\Q in
      <with|font-shape|italic|Supersymmetry and Trace Formulae>,
      pp.<nbsp>355\U367. <newblock>Springer, 1999.

      <bibitem*|38><label|bib-MR1684543>M.<nbsp>V. Berry and J.<nbsp>P.
      Keating, \PThe Riemann zeros and eigenvalue asymptotics,\Q
      <with|font-shape|italic|SIAM Rev.> <with|font-series|bold|41> (1999),
      no.<nbsp>2 236\U266 (electronic).

      <bibitem*|39><label|bib-MR2443603>G.<nbsp>Sierra and P.<nbsp>K.
      Townsend, \PLandau levels and Riemann zeros,\Q
      <with|font-shape|italic|Phys. Rev. Lett.> <with|font-series|bold|101>
      (2008), no.<nbsp>11 110201, 4.

      <bibitem*|40><label|bib-Sierra:2011tb>G.<nbsp>Sierra and
      J.<nbsp>Rodriguez-Laguna, \PThe H=xp model revisited and the Riemann
      zeros,\Q <with|font-shape|italic|Phys.Rev.Lett.>
      <with|font-series|bold|106> (2011) 200201,
      <hlink|<with|font-family|tt|1102.5356>|http://xxx.lanl.gov/abs/1102.5356>.

      <bibitem*|41><label|bib-MR2812337>M.<nbsp>V. Berry and J.<nbsp>P.
      Keating, \PA compact Hamiltonian with the same asymptotic mean spectral
      density as the Riemann zeros,\Q <with|font-shape|italic|J. Phys. A>
      <with|font-series|bold|44> (2011), no.<nbsp>28 285203, 14.

      <bibitem*|42><label|bib-Bargmann:1946me>V.<nbsp>Bargmann, \PIrreducible
      unitary representations of the Lorentz group,\Q
      <with|font-shape|italic|Annals Math.> <with|font-series|bold|48> (1947)
      568\U640.

      <bibitem*|43><label|bib-MR0271275>H.<nbsp>Jacquet, \PFonctions de
      Whittaker associées aux groupes de Chevalley,\Q
      <with|font-shape|italic|Bull. Soc. Math. France>
      <with|font-series|bold|95> (1967) 243\U309.

      <bibitem*|44><label|bib-MR0311838>G.<nbsp>Schiffmann, \PIntégrales
      d'entrelacement et fonctions de Whittaker,\Q
      <with|font-shape|italic|Bull. Soc. Math. France>
      <with|font-series|bold|99> (1971) 3\U72.

      <bibitem*|45><label|bib-MR507800>B.<nbsp>Kostant, \POn Whittaker
      vectors and representation theory,\Q <with|font-shape|italic|Invent.
      Math.> <with|font-series|bold|48> (1978), no.<nbsp>2 101\U184.

      <bibitem*|46><label|bib-MR1729357>P.<nbsp>Etingof, \PWhittaker
      functions on quantum groups and <math|q>-deformed Toda operators,\Q in
      <with|font-shape|italic|Differential topology, infinite-dimensional Lie
      algebras, and applications>, vol.<nbsp>194 of
      <with|font-shape|italic|Amer. Math. Soc. Transl. Ser. 2>,
      pp.<nbsp>9\U25. <newblock>Amer. Math. Soc., Providence, RI, 1999.

      <bibitem*|47><label|bib-Seiberg:1990eb>N.<nbsp>Seiberg, \PNotes on
      quantum Liouville theory and quantum gravity,\Q
      <with|font-shape|italic|Prog.Theor.Phys.Suppl.>
      <with|font-series|bold|102> (1990) 319\U349.

      <bibitem*|48><label|bib-DeWitt:1967yk>B.<nbsp>S. DeWitt, \PQuantum
      Theory of Gravity. 1. The Canonical Theory,\Q
      <with|font-shape|italic|Phys. Rev.> <with|font-series|bold|160> (1967)
      1113\U1148.

      <bibitem*|49><label|bib-Misner:1972js>C.<nbsp>W. Misner,
      \PMINISUPERSPACE,\Q.

      <bibitem*|50><label|bib-Moore:1991ir>G.<nbsp>W. Moore, N.<nbsp>Seiberg,
      and M.<nbsp>Staudacher, \PFrom loops to states in 2-D quantum
      gravity,\Q <with|font-shape|italic|Nucl. Phys.>
      <with|font-series|bold|B362> (1991) 665\U709.

      <bibitem*|51><label|bib-Fateev:2000ik>V.<nbsp>Fateev, A.<nbsp>B.
      Zamolodchikov, and A.<nbsp>B. Zamolodchikov, \PBoundary Liouville field
      theory. 1. Boundary state and boundary two point function,\Q
      <hlink|<with|font-family|tt|hep-th/0001012>|http://xxx.lanl.gov/abs/hep-th/0001012>.

      <bibitem*|52><label|bib-Aganagic:2003qj>M.<nbsp>Aganagic,
      R.<nbsp>Dijkgraaf, A.<nbsp>Klemm, M.<nbsp>Marino, and C.<nbsp>Vafa,
      \PTopological strings and integrable hierarchies,\Q
      <with|font-shape|italic|Commun.Math.Phys.> <with|font-series|bold|261>
      (2006) 451\U516, <hlink|<with|font-family|tt|hep-th/0312085>|http://xxx.lanl.gov/abs/hep-th/0312085>.

      <bibitem*|53><label|bib-KashaniPoor:2006nc>A.-K. Kashani-Poor, \PThe
      Wave Function Behavior of the Open Topological String Partition
      Function on the Conifold,\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|04> (2007) 004,
      <hlink|<with|font-family|tt|hep-th/0606112>|http://xxx.lanl.gov/abs/hep-th/0606112>.

      <bibitem*|54><label|bib-Cheng:2010yw>M.<nbsp>C.<nbsp>N. Cheng,
      R.<nbsp>Dijkgraaf, and C.<nbsp>Vafa, \PNon-Perturbative Topological
      Strings And Conformal Blocks,\Q <with|font-shape|italic|JHEP>
      <with|font-series|bold|09> (2011) 022,
      <hlink|<with|font-family|tt|1010.4573>|http://xxx.lanl.gov/abs/1010.4573>.

      <bibitem*|55><label|bib-Beem:2012mb>C.<nbsp>Beem, T.<nbsp>Dimofte, and
      S.<nbsp>Pasquetti, \PHolomorphic Blocks in Three Dimensions,\Q
      <with|font-shape|italic|JHEP> <with|font-series|bold|1412> (2014) 177,
      <hlink|<with|font-family|tt|1211.1986>|http://xxx.lanl.gov/abs/1211.1986>.

      <bibitem*|56><label|bib-Brown:1986nw>J.<nbsp>D. Brown and
      M.<nbsp>Henneaux, \PCentral Charges in the Canonical Realization of
      Asymptotic Symmetries: An Example from Three-Dimensional Gravity,\Q
      <with|font-shape|italic|Commun.Math.Phys.> <with|font-series|bold|104>
      (1986) 207\U226.

      <bibitem*|57><label|bib-Gubser:1998bc>S.<nbsp>Gubser, I.<nbsp>R.
      Klebanov, and A.<nbsp>M. Polyakov, \PGauge theory correlators from
      noncritical string theory,\Q <with|font-shape|italic|Phys.Lett.>
      <with|font-series|bold|B428> (1998) 105\U114,
      <hlink|<with|font-family|tt|hep-th/9802109>|http://xxx.lanl.gov/abs/hep-th/9802109>.

      <bibitem*|58><label|bib-Witten:1998qj>E.<nbsp>Witten, \PAnti-de Sitter
      space and holography,\Q <with|font-shape|italic|Adv.Theor.Math.Phys.>
      <with|font-series|bold|2> (1998) 253\U291,
      <hlink|<with|font-family|tt|hep-th/9802150>|http://xxx.lanl.gov/abs/hep-th/9802150>.

      <bibitem*|59><label|bib-gradshteyn2000table>I.<nbsp>S. Gradshteyn and
      I.<nbsp>Ryzhik, \PTable of integrals, series, and products. translated
      from the russian. translation edited and with a preface by alan jeffrey
      and daniel zwillinger,\Q 2000.

      <bibitem*|60><label|bib-MR0466039>H.<nbsp>M. Edwards,
      <with|font-shape|italic|Riemann's zeta function>. <newblock>Academic
      Press [A subsidiary of Harcourt Brace Jovanovich, Publishers], New
      York-London, 1974. <newblock>Pure and Applied Mathematics, Vol. 58.
    </bib-list>>
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
    <associate|ads2cft1a0|<tuple|28|6>>
    <associate|ads2cft1b0|<tuple|33|7>>
    <associate|auto-1|<tuple|50|11>>
    <associate|auto-2|<tuple|50|11>>
    <associate|bib-'tHooft:1993gx|<tuple|1|11>>
    <associate|bib-Aganagic:2003qj|<tuple|52|13>>
    <associate|bib-Alishahiha:2008tv|<tuple|21|12>>
    <associate|bib-Azeyanagi:2007bj|<tuple|20|12>>
    <associate|bib-Balasubramanian:1998de|<tuple|33|12>>
    <associate|bib-Balasubramanian:1998sn|<tuple|32|12>>
    <associate|bib-Balasubramanian:2010ys|<tuple|34|12>>
    <associate|bib-Bargmann:1946me|<tuple|42|13>>
    <associate|bib-Beem:2012mb|<tuple|55|13>>
    <associate|bib-Bellucci:2002va|<tuple|16|12>>
    <associate|bib-Blum:1999pc|<tuple|12|12>>
    <associate|bib-Brown:1986nw|<tuple|56|13>>
    <associate|bib-Cadoni:1999ja|<tuple|11|12>>
    <associate|bib-Cadoni:2000gm|<tuple|15|12>>
    <associate|bib-Caldarelli:2000xk|<tuple|14|12>>
    <associate|bib-Chamon:2011xk|<tuple|28|12>>
    <associate|bib-Cheng:2010yw|<tuple|54|13>>
    <associate|bib-DeWitt:1967yk|<tuple|48|13>>
    <associate|bib-Fateev:2000ik|<tuple|51|13>>
    <associate|bib-Figueras:2008qh|<tuple|5|11>>
    <associate|bib-Galajinsky:2008ce|<tuple|24|12>>
    <associate|bib-Giveon:2004zz|<tuple|19|12>>
    <associate|bib-Gubser:1998bc|<tuple|57|13>>
    <associate|bib-Gupta:2008ki|<tuple|22|12>>
    <associate|bib-Hartman:2008dq|<tuple|23|12>>
    <associate|bib-Jackiw:2012ur|<tuple|30|12>>
    <associate|bib-KashaniPoor:2006nc|<tuple|53|13>>
    <associate|bib-Kunduri:2007vf|<tuple|4|11>>
    <associate|bib-Leiva:2003kd|<tuple|18|12>>
    <associate|bib-MR0271275|<tuple|43|13>>
    <associate|bib-MR0311838|<tuple|44|13>>
    <associate|bib-MR0466039|<tuple|60|13>>
    <associate|bib-MR1684543|<tuple|38|13>>
    <associate|bib-MR1694895|<tuple|36|12>>
    <associate|bib-MR1729357|<tuple|46|13>>
    <associate|bib-MR2443603|<tuple|39|13>>
    <associate|bib-MR2812337|<tuple|41|13>>
    <associate|bib-MR507800|<tuple|45|13>>
    <associate|bib-Maldacena:1997re|<tuple|3|11>>
    <associate|bib-Maldacena:1998uz|<tuple|7|11>>
    <associate|bib-Misner:1972js|<tuple|49|13>>
    <associate|bib-MolinaVilaplana:2012xe|<tuple|29|12>>
    <associate|bib-Moore:1991ir|<tuple|50|13>>
    <associate|bib-Nakatsu:1998st|<tuple|8|11>>
    <associate|bib-NavarroSalas:1999up|<tuple|13|12>>
    <associate|bib-Seiberg:1990eb|<tuple|47|13>>
    <associate|bib-Sen:2008vm|<tuple|25|12>>
    <associate|bib-Sen:2008yk|<tuple|26|12>>
    <associate|bib-Sen:2011cn|<tuple|27|12>>
    <associate|bib-Sierra:2011tb|<tuple|40|13>>
    <associate|bib-Spradlin:1999bn|<tuple|10|12>>
    <associate|bib-Strominger:1998yg|<tuple|6|11>>
    <associate|bib-Strominger:2003tm|<tuple|17|12>>
    <associate|bib-Susskind:1994vu|<tuple|2|11>>
    <associate|bib-Townsend:1998qp|<tuple|9|12>>
    <associate|bib-Witten:1998qj|<tuple|58|13>>
    <associate|bib-Zamolodchikov:2001ah|<tuple|31|12>>
    <associate|bib-berry1999h|<tuple|37|13>>
    <associate|bib-deAlfaro:1976je|<tuple|35|12>>
    <associate|bib-gradshteyn2000table|<tuple|59|13>>
    <associate|conf1a|<tuple|8|3>>
    <associate|conf1b|<tuple|9|3>>
    <associate|conf1c|<tuple|1|2>>
    <associate|conf1d1|<tuple|5|2>>
    <associate|conf1d2|<tuple|6|2>>
    <associate|conf1d3|<tuple|7|2>>
    <associate|conf1e|<tuple|9|3>>
    <associate|conf1e1|<tuple|2|2>>
    <associate|conf1e2|<tuple|3|2>>
    <associate|conf1e3|<tuple|4|2>>
    <associate|conf1f1|<tuple|11|3>>
    <associate|conf1f2|<tuple|12|3>>
    <associate|conf1f3|<tuple|13|3>>
    <associate|conf1g3|<tuple|14|3>>
    <associate|conf1h1|<tuple|15|4>>
    <associate|conf1h2|<tuple|16|4>>
    <associate|conf1h3|<tuple|17|4>>
    <associate|conf1h4|<tuple|18|4>>
    <associate|conf1h5|<tuple|19|4>>
    <associate|conf1h6|<tuple|20|5>>
    <associate|conf1h7b|<tuple|34|8>>
    <associate|conf1h8|<tuple|35|8>>
    <associate|conf1h9|<tuple|36|8>>
    <associate|conf1i1|<tuple|37|8>>
    <associate|conf1i10|<tuple|50|11>>
    <associate|conf1i2|<tuple|39|8>>
    <associate|conf1i3|<tuple|42|9>>
    <associate|conf1i4|<tuple|43|9>>
    <associate|conf1i5|<tuple|45|10>>
    <associate|conf1i50|<tuple|44|10>>
    <associate|conf1i6|<tuple|46|10>>
    <associate|conf1i7|<tuple|47|10>>
    <associate|conf1i8|<tuple|48|10>>
    <associate|conf1i9|<tuple|49|11>>
    <associate|cor1|<tuple|30|7>>
    <associate|cor2|<tuple|31|7>>
    <associate|cor3|<tuple|32|7>>
    <associate|dff1|<tuple|38|8>>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnote-2|<tuple|2|4>>
    <associate|footnr-1|<tuple|1|1>>
    <associate|footnr-2|<tuple|2|4>>
    <associate|lft1a1|<tuple|21|5>>
    <associate|lft1a2|<tuple|22|5>>
    <associate|lft1a3|<tuple|22|5>>
    <associate|lft1a4|<tuple|24|5>>
    <associate|lft1a5|<tuple|28|5>>
    <associate|lft1a6|<tuple|28|6>>
    <associate|rh1a|<tuple|40|9>>
    <associate|rh1b|<tuple|41|9>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      'tHooft:1993gx

      Susskind:1994vu

      Maldacena:1997re

      Kunduri:2007vf

      Figueras:2008qh

      Strominger:1998yg

      Maldacena:1998uz

      Nakatsu:1998st

      Townsend:1998qp

      Spradlin:1999bn

      Cadoni:1999ja

      Blum:1999pc

      NavarroSalas:1999up

      Caldarelli:2000xk

      Cadoni:2000gm

      Bellucci:2002va

      Strominger:2003tm

      Leiva:2003kd

      Giveon:2004zz

      Azeyanagi:2007bj

      Alishahiha:2008tv

      Gupta:2008ki

      Hartman:2008dq

      Galajinsky:2008ce

      Sen:2008vm

      Sen:2008yk

      Sen:2011cn

      Chamon:2011xk

      MolinaVilaplana:2012xe

      Jackiw:2012ur

      Zamolodchikov:2001ah

      Sen:2008vm

      Balasubramanian:1998sn

      Balasubramanian:1998de

      Balasubramanian:2010ys

      deAlfaro:1976je

      MR1694895

      berry1999h

      MR1684543

      MR2443603

      Sierra:2011tb

      MR2812337

      deAlfaro:1976je

      Bargmann:1946me

      MR0271275

      MR0311838

      MR507800

      MR0271275

      MR0311838

      MR507800

      MR1729357

      Seiberg:1990eb

      DeWitt:1967yk

      Misner:1972js

      Moore:1991ir

      Fateev:2000ik

      Aganagic:2003qj

      KashaniPoor:2006nc

      Cheng:2010yw

      Beem:2012mb

      Azeyanagi:2007bj

      Sen:2008vm

      Balasubramanian:2010ys

      Chamon:2011xk

      Balasubramanian:1998sn

      Balasubramanian:1998de

      'tHooft:1993gx

      Susskind:1994vu

      Brown:1986nw

      Gubser:1998bc

      Witten:1998qj

      Chamon:2011xk

      Sen:2008yk

      Sen:2008vm

      gradshteyn2000table

      deAlfaro:1976je

      MR1694895

      berry1999h

      MR1684543

      berry1999h

      MR1684543

      MR0466039

      MR1694895

      MR2443603

      Sierra:2011tb

      MR2812337

      MR2443603
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|Acknowledgments
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>