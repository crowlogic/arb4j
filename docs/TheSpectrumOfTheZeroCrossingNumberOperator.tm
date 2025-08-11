<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Spectrum of the Zero Crossing Number
  Operator>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\definition>
    [Zero-Crossing Measure] Let <math|X<around|(|t,\<omega\>|)>> be a sample
    path of a Gaussian process with derivative
    <math|X<rprime|'><around|(|t,\<omega\>|)>> existing almost surely where
    <math|\<omega\>\<in\>\<Omega\>> represents a specific sample path element
    from the ensemble of possible sample paths denoted by <math|\<Omega\>>.
    Define the zero-crossing measure <math|\<mu\><rsub|\<omega\>>> on
    <math|\<bbb-R\>> by:

    <\equation>
      d*\<mu\><rsub|\<omega\>><around|(|s|)>=\<delta\><around|(|X<around|(|s,\<omega\>|)>|)><around|\||X<rprime|'><around|(|s,\<omega\>|)>|\|>*d*s
    </equation>

    where <math|\<delta\>> is the Dirac delta function.
  </definition>

  <\definition>
    [Zero-Crossing Spectral Operator] Define the zero-crossing spectral
    operator <math|T:L<rsup|2><around|(|\<bbb-R\>,\<mu\><rsub|\<omega\>>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>,\<mu\><rsub|\<omega\>>|)>>
    by:

    <\equation>
      <around|(|T*f|)><around|(|s|)>=s\<cdot\>f<around|(|s|)>
    </equation>
  </definition>

  <\theorem>
    [Zero-Crossing Spectrum] The operator <math|T> has spectrum given by:

    <\equation>
      \<sigma\><around|(|T|)>=<wide|<around|{|t\<in\>\<bbb-R\>:X<around|(|t,\<omega\>|)>=0|}>|\<bar\>>
    </equation>

    where the overline denotes topological closure.
  </theorem>

  <\proof>
    The operator <math|T> is multiplication by the function
    <math|m<around|(|s|)>=s> on the measure space
    <math|<around|(|\<bbb-R\>,\<mu\><rsub|\<omega\>>|)>>.

    For multiplication operators on measure spaces, the spectrum is given by:

    <\equation>
      \<sigma\><around|(|T|)>=<text|essential range of >m*<text|with respect
      to >\<mu\><rsub|\<omega\>>
    </equation>

    The essential range of <math|m<around|(|s|)>=s> with respect to measure
    <math|\<mu\><rsub|\<omega\>>> is:

    <\equation>
      <text|ess ran><rsub|\<mu\><rsub|\<omega\>>><around|(|s|)>=<around|{|\<lambda\>\<in\>\<bbb-R\>:\<mu\><rsub|\<omega\>><around|(|<around|{|s:<around|\||s-\<lambda\>|\|>\<less\>\<epsilon\>|}>|)>\<gtr\>0*<text|for
      all >\<epsilon\>\<gtr\>0|}>
    </equation>

    Since <math|\<mu\><rsub|\<omega\>>> is supported precisely on
    <math|Z<rsub|\<omega\>>=<around|{|t\<in\>\<bbb-R\>:X<around|(|t,\<omega\>|)>=0|}>>,
    we have:

    <\equation>
      \<mu\><rsub|\<omega\>><around|(|<around|{|s:<around|\||s-\<lambda\>|\|>\<less\>\<epsilon\>|}>|)>\<gtr\>0*<text|if
      and only if ><around|(|\<lambda\>-\<epsilon\>,\<lambda\>+\<epsilon\>|)>\<cap\>Z<rsub|\<omega\>>\<neq\>\<emptyset\>
    </equation>

    This occurs if and only if <math|\<lambda\>> is in the closure of
    <math|Z<rsub|\<omega\>>>.

    Therefore:

    <\equation>
      \<sigma\><around|(|T|)>=<wide|Z<rsub|\<omega\>>|\<bar\>>=<wide|<around|{|t\<in\>\<bbb-R\>:X<around|(|t,\<omega\>|)>=0|}>|\<bar\>>
    </equation>

    Equivalently, <math|\<lambda\>\<in\>\<sigma\><around|(|T|)>> if and only
    if <math|<around|(|T-\<lambda\>*I|)>> is not invertible, which occurs
    precisely when the multiplier <math|<around|(|s-\<lambda\>|)>> is not
    bounded away from zero on the support of <math|\<mu\><rsub|\<omega\>>>.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>