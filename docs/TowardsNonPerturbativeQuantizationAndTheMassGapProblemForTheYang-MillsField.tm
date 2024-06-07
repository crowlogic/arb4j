<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|g|<macro|g>>

    <assign|F|<macro|F>>

    <assign|A|<macro|A>>
  </hide-preamble>

  <doc-data|<doc-title|Towards non-perturbative quantization and the mass gap
  problem for the Yang--Mills Field>|<doc-author|<author-data|<author-name|A.
  Sevostyanov>|<\author-affiliation>
    Edited by: Stephen Crowley
  </author-affiliation>|<author-email|a.sevastyanov@abdn.ac.uk>|<\author-affiliation>
    Institute of Pure and Applied Mathematics, University of Aberdeen

    Aberdeen AB24 3UE, United Kingdom
  </author-affiliation>|<\author-note>
    <with|font-shape|italic|2000 Mathematics Subject Classification> 81T13
    Primary ; 60B05 Secondary

    <with|font-shape|italic|Key words and phrases.> Yang--Mills field,
    Gaussian measure
  </author-note>>>>

  <abstract-data|<\abstract>
    We reduce the problem of quantization of the Yang--Mills field
    Hamiltonian to a problem for defining a probability measure on an
    infinite-dimensional space of gauge equivalence classes of connections on
    <math|\<bbb-R\><rsup|3>>. We suggest a formally self-adjoint expression
    for the quantized Yang--Mills Hamiltonian as an operator on the
    corresponding Lebesgue <math|L<rsup|2>>-space. In the case when the
    Yang--Mills field is associated to the abelian group
    <math|U<around|(|1|)>> we define the probability measure which depends on
    two real parameters <math|m\<gtr\>0> and <math|c\<neq\>0>. This yields a
    non-standard quantization of the Hamiltonian of the electromagnetic
    field, and the associated probability measure is Gaussian. The
    corresponding quantized Hamiltonian is a self-adjoint operator in a Fock
    space the spectrum of which is <math|<around|{|0|}>\<cup\><around|[|<frac|1|2>*m,\<infty\>|)>>,
    i.e. it has a gap.
  </abstract>>

  <assign|nc|<macro|1|2|<assign||<macro|<arg|2>>>>><assign|nc*|<macro|1|2|3|<assign||<macro|<arg|3>>>>><nc|<pr>|<no-indent><with|font-shape|italic|Proof.
  >> <nc|<g>|\<frak-g\>> <assign|k|<macro|\<frak-k\>>><nc|<A>|\<cal-A\>>
  <nc|<F>|\<cal-F\>> <assign|H|<macro|\<frak-H\>>>

  <section*|Introduction>

  <assign|the-equation|<macro|<number|<equation-nr>|arabic>>><reset-counter|equation>

  The purpose of this short note is to reduce the problem of non-perturbative
  quantization of the Yang\UMills field Hamiltonian to a problem for defining
  a probability type measure on an infinite-dimensional space of gauge
  equivalence classes of connections on <math|\<bbb-R\><rsup|3>>. Recall that
  the Hamiltonian of the Yang\UMills field associated to a compact Lie group
  <math|K> with Lie algebra <math|<k>> is quadratic in momenta and its
  potential is equal to the square of the three-dimensional curvature tensor
  <math|F> with respect to a natural metric
  <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> on the space of
  <math|<k>>-valued differential forms on <math|\<bbb-R\><rsup|3>>. Our key
  observation is that the <math|<k>>-valued one-form <math|G> on
  <math|\<bbb-R\><rsup|3>> given by the Hodge star operator <math|\<ast\>> in
  <math|\<bbb-R\><rsup|3>> applied to <math|F>, <math|G=\<ast\>F>, is a
  potential vector field on the space of gauge equivalence classes of
  connections on <math|\<bbb-R\><rsup|3>>, the potential being the
  Chern\USimons functional. So that the potential term of the Yang\UMills
  Hamiltonian becomes the square of a potential vector field
  <math|<around|\<langle\>|G,G|\<rangle\>>> on the space of gauge equivalence
  classes of connections on <math|\<bbb-R\><rsup|3>> equipped with the metric
  <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> which plays the
  role of the configuration space of the Yang\UMills field, and the cotangent
  bundle to it is the corresponding phase space.

  We show that for a Riemannian manifold <math|M> with a Riemannian metric
  <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> any Hamiltonian
  on the symplectic manifold <math|T<rsup|\<ast\>>*M> of the form

  <\equation>
    <label|classh><frac|1|2>*<around|(|<around|\<langle\>|p,p|\<rangle\>>+<around|\<langle\>|v<around|(|x|)>,v<around|(|x|)>|\<rangle\>>|)>
  </equation>

  where <math|p\<in\>T<rsub|x>*M\<simeq\>T<rsup|\<ast\>><rsub|x>*M> is the
  momentum and <math|v=<math-up|grad><nbsp>\<phi\>> is a potential vector
  field, admits a family of canonical quantizations of the form

  <\equation>
    <label|rec><frac|1|2>*<big|sum><rsub|a=1><rsup|n>\<xi\><rsub|a><rsup|\<ast\>><around|(|x|)>*\<xi\><rsub|a><around|(|x|)>:L<rsup|2>*<around|(|M,d*\<mu\>|)>\<rightarrow\>L<rsup|2>*<around|(|M,d*\<mu\>|)>
  </equation>

  Here <math|\<xi\><rsub|a><around|(|x|)>>,
  <math|a=1,\<ldots\>,<math-up|dim><nbsp>M> is an orthonormal basis of
  <math|T<rsub|x>*M>, and <math|\<xi\><rsub|a><rsup|\<ast\>><around|(|x|)>>
  is the operator formally adjoint to <math|\<xi\><rsub|a><around|(|x|)>>
  with respect to the canonical scalar product in the space
  <math|L<rsup|2>*<around|(|M,d*\<mu\>|)>> of square integrable functions on
  <math|M> with respect to the measure <math|d*\<mu\>=\<psi\>*e<rsup|-2*\<phi\>>*d*x>,
  where <math|d*x> is the Lebesgue measure on <math|M> associated to the
  Riemannian metric, and <math|\<psi\>> is an arbitrary smooth non-vanishing
  function on <math|M>.

  The appearance of the function <math|\<psi\>> shows some ambiguity which is
  permitted by the correspondence principle in the course of quantization. We
  shall see that according to this principle for any smooth non-vanishing
  function <math|\<psi\>> on <math|M> the operator given by expression
  (<reference|rec>) is a quantization of the Hamiltonian\ 

  <\equation>
    <frac|<around|\<langle\>|p,p|\<rangle\>>+<around|\<langle\>|v<around|(|x|)>,v<around|(|x|)>|\<rangle\>>|2>*
  </equation>

  But, of course, the properties of the quantized Hamiltonian depend on the
  choice of <math|\<psi\>>. In practice the choice of <math|\<psi\>> should
  be dictated by experimental data and by purely mathematical restrictions.
  It seems that the freedom of this kind in the quantization of classical
  Hamiltonian systems has not been used so far. As we shall see the latter
  type of restrictions becomes primarily important in the case of the
  Yang\UMills field.

  To illustrate the above mentioned ambiguity we are going to consider the
  situation when <math|M=\<bbb-R\>> with the usual Euclidean metric, and the
  classical Hamiltonian is <math|<frac|1|2>*<around|\<langle\>|p,p|\<rangle\>>>,
  i.e. it describes a free particle on the line. If
  <math|\<psi\><around|(|x|)>=1> then the corresponding operator
  (<reference|rec>) is

  <\equation>
    -<frac|1|2>*<frac|d<rsup|2>|d*x<rsup|2>>:L<rsup|2>*<around|(|\<bbb-R\>,d*x|)>\<rightarrow\>L<rsup|2>*<around|(|\<bbb-R\>,d*x|)>
  </equation>

  i.e. it is the quantum Hamiltonian of a free particle on the line. It gives
  rise to a self-adjoint operator the spectrum of which is
  <math|<around|[|0,\<infty\>|)>>.

  But one can also choose <math|\<psi\><around|(|x|)>=e<rsup|-<frac|x<rsup|2>|2>>>,
  and then the corresponding operator (<reference|rec>) becomes

  <\equation>
    -<frac|e<rsup|<frac|1|2>*x<rsup|2>>|2>**<frac|d|d*x>*e<rsup|-<frac|x<rsup|2>|2>*>*<frac|d|d*x>:L<rsup|2>*<around|(|\<bbb-R\>,e<rsup|-<frac|x<rsup|2>|2>>*d*x|)>\<rightarrow\>L<rsup|2>*<around|(|\<bbb-R\>,e<rsup|-<frac|x<rsup|2>|2>>*d*x|)>
  </equation>

  which is the Hermite differential operator which gives rise to a
  self-adjoint operator on <math|L<rsup|2>*<around|(|\<bbb-R\>,e<rsup|-<frac|x<rsup|2>|2>>|)>>
  the spectrum of which is the set <math|<around|{|0,<frac|1|2>,1,<frac|3|2>,\<ldots\>|}>>,
  and the corresponding eigenfunctions are the Hermite polynomials (see e.g.
  <cite|Herm>). Thus with this choice of <math|\<psi\>> we obtain, up to a
  non-essential constant, the Hamiltonian of a quantum harmonic oscillator,
  and the spectrum of it has a gap separating it from the zero eigenvalue
  corresponding to the ground state.

  Note that in Quantum Mechanics one has to take <math|\<psi\>=1> in the
  above example in order to make the momentum operator
  <math|<frac|1|i>*<frac|d|d*x>> self-adjoint in
  <math|L<rsup|2>*<around|(|\<bbb-R\>,\<psi\>*d*x|)>>. However, in Quantum
  Field Theory operators of variational derivatives with respect to fields,
  which play the role of <math|<frac|1|i>*<frac|d|d*x>>, may have no physical
  meaning. Therefore they do not need to be self-adjoint, and a non-trivial
  choice of <math|\<psi\>> is allowed.

  We show that the Hamiltonian of the Yang\UMills field is of type
  (<reference|classh>), where <math|M> is the space of gauge equivalence
  classes of connections on <math|\<bbb-R\><rsup|3>> equipped with the metric
  <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>>, and
  <math|\<phi\>> is the Chern\USimons functional which we denote by
  <math|C*S>. Expressing the corresponding quantized Hamiltonian in form
  (<reference|rec>) solves the so called normal ordering problem which
  appears in the course of quantization. Thus the problem of quantization of
  the Yang\UMills Hamiltonian is reduced to defining a measure on the
  infinite-dimensional space of gauge equivalence classes of connections on
  <math|\<bbb-R\><rsup|3>> with \Pdensity\Q
  <math|\<psi\>*e<rsup|-2*\<phi\>>>. Note that measures on
  infinite-dimensional spaces are probability measures, and to ensure that
  the obtained measure on the space of gauge equivalence classes of
  connections on <math|\<bbb-R\><rsup|3>> is a probability measure it is
  natural to choose <math|\<psi\>=e<rsup|-<frac|<around|\<langle\>|G,G|\<rangle\>>|2>*>>
  which guarantees that <math|\<psi\>*e<rsup|-2*\<phi\>>> decreases at
  \Pinfinity\Q in this space.

  It turns out, however, that even in the abelian case when
  <math|K=U<around|(|1|)>> this Ansatz does not work. If we use the Coulomb
  gauge fixing condition to describe the space of gauge equivalence classes
  of <math|U<around|(|1|)>>-connections on <math|\<bbb-R\><rsup|3>> as the
  space of vector fields satisfying the condition
  <with|font-family|rm|div><math|A=0> then the appropriate choice for
  <math|\<psi\>> is\ 

  <\equation>
    <text|<math|exp <around|(|-<frac|<around|\<langle\>|G,G|\<rangle\>>|2*c<rsup|2>>*-<frac|<around|(|c<rsup|2>+m|)>*<around|\<langle\>|A,A|\<rangle\>>|2>*|)>>\<forall\>
    <math|c,m\<in\>\<bbb-R\>>, <math|c\<neq\>0>, <math|m\<gtr\>0>>
  </equation>

  \ and we show that

  <\equation>
    \<psi\>*e<rsup|-2*\<phi\>>=e<rsup|-<frac|<around|\<langle\>|G,G|\<rangle\>>|2*c<rsup|2>>*-2*C*S<around|(|A|)>-<frac|<around|(|c<rsup|2>+m|)>*<around|\<langle\>|A,A|\<rangle\>>|2>>
  </equation>

  is the exponent of a negatively defined quadratic expression in <math|A>.
  So that the corresponding probability measure is Gaussian. With this choice
  of <math|\<psi\>> the quantized abelian Yang\UMills field suggested in this
  paper rather resembles the second harmonic oscillator type quantization of
  the classical Hamiltonian for a free particle on the line considered above.

  Indeed, we prove that the corresponding quantized Yang\UMills Hamiltonian
  defined following recipe (<reference|rec>) is self-adjoint and its spectrum
  is <math|<around|{|0|}>\<cup\><around|[|<frac|1|2>*m,\<infty\>|)>>, i.e. it
  has a gap.

  The paper is organized as follows. In Sections <reference|YMH> and
  <reference|YMPh> we recall the results on the Lagrangian and the
  Hamiltonian formulation for the Yang\UMills field. These results are
  well-known in some form. We formulate them in a form suitable for our
  purposes. In Proposition <reference|YMhamiltprop> we make the key
  observation about the structure of the potential in the Hamiltonian of the
  Yang\UMills field.

  In Section <reference|quantmod> we discuss quantizations of Hamiltonians of
  the Yang\UMills type mentioned above, and in Section <reference|YMhamquant>
  these results are applied to the Yang\UMills Hamiltonian.

  <with|font-series|bold|Acknowledgements>

  The results presented in this paper have been partially obtained during
  research stays at Institut des Haut Études Scientifiques, Paris and
  Max\UPlanck\UInstut für Mathematik, Bonn. The author is grateful to these
  institutions for hospitality.

  The research on this project received funding from the European Research
  Council (ERC) under the European Union's Horizon 2020 research and
  innovation program (QUASIFT grant agreement 677368) during the visit of the
  author to Institut des Haut Études Scientifiques, Paris.

  The author also thanks the referee for useful comments.

  <section|The Yang\UMills field in Hamiltonian formulation><label|YMH>

  <subsection|The Yang\UMills field as a Hamiltonian system with
  constrains><label|YMh>

  In this section following <cite|FS> we recall the Lagrangian and the
  Hamiltonian formalism for the Yang\UMills field. The canonical variables
  and the Hamiltonian will be obtained via the Legendre transform starting
  from the Lagrangian formulation.

  Let <math|K> be a compact semi-simple Lie group, <math|<k>> its Lie algebra
  and <math|<g>> the complexification of <math|<k>>. We denote by
  <math|<around|(|\<cdummy\>,\<cdummy\>|)>> the Killing form of <math|<g>>.
  Recall that the restriction of this form to <math|<k>> is non-degenerate
  and negatively defined. We shall consider the Yang\UMills functional on the
  affine space of smooth connections in the trivial <math|K>-bundle,
  associated to the adjoint representation of <math|K>, over the standard
  Minkowski space <math|\<bbb-R\><rsub|1,3>>. Fixing the standard
  trivialization of this bundle and the trivial connection as an origin in
  the affine space of connections we can identify this space with the space
  <math|\<Omega\><rsup|1><around|(|\<bbb-R\><rsub|1,3>,<k>|)>> of
  <math|<k>>-valued 1-forms on <math|\<bbb-R\><rsub|1,3>>. Let
  <math|<A>\<in\>\<Omega\><rsup|1><around|(|\<bbb-R\><rsub|1,3>,<k>|)>> be
  such a connection. Denote by <math|<F>> the curvature 2-form of this
  connection, <math|<F>=d<A>+<frac|1|2>*<around|[|<A>\<wedge\><A>|]>>. Here
  as usual we denote by <math|<around|[|<A>\<wedge\><A>|]>> the operation
  which takes the exterior product of <math|<k>>-valued 1-forms and the
  commutator of their values in <math|<k>>. The Yang\UMills action functional
  <math|Y*M> evaluated at <math|<A>> is defined by the formula

  <\equation>
    <label|YM>Y*M=<frac|1|2>*<big|int><rsub|\<bbb-R\><rsub|1,3>><around|(|<F>\<wedge\>,\<star\><F>|)>
  </equation>

  where <math|\<star\>> stands for the Hodge star operation associated to the
  standard metric on the Minkowski space, and we evaluate the Killing form on
  the values of <math|<F>> and <math|\<star\><F>> and also take their
  exterior product. The corresponding Lagrangian density <math|\<cal-L\>> is
  equal to <math|\<star\><around|(|<F>\<wedge\>,\<star\><F>|)>>,

  <\equation>
    <label|L>\<cal-L\>=<frac|1|2>*\<star\><around|(|<F>\<wedge\>,\<star\><F>|\<nobracket\>>
  </equation>

  Next, following <cite|FS>, we pass from Lagrangian to Hamiltonian
  formulation for the Yang\UMills field. To this end one should use the
  modified Lagrangian density <math|\<cal-L\><rprime|'>>,

  <\equation>
    <label|L'>\<cal-L\><rprime|'>=\<star\><around|(|<around|(|d<A>+<frac|1|2>*<around|[|<A>\<wedge\><A>|]>-<frac|1|2><F>|)>\<wedge\>,\<star\><F>|)>
  </equation>

  where <math|<A>> and <math|<F>> should be regarded as independent
  variables. The equations of motion obtained by extremizing the
  corresponding action functional are equivalent to those derived from the
  action (<reference|YM>). Indeed, the equation for <math|<F>> following from
  (<reference|L'>) is just the definition of the curvature,

  <\equation>
    <label|nondyn><F>=d<A>+<frac|1|2>*<around|[|<A>\<wedge\><A>|\<nobracket\>>
  </equation>

  and the other equation,

  <\equation*>
    d*\<star\><F>+<around|[|<A>\<wedge\>\<star\><F>|]>=0
  </equation*>

  becomes the usual Yang\UMills equation after expressing <math|<F>> in terms
  of <math|<A>>.

  In order to pass to the Hamiltonian formalism for the Yang\UMills field we
  introduce a convenient notation that will be used throughout of this paper.
  Let <math|\<Omega\><rsup|\<ast\>><around|(|\<bbb-R\><rsup|3>,<k>|)>> be the
  space of <math|<k>>-valued differential forms on <math|\<bbb-R\><rsup|3>>.
  We define a scalar product on this space, whenever it is finite, by

  <\equation>
    <label|prod><tabular|<tformat|<table|<row|<cell|<around|\<langle\>|\<omega\><rsub|1>,\<omega\><rsub|2>|\<rangle\>>>|<cell|=-<big|int><rsub|\<bbb-R\><rsup|3>><around|(|\<omega\><rsub|1>\<wedge\>,\<ast\>\<omega\><rsub|2>|)>>>|<row|<cell|>|<cell|=-<big|int><rsub|\<bbb-R\><rsup|3>>\<ast\><around|(|\<omega\><rsub|1>\<wedge\>,\<ast\>\<omega\><rsub|2>|)>*d<rsup|3>*x,<nbsp>\<omega\><rsub|1,2>\<in\>\<Omega\><rsup|\<ast\>><around|(|\<bbb-R\><rsup|3>,<k>|)>>>>>>
  </equation>

  where <math|\<ast\>> stands for the Hodge star operation associated to the
  standard Euclidean metric on <math|\<bbb-R\><rsup|3>>, and we evaluate the
  Killing form on the values of <math|\<omega\><rsub|1>> and
  <math|\<ast\>\<omega\><rsub|2>> and also take their exterior product.

  Let <math|<A>> be <math|<k>>-valued connection 1-form in the trivial
  <math|K>-bundle, associated to the adjoint representation of <math|K>, over
  the standard Minkowski space, <math|<F>> its curvature 2-form. Fix a
  coordinate system <math|<around|(|x<rsub|0>,x<rsub|1>,x<rsub|2>,x<rsub|3>|)>>
  on <math|\<bbb-R\><rsub|1,3>> so that <math|x<rsub|0>=t> is the time and
  <math|<around|(|x<rsub|1>,x<rsub|2>,x<rsub|3>|)>> are orthogonal Cartesian
  coordinates on <math|\<bbb-R\><rsup|3>\<subset\>\<bbb-R\><rsub|1,3>>. We
  denote by <math|A> the \Pthree-dimensional Euclidean part\Q of <math|<A>>,

  <\equation>
    A=<big|sum><rsub|k=1><rsup|3>A<rsub|k>*d*x<rsub|k>
  </equation>

  where <math|A<rsub|k>=<A><rsub|k>> for <math|k=1,2,3>. We also introduce
  the \Pelectric\Q field <math|E> and the \Pmagnetic\Q field <math|G>
  associated to <math|<F>> as follows:

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|1|1|cell-halign|r>|<table|<row|<cell|E>|<cell|=<big|sum><rsub|k=1><rsup|3>E<rsub|k>*d*x<rsub|k>>>|<row|<cell|E<rsub|k>>|<cell|=<F><rsub|0*k>>>|<row|<cell|F>|<cell|=d*A+<frac|1|2>*<around|[|A\<wedge\>A|]>>>|<row|<cell|G>|<cell|=\<ast\>F>>>>>
  </equation>

  i.e. <math|F> is the \Pthree-dimensional\Q spatial part of <math|<F>>.

  We recall that the covariant derivative

  <\equation>
    d<rsub|A>:\<Omega\><rsup|n><around|(|\<bbb-R\><rsup|3>,<k>|)>\<rightarrow\>\<Omega\><rsup|n+1><around|(|\<bbb-R\><rsup|3>,<k>|)>
  </equation>

  \ associated to <math|A> is defined by

  <\equation>
    d<rsub|A>*\<omega\>=d*\<omega\>+<around|[|A\<wedge\>\<omega\>|]>
  </equation>

  , and the operator formally adjoint to <math|d<rsub|A>> with respect to
  scalar product (<reference|prod>) is equal to
  <math|-\<ast\>d<rsub|A>\<ast\>>. We denote by
  <with|font-family|rm|div><rsub|<math|A>> the part of this operator acting
  from <math|\<Omega\><rsup|1><around|(|\<bbb-R\><rsup|3>,<k>|)>> to
  <math|\<Omega\><rsup|0><around|(|\<bbb-R\><rsup|3>,<k>|)>>, with the
  opposite sign,

  <\equation*>
    <math-up|div><rsub|A>=\<ast\>d<rsub|A>\<ast\>:\<Omega\><rsup|1><around|(|\<bbb-R\><rsup|3>,<k>|)>\<rightarrow\>\<Omega\><rsup|0><around|(|\<bbb-R\><rsup|3>,<k>|)>
  </equation*>

  Using this notation the Lagrangian density (<reference|L'>) can be
  rewritten, up to a divergence, in the following form

  <\equation>
    <around*|\<nobracket\>|<label|L''>\<cal-L\><rprime|'>=-<around*|(|\<ast\><around|(|E\<wedge\>,\<ast\>\<partial\><rsub|t>*A|)>-<frac|\<ast\><around|(|E\<wedge\>,\<ast\>E|)>+\<ast\><around|(|G\<wedge\>,\<ast\>G|)>+<around|(|<A><rsub|0>,<math-up|div><rsub|A>E|)>|2>|\<nobracket\>>|)>
  </equation>

  It is easier to confirm this formula by an explicit calculation in terms of
  components (see <cite|IZ>, Section 12-1-4 for further details). Below we
  use Greek letters to label the coordinates
  <math|<around|(|x<rsub|0>,x<rsub|1>,x<rsub|2>,x<rsub|3>|)>> in the
  Minkowski space, Latin letters to label the spacial coordinates
  <math|<around|(|x<rsub|1>,x<rsub|2>,x<rsub|3>|)>>, and the usual lifting
  rules for tensor indexes with the help of metric.
  <math|\<partial\><rsub|\<mu\>>> and <math|\<partial\><rsub|k>> stand for
  the partial derivative with respect to <math|x<rsub|\<mu\>>> and
  <math|x<rsub|k>>, respectively. From (<reference|L'>) using the definition
  of <math|\<star\>> we have in terms of the components of the connection and
  of the curvature forms

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<cal-L\><rprime|'>>|<cell|=<big|sum><rsub|\<nu\>\<less\>\<mu\>><around|(|\<partial\><rsub|\<nu\>><A><rsub|\<mu\>>-\<partial\><rsub|\<mu\>><A><rsub|\<nu\>>+<around|[|<A><rsub|\<nu\>>,<A><rsub|\<mu\>>|]>-<frac|1|2><F><rsub|\<nu\>*\<mu\>>,<F><rsup|\<nu\>*\<mu\>><rsub|>|)>>>|<row|<cell|>|<cell|+<rsub|><big|sum><rsub|k=1><rsup|3><around|(|\<partial\><rsub|t><A><rsub|k>-\<partial\><rsub|k><A><rsub|0>+<around|[|<A><rsub|0>,<A><rsub|k>|]>-<frac|1|2><F><rsub|0*k>,<F><rsup|0*k>|)>>>|<row|<cell|>|<cell|+<big|sum><rsub|i\<less\>j><around|(|\<partial\><rsub|i><A><rsub|j>-\<partial\><rsub|j><A><rsub|i>+<around|[|<A><rsub|i>,<A><rsub|j>|]>-<frac|1|2><F><rsub|i*j>,<F><rsup|i*j>|)>>>>>>
  </equation>

  Now we can rewrite this equation with the help of the non-dynamical
  equations

  <\equation>
    \<partial\><rsub|i><A><rsub|j>-\<partial\><rsub|j><A><rsub|i>+<around|[|<A><rsub|i>,<A><rsub|j>|]>=<F><rsub|i*j>
  </equation>

  following from (<reference|nondyn>),

  <\equation>
    \<cal-L\><rprime|'>=<big|sum><rsub|k=1><rsup|3><around|(|\<partial\><rsub|t><A><rsub|k>-\<partial\><rsub|k><A><rsub|0>+<around|[|<A><rsub|0>,<A><rsub|k>|]>-<frac|1|2><F><rsub|0*k>,<F><rsup|0*k>|)>+<big|sum><rsub|i\<less\>j><frac|1|2>*<around|(|<F><rsub|i*j>,<F><rsup|i*j>|)>
  </equation>

  Recalling the definitions of <math|F> and <math|E> we arrive at

  <\equation>
    <with|font-base-size|8|\<cal-L\><rprime|'>=<big|sum><rsub|k=1><rsup|3><around*|(|-<around|(|\<partial\><rsub|t>*A<rsub|k>,E<rsub|k>|)>+\<partial\><rsub|k><around|(|<A><rsub|0>,E<rsub|k>|)>-<around|(|<A><rsub|0>,\<partial\><rsub|k>*E<rsub|k>+<around|[|A<rsub|k>,E<rsub|k>|]>|)>+<frac|1|2>*<around|(|E<rsub|k>,E<rsub|k>|)>|)>+<big|sum><rsub|i\<less\>j><frac|1|2>*<around|(|<F><rsub|i*j>,<F><rsup|i*j>|)>>
  </equation>

  which is equal to the right hand side of (<reference|L''>) up to the
  divergence term <math|<big|sum><rsub|k=1><rsup|3>\<partial\><rsub|k><around|(|<A><rsub|0>,E<rsub|k>|)>>.

  For the corresponding action we have

  <\equation>
    <label|YM''>Y*M<rprime|'>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<around|\<langle\>|E,\<partial\><rsub|t>*A|\<rangle\>>-<frac|<around|\<langle\>|E,E|\<rangle\>>+<around|\<langle\>|G,G|\<rangle\>>|2>*+<around|\<langle\>|<A><rsub|0>,<math-up|div><rsub|A>E|\<rangle\>>|)>*d*t.
  </equation>

  Denote

  <\equation>
    C=<math-up|div><rsub|A>E
  </equation>

  , and introduce an orthonormal basis <math|T<rsub|a>,<nbsp>a=1,\<ldots\>,<math-up|dim><nbsp><k>>
  in <math|<k>> with respect to the Killing form and the components of
  <math|A>, <math|E>, <math|<A><rsub|0>> and <math|C> associated to this
  basis

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|k>>|<cell|=<big|sum><rsub|a>A<rsub|k><rsup|a>*T<rsub|a>,<nbsp>E<rsub|k>>>|<row|<cell|>|<cell|=<big|sum><rsub|a>E<rsub|k><rsup|a>*T<rsub|a>,<nbsp><A><rsub|0>=<A><rsub|0><rsup|a>T<rsub|a>,<nbsp>C=C<rsup|a>*T<rsub|a>>>>>>
  </equation>

  In terms of these components the action (<reference|YM''>) takes the form

  <\equation>
    <label|YM'''>Y*M<rprime|'>=<big|int><rsub|\<bbb-R\><rsub|1,3>><around*|(|<big|sum><rsub|k,a>E<rsub|k><rsup|a>*\<partial\><rsub|t>*A<rsub|k><rsup|a>-h*<around|(|A,E|)>+<big|sum><rsub|a><A><rsub|0><rsup|a>C<rsup|a>|)>*d<rsup|4>*x
  </equation>

  where

  <\equation>
    h*<around|(|A,E|)>=-<frac|\<ast\><around|(|E\<wedge\>,\<ast\>E|)>+\<ast\><around|(|G\<wedge\>,\<ast\>G|)>|2>
  </equation>

  is the Hamiltonian density. Denote

  <\equation>
    <label|hamilt>H*<around|(|A,E|)>=<frac|*<around|(|<around|\<langle\>|E,E|\<rangle\>>+<around|\<langle\>|G,G|\<rangle\>>|)>|2>
  </equation>

  From formula (<reference|YM'''>) it is clear that <math|A<rsub|k><rsup|a>>
  and <math|E<rsub|k><rsup|a>> are canonical conjugate coordinates and
  momenta for the Yang\UMills field, <math|H*<around|(|A,E|)>> is the
  Hamiltonian, <math|<A><rsub|0><rsup|a>> are Lagrange multipliers and
  <math|C<rsup|a>=0> are constrains imposed on the canonical variables.

  The Yang\UMills equations become Hamiltonian with respect to the canonical
  Poisson structure

  <\equation>
    <label|pois><around|{|E<rsub|k><rsup|a><around|(|x|)>,A<rsub|l><rsup|b><around|(|y|)>|}>=\<delta\><rsub|k*l>*\<delta\><rsup|a*b>*\<delta\>*<around|(|x-y|)>,
  </equation>

  and all the other Poisson brackets of the components of <math|E> and
  <math|A> vanish. One can also check that

  <\equation>
    <label|momentbrack><around|{|C<rsup|a><around|(|x|)>,C<rsup|b><around|(|y|)>|}>=<big|sum><rsub|c>t<rsup|a*b*c>*C<rsup|c><around|(|x|)>*\<delta\>*<around|(|x-y|)>,
  </equation>

  where <math|t<rsup|a*b*c>> are the structure constants of Lie algebra
  <math|<k>> with respect to the basis <math|T<rsup|a>>,
  <math|<around|[|T<rsup|a>,T<rsup|b>|]>=<big|sum><rsub|c>t<rsup|a*b*c>*T<rsup|c>>,
  and that

  <\equation>
    <label|haminv><around|{|H*<around|(|A,E|)>,C<rsup|a><around|(|x|)>|}>=0.
  </equation>

  This means that the Yang\UMills field is a generalized Hamiltonian system
  with first class constrains according to Dirac's classification <cite|Dir>.

  <section|The structure of the phase space of the Yang\UMills
  field><label|YMPh>

  <subsection|Reduction of the phase space><label|YMred>

  In this section we collect some facts on the Poisson geometry of the phase
  space of the Yang\UMills field and related gauge actions. These results are
  certainly well known. But it seems that they are not presented in the
  literature in the form suitable for our purposes (see, however, <cite|Sing>
  about the gauge actions).

  To begin with, we consider the Yang\UMills field as a generalized
  Hamiltonian system with Hamiltonian (<reference|hamilt>) and constraints
  <math|C=<math-up|div><rsub|A><nbsp>E=0> on the phase space
  <math|\<Omega\><rsup|1><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>\<times\>\<Omega\><rsup|1><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>>
  equipped with Poisson structure (<reference|pois>). Here
  <math|\<Omega\><rsup|1><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>> stands
  for the space of smooth <math|<k>>-valued 1-forms on
  <math|\<bbb-R\><rsup|3>> with compact support. Later the phase space will
  be considerably extended.

  The Poisson structure (<reference|pois>) has a natural geometric
  interpretation. Indeed, consider the affine space of smooth connections in
  the trivial <math|K>-bundle, associated to the adjoint representation of
  <math|K>, over <math|\<bbb-R\><rsup|3>>. As in Section <reference|YMh> we
  fix the standard trivialization of this bundle and the trivial connection
  as an origin in the affine space of connections and identify this space
  with the space <math|\<Omega\><rsup|1><around|(|\<bbb-R\><rsup|3>,<k>|)>>
  of <math|<k>>-valued 1-forms on <math|\<bbb-R\><rsup|3>>. Let
  <math|\<cal-D\>> be the subspace in the affine space of connections
  isomorphic to <math|\<Omega\><rsup|1><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>>
  under this identification. We shall frequently write <math|\<cal-D\>>
  instead of <math|\<Omega\><rsup|1><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>>
  and call this space the space of compactly supported <math|K>-connections
  on <math|\<bbb-R\><rsup|3>>.

  The space <math|\<cal-D\>> has a natural Riemannian metric defined with the
  help of scalar product (<reference|prod>),

  <\equation>
    <label|riemann><around|\<langle\>|E,E<rprime|'>|\<rangle\>>=-<big|int><rsub|\<bbb-R\><rsup|3>><around|(|E\<wedge\>,\<ast\>E<rprime|'>|)>,<nbsp>E,E<rprime|'>\<in\>T<rsub|A>*\<cal-D\>\<simeq\>\<cal-D\>,
  </equation>

  This metric gives rise to a natural imbedding
  <math|T*\<cal-D\>\<hookrightarrow\>T<rsup|\<ast\>>*\<cal-D\>> induced by
  the natural embeddings

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|T<rsub|A>*\<cal-D\>\<simeq\>\<cal-D\>\<hookrightarrow\>\<cal-D\><rsup|\<ast\>>\<simeq\>T<rsub|A><rsup|\<ast\>>*\<cal-D\>,A\<in\>\<cal-D\>>>|<row|<cell|>>|<row|<cell|\<omega\>\<mapsto\><wide|\<omega\>|^>,>>|<row|<cell|>>|<row|<cell|<wide|\<omega\>|^><around|(|\<omega\><rprime|'>|)>=<around|\<langle\>|\<omega\>,\<omega\><rprime|'>|\<rangle\>>,<nbsp>\<omega\>,\<omega\><rprime|'>\<in\>\<cal-D\>.>>>>>
  </equation>

  Using this imbedding the tangent bundle <math|T*\<cal-D\>> can be equipped
  with the natural structure of a Poisson manifold induced by the restriction
  of the canonical symplectic structure of <math|T<rsup|\<ast\>>*\<cal-D\>>
  to <math|T*\<cal-D\>\<hookrightarrow\>T<rsup|\<ast\>>*\<cal-D\>>. This
  restriction is well defined as a symplectic form on <math|T*\<cal-D\>>
  since the canonical symplectic form on <math|T<rsup|\<ast\>>*\<cal-D\>> is
  constant, and metric (<reference|riemann>), with the help of which the
  restriction of the form to <math|T*\<cal-D\>> is defined, is
  non-degenerate. Explicitly this restriction <math|\<Omega\>> is given by

  <\equation>
    \<Omega\><around|(|A,E|)><around|(|<around|(|X,Y|)>,<around|(|X<rprime|'>,Y<rprime|'>|)>|)>=<around|\<langle\>|Y<rprime|'>,X|\<rangle\>>-<around|\<langle\>|Y,X<rprime|'>|\<rangle\>>
  </equation>

  where\ 

  <\equation>
    <around|(|A,E|)>\<in\>T*\<cal-D\>\<simeq\>\<cal-D\>\<times\>\<cal-D\>
  </equation>

  <\equation>
    <around|(|X,Y|)>,<around|(|X<rprime|'>,Y<rprime|'>|)>\<in\>T<rsub|<around|(|A,E|)>>*T*\<cal-D\>\<simeq\>\<cal-D\>\<times\>\<cal-D\>
  </equation>

  The symplectic structure on the space <math|T*\<cal-D\>> can be identified
  with that which corresponds to Poisson structure (<reference|pois>).

  Now let us discuss the meaning of the constrains. First of all we note that
  the constrains <math|C=<math-up|div><rsub|A><nbsp>E> infinitesimally
  generate the gauge action on the phase space <math|T*\<cal-D\>>. More
  precisely, let <math|\<cal-K\>> be the group of <math|K>-valued maps
  <math|g:\<bbb-R\><rsup|3>\<rightarrow\>K> such that
  <math|g<around|(|x|)>=I> for <math|<around|\||x|\|>\<geq\>R<around|(|g|)>>,
  where <math|I> is the identity element of <math|K> and
  <math|R<around|(|g|)>\<gtr\>0> is a real number depending on <math|g>.
  <math|\<cal-K\>> is called the gauge group of compactly supported gauge
  transformations. The Lie algebra of <math|\<cal-K\>> is isomorphic to
  <math|\<Omega\><rsup|0><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>>.

  The gauge group <math|\<cal-K\>> acts on the space of connections
  <math|\<cal-D\>> by

  <\equation>
    <label|Gaugeact><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<cal-K\>\<times\>\<cal-D\>\<rightarrow\>\<cal-D\>>>|<row|<cell|g\<times\>A\<mapsto\>g\<circ\>A=-d*g*g<rsup|-1>+g*A*g<rsup|-1>>>>>>
  </equation>

  where we denote

  <\equation>
    d*g*g<rsup|-1>=g<rsup|\<ast\>>*\<theta\><rsub|R>
  </equation>

  <\equation>
    g*A*g<rsup|-1>=<math-up|Ad>g<around|(|A|)>
  </equation>

  and <math|\<theta\><rsub|R>> is the right-invariant Maurer\UCartan form on
  <math|K>. This action is free, so that the quotient
  <math|\<cal-D\>/\<cal-K\>> is a smooth manifold.

  The action (<reference|Gaugeact>) of <math|\<cal-K\>> on the space of
  connections <math|\<cal-D\>> induces an action

  <\equation>
    <label|Gaugeactph><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<cal-K\>\<times\>T*\<cal-D\>\<rightarrow\>T*\<cal-D\>>>|<row|<cell|g\<times\><around|(|A,E|)>\<mapsto\><around|(|g*E*g<rsup|-1>,-d*g*g<rsup|-1>+g*A*g<rsup|-1>|)>>>>>>
  </equation>

  where as before we write <math|g*E*g<rsup|-1>=<math-up|Ad>g<around|(|E|)>>.
  This action gives rise to an action of the Lie algebra
  <math|\<Omega\><rsup|0><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>> of the
  gauge group <math|\<cal-K\>> on <math|T*\<cal-D\>> by vector fields. If
  <math|X\<in\>\<Omega\><rsup|0><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>>
  then the corresponding vector field <math|V<rsub|X><around|(|A,E|)>> is
  given by

  <\equation>
    <label|gaugeactph>V<rsub|X><around|(|A,E|)>=<around|(|<around|[|X,E|]>,-d*X+<around|[|X,A|]>|)>,<nbsp><around|(|A,E|)>\<in\>T*\<cal-D\>\<simeq\>\<cal-D\>\<times\>\<cal-D\>
  </equation>

  Here we, of course, identify <math|T<rsub|<around|(|A,E|)>>*T*\<cal-D\>\<simeq\>T*\<cal-D\>\<simeq\>\<cal-D\>\<times\>\<cal-D\>>.

  The action (<reference|gaugeactph>) is generated by the constraint
  <with|font-family|rm|div><math|<rsub|A><nbsp>E> in the sense that for

  <\equation>
    X\<in\>\<Omega\><rsup|0><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>,<nbsp><around|(|A,E|)>\<in\>T*\<cal-D\>
  </equation>

  \ we have

  <\equation>
    <around|{|<around|\<langle\>|<math-up|div><rsub|A><nbsp>E,X|\<rangle\>>,A<around|(|x|)>|}>=-d*X<around|(|x|)>+<around|[|X<around|(|x|)>,A<around|(|x|)>|]>
  </equation>

  and

  <\equation*>
    <around|{|<around|\<langle\>|<math-up|div><rsub|A><nbsp>E,X|\<rangle\>>,E<around|(|x|)>|}>=<around|[|X<around|(|x|)>,E<around|(|x|)>|]>
  </equation*>

  Using the language of Poisson geometry and taking into account formula
  (<reference|momentbrack>) for the Poisson brackets of the constrains one
  can say that <math|\<cal-K\>\<times\>T*\<cal-D\>\<rightarrow\>T*\<cal-D\>>
  is a Hamiltonian group action, and the map

  <\equation>
    <label|YMmoment><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<mu\>:T*\<cal-D\>\<rightarrow\>\<Omega\><rsup|0><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>>>|<row|<cell|\<mu\><around|(|A,E|)>=<math-up|div><rsub|A>
    E>>>>>
  </equation>

  is the moment map for this action. In particular, action
  (<reference|Gaugeactph>) preserves the symplectic form of
  <math|T*\<cal-D\>>.

  We note that action (<reference|Gaugeactph>) also preserves Riemannian
  structure (<reference|riemann>) of the configuration space
  <math|\<cal-D\>>. This follows from the fact that the Killing form on
  <math|<k>> is invariant with respect to the adjoint action of <math|K>.

  The properties of the phase space of the Yang\UMills field and of the gauge
  action discussed above are formulated in the following proposition.

  <\proposition*>
    <label|YMprop>Let <math|\<cal-D\>> be the space of compactly supported
    <math|K>-connections on <math|\<bbb-R\><rsup|3>>, <math|\<cal-K\>> the
    group of compactly supported gauge transformations. Then the following
    statements are true.

    (i) The space <math|\<cal-D\>> is an infinite dimensional Riemannian
    manifold equipped with the metric

    <\equation>
      <label|r1><around|\<langle\>|E,E<rprime|'>|\<rangle\>>=-<big|int><rsub|\<bbb-R\><rsup|3>><around|(|E\<wedge\>,\<ast\>E<rprime|'>|)>,<nbsp>E,E<rprime|'>\<in\>T<rsub|A>*\<cal-D\>
    </equation>

    This metric induces a natural imbedding
    <math|T*\<cal-D\>\<hookrightarrow\>T<rsup|\<ast\>>*\<cal-D\>>, and the
    tangent bundle <math|T*\<cal-D\>> can be equipped with the natural
    structure of a Poisson manifold induced by the canonical symplectic
    structure of <math|T<rsup|\<ast\>>*\<cal-D\>>.

    (ii) The gauge action <math|\<cal-K\>\<times\>\<cal-D\>\<rightarrow\>\<cal-D\>>
    preserves Riemannian metric (<reference|r1>) and gives rise to a
    Hamiltonian group action <math|\<cal-K\>\<times\>T*\<cal-D\>\<rightarrow\>T*\<cal-D\>>
    with the moment map

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<mu\>:T*\<cal-D\>\<rightarrow\>\<Omega\><rsup|0><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>>>|<row|<cell|\<mu\><around|(|A,E|)>=<math-up|div><rsub|A><nbsp>E,<nbsp><around|(|A,E|)>\<in\>T*\<cal-D\>\<simeq\>\<cal-D\>\<times\>\<cal-D\>>>>>>
    </equation>

    (iii) The action of the gauge group <math|\<cal-K\>> on the spaces
    <math|\<cal-D\>> and <math|T*\<cal-D\>> is free, and the reduced phase
    space <math|\<mu\><rsup|-1><around|(|0|)>/\<cal-K\>> is a smooth
    manifold.
  </proposition*>

  Finally we make a few remarks on the structure of the Hamiltonian of the
  Yang\UMills field.

  Since the Hamiltonian <math|H*<around|(|A,E|)>> of the Yang\UMills field is
  invariant under the gauge action (<reference|Gaugeactph>) (this fact can be
  checked directly and also follows from formula (<reference|haminv>)) the
  generalized Hamiltonian dynamics in the sense of Dirac (see <cite|Dir>)
  described by this Hamiltonian together with the constrains
  <with|font-family|rm|div><math|<rsub|A><nbsp>E=0> is equivalent, in the
  sense explained in <cite|FS>, Sect. 3.2, to the usual one on the reduced
  phase space <math|\<mu\><rsup|-1><around|(|0|)>/\<cal-K\>> (see <cite|A>,
  Appendix 5). More explicitly, since <math|H*<around|(|A,E|)>> is gauge
  invariant the Hamiltonian vector field of it is tangent to
  <math|\<mu\><rsup|-1><around|(|0|)>> and is invariant under the action of
  <math|\<cal-K\>>. Thus this vector field gives rise to a Hamiltonian vector
  field on <math|\<mu\><rsup|-1><around|(|0|)>/\<cal-K\>> (see <cite|A>,
  Appendix 5C) which gives rise to a Hamiltonian dynamics on the reduced
  space.

  The Hamiltonian (<reference|hamilt>) itself has a very standard structure;
  <math|H*<around|(|A,E|)>> is equal to the sum of a half of the square of
  the momentum, <math|<frac|1|2>*<around|\<langle\>|E,E|\<rangle\>>>, and of
  a potential <math|U<around|(|A|)>>

  <\equation>
    U<around|(|A|)>=<frac|<around|\<langle\>|G,G|\<rangle\>>|2>*
  </equation>

  The potential <math|U<around|(|A|)>> is, in turn, equal to a half of the
  square of the vector field <math|G\<in\>\<Gamma\>*<around|(|T*\<cal-D\>|)>>.
  By definition the vector field <math|G> is invariant with respect to the
  gauge action of <math|\<cal-K\>> which is

  <\equation>
    G*<around|(|g\<circ\>A|)>=g*G<around|(|A|)>*g<rsup|-1>
  </equation>

  The value of this field at each point <math|A\<in\>\<cal-D\>> belongs to
  the kernel of the operator <with|font-family|rm|div><rsub|<math|A>>.
  Indeed, from the Bianchi identity <math|d<rsub|A>*F=0>, the definition of
  <math|G=\<ast\>F> and the formula <math|\<ast\>\<ast\>=><with|font-family|rm|id>
  it follows that

  <\equation>
    <math-up|div><rsub|A><nbsp>G=-\<ast\>d<rsub|A>\<ast\>
  </equation>

  <\equation>
    \<ast\>F=-\<ast\>d<rsub|A><nbsp>F=0
  </equation>

  The vector field <math|G> has one more important property: it is potential
  with the potential function equal to the Chern\USimons functional. Recall
  that this functional is defined by

  <\equation>
    <label|CS>C*S<around|(|A|)>=<frac|<around|\<langle\>|A,\<ast\>d*A|\<rangle\>>|2>*+<frac|<around|\<langle\>|A,\<ast\><around|[|A\<wedge\>A|]>|\<rangle\>>|3>
  </equation>

  This functional is invariant under the action of the Lie algebra of the
  gauge group and its gradient is equal to <math|G>. Note that the
  Chern\USimons functional is not invariant under the action of the gauge
  group itself: there is a constant <math|\<kappa\>> such that for any
  <math|g\<in\>\<cal-K\>> <math|C*S*<around|(|g\<circ\>A|)>> differs from
  <math|C*S<around|(|A|)>> by <math|\<kappa\>*n>, where
  <math|n\<in\>\<bbb-Z\>> depends on the homotopy class of <math|g> (see e.g.
  <cite|F>).

  Now we summarize the properties of the Hamiltonian of the Yang\UMills
  field.

  <\proposition*>
    <label|YMhamiltprop>(i) The generalized Hamiltonian system on the Poisson
    manifold <math|T*\<cal-D\>> with the Hamiltonian

    <\equation>
      H*<around|(|A,E|)>=<frac|*<around|(|<around|\<langle\>|E,E|\<rangle\>>+<around|\<langle\>|G,G|\<rangle\>>|)>|2>
    </equation>

    <\equation>
      G=\<ast\>F
    </equation>

    <\equation>
      F=d*A+<frac|*<around|[|A\<wedge\>A|]>|2>
    </equation>

    \ and the constraints

    <\equation>
      div<rsub|A>-E=0
    </equation>

    \ describes the Yang\UMills dynamics on <math|T*\<cal-D\>>.

    (ii) The Hamiltonian <math|H*<around|(|A,E|)>> is invariant under the
    gauge action

    <\equation>
      \<cal-K\>\<times\>T*\<cal-D\>\<rightarrow\>T*\<cal-D\>
    </equation>

    \ and the generalized Hamiltonian dynamics described by this Hamiltonian
    together with the constraints\ 

    <\equation>
      <text|div><rsub|A><nbsp>E=0
    </equation>

    \ is equivalent to the usual one on the reduced phase space

    <\equation>
      <frac|\<mu\><rsup|-1><around|(|0|)>|\<cal-K\>>
    </equation>

    (iii) The vector field <math|G> is invariant with respect to the gauge
    action of <math|\<cal-K\>>

    <\equation>
      G*<around|(|g\<circ\>A|)>=g*G<around|(|A|)>*g<rsup|-1>
    </equation>

    The value of this field at each point <math|A\<in\>\<cal-D\>> belongs to
    the kernel of the operator <with|font-family|rm|div><rsub|<math|A>>,

    <\equation>
      G<around|(|A|)>\<in\><math-up|Ker><nbsp><math-up|div><rsub|A><nbsp>\<forall\>A\<in\>\<cal-D\><text|>
    </equation>

    (iv) The vector field <math|G> is potential with the potential equal to
    the Chern\USimons functional (<reference|CS>) which is invariant under
    the action of the Lie algebra of the gauge group.
  </proposition*>

  <subsection|The structure of the reduced phase space><label|redcoord>

  In Propositions <reference|YMprop> and <reference|YMhamiltprop> we
  formulated all the properties of the Yang\UMills field which are important
  for our further consideration. In this section we study an arbitrary
  Hamiltonian system satisfying these properties.

  First we consider a phase space equipped with a Lie group action of the
  type described in Proposition <reference|YMprop>. Actually the Riemannian
  metric introduced in that proposition is only important for the definition
  of the Hamiltonian of the Yang\UMills field. This metric is not relevant to
  Poisson geometry. We used this metric in the description of the phase space
  in order to avoid analytic difficulties arising in the infinite-dimensional
  case. Now let us forget about the metric for a moment and discuss the
  geometry of the reduced space.

  The Poisson structure described in Proposition <reference|YMprop> is an
  example of the canonical Poisson structure on the cotangent bundle, and the
  group action on this bundle is induced by a group action on the base
  manifold. Thus we start with a manifold <math|\<cal-M\>> and a Lie group
  <math|G> freely acting on <math|\<cal-M\>>. The canonical symplectic
  structure on <math|T<rsup|\<ast\>>*\<cal-M\>> can be defined as follows
  (see <cite|A>).

  Denote by <math|\<pi\>:T<rsup|\<ast\>>*\<cal-M\>\<rightarrow\>\<cal-M\>>
  the canonical projection, and define a 1-form <math|\<theta\>> on
  <math|T<rsup|\<ast\>>*\<cal-M\>> by <math|\<theta\><around|(|v|)>=p*<around|(|d*\<pi\>*v|)>>,
  where <math|p\<in\>T<rsub|x><rsup|\<ast\>>*\<cal-M\>> and
  <math|v\<in\>T<rsub|<around|(|x,p|)>>*<around|(|T<rsup|\<ast\>>*\<cal-M\>|)>>.
  Then the canonical symplectic form on <math|T<rsup|\<ast\>>*\<cal-M\>> is
  equal to <math|d*\<theta\>>.

  Recall that the induced Lie group action
  <math|G\<times\>T<rsup|\<ast\>>*\<cal-M\>\<rightarrow\>T<rsup|\<ast\>>*\<cal-M\>>
  is a Hamiltonian group action with a moment map
  <math|\<mu\>:T<rsup|\<ast\>>*\<cal-M\>\<rightarrow\><g><rsup|\<ast\>>>,
  where <math|<g><rsup|\<ast\>>> is the dual space to the Lie algebra
  <math|<g>> of <math|G>. The moment map <math|\<mu\>> is uniquely determined
  by the formula (see <cite|Per>, Theorem 1.5.2)

  <\equation>
    <label|mom><around|(|\<mu\><around|(|x,p|)>,X|)>=\<theta\><around|(|<wide|X|~>|)><around|(|x,p|)>=p<around|(|<wide|X|^><around|(|x|)>|)>,
  </equation>

  where <math|<wide|X|^>> is the vector field on <math|\<cal-M\>> generated
  by arbitrary element <math|X\<in\><g>>, <math|<wide|X|~>> is the induced
  vector field on <math|T<rsup|\<ast\>>*\<cal-M\>> and <math|(,)> stands for
  the canonical paring between <math|<g>> and <math|<g><rsup|\<ast\>>>.

  Formula (<reference|mom>) implies that for any <math|x\<in\>\<cal-M\>> the
  map <math|\<mu\><around|(|x,p|)>> is linear in <math|p>. We denote this
  linear map by <math|m<around|(|x|)>>, <math|m<around|(|x|)>:T<rsub|x><rsup|\<ast\>>*\<cal-M\>\<rightarrow\><g><rsup|\<ast\>>>,

  <\equation>
    <label|m>m<around|(|x|)>*p=\<mu\><around|(|x,p|)>.
  </equation>

  Next, following <cite|A>, Appendix 5, with some modifications of the proofs
  suitable for our purposes, we describe the structure of the reduced space
  <math|\<mu\><rsup|-1><around|(|0|)>/G>. We start with a simple lemma.

  <\lemma>
    <label|l1>The annihilator <math|T<rsub|x>*\<cal-O\><rsup|\<perp\>>\<in\>T<rsub|x><rsup|\<ast\>>*\<cal-M\>>
    of the tangent space <math|T<rsub|x>*\<cal-O\>> to the <math|G>-orbit
    <math|\<cal-O\>\<subset\>\<cal-M\>> at point <math|x> is isomorphic to
    <with|font-family|rm|Ker><math|<nbsp>m<around|(|x|)>>,
    <math|T<rsub|x>*\<cal-O\><rsup|\<perp\>>=<math-up|Ker><nbsp>m<around|(|x|)>>.
  </lemma>

  <\proof>
    First we note that the space <math|T<rsub|x>*\<cal-O\><rsup|\<perp\>>> is
    spanned by the differentials of <math|G>-invariant functions on
    <math|\<cal-M\>>. But from the definitions of the moment map and of the
    Poisson structure on <math|T<rsup|\<ast\>>*\<cal-M\>> we have

    <\equation>
      <label|to>L<rsub|<wide|X|^>>*f<around|(|x|)>=<around|{|<around|(|X,\<mu\>|)>,f|}><around|(|x|)>=<around|(|X,m<around|(|x|)>*d*f<around|(|x|)>|)>,
    </equation>

    where <math|<wide|X|^>> is the vector field on <math|\<cal-M\>> generated
    by element <math|X\<in\><g>>, <math|f\<in\>C<rsup|\<infty\>><around|(|\<cal-M\>|)>>,
    and <math|(,)> stands for the canonical paring between <math|<g>> and
    <math|<g><rsup|\<ast\>>>.

    Formula (<reference|to>) implies that <math|f> is <math|G>-invariant if
    and only if <math|d*f<around|(|x|)>\<in\><math-up|Ker><nbsp>m<around|(|x|)>>.
    This completes the proof.
  </proof>

  <math|\<Box\>>

  <\proposition>
    <label|redstruct>The action of the group <math|G> on
    <math|T<rsup|\<ast\>>*\<cal-M\>> is free, and the reduced phase space
    <math|\<mu\><rsup|-1><around|(|0|)>/G> is a smooth manifold. Moreover, we
    have an isomorphism of symplectic manifolds,
    <math|\<mu\><rsup|-1><around|(|0|)>/G\<simeq\>T<rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>>,
    where <math|T<rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>> is equipped with
    the canonical symplectic structure. Under this isomorphism
    <math|T<rsub|\<cal-O\><rsub|x>><rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>\<simeq\>T<rsub|x>*\<cal-O\><rsub|x><rsup|\<perp\>>>,
    where <math|\<cal-O\><rsub|x>> is the <math|G>-orbit of <math|x>.
  </proposition>

  <\proof>
    Let <math|\<cal-O\><rsub|x>> be the <math|G>-orbit of point
    <math|x\<in\>\<cal-M\>> and <math|\<pi\>:\<cal-M\>\<rightarrow\>\<cal-M\>/G>
    the canonical projection, <math|\<pi\><around|(|x|)>=\<cal-O\><rsub|x>>.
    Denote by <math|\<Xi\>> the foliation of the space <math|\<cal-M\>> by
    the subspaces <math|T<rsub|x>*\<cal-O\><rsup|\<perp\>>>. Since the
    foliation <math|\<Xi\>> is <math|G>-invariant and
    <with|font-family|rm|Ker><math|<nbsp>d*\<pi\>\|<rsub|T<rsub|x>*\<cal-M\>>=T<rsub|x>*\<cal-O\><rsub|x>>
    we can identify the subspace <math|T<rsub|x>*\<cal-O\><rsub|x><rsup|\<perp\>>>
    with the tangent space <math|T<rsub|\<cal-O\><rsub|x>><rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>>
    by means of the dual map to the differential of the projection
    <math|\<pi\>>. But the definition of the moment map <math|\<mu\>> and
    Lemma <reference|l1> imply that <math|>. Therefore the quotient
    <math|\<mu\><rsup|-1><around|(|0|)>/G> is diffeomorphic to
    <math|T<rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>>, the diffeomorphism being
    induced by the canonical projection <math|\<pi\>>.

    From the definitions of the Poisson structures on
    <math|T<rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>> and on the reduced space
    <math|\<mu\><rsup|-1><around|(|0|)>/G> it follows that the diffeomorphism

    <\equation>
      <frac|\<mu\><rsup|-1><around|(|0|)>|G>\<simeq\>T<rsup|\<ast\>>*<around|(|<frac|\<cal-M\>|G>|)>
    </equation>

    \ is actually an isomorphism of symplectic manifolds.
  </proof>

  <math|\<Box\>>

  Using the last proposition one can easily describe the space
  <math|\<Gamma\>*T<rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>> of covector
  fields on <math|\<cal-M\>/G>.

  <\corollary>
    <label|vectred>The space <math|\<Gamma\>*T<rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>>
    is isomorphic to the space of <math|G>-invariant sections
    <math|V\<in\>\<Gamma\>*T<rsup|\<ast\>>*\<cal-M\>> such that
    <math|V<around|(|x|)>\<in\>T<rsub|x>*\<cal-O\><rsub|x><rsup|\<perp\>>>
    for any <math|x\<in\>\<cal-M\>>. Such covector fields will be called
    vertical <math|G>-invariant covector fields on <math|\<cal-M\>>. We
    denote this space by <math|\<Gamma\><rsub|G><rsup|\<perp\>>*T<rsup|\<ast\>>*\<cal-M\>>,
    <math|\<Gamma\><rsub|G><rsup|\<perp\>>*T<rsup|\<ast\>>*\<cal-M\>\<simeq\>\<Gamma\>*T<rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>>.
  </corollary>

  Now we discuss the class of Hamiltonians on
  <math|T<rsup|\<ast\>>*\<cal-M\>> we are interested in. First, recalling
  Proposition <reference|YMprop> we equip the manifold <math|\<cal-M\>> with
  a Riemannian metric <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>>
  and assume that the action of <math|G> on <math|\<cal-M\>> preserves this
  metric. Using this metric we can establish an isomorphism of
  <math|G>-manifolds, <math|T*\<cal-M\>\<simeq\>T<rsup|\<ast\>>*\<cal-M\>>.
  We shall always identify the tangent and the cotangent bundle of
  <math|\<cal-M\>> and the spaces of vector and covector fields on
  <math|\<cal-M\>> by means of this isomorphism. The tangent bundle
  <math|T*\<cal-M\>> will be regarded as a symplectic manifold with the
  induced symplectic structure. Under the identification
  <math|T*\<cal-M\>\<simeq\>T<rsup|\<ast\>>*\<cal-M\>> the subspace
  <math|T<rsub|x>*\<cal-O\><rsup|\<perp\>>\<subset\>T<rsub|x><rsup|\<ast\>>*\<cal-M\>>
  is isomorphic to the orthogonal complement of the tangent space
  <math|T<rsub|x>*\<cal-O\>> in <math|T<rsub|x>*\<cal-M\>>. Note also that
  since <math|T<rsub|\<cal-O\><rsub|x>><rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>\<simeq\>T<rsub|x>*\<cal-O\><rsub|x><rsup|\<perp\>>>
  and the metric on <math|\<cal-M\>> is <math|G>-invariant
  <math|T<rsub|\<cal-O\><rsub|x>><rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>> has
  a scalar product induced from <math|T<rsub|x>*\<cal-O\><rsub|x><rsup|\<perp\>>>,
  i.e. <math|\<cal-M\>/G> naturally becomes a Riemannian manifold. We shall
  also identify <math|T<rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>\<simeq\>T*<around|(|\<cal-M\>/G|)>>
  by means of the metric. Denote by <math|\<Gamma\><rsub|G><rsup|\<perp\>>*T*\<cal-M\>>
  the space of <math|G>-invariant vertical vector fields on <math|\<cal-M\>>.
  By Corollary <reference|vectred> we have an isomorphism,
  <math|\<Gamma\><rsub|G><rsup|\<perp\>>*T*\<cal-M\>\<simeq\>\<Gamma\>*T*<around|(|\<cal-M\>/G|)>>.

  On the symplectic manifold <math|T*\<cal-M\>> we define a Hamiltonian of
  the type described in Proposition <reference|YMhamiltprop>. In order to do
  that we fix a <math|G>-invariant vertical vector field <math|V> on
  <math|\<cal-M\>>. Then we put

  <\equation>
    l<around|(|x,p|)>=<frac|<around|\<langle\>|p,p|\<rangle\>>+<around|\<langle\>|V<around|(|x|)>,V<around|(|x|)>|\<rangle\>>|2>*\<forall\><nbsp>p\<in\>T<rsub|x>*\<cal-M\><text|>
  </equation>

  This Hamiltonian is obviously <math|G>-invariant and gives rise to a
  Hamiltonian <math|l<rsub|r*e*d>> on the reduced space
  <math|\<mu\><rsup|-1><around|(|0|)>/G\<simeq\>T<rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>>.
  Since by Corollary <reference|vectred> <math|V> can be regarded as a
  (co)vector field on <math|\<cal-M\>/G> we have

  <\equation>
    <label|hamiltred>l<rsub|r*e*d><around|(|\<cal-O\><rsub|x>,p<rsub|\<perp\>>|)>=<frac|<around|\<langle\>|p<rsub|\<perp\>>,p<rsub|\<perp\>>|\<rangle\>>+<around|\<langle\>|V<around|(|x|)>,V<around|(|x|)>|\<rangle\>>|2>*\<forall\><nbsp>p<rsub|\<perp\>>\<in\>T<rsub|x>*\<cal-O\><rsub|x><rsup|\<perp\>>\<simeq\>T<rsub|\<cal-O\><rsub|x>><rsup|\<ast\>>*<around|(|\<cal-M\>/G|)>
  </equation>

  Now we can apply the above obtained results in the case of the Yang\UMills
  field. The reduced phase space of the Yang\UMills field is of the type
  considered in Lemma <reference|l1> and Proposition <reference|redstruct>
  with <math|\<cal-M\>=\<cal-D\>> and <math|G=\<cal-K\>>. In the
  infinite-dimensional case we have to distinguish between <math|T*\<cal-D\>>
  and <math|T<rsup|\<ast\>>*\<cal-D\>>. But according to Proposition
  <reference|YMprop> for the description of the Yang\UMills dynamics it
  suffices to consider <math|T*\<cal-D\>> and equip it with the Poisson
  structure induced by the imbedding <math|T*\<cal-D\>\<subset\>T<rsup|\<ast\>>*\<cal-D\>>
  with the help of metric (<reference|r1>). Then the action of
  <math|\<cal-K\>> of <math|T*\<cal-D\>> becomes Hamiltonian, and in the
  notation of Lemma <reference|l1>\ 

  <\equation>
    m<around|(|x|)>=<math-up|div><rsub|A>
  </equation>

  Let <math|\<cal-O\><rsub|A>> be the gauge orbit of a connection
  <math|A\<in\>\<cal-D\>>. By Lemma <reference|l1> the space
  <math|T<rsub|\<cal-O\><rsub|A>>*\<cal-D\>/\<cal-K\>> is isomorphic to the
  kernel of the operator <with|font-family|rm|div><rsub|<math|A>> in
  <math|T<rsub|A>*\<cal-D\>>. The metric (<reference|r1>) induces a
  Riemannian metric on <math|\<cal-D\>/\<cal-K\>> which we denote by the same
  symbol.

  According to Proposition <reference|YMhamiltprop> the vector field <math|G>
  on the space <math|\<cal-D\>> is <math|\<cal-K\>>-invariant and horizontal.
  Hamiltonian (<reference|hamilt>) is of type (<reference|hamiltred>).
  Therefore from formula (<reference|hamiltred>) and Proposition
  <reference|redstruct> we infer that Hamiltonian (<reference|hamilt>) gives
  rise to the Hamiltonian

  <\equation>
    <label|Hamiltred>H<rsub|r*e*d>*<around|(|\<cal-O\><rsub|A>,E<rsub|\<perp\>>|)>=<frac|<around|\<langle\>|E<rsub|\<perp\>>,E<rsub|\<perp\>>|\<rangle\>>+<around|\<langle\>|G,G|\<rangle\>>|2>*\<forall\><nbsp>E<rsub|\<perp\>>\<in\>T<rsub|\<cal-O\><rsub|A>>*<around|(|\<cal-D\>/\<cal-K\>|)>\<simeq\><math-up|Ker<nbsp>div><rsub|A>
  </equation>

  on the reduced phase space <math|\<mu\><rsup|-1><around|(|0|)>/\<cal-K\>\<simeq\>T*\<cal-D\>/\<cal-K\>>.

  Based on the results of this section we can also make two remarks on the
  structure of the gauge orbit space <math|\<cal-D\>/\<cal-K\>>.

  <\remark>
    The Riemannian geometry of the space <math|\<cal-D\>/\<cal-K\>> is
    nontrivial. In particular, its curvature tensor is not identically equal
    to zero (see <cite|Sing>). This is the main peculiarity of non-abelian
    gauge theories.
  </remark>

  <\remark>
    The quotient <math|\<cal-D\>/\<cal-K\>> cannot be realized as a
    cross-section for the gauge action of <math|\<cal-K\>> on
    <math|\<cal-D\>>. For any local cross-section of this action there are
    <math|\<cal-K\>>-orbits in <math|\<cal-D\>> which meet this cross-section
    many times. This phenomenon is called the Gribov ambiguity (see
    <cite|Sing1>).

    The Riemannian manifold <math|\<cal-D\>/\<cal-K\>> cannot be realized as
    a cross-section for the action of <math|\<cal-K\>> on <math|\<cal-D\>>
    even locally. This is due to the fact that the foliation <math|\<Xi\>> of
    <math|\<cal-D\>> by the subspaces <with|font-family|rm|Ker<nbsp>div><math|<rsub|A>\<subset\>T<rsub|A>*\<cal-D\>>
    is not an integrable distribution, and therefore the subspaces
    <with|font-family|rm|Ker<nbsp>div><rsub|<math|A>> are not tangent to a
    submanifold in <math|\<cal-D\>>. Indeed, the components <math|C<rsup|a>>
    of the constraint <with|font-family|rm|div><math|<rsub|A><nbsp>E>
    regarded as an <math|\<Omega\><rsup|0><around|(|\<bbb-R\><rsup|3>,<k>|)>>-valued
    1-form on <math|\<cal-D\>> do not form a differential ideal. Therefore
    the conditions of the Frobenius integrability theorem are not satisfied.
    In Poisson geometry constrains of this type are called non-holonomic.
  </remark>

  <section|Quantization of the Hamiltonian of the Yang\UMills field>

  <subsection|Quantization of Yang\UMills type Hamiltonians: a model
  case><label|quantmod>

  Let <math|M> be <math|n>-dimensional Riemannian manifold with a metric
  <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>>. For simplicity
  we denote the pairing between <math|T<rsub|x>*M> and
  <math|T<rsup|\<ast\>><rsub|x>*M> and the induced scalar product on
  <math|T<rsub|x><rsup|\<ast\>>*M> by the same symbol as the metric on
  <math|M>. As before we can identify <math|T<rsup|\<ast\>>*M> and <math|T*M>
  using the metric.

  Consider a Hamiltonian of type (<reference|hamiltred>) on
  <math|T<rsup|\<ast\>>*M\<simeq\>T*M>,

  <\equation>
    <label|hamM>h*<around|(|x,p|)>=<frac|1|2>*<around|(|<around|\<langle\>|p,p|\<rangle\>>+<around|\<langle\>|v<around|(|x|)>,v<around|(|x|)>|\<rangle\>>|)>,<nbsp>x\<in\>M,<nbsp>p\<in\>T<rsub|x>*M,
  </equation>

  where <math|v> is a vector field on <math|M>. So <math|M> plays the role of
  <math|\<cal-M\>/G> in this section.

  Assume that the vector field <math|v> is potential with a potential
  function <math|\<phi\>>, so <math|v=<math-up|grad><nbsp>\<phi\>>.

  Let <math|\<xi\><rsub|a><around|(|x|)>>, <math|a=1,\<ldots\>,n> be an
  orthonormal basis in <math|T<rsub|x>*M>,
  <math|<around|\<langle\>|\<xi\><rsub|a>,\<xi\><rsub|b>|\<rangle\>>=\<delta\><rsub|a*b>>.
  Let <math|T<rsub|\<xi\><rsub|a>>=<around|\<langle\>|\<xi\><rsub|a>,p|\<rangle\>>-i*<around|\<langle\>|\<xi\><rsub|a>,v|\<rangle\>>>,
  <math|T<rsub|\<xi\><rsub|a>><rsup|\<ast\>>=<around|\<langle\>|\<xi\><rsub|a>,p|\<rangle\>>+i*<around|\<langle\>|\<xi\><rsub|a>,v|\<rangle\>>>.
  From this definition and from the definition of the basis
  <math|\<xi\><rsub|a>> it follows immediately that

  <\equation>
    h*<around|(|x,p|)>=<frac|1|2>*<big|sum><rsub|a=1><rsup|n>T<rsub|\<xi\><rsub|a>><rsup|\<ast\>>*T<rsub|\<xi\><rsub|a>>.
  </equation>

  Now let <math|x<rsup|1>,\<ldots\>,x<rsup|n>> be a local coordinate system
  on <math|M> defined on an open subset of <math|M>,
  <math|\<xi\><rsub|a><rsup|i>> the coordinates of <math|\<xi\><rsub|a>> with
  respect to this coordinate system, so <math|\<xi\><rsub|a>=<big|sum><rsub|i=1><rsup|n>\<xi\><rsub|a><rsup|i>*<frac|\<partial\>|\<partial\>*x<rsup|i>>>.
  Denote by <math|g<rsub|i*j>> the components of metric tensor of the metric
  <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> in terms of the
  coordinates <math|x<rsup|1>,\<ldots\>,x<rsup|n>>. We also have
  <math|p=<big|sum><rsub|i=1><rsup|n>p<rsub|i>*d*x<rsup|i>>.

  Let <math|L<rsup|2>*<around|(|M,\<psi\>|)>> be the Hilbert space of
  complex-valued functions on <math|M> such that

  <\equation>
    <big|int><rsub|M><around|\||f|\|><rsup|2>*\<psi\>*d*\<mu\>\<less\>\<infty\>,
  </equation>

  where <math|\<mu\>> is the Lebesgue measure on <math|M> associated to the
  Riemannian metric, and <math|\<psi\>\<in\>C<rsup|\<infty\>><around|(|M|)>>
  is a smooth non-vanishing function on <math|M>. The scalar product on
  <math|L<rsup|2>*<around|(|M,\<psi\>|)>> is given by the usual formula

  <\equation>
    <around|(|f,f<rprime|'>|)><rsub|\<psi\>>=<big|int><rsub|M>f<around*|(|\<mu\>|)><wide|f|\<bar\>><rprime|'><around*|(|\<mu\>|)>*\<psi\>*d*\<mu\>
  </equation>

  According to the canonical quantization philosophy and the correspondence
  principle after quantization <math|p<rsub|i>> becomes the operator
  <math|<frac|1|i>*<frac|\<partial\>|\<partial\>*x<rsup|i>>> in
  <math|L<rsup|2>*<around|(|M,\<psi\>|)>>, and any function of <math|x>
  becomes the multiplication operator by that function in
  <math|L<rsup|2>*<around|(|M,\<psi\>|)>>, so <math|T<rsub|\<xi\><rsub|a>>>
  becomes the operator\ 

  <\equation>
    <frac|1|i>*\<xi\><rsub|a>-i*<around|(|\<xi\><rsub|a>,v|)>=-i*\<nabla\><rsub|\<xi\><rsub|a>>
  </equation>

  where

  <\equation>
    \<nabla\><rsub|\<xi\><rsub|a>>=\<xi\><rsub|a>+<around|\<langle\>|\<xi\><rsub|a>,v|\<rangle\>>
  </equation>

  We would like to define a self-adjoint operator in
  <math|L<rsup|2>*<around|(|M,\<psi\>|)>> which is a quantization of the
  Hamiltonian <math|h*<around|(|x,p|)>>. According to the canonical
  quantization philosophy we have to ensure that the quantized Hamiltonian
  becomes a self-adjoint operator in <math|L<rsup|2>*<around|(|M,\<psi\>|)>>.
  In order to fulfill this requirement we have to require that after
  quantization <math|T<rsub|\<xi\><rsub|a>><rsup|\<ast\>>> becomes the
  operator adjoint to <math|<frac|1|i>*\<xi\><rsub|a>-i*<around|(|\<xi\><rsub|a>,v|)>>
  in <math|L<rsup|2>*<around|(|M,\<psi\>|)>>. In terms of the local
  coordinates the operator formally adjoint to
  <math|<frac|1|i>*\<xi\><rsub|a>-i*<around|\<langle\>|\<xi\><rsub|a>,v|\<rangle\>>>
  takes the form

  <\equation>
    f\<mapsto\>i*<around*|(|-<frac|1|<sqrt|g>>*\<psi\><rsup|-1>*<frac|\<partial\>|\<partial\>*x<rsup|i>>*<around|(|\<xi\><rsub|a><rsup|i>*<sqrt|g>*\<psi\>*f|)>+<around|\<langle\>|\<xi\><rsub|a>,v|\<rangle\>>*f|)>=i*\<nabla\><rsub|\<xi\><rsub|a>><rsup|\<ast\>>*f
  </equation>

  where <math|g=<around|\||<math-up|det><nbsp>g<rsub|i*j>|\|>>, so a natural
  candidate for a quantized Hamiltonian is the self-adjoint operator
  <math|h<rsub|0>> defined by the expression

  <\equation>
    <label|qh1><frac|1|2>*<big|sum><rsub|a=1><rsup|n>\<nabla\><rsub|\<xi\><rsub|a>><rsup|\<ast\>>*\<nabla\><rsub|\<xi\><rsub|a>>.
  </equation>

  One straightforwardly verifies that, after applying reversely the
  correspondence principle according to which the operator
  <math|<frac|1|i>*<frac|\<partial\>|\<partial\>*x<rsup|i>>> becomes
  <math|p<rsub|i>>, and the multiplication operator by a function in
  <math|L<rsup|2>*<around|(|M,\<psi\>|)>> becomes this function in the
  classical limit, expression (<reference|qh1>) becomes Hamiltonian
  (<reference|hamM>) in the classical limit.

  Note that the operator of multiplication by <math|e<rsup|\<phi\>>> gives
  rise to a unitary equivalence <math|L<rsup|2>*<around|(|M,\<psi\>|)>\<rightarrow\>L<rsup|2>*<around|(|M,\<psi\>*e<rsup|-2*\<phi\>>|)>>,
  and the operator <math|h> in <math|L<rsup|2>*<around|(|M,\<psi\>*e<rsup|-2*\<phi\>>|)>>
  unitarily equivalent to <math|h<rsub|0>>

  <\equation>
    h=e<rsup|\<phi\>>*h<rsub|0>*e<rsup|-\<phi\>>
  </equation>

  , is defined using the expression

  <\equation>
    <label|expr>e<rsup|\<phi\>>*<frac|1|2>*<big|sum><rsub|a=1><rsup|n>\<nabla\><rsub|\<xi\><rsub|a>><rsup|\<ast\>>*\<nabla\><rsub|\<xi\><rsub|a>>*e<rsup|-\<phi\>>=<frac|1|2>*<big|sum><rsub|a=1><rsup|n>\<xi\><rsub|a><rsup|\<ast\>>*\<xi\><rsub|a>,
  </equation>

  where as above in local coordinates <math|\<xi\><rsub|a>=<big|sum><rsub|i=1><rsup|n>\<xi\><rsub|a><rsup|i>*<frac|\<partial\>|\<partial\>*x<rsup|i>>>,
  and <math|\<xi\><rsub|a><rsup|\<ast\>>> is the operator formally adjoint to
  <math|\<xi\><rsub|a>> with respect to the scalar product in
  <math|L<rsup|2>*<around|(|M,\<psi\>*e<rsup|-2*\<phi\>>|)>>.

  A formal definition of the self-adjoint operator <math|h> can be given
  using its bilinear form. Clearly, expression(<reference|expr>) defines a
  non-negative symmetric operator on <math|L<rsup|2>*<around|(|M,\<psi\>*e<rsup|-2*\<phi\>>|)>>,
  with the domain being the space <math|C<rsub|0><rsup|\<infty\>>> of smooth
  complex-valued compactly supported functions on <math|M>. Thus one can
  apply the Friedrichs extension method to define its self-adjoint extension
  (see <cite|RS2>, Theorem X.23). This yields the following statement.

  <\theorem>
    The non-negative bilinear form

    \ 

    <\equation>
      <around|(|f,f<rprime|'>|)><rsub|h>=<frac|1|2>*<big|sum><rsub|a=1><rsup|n><around|(|\<xi\><rsub|a>*f,\<xi\><rsub|a>*f<rprime|'>|)><rsub|\<psi\>*e<rsup|-2*\<phi\>>>
    </equation>

    with the domain being the space <math|C<rsub|0><rsup|\<infty\>>> of
    smooth complex-valued compactly supported functions on <math|M>, is
    closable on <math|L<rsup|2>*<around|(|M,\<psi\>*e<rsup|-2*\<phi\>>|)>>
    with a domain <math|D> and its closure defines a non-negative
    self-adjoint operator <math|h> on <math|L<rsup|2>*<around|(|M,\<psi\>*e<rsup|-2*\<phi\>>|)>>
    with a domain <math|D<around|(|h|)>>, so that

    <\equation>
      <around|(|f,f<rprime|'>|)><rsub|h>=<around|(|h*f,f<rprime|'>|)><rsub|\<psi\>*e<rsup|-2*\<phi\>>>
    </equation>

    \ for any <math|f\<in\>D<around|(|h|)>,f<rprime|'>\<in\>D>.

    Moreover, if the constant function <math|1> belongs to
    <math|L<rsup|2>*<around|(|M,\<psi\>*e<rsup|-2*\<phi\>>|)>> then <math|1>
    is an eigenfunction of the operator <math|h> with the lowest eigenvalue
    zero.

    For any smooth non-vanishing function <math|\<psi\>> on <math|M>,
    <math|\<psi\>\<in\>C<rsup|\<infty\>><around|(|M|)>>, the operator
    <math|h> is a quantization of Hamiltonian (<reference|hamM>) in the sense
    of canonical quantization.
  </theorem>

  The second part of the previous theorem ensures the existence of the lowest
  energy ground state for the operator <math|h>.

  <subsection|Application to the Yang\UMills Hamiltonian><label|YMhamquant>

  Now we are going to apply the idea of the previous section to quantize the
  reduced Yang\UMills Hamiltonian defined by formula (<reference|Hamiltred>)
  on the reduced phase space <math|\<mu\><rsup|-1><around|(|0|)>/\<cal-K\>\<simeq\>T*\<cal-D\>/\<cal-K\>>.
  Note that according to this formula <math|H<rsub|r*e*d>> is of the same
  type as the Hamiltonian <math|h*<around|(|x,p|)>> considered in the
  previous section with <math|\<phi\>=C*S<around|(|A|)>>. So informally,
  according to Proposition <reference|redstruct>, we should take
  <math|\<cal-D\>/\<cal-K\>> as <math|M> in the previous section. But the
  fact that <math|\<cal-D\>/\<cal-K\>> is infinite-dimensional now brings
  further difficulties.

  According to the philosophy of Section <reference|quantmod>, firstly we
  should try to find a measure with \Pdensity\Q which resembles
  <math|\<psi\>*e<rsup|-2*\<phi\>>> with <math|\<phi\>=C*S<around|(|A|)>> and
  an appropriate <math|\<psi\>>. The peculiarity of the infinite-dimensional
  case is that the existence of such measures is a very strong condition. In
  particular, all known measures of this kind are probability measures, so
  that the entire space has a finite volume usually normalized to one.
  Therefore <math|\<psi\>*e<rsup|-2*\<phi\>>> should rapidly decrease at
  infinity. As it can be easily seen this condition is not fulfilled if we
  choose <math|\<psi\>=1>. It is natural to use <math|\<psi\>=exp
  <around|(|-<frac|1|2>*<around|\<langle\>|G,G|\<rangle\>>|)>> and then

  <\equation>
    <label|ansatz>\<psi\>*e<rsup|-2*\<phi\>>=exp
    <around|(|-<frac|1|2>*<around|\<langle\>|G,G|\<rangle\>>-2*C*S<around|(|A|)>|)>.
  </equation>

  This functional is invariant under the action of the Lie algebra of the
  gauge group. The Chern\USimons functional is not invariant under the action
  of the gauge group itself, so functional (<reference|ansatz>) is not quite
  well defined on <math|\<cal-D\>/\<cal-K\>>. But one should not expect that
  a measure on an infinite-dimensional quotient space by an action of an
  infinite-dimensional group is induced by a measure on the original space
  invariant under the group action. This phenomenon is related to the fact
  that there are no even translation invariant measures on
  infinite-dimensional spaces. Therefore firstly we have to fix a model for
  <math|\<cal-D\>/\<cal-K\>> and then define a measure on it. Thus we only
  need to define a functional on the model for <math|\<cal-D\>/\<cal-K\>> the
  gradient of which coincides with that of <math|C*S<around|(|A|)>>. This is
  the only condition required by the correspondence principle. Note that the
  gradient of <math|C*S<around|(|A|)>> is well defined as a vector field on
  <math|\<cal-D\>/\<cal-K\>>.

  Even taking into account the discussion above it turns out that a measure
  with a \Pdensity\Q which resembles <math|exp
  <around|(|-<frac|1|2>*<around|\<langle\>|G,G|\<rangle\>>-2*C*S<around|(|A|)>|)>>
  still does not exist even in the abelian case, and a certain
  \Prenormalization\Q is required to define it. We shall construct this
  measure now in the abelian case when <math|K=U<around|(|1|)>>.

  So from now on we assume that <math|K=U<around|(|1|)>>. We identify the
  corresponding Lie algebra with <math|\<bbb-R\>>. Choose a model
  <math|\<cal-D\><rsub|0>> for <math|\<cal-D\>/\<cal-K\>> being the space of
  the elements <math|A> of <math|\<cal-D\>> which satisfy the condition
  <with|font-family|rm|div><math|A=0>, where
  <with|font-family|rm|div><math|=<math-up|div><rsub|0>>. Note that in the
  abelian case <math|C*S<around|(|A|)>> is gauge invariant and gives rise to
  a functional on <math|\<cal-D\>/\<cal-K\>>. Its restriction to
  <math|\<cal-D\><rsub|0>> will be denoted by the same letter. All
  functionals of <math|A> below will be considered as functionals on
  <math|\<cal-D\><rsub|0>>.

  In the abelian case we have

  <\equation>
    <label|exp1>exp <around|(|-<frac|1|2>*<around|\<langle\>|G,G|\<rangle\>>-2*C*S<around|(|A|)>|)>=exp
    <around|(|-<frac|1|2>|\<langle\>>\<ast\>d*A,\<ast\>d*A\<rangle\>-\<langle\>\<ast\>d*A,A\<rangle\>),
  </equation>

  and this function is the exponent of an expression which is quadratic in
  <math|A> which means that the measure that we are going to construct is
  likely to be Gaussian. To define such a measure we have to ensure that the
  expression in the exponent is negative definite which is not true for
  (<reference|exp1>). In order to fulfill this condition we choose
  <math|\<psi\>=exp <around|(|-<frac|1|2*c<rsup|2>>*<around|\<langle\>|G,G|\<rangle\>>-<frac|1|2>*<around|(|c<rsup|2>+m|)>*<around|\<langle\>|A,A|\<rangle\>>|)>>,
  <math|A\<in\>\<cal-D\><rsub|0>>, where <math|c,m\<in\>\<bbb-R\>> are
  constants, <math|c\<neq\>0>, and <math|m\<gtr\>0>. Then

  <math|>

  <\equation>
    <label|exp2><tabular|<tformat|<table|<row|<cell|\<psi\>*e<rsup|-2*\<phi\>>>|<cell|=e<rsup|-<frac|<around|\<langle\>|G,G|\<rangle\>>|2*c<rsup|2>>*-2*C*S<around|(|A|)>-<frac|<around|(|c<rsup|2>+m|)>*<around|\<langle\>|A,A|\<rangle\>>|2>>>>|<row|<cell|>|<cell|=exp
    <around|(|-<frac|\<langle\>\<ast\>d*A,\<ast\>d*A\<rangle\>|2*c<rsup|2>>|\<nobracket\>>-\<langle\>\<ast\>d*A,A\<rangle\>-<frac|<around|(|c<rsup|2>+m|)>*<around|\<langle\>|A,A|\<rangle\>>|2>*)>>|<row|<cell|>|<cell|=exp
    <around|(|-<frac|1|2>*<around|(|\<Lambda\>*A,A|)>|)>>>>>>
  </equation>

  where

  <\equation>
    \<Lambda\>=T<rsup|2>+mId
  </equation>

  , and

  <\equation>
    T=<frac|1|c><math-up|curl>+cId
  </equation>

  and

  <\equation>
    <text|curl>=\<ast\>d
  </equation>

  \ are symmetric operators on <math|\<cal-D\><rsub|0>> with respect to the
  scalar product <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>>.

  Recall that Gaussian measures are actually defined on spaces dual to
  nuclear spaces (see e.g. <cite|Ob>). This forces us to enlarge
  <math|\<cal-D\><rsub|0>> and to replace it with the nuclear space
  <math|\<cal-S\><rsub|0>> which consists of elements <math|A> of
  <math|\<Omega\><rsup|1><around|(|\<bbb-R\><rsup|3>,\<frak-k\>|)>=\<Omega\><rsup|1><around|(|\<bbb-R\><rsup|3>|)>>
  the components of which with respect to the fixed Cartesian coordinate
  system belong to the Schwartz space and which satisfy the condition
  <with|font-family|rm|div><math|A=0>, the topology on
  <math|\<cal-S\><rsub|0>> being induced by that of the Schwartz space. Let
  <math|\<cal-S\><rsub|0><rsup|\<ast\>>> be the dual space.

  According to the Bochner\UMinlos theorem (Theorem 1.5.2 in <cite|Ob>)
  Gaussian measures on <math|\<cal-S\><rsub|0><rsup|\<ast\>>> are Fourier
  transforms of characteristic functionals on <math|\<cal-S\><rsub|0>>, and
  the Gaussian measure with \Pdensity\Q which resembles <math|exp
  <around|(|-<frac|1|2>*<around|(|\<Lambda\><rsup|>*A,A|)>|)>> should have
  the characteristic functional

  <\equation>
    C<around|(|A|)>=e<rsup|-<frac|*<around|\<langle\>|<frac|*A|\<Lambda\>>,A|\<rangle\>>|2>>
  </equation>

  .

  <\lemma>
    <label|charf><math|C<around|(|A|)>>, <math|A\<in\>\<cal-S\><rsub|0>> is a
    characteristic functional, i.e.

    <\enumerate>
      <item><math|C<around|(|A|)>>, <math|A\<in\>\<cal-S\><rsub|0>> is
      positive definite: for any <math|\<alpha\><rsub|1>,\<ldots\>,\<alpha\><rsub|n>\<in\>\<bbb-C\>>,
      <math|\<xi\><rsub|1>,\<ldots\>,\<xi\><rsub|n>\<in\>\<cal-S\><rsub|0>>
      we have <math|<big|sum><rsub|i,j=1><rsup|n>\<alpha\><rsub|i>*<wide|\<alpha\>|\<bar\>><rsub|j>*C*<around|(|\<xi\><rsub|i>-\<xi\><rsub|j>|)>\<geq\>0>;

      <item><math|C<around|(|A|)>>, <math|A\<in\>\<cal-S\><rsub|0>> is a
      continuous functional on <math|\<cal-S\><rsub|0>>;

      <item><math|C<around|(|0|)>=1>.
    </enumerate>
  </lemma>

  To justify this claim we shall need some facts about the spectral
  decomposition for the operator curl (see <cite|BS3>, Ÿ8.6, Ex. 4).

  Let <math|\<cal-H\><rsup|i>>, <math|i=0,1> be the completion of the space
  <math|\<Omega\><rsup|i><rsub|c><around|(|\<bbb-R\><rsup|3>,<k>|)>=\<Omega\><rsup|i><rsub|c><around|(|\<bbb-R\><rsup|3>|)>>
  with respect to scalar product (<reference|prod>). Here we assume that
  <math|<k>> is identified with <math|\<bbb-R\>> and the Killing form is just
  minus the product of real numbers. According to Lemma 8 (i) in <cite|SS>
  <with|font-family|rm|div><math|:\<Omega\><rsup|1><rsub|c><around|(|\<bbb-R\><rsup|3>|)>\<rightarrow\>\<cal-H\><rsup|0>>
  is a closable operator. We denote its closure by the same symbol,
  <with|font-family|rm|div><math|:\<cal-H\><rsup|1>\<rightarrow\>\<cal-H\><rsup|0>>.

  <with|font-family|rm|Ker<nbsp>div><math|\<subset\>\<cal-H\><rsup|1>> is
  naturally a Hilbert space with the scalar product inherited from
  <math|\<cal-H\><rsup|1>>, and, in fact, this Hilbert space is rigged.
  Namely,

  <\equation>
    <label|GG>\<cal-S\><rsub|0>\<subset\><math-up|Ker<nbsp>div>\<subset\>\<cal-S\><rsub|0><rsup|\<ast\>>
  </equation>

  is the corresponding Gelfand\UGraev triple.

  Let <math|\<cal-H\><rsup|i><rsub|\<bbb-C\>>>, <math|i=0,1>,
  <with|font-family|rm|Ker<nbsp>div><rsub|<math|\<bbb-C\>>> and
  <math|\<cal-S\><rsub|0><rsup|\<bbb-C\>>> be the complexifications of
  <math|\<cal-H\><rsup|i>>, <math|i=0,1>, <with|font-family|rm|Ker<nbsp>div>
  and <math|\<cal-S\><rsub|0>>, respectively. We can identify
  <math|\<cal-H\><rsup|1><rsub|\<bbb-C\>>> with the Lebesgue space
  <math|L<rsup|2>*<around|(|\<bbb-R\><rsup|3>,\<bbb-C\><rsup|3>|)>> of square
  integrable functions with values in <math|\<bbb-C\><rsup|3>> equipped with
  the scalar product induced from <math|\<cal-H\><rsup|1><rsub|\<bbb-C\>>>.
  The componentwise Fourier transform <math|F> provides an isomorphism of
  <math|L<rsup|2>*<around|(|\<bbb-R\><rsup|3>,\<bbb-C\><rsup|3>|)>> onto
  itself under which <with|font-family|rm|Ker<nbsp>div><rsub|<math|\<bbb-C\>>>
  is mapped onto the subspace <math|F<around|(|<math-up|Ker<nbsp>div><rsub|\<bbb-C\>>|)>>
  in <math|L<rsup|2>*<around|(|\<bbb-R\><rsup|3>,\<bbb-C\><rsup|3>|)>> which
  consists of <math|\<bbb-C\><rsup|3>>-valued functions
  <math|f<around|(|k|)>\<in\>L<rsup|2>*<around|(|\<bbb-R\><rsup|3>,\<bbb-C\><rsup|3>|)>>,
  <math|k\<in\>\<bbb-R\><rsup|3>> satisfying the condition
  <math|k\<cdot\>f<around|(|k|)>=0>, where <math|\<cdot\>> is the standard
  scalar product in <math|\<bbb-C\><rsup|3>> induced by the Cartesian product
  in <math|\<bbb-R\><rsup|3>> fixed above. Also the Fourier transform maps
  <math|\<cal-S\><rsub|0><rsup|\<bbb-C\>>\<subset\>\<cal-H\><rsup|1><rsub|\<bbb-C\>>>
  isomorphically onto the subspace <math|F<around|(|\<cal-S\><rsub|0><rsup|\<bbb-C\>>|)>>
  of <math|\<bbb-C\><rsup|3>>-valued functions
  <math|f<around|(|k|)>\<in\>L<rsup|2>*<around|(|\<bbb-R\><rsup|3>,\<bbb-C\><rsup|3>|)>>,
  <math|k\<in\>\<bbb-R\><rsup|3>> with components from the complex Schwartz
  space and satisfying the condition <math|k\<cdot\>f<around|(|k|)>=0>.
  <with|font-family|rm|Ker<nbsp>div><rsub|<math|\<bbb-C\>>> is an invariant
  subspace for the natural extension of the operator curl to
  <math|\<cal-H\><rsup|1><rsub|\<bbb-C\>>>. Note that the action of curl on
  <math|\<cal-H\><rsup|1><rsub|\<bbb-C\>>> preserves <math|\<cal-H\><rsup|1>>
  and <with|font-family|rm|Ker<nbsp>div>, i.e. curl is a real operator and
  <with|font-family|rm|Ker<nbsp>div> is an invariant subspace for it.
  <with|font-family|rm|curl><math|:<math-up|Ker<nbsp>div><rsub|\<bbb-C\>>\<rightarrow\><math-up|Ker<nbsp>div><rsub|\<bbb-C\>>>
  is a self-adjoint operator with the natural domain
  <math|<around|{|v\<in\><math-up|Ker<nbsp>div><rsub|\<bbb-C\>>:<math-up|curl>v\<in\><math-up|Ker<nbsp>div><rsub|\<bbb-C\>>|}>>.

  Under the isomorphism <math|F> the operator curl acting on
  <math|\<cal-H\><rsup|1><rsub|\<bbb-C\>>\<simeq\>L<rsup|2>*<around|(|\<bbb-R\><rsup|3>,\<bbb-C\><rsup|3>|)>>
  becomes the operator <math|F<math-up|curl>F<rsup|-1>> acting by the cross
  vector product by <math|i*k> on elements of
  <math|f<around|(|k|)>\<in\>L<rsup|2>*<around|(|\<bbb-R\><rsup|3>,\<bbb-C\><rsup|3>|)>>.
  For each <math|k\<in\>\<bbb-R\><rsup|3>> this operator acts of
  <math|f<around|(|k|)>\<in\>\<bbb-C\><rsup|3>> by the matrix

  <\equation>
    <label|cr><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|0ln>|<table|<row|<cell|0>|<cell|-i*k<rsub|3>>|<cell|i*k<rsub|2>>>|<row|<cell|i*k<rsub|3>>|<cell|0>|<cell|-i*k<rsub|1>>>|<row|<cell|-i*k<rsub|2>>|<cell|i*k<rsub|1>>|<cell|0>>>>>|)>
  </equation>

  which is nothing but the symbol of the operator curl.

  <math|F<around|(|<math-up|Ker<nbsp>div><rsub|\<bbb-C\>>|)>> is an invariant
  subspace for the operator <math|F<math-up|curl>F<rsup|-1>>. For each fixed
  <math|k> the eigenvalues of matrix (<reference|cr>) restricted to the
  subspace in <math|\<bbb-C\><rsup|3>> which consists of elements
  <math|v\<in\>\<bbb-C\><rsup|3>> satisfying the condition
  <math|k\<cdot\>v=0> are <math|\<pm\><around|\||k|\|>>. According to
  <cite|BS3>, Ÿ8.6, Ex. 4 this implies that the spectrum of the operator curl
  is absolutely continuous, <math|\<sigma\><around|(|<math-up|curl>|)>=\<sigma\><rsub|a*c><around|(|<math-up|curl>|)>=\<bbb-R\>>,
  and hence curl has no eigenvectors in the usual sense. But it has a
  complete basis of generalized eigenvectors (see, for instance, <cite|GV>).

  Namely, this operator can be easily diagonalized by means of the Fourier
  transform (see <cite|BS3>, Ch. 8, Ÿ8.6, Ex. 4). The generalized complex
  eigenvectors corresponding to the generalized eigenvalues
  <math|\<pm\><around|\||k|\|>>, <math|k\<in\>\<bbb-R\><rsup|3>\<setminus\><around|{|0|}>>,
  can be chosen, for instance, in the form

  <\equation>
    <label|roteigen><frac|1|<sqrt|2>*<around|(|2*\<pi\>|)><rsup|<frac|3|2>>>*e<rsup|i*k\<cdot\>x>*<around|(|\<theta\><rsub|1><around|(|k|)>\<pm\>i*\<theta\><rsub|2><around|(|k|)>|)>,
  </equation>

  where <math|\<theta\><rsub|1,2><around|(|k|)>> are 1-forms on
  <math|\<bbb-R\><rsup|3>> dual to orthonormal vectors
  <math|e<rsub|1,2><around|(|k|)>>, with respect to the fixed Cartesian
  scalar product, such that for every <math|k\<neq\>0>
  <math|<frac|k|<around|\||k|\|>>,e<rsub|1><around|(|k|)>,e<rsub|2><around|(|k|)>>
  is an orthonormal basis in <math|\<bbb-R\><rsup|3>>,
  <math|<frac|k|<around|\||k|\|>>\<times\>e<rsub|1><around|(|k|)>=e<rsub|2><around|(|k|)>>
  (vector product) and <math|e<rsub|1,2><around|(|k|)>> smoothly depend on
  <math|k\<in\>\<bbb-R\><rsup|3>\<setminus\><around|{|0|}>>.

  Since the operator <with|font-family|rm|curl> sends real-valued functions
  to real valued functions one can also find real generalized eigenvectors
  <math|e<rsub|\<pm\>><around|(|k|)>\<in\>\<cal-S\><rsub|0><rsup|\<ast\>>>
  corresponding to <math|\<pm\><around|\||k|\|>>,
  <math|k\<in\>\<bbb-R\><rsup|3>\<setminus\><around|{|0|}>>.

  The vectors <math|e<rsub|\<pm\>><around|(|k|)>> are generalized
  eigenvectors for the operator <math|<math-up|curl>> in the sense that

  <\equation>
    <label|eigen><around|\<langle\>|e<rsub|\<pm\>><around|(|k|)>,<math-up|curl><nbsp>\<omega\>|\<rangle\>>=\<pm\><around|\||k|\|><around|\<langle\>|e<rsub|\<pm\>><around|(|k|)>,\<omega\>|\<rangle\>><nbsp><with|math-font-family|rm|for<nbsp>any><nbsp>\<omega\>\<in\>\<cal-S\><rsub|0>.
  </equation>

  Note also that <math|\<cal-S\><rsub|0>> is dense in
  <math|<math-up|Ker><nbsp><math-up|div>>.

  <with|font-shape|italic|Proof of Lemma <reference|charf>.> Firstly we show
  that <math|\<Lambda\><rsup|-1>:\<cal-S\><rsub|0>\<rightarrow\>\<cal-S\><rsub|0>>
  is a continuous operator. The easiest way to see this is to observe that
  according to the results on the eigenvalues of matrix (<reference|cr>)
  mentioned above the eigenvalues of the symbol of the operator
  <math|\<Lambda\>> acting for each fixed <math|k> on the subspace in
  <math|\<bbb-C\><rsup|3>> which consists of elements
  <math|v\<in\>\<bbb-C\><rsup|3>> satisfying the condition
  <math|k\<cdot\>v=0> are <math|<around|(|\<pm\><frac|1|c>\|k\|+c|)><rsup|2>+m\<geq\>m\<gtr\>0>.
  Therefore the inverse to the symbol is well-defined for each <math|k>, the
  entries of the inverse to the symbol are smooth and bounded (in fact they
  are rational functions of the components of <math|k> with respect to the
  orthonormal basis in <math|\<bbb-R\><rsup|3>>), and hence it gives rise to
  a bounded operator on <math|F<around|(|\<cal-S\><rsub|0><rsup|\<bbb-C\>>|)>>.
  Applying the inverse to the Fourier transform and recalling that
  <math|\<Lambda\>>, and hence <math|\<Lambda\><rsup|-1>>, preserve
  <math|\<cal-S\><rsub|0>\<subset\>\<cal-S\><rsub|0><rsup|\<bbb-C\>>> we
  deduce that <math|\<Lambda\><rsup|-1>:\<cal-S\><rsub|0>\<rightarrow\>\<cal-S\><rsub|0>>
  is a continuous operator.

  Recall also that <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>>
  is a continuous bilinear form on <math|\<cal-S\><rsub|0>>. Therefore the
  functional

  <\equation>
    C<around|(|A|)>=exp <around|(|-<frac|1|2>*<around|\<langle\>|\<Lambda\><rsup|-1>*A,A|\<rangle\>>|)>
  </equation>

  \ is continuous. Obviously, <math|C<around|(|0|)>=1>. Finally we have to
  check that <math|C<around|(|A|)>> is positive definite. Note that

  <\equation>
    <around|\<langle\>|\<Lambda\>\<cdot\>,\<cdot\>|\<rangle\>>=<around|\<langle\>|T\<cdot\>,T\<cdot\><around|\<rangle\>|+m|\<langle\>>\<cdot\>,\<cdot\>|\<rangle\>>
  </equation>

  . Therefore <math|<around|\<langle\>|\<Lambda\>\<cdot\>,\<cdot\>|\<rangle\>>>
  is a positive definite bilinear form on <math|\<cal-S\><rsub|0>>, and
  <math|\<Lambda\>> is a positive operator on
  <with|font-family|rm|Ker<nbsp>div>. Thus <math|\<Lambda\><rsup|-1>> is a
  positive operator on <with|font-family|rm|Ker<nbsp>div> as well, and
  <math|<around|\<langle\>|\<Lambda\><rsup|-1>\<cdot\>,\<cdot\>|\<rangle\>>>
  is a positive definite bilinear form on <math|\<cal-S\><rsub|0>>.

  Note that the results on the spectrum of the operator curl above imply that
  the spectrum of the real operator <math|\<Lambda\>> acting on the
  complexification of <with|font-family|rm|Ker<nbsp>div> is continuous and
  coincides with the set <math|<around|[|m,\<infty\>|)>>, and therefore the
  spectrum of the real operator <math|\<Lambda\><rsup|-1>> acting on the
  complexification of <with|font-family|rm|Ker<nbsp>div> is continuous and
  coincides with the set <math|<around|[|0,<frac|1|m>|]>>. We deduce that the
  bilinear form <math|<around|\<langle\>|\<Lambda\><rsup|-1>\<cdot\>,\<cdot\>|\<rangle\>>>
  on <math|\<cal-S\><rsub|0>> is non-degenerate and defines the structure of
  a pre-Hilbert space on <math|\<cal-S\><rsub|0>>.

  Now by Lemma 2.1.1 in <cite|Ob> <math|C<around|(|A|)>> is positive
  definite, i.e. for any <math|\<alpha\><rsub|1>,\<ldots\>,\<alpha\><rsub|n>\<in\>\<bbb-C\>>,
  <math|\<xi\><rsub|1>,\<ldots\>,\<xi\><rsub|n>\<in\>\<cal-S\><rsub|0>> we
  have

  <\equation>
    <big|sum><rsub|i,j=1><rsup|n>\<alpha\><rsub|i>*<wide|\<alpha\>|\<bar\>><rsub|j>*C*<around|(|\<xi\><rsub|i>-\<xi\><rsub|j>|)>\<geq\>0
  </equation>

  Thus <math|C<around|(|A|)>>, <math|A\<in\>\<cal-S\><rsub|0>> is a positive
  definite continuous functional on <math|\<cal-S\><rsub|0>> satisfying
  <math|C<around|(|0|)>=1>, i.e. it is a characteristic functional.

  <math|\<Box\>>

  Using the Bochner\UMinlos theorem (Theorem 1.5.2 in <cite|Ob>) we
  immediately deduce the following corollary of Lemma <reference|charf>.

  <\corollary>
    There is a probability measure <math|\<mu\>> on
    <math|\<cal-S\><rsub|0><rsup|\<ast\>>> such that <math|C<around|(|A|)>>
    is the Fourier transform of <math|\<mu\>>, i.e.

    <\equation>
      C<around|(|A|)>=<big|int><rsub|\<cal-S\><rsub|0><rsup|\<ast\>>>e<rsup|i*<around|\<langle\>|x,A|\<rangle\>>>*d*\<mu\><around|(|x|)>
    </equation>

    where <math|<around|\<langle\>|x,A|\<rangle\>>> stands for the pairing of
    <math|x\<in\>\<cal-S\><rsub|0><rsup|\<ast\>>> and
    <math|A\<in\>\<cal-S\><rsub|0>>.
  </corollary>

  Let <math|\<cal-H\>=L<rsup|2>*<around|(|\<cal-S\><rsub|0><rsup|\<ast\>>,\<mu\>|)>>
  be the usual complex Lebesgue space associated to the measure
  <math|\<mu\>>. Let <math|\<xi\><rsub|a>>, <math|a\<in\>\<bbb-N\>> be an
  orthonormal basis of <with|font-family|rm|Ker<nbsp>div> which consists of
  elements from <math|\<cal-S\><rsub|0>>. For any
  <math|\<xi\>\<in\>\<cal-S\><rsub|0><rsup|\<ast\>>> denote by
  <math|D<rsub|\<xi\>>> the Gateaux derivative for functions on
  <math|\<cal-S\><rsub|0><rsup|\<ast\>>>, i.e. for
  <math|F:\<cal-S\><rsub|0><rsup|\<ast\>>\<rightarrow\>\<bbb-C\>>

  <\equation>
    D<rsub|\<xi\>>*F<around|(|x|)>=<frac|d|d*t>\|<rsub|t=0>F*<around|(|x+t*\<xi\>|)>
  </equation>

  Let <math|D<rsup|\<ast\>><rsub|\<xi\>>> be the operator formally adjoint to
  <math|D<rsub|\<xi\>>> in <math|\<cal-H\>>.

  Any <math|\<xi\>\<in\>\<cal-S\><rsub|0>> defines a linear function on
  <math|\<cal-S\><rsub|0><rsup|\<ast\>>>,
  <math|X<rsub|\<xi\>><around|(|x|)>=<around|\<langle\>|x,\<xi\>|\<rangle\>>>.
  Let <math|\<cal-P\>> be the algebra of functions on
  <math|\<cal-S\><rsub|0><rsup|\<ast\>>> generated by complex polynomials in
  variables <math|X<rsub|\<xi\>>>, <math|\<xi\>\<in\>\<cal-S\><rsub|0>>.

  According to the philosophy developed in the previous section (see formula
  (<reference|expr>)) the operator defined by the expression

  <\equation>
    <label|YMexp>H=<frac|1|2>*<big|sum><rsub|a=1><rsup|\<infty\>>D<rsup|\<ast\>><rsub|\<xi\><rsub|a>>*D<rsub|\<xi\><rsub|a>>
  </equation>

  can be regarded as a quantization of the Yang\UMills Hamiltonian
  <math|H<rsub|r*e*d>>. Here each <math|\<xi\><rsub|a>\<in\>\<cal-S\><rsub|0>>
  is regarded as an element of <math|\<cal-S\><rsub|0><rsup|\<ast\>>> via
  imbedding (<reference|GG>).

  <\proposition>
    Expression (<reference|YMexp>) does not depend on the choice of the basis
    <math|\<xi\><rsub|a>>, <math|a\<in\>\<bbb-N\>> and defines an operator in
    <math|\<cal-H\>> with domain <math|\<cal-P\>> which is essentially
    self-adjoint. We denote its self-adjoint closure by the same letter. The
    self-adjoint operator <math|H:\<cal-H\>\<rightarrow\>\<cal-H\>> defined
    this way can be regarded as a quantization of the Yang\UMills Hamiltonian
    <math|H<rsub|r*e*d>>.
  </proposition>

  <pr>Similarly to the discussion in <cite|Hid>, Ch. 11, page 408, one can
  see that expression (<reference|YMexp>) does not depend on the choice of
  the basis <math|\<xi\><rsub|a>>, <math|a\<in\>\<bbb-N\>> and using the
  arguments from the proof of Theorem 11.1 in <cite|Hid> verbatim one can
  immediately deduce that this expression defines an operator in
  <math|\<cal-H\>> with domain <math|\<cal-P\>> which is essentially
  self-adjoint.

  <math|\<Box\>>

  The spectral decomposition for the operator <math|H> can be performed in
  the usual way using a Fock space presentation for <math|\<cal-H\>> which
  can be constructed as follows.

  Recall that the generalized Fourier transform

  <\equation>
    \<Phi\>:<math-up|Ker><nbsp><math-up|div>\<rightarrow\>L<rsup|2><rsub|+><around|(|\<bbb-R\><rsup|3>|)><above|+|\<cdot\>>L<rsup|2><rsub|-><around|(|\<bbb-R\><rsup|3>|)>
  </equation>

  where <math|L<rsup|2><rsub|\<pm\>><around|(|\<bbb-R\><rsup|3>|)>> are
  copies of the usual <math|L<rsup|2><around|(|\<bbb-R\><rsup|3>|)>>,
  associated to the basis <math|e<rsub|\<pm\>><around|(|k|)>> of generalized
  eigenvectors is given in terms of components by

  <\equation>
    <label|fouriero><tabular|<tformat|<table|<row|<cell|\<Phi\><around|(|\<omega\>|)><rsub|\<pm\>><around|(|k|)>>|<cell|=-L<rsup|2>*<text|->lim<rsub|R\<rightarrow\>\<infty\>>
    <big|int><rsub|<around|\||x|\|>\<leq\>R>\<ast\><around|(|\<omega\>\<wedge\>\<ast\>e<rsub|\<pm\>><around|(|k|)>|)>*d<rsup|3>*x>>|<row|<cell|>|<cell|=\<Phi\><around|(|\<omega\>|)><rsub|+><above|+|\<cdot\>>\<Phi\><around|(|\<omega\>|)><rsub|->\<forall\>\<Phi\><around|(|\<omega\>|)><rsub|\<pm\>>\<in\>L<rsup|2><rsub|\<pm\>><around|(|\<bbb-R\><rsup|3>|)>>>>>>
  </equation>

  Here <math|L<rsup|2>*<text|->lim> stands for the limit with respect to the
  <math|L<rsup|2><around|(|\<bbb-R\><rsup|3>|)>>-norm.

  For <math|\<omega\>\<in\>\<cal-S\><rsub|0>> we can also write

  <\equation>
    <label|fouriero1><tabular|<tformat|<table|<row|<cell|\<Phi\><around|(|\<omega\>|)><rsub|\<pm\>><around|(|k|)>>|<cell|=-lim<rsub|R\<rightarrow\>\<infty\>>
    <big|int><rsub|<around|\||x|\|>\<leq\>R>\<ast\><around|(|\<omega\>\<wedge\>\<ast\>e<rsub|\<pm\>><around|(|k|)>|)>*d<rsup|3>*x>>|<row|<cell|>|<cell|=-lim<rsub|R\<rightarrow\>\<infty\>>
    <big|int><rsub|\<bbb-R\><rsup|3>>\<ast\><around|(|\<omega\>\<wedge\>\<ast\>\<chi\><rsub|R><around|(|x|)>*e<rsub|\<pm\>><around|(|k|)>|)>*d<rsup|3>*x>>|<row|<cell|>|<cell|=<around|\<langle\>|\<omega\>,e<rsub|\<pm\>><around|(|k|)>|\<rangle\>>>>>>>
  </equation>

  where <math|\<chi\><rsub|R><around|(|x|)>> is the characteristic function
  of the ball of radius <math|R>.

  Since the usual Fourier transform is unitary, one can normalize the
  generalized eigenvectors <math|e<rsub|\<pm\>><around|(|k|)>> in such a way
  that <math|\<Phi\>> is also a unitary map. We shall always assume that such
  normalization is fixed.

  Using the generalized eigenvectors <math|e<rsub|\<pm\>><around|(|k|)>> and
  unitarity of <math|\<Phi\>> operator (<reference|YMexp>) can be rewritten
  in the following form

  <\equation>
    <label|YMsym>H=<frac|1|2>*<big|sum><rsub|\<varepsilon\>=\<pm\>><big|int><rsub|\<bbb-R\><rsup|3>>*D<rsup|\<ast\>><rsub|e<rsub|\<varepsilon\>><around|(|k|)>>*D<rsub|e<rsub|\<varepsilon\>><around|(|k|)>>d<rsup|3>*k
  </equation>

  Note that by Proposition 4.3.11 in <cite|Ob> for
  <math|\<xi\>,\<eta\>\<in\>\<cal-S\><rsub|0>\<subset\>\<cal-S\><rsub|0><rsup|\<ast\>>>
  the operators <math|D<rsub|\<xi\>>,D<rsub|\<eta\>><rsup|\<ast\>>> satisfy
  the following commutation relations

  <\equation>
    <label|commrel><around|[|D<rsub|\<xi\>>,D<rsup|\<ast\>><rsub|\<eta\>>|]>=<around|(|\<Lambda\>*\<xi\>,\<eta\>|)>,<around|[|D<rsub|\<xi\>>,D<rsub|\<eta\>>|]>=<around|[|D<rsub|\<xi\>><rsup|\<ast\>>,D<rsup|\<ast\>><rsub|\<eta\>>|]>=0.
  </equation>

  By definition the operator <math|\<Lambda\>> acts on the generalized
  eigenvectors <math|e<rsub|\<varepsilon\>><around|(|k|)>> as follows
  <math|\<Lambda\>*e<rsub|\<varepsilon\>><around|(|k|)>=<around|(|<around|(|<frac|1|c>*\<varepsilon\>\|k\|+c|)><rsup|2>+m|)>*e<rsub|\<varepsilon\>><around|(|k|)>>.

  The last two observations imply that one can establish a Hilbert space
  isomorphism between <math|\<cal-H\>> and a Fock space as follows (see
  <cite|Ber>, Ch. 1, <cite|Ob>, Theorem 2.3.5).

  Let <math|H<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>>
  be the space of complex-valued symmetric functions
  <math|f*<around|(|k<rsub|1>,\<ldots\>,k<rsub|n>|)>> of <math|n> variables
  <math|k<rsub|i>\<in\>\<bbb-R\><rsup|3>>, <math|i=1,\<ldots\>,n> such that

  <\equation>
    <around*|\||f|\|><rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>><rsup|2>=<big|int><rsub|<around|(|\<bbb-R\><rsup|3>|)><rsup|n>><around|\||f*<around|(|k<rsub|1>,\<ldots\>,k<rsub|n>|)>|\|><rsup|2>*<big|prod><rsub|i=1><rsup|n><around|(|<around|(|\<varepsilon\><rsub|i>*<frac|1|c>\|k<rsub|i>\|+c|)><rsup|2>+m|)>*d*k<rsub|1>*\<ldots\>*d*k<rsub|n>\<less\>\<infty\>
  </equation>

  <math|H<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>> is a
  Hilbert space with the scalar product

  <\equation>
    <around|(|f,g|)><rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>=<big|int><rsub|<around|(|\<bbb-R\><rsup|3>|)><rsup|n>>f*<around|(|k<rsub|1>,\<ldots\>,k<rsub|n>|)><wide|g*<around|(|k<rsub|1>,\<ldots\>,k<rsub|n>|)>|\<bar\>><big|prod><rsub|i=1><rsup|n><around|(|<around|(|\<varepsilon\><rsub|i>*<frac|1|c>\|k<rsub|i>\|+c|)><rsup|2>+m|)>*d*k<rsub|1>*\<ldots\>*d*k<rsub|n>
  </equation>

  Let <math|\<cal-F\>> be the space of all sequences
  <math|<around|(|f<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>|)><rsub|n=0><rsup|\<infty\>>>,
  <math|f<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>\<in\>H<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>>
  such that

  <\equation>
    <big|sum><rsub|n=0><rsup|\<infty\>><big|sum><rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>=\<pm\>><around*|\||f<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>|\|><rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>><rsup|2>\<less\>\<infty\>
  </equation>

  where we assume that for <math|n=0> <math|H<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>=\<bbb-C\>>
  with the usual complex number scalar product and norm.

  <math|\<cal-F\>> is a Hilbert space with the scalar product induced from

  <\equation>
    <big|oplus><rsub|n=0><rsup|\<infty\>><big|oplus><rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>=\<pm\>>H<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>
  </equation>

  The following result is the standard Wiener\UItô\USegal isomorphism between
  <math|\<cal-F\>> and <math|\<cal-H\>> (see <cite|Ob>, Theorem 2.3.5,
  <cite|Ber>, Ch. 1).

  <\theorem>
    <label|FTR>The map <math|\<cal-F\>\<rightarrow\>\<cal-H\>>,

    <\equation>
      <around|(|f<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>|)><rsub|n=0><rsup|\<infty\>>\<mapsto\><big|sum><rsub|n=0><rsup|\<infty\>><big|sum><rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>=\<pm\>><big|int><rsub|<around|(|\<bbb-R\><rsup|3>|)><rsup|n>>*f<rsub|\<varepsilon\><rsub|1>,\<ldots\>,\<varepsilon\><rsub|n>>*D<rsub|e<rsub|\<varepsilon\><rsub|1>><around|(|k<rsub|1>|)>><rsup|\<ast\>>*\<ldots\>*D<rsup|\<ast\>><rsub|e<rsub|\<varepsilon\><rsub|n>><around|(|k<rsub|n>|)>>*1d*k<rsub|1>*\<ldots\>*d*k<rsub|n>
    </equation>

    is a well-defined Hilbert space isomorphism.
  </theorem>

  <math|D<rsub|e<rsub|\<varepsilon\><rsub|1>><around|(|k<rsub|1>|)>><rsup|\<ast\>>*\<ldots\>*D<rsup|\<ast\>><rsub|e<rsub|\<varepsilon\><rsub|n>><around|(|k<rsub|n>|)>>*1>
  can be regarded as elements of a space of generalized functionals on
  <math|\<cal-S\><rsub|0><rsup|\<ast\>>>. We are not going to define this
  space here (see e.g. <cite|Hid>, Ch. 3, 4).

  Commutation relations (<reference|commrel>), formula (<reference|YMsym>)
  for <math|H> and the unitarity of the generalized Fourier transform
  <math|\<Phi\>> imply that the elements <math|D<rsub|e<rsub|\<varepsilon\><rsub|1>><around|(|k<rsub|1>|)>><rsup|\<ast\>>*\<ldots\>*D<rsup|\<ast\>><rsub|e<rsub|\<varepsilon\><rsub|n>><around|(|k<rsub|n>|)>>*1>
  and the constant function <math|1> are the generalized eigenvectors of the
  operator <math|H>. Namely, at least formally, we have

  <\equation>
    <label|geneigen>H*D<rsub|e<rsub|\<varepsilon\><rsub|1>><around|(|k<rsub|1>|)>><rsup|\<ast\>>*\<ldots\>*D<rsup|\<ast\>><rsub|e<rsub|\<varepsilon\><rsub|n>><around|(|k<rsub|n>|)>>*1=<frac|1|2>*<big|sum><rsub|i=1><rsup|n><around|(|<around|(|\<varepsilon\><rsub|i>*<frac|1|c>\|k<rsub|i>\|+c|)><rsup|2>+m|)>*D<rsub|e<rsub|\<varepsilon\><rsub|1>><around|(|k<rsub|1>|)>><rsup|\<ast\>>*\<ldots\>*D<rsup|\<ast\>><rsub|e<rsub|\<varepsilon\><rsub|n>><around|(|k<rsub|n>|)>>*1
  </equation>

  <\equation*>
    H*1=0.
  </equation*>

  By Theorem <reference|FTR> the set of the generalized eigenvectors is
  complete. Therefore using the formulas for the generalized eigenvalues in
  (<reference|geneigen>) we deduce the following statement.

  <\theorem>
    The spectrum of the operator <math|H> is
    <math|<around|{|0|}>\<cup\><around|[|<frac|1|2>*m,\<infty\>|)>>. The
    eigenspace corresponding to the eigenvalue <math|0> is one-dimensional
    and is generated by the constant function
    <math|1\<in\>\<cal-H\>=L<rsup|2>*<around|(|\<cal-S\><rsub|0><rsup|\<ast\>>,\<mu\>|)>>
    which can be regarded as the ground state. The other points of the
    spectrum belong to the absolutely continuous spectrum which is of
    Lebesgue type. The spectral multiplicity function takes the constant
    value <math|\<bbb-N\>> on the absolutely continuous spectrum. Thus
    <math|\<sigma\><rsub|p*t><around|(|H|)>=<around|{|0|}>>,
    <math|\<sigma\><rsub|a*c><around|(|H|)>=<around|[|<frac|1|2>*m,\<infty\>|)>>,
    <math|\<sigma\><around|(|H|)>=\<sigma\><rsub|p*t><around|(|H|)>\<cup\>\<sigma\><rsub|a*c><around|(|H|)>>,
    and the spectrum of <math|H> has a gap.
  </theorem>

  <\remark>
    Note that the condition <math|m\<gtr\>0> is essential in the above
    construction of the quantization of the abelian Yang\UMills field. The
    standard quantization of the abelian Yang\UMills field used in Quantum
    Electrodynamics yields a massless theory. In contrast to our quantization
    the quantized Hamiltonian in Quantum Electrodynamics cannot be realized
    as a self-adjoint operator in an <math|L<rsup|2>>-space. This
    quantization is unlikely to have a counterpart in the non-abelian case
    and looks rather exceptional.
  </remark>

  In conclusion we remark that in the non-abelian case a properly quantized
  Hamiltonian <math|H<rsub|r*e*d>> should act as a self-adjoint operator in
  an <math|L<rsup|2>>-space associated to a measure with a \Pdensity\Q which
  resembles functional (<reference|ansatz>) with an appropriate
  \Prenormalization\Q. If this measure was constructed the quantized
  Hamiltonian would be immediately defined.

  <\thebibliography|99>
    <bibitem|A>Arnold, V. I., Mathematical methods of classical mechanics,
    Springer-Verlag, Berlin (1980).

    <bibitem|Ber>Berezin, F., The method of secondary quantization, Academic
    Press, London (1966).

    <bibitem|BS3>Birman, M. Sh., Solomyak, M. Z., Spectral theory of
    self-adjoint operators in Hilbert space, Reidel, Dordrecht (1987).

    <bibitem|Dir>Dirac, P.A.M., Generalized Hamiltonian dynamics,
    <with|font-shape|italic|Can. J. Math.>, <with|font-series|bold|2> (1950),
    129;

    Generalized Hamiltonian dynamics, <with|font-shape|italic|Proc. Roy. Soc.
    London>, <with|font-series|bold|A246> (1958), 326;

    Lectures on quantum mechanics, Academic Press, London (1967).

    <bibitem|FS>Faddeev, L. D., Slavnov, A. A., An introduction to the
    quantum theory of gauge fields, Benjamin/Cummings, London (1980).

    <bibitem|F>Freed, D. S., Classical Chern-Simons theory I,
    <with|font-shape|italic|Adv. Math.>, <with|font-series|bold|113> (1995),
    237\U303.

    <bibitem|GV>Gelfand, I. M., Vilenkin, N. Ya., Some applications of
    harmonic analysis. Rigged Hilbert spaces, Generalized functions, vol. 4,
    AMS Chelsea Publishing <with|font-series|bold|380> (1964).

    <bibitem|Hid>Hida, T., Kuo, H., Potthoff, J., Streit, L., White noise. An
    infinite-dimensional calculus, <with|font-shape|italic|Mathematics and
    Its Applications> <with|font-series|bold|253>, Kluwer (1993).

    <bibitem|IZ>Itzykson, C., Zuber, G. B., Quantum field theory,
    McGraw\UHill, New York (1980).

    <bibitem|Herm>Koornwinder, T. H., Wong, R. S. C., Koekoek, R., Swarttouw,
    R. F., Orthogonal Polynomials, in: NIST Handbook of Mathematical
    Functions (Olver, F. W. J., Lozier, D. M., Boisvert, R. F., Clark, C. W.
    (eds.)), Cambridge University Press (2010).

    <bibitem|Ob>Obata, N., White noise calculus and Fock space,
    <with|font-shape|italic|Lect. Notes in Math.>
    <with|font-series|bold|1577>, Springer, Berlin\UNew York (1994).

    <bibitem|Per>Perelomov, A. M., Integrable systems of classical mechanics
    and Lie algebras, vol. 1, Birkhäuser, Basel (1990).

    <bibitem|RS2>Reed, M., Simon, B., Methods of modern mathematical physics,
    vol. 2, Academic Press, London (1975).

    <bibitem|SS>Sevostyanov, A., An analogue of the operator curl for
    nonabelian gauge groups and scattering theory,
    <with|font-shape|italic|Bull. London Math. Soc.>
    <with|font-series|bold|39> (2007), 1005\U1018.

    <bibitem|Sing>Singer, I. M., The geometry of the orbit space for
    non-abelian gauge theories, <with|font-shape|italic|Physica Scripta>,
    <with|font-series|bold|24> (1981), 817\U820.#

    <bibitem|Sing1>Singer, I. M., Some remarks on the Gribov ambiguity,
    <with|font-shape|italic|Comm. Math. Phys.>, <with|font-series|bold|60>
    (1978), 7\U12.
  </thebibliography>
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
    <associate|CS|<tuple|50|11>>
    <associate|FTR|<tuple|10|23>>
    <associate|GG|<tuple|87|19>>
    <associate|Gaugeact|<tuple|36|9>>
    <associate|Gaugeactph|<tuple|39|9>>
    <associate|Hamiltred|<tuple|67|14>>
    <associate|L|<tuple|9|4>>
    <associate|L'|<tuple|10|4>>
    <associate|L''|<tuple|17|6>>
    <associate|YM|<tuple|8|4>>
    <associate|YM''|<tuple|22|6>>
    <associate|YM'''|<tuple|25|7>>
    <associate|YMH|<tuple|1|4>>
    <associate|YMPh|<tuple|2|7>>
    <associate|YMexp|<tuple|96|22>>
    <associate|YMh|<tuple|1.1|4>>
    <associate|YMhamiltprop|<tuple|50|11>>
    <associate|YMhamquant|<tuple|3.2|17>>
    <associate|YMmoment|<tuple|43|9>>
    <associate|YMprop|<tuple|43|10>>
    <associate|YMred|<tuple|2.1|7>>
    <associate|YMsym|<tuple|100|23>>
    <associate|ansatz|<tuple|80|17>>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-10|<tuple|12|24>>
    <associate|auto-2|<tuple|1|4>>
    <associate|auto-3|<tuple|1.1|4>>
    <associate|auto-4|<tuple|2|7>>
    <associate|auto-5|<tuple|2.1|7>>
    <associate|auto-6|<tuple|2.2|11>>
    <associate|auto-7|<tuple|3|15>>
    <associate|auto-8|<tuple|3.1|15>>
    <associate|auto-9|<tuple|3.2|17>>
    <associate|bib-A|<tuple|A|24>>
    <associate|bib-BS3|<tuple|BS3|24>>
    <associate|bib-Ber|<tuple|Ber|24>>
    <associate|bib-Dir|<tuple|Dir|24>>
    <associate|bib-F|<tuple|F|25>>
    <associate|bib-FS|<tuple|FS|24>>
    <associate|bib-GV|<tuple|GV|25>>
    <associate|bib-Herm|<tuple|Herm|25>>
    <associate|bib-Hid|<tuple|Hid|25>>
    <associate|bib-IZ|<tuple|IZ|25>>
    <associate|bib-Ob|<tuple|Ob|25>>
    <associate|bib-Per|<tuple|Per|25>>
    <associate|bib-RS2|<tuple|RS2|25>>
    <associate|bib-SS|<tuple|SS|25>>
    <associate|bib-Sing|<tuple|Sing|25>>
    <associate|bib-Sing1|<tuple|Sing1|25>>
    <associate|charf|<tuple|7|19>>
    <associate|classh|<tuple|1|2>>
    <associate|commrel|<tuple|101|23>>
    <associate|cr|<tuple|88|20>>
    <associate|eigen|<tuple|90|20>>
    <associate|exp1|<tuple|81|18>>
    <associate|exp2|<tuple|82|18>>
    <associate|expr|<tuple|77|16>>
    <associate|fouriero|<tuple|98|22>>
    <associate|fouriero1|<tuple|99|22>>
    <associate|gaugeactph|<tuple|40|9>>
    <associate|geneigen|<tuple|107|24>>
    <associate|hamM|<tuple|68|15>>
    <associate|hamilt|<tuple|27|7>>
    <associate|hamiltred|<tuple|65|14>>
    <associate|haminv|<tuple|30|7>>
    <associate|l1|<tuple|1|12>>
    <associate|m|<tuple|61|12>>
    <associate|mom|<tuple|60|12>>
    <associate|momentbrack|<tuple|29|7>>
    <associate|nondyn|<tuple|11|4>>
    <associate|pois|<tuple|28|7>>
    <associate|prod|<tuple|12|5>>
    <associate|qh1|<tuple|75|16>>
    <associate|quantmod|<tuple|3.1|15>>
    <associate|r1|<tuple|44|10>>
    <associate|rec|<tuple|2|2>>
    <associate|redcoord|<tuple|2.2|11>>
    <associate|redstruct|<tuple|2|13>>
    <associate|riemann|<tuple|31|8>>
    <associate|roteigen|<tuple|89|20>>
    <associate|to|<tuple|62|12>>
    <associate|vectred|<tuple|3|13>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Herm

      FS

      FS

      IZ

      Dir

      Sing

      Dir

      FS

      A

      A

      F

      A

      Per

      A

      Sing

      Sing1

      RS2

      Ob

      Ob

      BS3

      SS

      BS3

      GV

      BS3

      Ob

      Ob

      Hid

      Hid

      Ob

      Ber

      Ob

      Ob

      Ber

      Hid
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Yang\UMills field in Hamiltonian formulation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Yang\UMills field as a
      Hamiltonian system with constrains <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      structure of the phase space of the Yang\UMills field>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Reduction of the phase space
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>The structure of the reduced
      phase space <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Quantization
      of the Hamiltonian of the Yang\UMills field>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Quantization of Yang\UMills
      type Hamiltonians: a model case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Application to the
      Yang\UMills Hamiltonian <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>