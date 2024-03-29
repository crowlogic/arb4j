<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|parchment|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Newton Flow of The Hyperbolic Tangent Of One Plus
  t Squared>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|A closed form solution for the Newton flow of
  <math|tanh<around*|(|ln<around*|(|1+x<rsup|2>|)>|)>> is derived and
  discussed in terms of it being the integrated infinitesimal generator
  comprising a semigroup of holomorphic mappings.>>

  <section|The Newton Flow ODE>

  The differential equation for the Newton flow <math|z<around|(|t|)>> of
  <math|f<around|(|t|)>> is given by

  <\equation>
    <wide|z|\<dot\>><around|(|t|)>=-<frac|f<around|(|z<around|(|t|)>|)>|<frac|d|d*t>*f<around|(|z<around|(|t|)>|)>>=-<frac|f<around|(|z<around|(|t|)>|)>|<wide|f|\<dot\>><around|(|z<around|(|t|)>|)>>
  </equation>

  If\ 

  <\equation>
    f<around|(|t|)>=S<around|(|t|)>=tanh (ln <around|(|1+t<rsup|2>|)>
  </equation>

  and we let

  <\equation>
    <tabular|<tformat|<table|<row|<cell|b<around|(|a|)>>|<cell|=<around|(|1+a<rsup|2>|)><rsup|2>+1>>|<row|<cell|>|<cell|=a<rsup|4>+2a<rsup|2>+2>>>>>
  </equation>

  then define

  <\equation>
    <tabular|<tformat|<table|<row|<cell|g<around|(|t,a|)>>|<cell|=e<rsup|t>-1+<frac|2|b<around|(|a|)>>>>|<row|<cell|>|<cell|=e<rsup|t>-1+<frac|2|<around|(|1+a<rsup|2>|)><rsup|2>+1>>>>>>
  </equation>

  and

  <\equation>
    <tabular|<tformat|<table|<row|<cell|h<around|(|t,a|)>>|<cell|=<sqrt|e<rsup|2*t>-<frac|a<rsup|4>*<around|(|2+a<rsup|2>|)><rsup|2>|b<around|(|a|)><rsup|2>>>>>|<row|<cell|>|<cell|=<sqrt|e<rsup|2*t>-<frac|<around*|(|<around|(|1+a<rsup|2>|)><rsup|2>-1|)><rsup|2>|<around*|(|<around|(|1+a<rsup|2>|)><rsup|2>+1|)><rsup|2>>>>>>>>
  </equation>

  then there are 4 solutions of <math|z<around|(|t|)>> for the Newton flow
  given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|z<around|(|t,a|)>>|<cell|=\<pm\><sqrt|\<pm\><frac|g<around|(|t,a|)>+h<around|(|t,a|)>|g<around|(|t,a|)>>>>>|<row|<cell|>|<cell|=\<pm\><sqrt|\<pm\><frac|<around|\<nobracket\>|e<rsup|t>-1+<frac|2|<around|(|1+a<rsup|2>|)><rsup|2>+1>|>+<sqrt|e<rsup|2*t>-<frac|<around*|(|<around|(|1+a<rsup|2>|)><rsup|2>-1|)><rsup|2>|<around*|(|<around|(|1+a<rsup|2>|)><rsup|2>+1|)><rsup|2>>>|e<rsup|t>-1+<frac|2|<around|(|1+a<rsup|2>|)><rsup|2>+1>>>>>>>>
  </equation>

  which satisfy

  <\equation>
    lim<rsub|t\<rightarrow\>\<infty\>>z<around*|(|t,a|)>=<around*|{|0,\<pm\>i<sqrt|2>|}>\<forall\>a\<in\>\<bbb-C\>
  </equation>

  where by design, definition, and necessity

  <\equation>
    S<around*|(|lim<rsub|t\<rightarrow\>\<infty\>>z<around*|(|t,a|)>|)>=0\<forall\>a\<in\>\<bbb-C\>
  </equation>

  <subsection|Newton Flows Are Integrated Infinitesimal Generators
  Constituting Semigroups of Holomorphic Mappings>

  The Newton flow corresponding to the solution of the continuous Newton's
  method is the integrated infinitesimal generator constituting a semigroup
  of holomorphic mappings.

  To understand this, we need to briefly discuss the continuous Newton's
  method and the concept of semigroups of holomorphic mappings.

  Continuous Newton's method is a generalization of the classical Newton's
  method in which the iterations are replaced by a continuous flow. For a
  given holomorphic function <math|f<around|(|z|)>>, the continuous Newton's
  method is described by the following ordinary differential equation (ODE):

  <\equation>
    <frac|d*z|d*t>=-<frac|f<around|(|z<around*|(|t|)>|)>|f<rprime|'><around|(|z<around*|(|t|)>|)>>
  </equation>

  with an initial condition <math|z<around|(|0|)>=z<rsub|0>>.

  The solution of this ODE is a continuous trajectory <math|z<around|(|t|)>>
  in the complex plane, which converges to the zero of the function
  <math|f<around|(|z|)>> as <math|t> approaches infinity.

  <\definition>
    A <verbatim|semigroup of holomorphic mappings> is a family of mappings
    <math|T<around|(|t|)>:D\<to\>D>, where <math|D> is an open subset of the
    complex plane and <math|t> belongs to a certain interval
    <math|<around|[|0,t<rsub|max>|)>>, with the following properties:

    <\enumerate>
      <item><math|T<around|(|0|)>> is the identity map on <math|D>.

      <item>If <math|s+t\<less\>t<rsub|max>\<forall\>s,t\<geq\>0> then
    </enumerate>

    <\equation>
      T<around|(|s|)>\<circ\>T<around|(|t|)>=T*<around|(|s+t|)>=T<around*|(|sT|)>
    </equation>

    where <math|\<circ\>> denotes the composition operator.
  </definition>

  <\definition>
    An <verbatim|infinitesimal generator> <math|A> of a semigroup of
    holomorphic mappings <math|T<around|(|t|)>> is a linear operator that
    satisfies the following condition:

    <\equation*>
      lim<rsub|t\<to\>0> <frac|T<around|(|t|)>*z<around|(|t|)>-z<around|(|t|)>|t>=A*z<around|(|t|)>\<forall\>z<around|(|t|)>\<in\>D
    </equation*>
  </definition>

  Now, consider the Newton flow as a semigroup of holomorphic mappings
  <math|T<around|(|t|)>> with an infinitesimal generator <math|A>. It can be
  shown that the Newton flow generated by the continuous Newton's method
  indeed satisfies the properties of a semigroup, and its infinitesimal
  generator <math|A> can be represented by the linear operator

  <\equation*>
    -<frac|f<around|(|z|)>|f<rprime|'><around|(|z|)>>=<wide|z|\<dot\>><around|(|t|)>=-<frac|f<around|(|z<around|(|t|)>|)>|<frac|d|d*t>*f<around|(|z<around|(|t|)>|)>>=-<frac|f<around|(|z<around|(|t|)>|)>|<wide|f|\<dot\>><around|(|z<around|(|t|)>|)>>
  </equation*>

  Here, the solution <math|z<around*|(|t,a|)>=T<around*|(|t|)>> and the
  dependence on the initial condition <math|a> is still there just not
  written.

  <subsubsection|Conclusion><label|expounding-a-bit-more><label|expounding-a-bit-more>

  The Newton flow solution <math|z<around*|(|t,a|)>> is found by solving the
  ordinary Newton differential equation that describes how the flow evolves
  and its trajectory forms a semigroup under the operation of function
  composition.

  The infinitesimal generator is essentially the velocity of the system,
  \ encoding its dynamics. When we talk about Newton flow, the infinitesimal
  generator is given by the right-hand side
  <math|-<frac|f<around|(|z<around*|(|t|)>|)>|f<rprime|'><around|(|z<around*|(|t|)>|)>>>
  of the ODE:

  <\equation*>
    <wide|z|\<dot\>><around|(|t|)>=-<frac|f<around|(|z<around|(|t|)>|)>|<frac|d|d*t>*f<around|(|z<around|(|t|)>|)>>=-<frac|f<around|(|z<around|(|t|)>|)>|<wide|f|\<dot\>><around|(|z<around|(|t|)>|)>>
  </equation*>

  Here, <math|f<around|(|z|)>=S<around*|(|z|)>> is the function that we're
  trying to find roots for, and <math|f<rprime|'><around|(|z|)>> is its
  derivative. As time progresses, the points of the flow evolve according to
  the dynamics of the system. In the limit as <math|t> approaches infinity,
  <math|z<around|(|t,a|)>> converges to a set of values
  <math|<around*|{|0,\<pm\>i<sqrt|2>|}>>, regardless of the initial codition
  <math|z<around*|(|0|)>=a> thus <math|S*<around|(lim|<rsub|t\<rightarrow\>\<infty\>>*z<around|(|t,a|)>|)>=0>,\ 

  The connection between the infinitesimal generator and the semigroup
  properties of the flow is the fundamental principle that makes this method
  so powerful for root-finding.

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

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.1.1|3>>
    <associate|expounding-a-bit-more|<tuple|1.1.1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Newton Flow ODE> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Newton Flows Are Integrated
      Infinitesimal Generators Constituting Semigroups of Holomorphic
      Mappings <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>