<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <\theorem>
    <with|font-series|bold|(M. H. Stone).> Let <math|<around|{|U<rsub|t>|}>>,
    <math|-\<infty\>\<less\>t\<less\>\<infty\>>, be a one-parameter group of
    class <math|<around|(|C<rsub|0>|)>> unitary operators in a Hilbert space
    <math|X>. Then

    <\equation>
      U<rsub|t>=e<rsup|i*t*H>
    </equation>

    where

    <\equation>
      f<around|(|t|)>=e<rsup|i*t*\<lambda\>>
    </equation>

    and

    <\equation>
      <space|1em>i*H=A
    </equation>

    <\equation>
      H<rsup|\<ast\>>=H
    </equation>

    <math|H> is the infinitesimal generator of the group <math|U<rsub|t>>.
    Conversely, for any self-adjoint operator <math|H> in <math|X>

    <\equation>
      U<rsub|t>=e<rsup|i*t*H>
    </equation>

    defines a one-parameter group of class <math|<around|(|C<rsub|0>|)>> of
    unitary operators.
  </theorem>

  <with|font-shape|italic|Proof.> We have, by the representation theorem of
  the semi-group theory,

  <\equation>
    U<rsub|t,x>=s-lim<rsub|n\<to\>\<infty\>>
    e<rsup|i*t*H*<around*|(|I-<frac|i|n>*H|)><rsup|-1>>*x
  </equation>

  Since the function

  <\equation>
    g<around|(|t|)>=e<rsup|i*t*<around*|(|1-<frac|1|n>*i*\<lambda\>|)><rsup|-1>>
  </equation>

  is smaller than

  <\equation>
    e<rsup|-<frac|n*t<rsup|2>|<frac|1|n<rsup|2>>+2>>
  </equation>

  in absolute value, we have, for

  <\equation>
    H=<big|int>f*d*E<around|(|\<lambda\>|)>
  </equation>

  <\equation>
    e<rsup|i*t*H*<around*|(|I-<frac|i|n>*H|)><rsup|-1>>=<big|int>e<rsup|<frac|i*t*\<lambda\>|1-<frac|i|n>*\<lambda\>>>*d*E<around|(|\<lambda\>|)>
  </equation>

  and moreover,

  <\equation>
    lim<rsub|n\<to\>\<infty\>> <big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|\||e<rsup|<frac|i*t*\<lambda\>|1-<frac|i|n>*\<lambda\>>>-e<rsup|i*t*\<lambda\>>|\|><rsup|2>*d*<around|\<\|\|\>|E<around|(|\<lambda\>|)>*x|\<\|\|\>><rsup|2>=0
  </equation>

  This proves that

  <\equation>
    U<rsub|t>=f<rsub|t><around|(|H|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*E<around|(|\<lambda\>|)>
  </equation>

  For the converse part of Theorem 1, we observe that, by the operational
  calculus of the preceding section,

  <\equation>
    f<rsub|t><around|(|H|)><rsup|\<ast\>>=f<rsub|-t><around|(|H|)>
  </equation>

  <\equation>
    f<rsub|t><around|(|H|)>*f<rsub|s><around|(|H|)>=f<rsub|t+s><around|(|H|)>
  </equation>

  <\equation>
    f<rsub|0><around|(|H|)>=I
  </equation>

  We also have the strong continuity of <math|f<rsub|t><around|(|H|)>> at
  <math|t=0> by

  <\equation>
    <around|\<\|\|\>|f<rsub|t><around|(|H|)>*x-x|\<\|\|\>><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||e<rsup|i*t*\<lambda\>>-1|\|><rsup|2>*d*<around|\<\|\|\>|E<around|(|\<lambda\>|)>*x|\<\|\|\>><rsup|2>\<to\>0*<space|1em><text|as><space|1em>t\<to\>0
  </equation>

  Hence <math|U<rsub|t>=f<rsub|t><around|(|H|)>> is a one-parameter group of
  class <math|<around|(|C<rsub|0>|)>> unitary operators.

  <\theorem>
    <with|font-series|bold|(Bochner).> A complex-valued continuous function
    <math|f<around|(|t|)>\<forall\>-\<infty\>\<less\>t\<less\>\<infty\>> is
    representable as

    <\equation>
      f<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*d*\<nu\><around|(|\<lambda\>|)>
    </equation>

    with a non-decreasing, right-continuous bounded function
    <math|\<nu\><around|(|\<lambda\>|)>>, if <math|f<around|(|t|)>> is
    positive definite in the following sense:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>f*<around|(|t-s|)>*\<varphi\><around|(|t|)><wide|\<varphi\><around|(|s|)>|\<bar\>>d*t*d*s\<geq\>0
    </equation>

    for every continuous function <math|\<varphi\>> with compact support.
  </theorem>

  \;

  <strong|<strong|Deduction of Theorem 2 from Theorem >1. >Consider the
  totality <math|\<frak-S\>> of complex-valued functions
  <math|x<around|(|t|)>>, <math|-\<infty\>\<less\>t\<less\>\<infty\>>, such
  that <math|x<around|(|t|)>=0> except possibly for a finite set of values of
  <math|t>; the finite set may vary with <math|x>. <math|\<frak-S\>> is a
  pre-Hilbert space by

  <\equation>
    <around|(|x+y|)><around|(|t|)>=x<around|(|t|)>+y<around|(|t|)>
  </equation>

  <\equation>
    <around|(|\<alpha\>*x|)><around|(|t|)>=\<alpha\>*x<around|(|t|)>
  </equation>

  <\equation>
    <around|(|x,y|)>=-<big|int><rsub|-\<infty\>><rsup|\<infty\>>f*<around|(|t-s|)><wide|x<around|(|s|)>|\<bar\>>y<around|(|t|)>*d*s
  </equation>

  excepting the axiom that <math|<around|(|x,x|)>=0> implies <math|x=0>. That
  <math|<around|(|x,x|)>\<geq\>0> for any <math|x\<in\>\<frak-S\>> is a
  simple consequence of the positive definiteness of the function
  <math|f<around|(|t|)>>.

  Let us set <math|\<frak-N\>=<around|{|x\<in\>\<frak-S\>;<around|(|x,x|)>=0|}>>.
  Then the factor space <math|\<frak-S\>/\<frak-N\>> is a pre-Hilbert space
  with respect to the scalar product <math|<around|(|<wide|x|^>,<wide|y|^>|)>=<around|(|x,y|)>>
  where <math|<wide|x|^>> is the residue class mod <math|\<frak-N\>>
  containing <math|x\<in\>\<frak-S\>>. Let <math|X> be the completion of the
  pre-Hilbert space <math|\<frak-S\>/\<frak-N\>>. The operator
  <math|U<rsub|t>> defined by

  <\equation>
    <around|(|U<rsub|t>*x|)><around|(|t|)>=x*<around|(|t-\<tau\>|)>\<forall\>x\<in\>\<frak-S\>
  </equation>

  surely satisfies the conditions

  <\equation>
    <around|(|U<rsub|t>*x,U<rsub|t>*y|)>=<around|(|x,y|)>
  </equation>

  <\equation>
    U<rsub|\<tau\>>*U<rsub|\<sigma\>>=U<rsub|\<tau\>+\<sigma\>>*
  </equation>

  <\equation>
    <space|1em>U<rsub|0>=I
  </equation>

  Therefore, it is easy to see that <math|<around|{|U<rsub|t>|}>> naturally
  defines a unitary operator <math|<wide|U|~><rsub|t>> in <math|X> in such a
  way that <math|<around|{|<wide|U|~><rsub|t>|}>>,
  <math|-\<infty\>\<less\>t\<less\>\<infty\>>, constitutes a one-parameter
  class <math|<around|(|C<rsub|0>|)>> semi-group of \ unitary operators in
  <math|X>; the strong continuity in <math|t> of <math|<wide|U|~><rsub|t>>
  follows from the continuity of the function <math|f<around|(|t|)>>. Hence,
  by Stone's theorem,

  <\equation>
    <wide|U|~><rsub|t>=e<rsup|i*t*A>
  </equation>

  Let <math|x<rsub|0><around|(|t|)>\<in\>\<frak-S\>> be defined by
  <math|x<rsub|0><around|(|t|)>=1> and <math|x<rsub|0><around|(|t|)>=0>
  whenever <math|t\<neq\>\<tau\>>. Then, by (4) and (5),
  <math|f<around|(|t|)>=<around|(|U<rsub|t>*x<rsub|0>,x<rsub|0>|)>>.
  Therefore,

  <\equation>
    f<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*<around|(|E<around|(|\<lambda\>|)>*x<rsub|0>,x<rsub|0>|)>
  </equation>

  which proves Bochner's theorem.
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