<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Caputo Fractional Derivative of the Sine
  Function>|<doc-date|>>

  <\definition>
    [Caputo Fractional Derivative] For <math|\<alpha\>\<gtr\>0>, the Caputo
    fractional derivative of order <math|\<alpha\>> for a function
    <math|f<around|(|t|)>> is defined as:

    <\equation>
      <rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*f<around|(|t|)>=<frac|1|\<Gamma\>*<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>>*<big|int><rsub|0><rsup|t><frac|f<rsup|<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>|)>><around|(|\<tau\>|)>|<around|(|t-\<tau\>|)><rsup|\<alpha\>-<around|\<lceil\>|\<alpha\>|\<rceil\>>+1>>*d*\<tau\>
    </equation>

    where <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>> is the ceiling
    function, denoting the smallest integer greater than or equal to
    <math|\<alpha\>>.
  </definition>

  <\definition>
    [Mittag-Leffler Function] The two-parameter Mittag-Leffler function is
    defined for <math|\<alpha\>,\<beta\>\<gtr\>0> as:

    <\equation>
      E<rsub|\<alpha\>,\<beta\>><around|(|z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|z<rsup|k>|\<Gamma\>*<around|(|\<alpha\>*k+\<beta\>|)>>
    </equation>
  </definition>

  <\lemma>
    For non-negative integers <math|m>, the <math|m>-th derivative of
    <math|sin <around|(|t|)>> is given by:

    <\equation>
      sin<rsup|<around|(|m|)>><around|(|t|)>=sin
      <around*|(|t+<frac|m*\<pi\>|2>|)>
    </equation>
  </lemma>

  <\lemma>
    For <math|a\<gtr\>0> and <math|b\<gtr\>0>, the Beta function satisfies:

    <\equation>
      <big|int><rsub|0><rsup|1>u<rsup|a-1>*<around|(|1-u|)><rsup|b-1>*d*u=B<around|(|a,b|)>=<frac|\<Gamma\><around|(|a|)>*\<Gamma\><around|(|b|)>|\<Gamma\>*<around|(|a+b|)>>
    </equation>
  </lemma>

  <\theorem>
    [Caputo Fractional Derivative of Sine] For any <math|\<alpha\>\<gtr\>0>,
    the Caputo fractional derivative of <math|sin <around|(|t|)>> is given
    by:

    <\equation>
      <rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>=t<rsup|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*E<rsub|2,<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>+1>*<around|(|-t<rsup|2>|)>
    </equation>

    where <math|E<rsub|2,<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>+1>*<around|(|-t<rsup|2>|)>>
    is the Mittag-Leffler function.
  </theorem>

  <\proof>
    We begin with the Caputo fractional derivative definition for
    <math|\<alpha\>\<gtr\>0>:

    <\equation>
      <rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>=<frac|1|\<Gamma\>*<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>>*<big|int><rsub|0><rsup|t><frac|sin<rsup|<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>|)>><around|(|\<tau\>|)>|<around|(|t-\<tau\>|)><rsup|\<alpha\>-<around|\<lceil\>|\<alpha\>|\<rceil\>>+1>>*d*\<tau\>
    </equation>

    From the lemma, we know that:

    <\equation>
      sin<rsup|<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>|)>><around|(|\<tau\>|)>=sin
      <around*|(|\<tau\>+<frac|<around|\<lceil\>|\<alpha\>|\<rceil\>>*\<pi\>|2>|)>
    </equation>

    The <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>>-th derivative of sine
    can be expanded in Taylor series:

    <\equation>
      sin <around*|(|\<tau\>+<frac|<around|\<lceil\>|\<alpha\>|\<rceil\>>*\<pi\>|2>|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>*\<tau\><rsup|2*k+p>|<around|(|2*k+p|)>!>
    </equation>

    where <math|p=0> if <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>> is
    even, and <math|p=1> if <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>> is
    odd.

    Substituting into the Caputo definition:

    <\align>
      <tformat|<table|<row|<cell|<rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>>|<cell|=<frac|1|\<Gamma\>*<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>>*<big|int><rsub|0><rsup|t><frac|1|<around|(|t-\<tau\>|)><rsup|\<alpha\>-<around|\<lceil\>|\<alpha\>|\<rceil\>>+1>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>*\<tau\><rsup|2*k+p>|<around|(|2*k+p|)>!>*d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|\<Gamma\>*<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|<around|(|2*k+p|)>!>*<big|int><rsub|0><rsup|t><frac|\<tau\><rsup|2*k+p>|<around|(|t-\<tau\>|)><rsup|\<alpha\>-<around|\<lceil\>|\<alpha\>|\<rceil\>>+1>>*d*\<tau\><eq-number>>>>>
    </align>

    Making the substitution <math|\<tau\>=t*u>, we get:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|t><frac|\<tau\><rsup|2*k+p>|<around|(|t-\<tau\>|)><rsup|\<alpha\>-<around|\<lceil\>|\<alpha\>|\<rceil\>>+1>>*d*\<tau\>>|<cell|=<big|int><rsub|0><rsup|1><frac|<around|(|t*u|)><rsup|2*k+p>|<around|(|t-t*u|)><rsup|\<alpha\>-<around|\<lceil\>|\<alpha\>|\<rceil\>>+1>>\<cdot\>t*<space|0.17em>d*u<eq-number>>>|<row|<cell|>|<cell|=t<rsup|2*k+p+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*<big|int><rsub|0><rsup|1><frac|u<rsup|2*k+p>|<around|(|1-u|)><rsup|\<alpha\>-<around|\<lceil\>|\<alpha\>|\<rceil\>>+1>>*d*u<eq-number>>>>>
    </align>

    The integral can be expressed in terms of the Beta function:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|1><frac|u<rsup|2*k+p>|<around|(|1-u|)><rsup|\<alpha\>-<around|\<lceil\>|\<alpha\>|\<rceil\>>+1>>*d*u>|<cell|=<big|int><rsub|0><rsup|1>u<rsup|2*k+p>*<around|(|1-u|)><rsup|<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>-1>*d*u<eq-number>>>|<row|<cell|>|<cell|=B<around|(|2*k+p+1,<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)><eq-number>>>|<row|<cell|>|<cell|=<frac|\<Gamma\>*<around|(|2*k+p+1|)>*\<Gamma\>*<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>|\<Gamma\>*<around|(|2*k+p+1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>><eq-number>>>>>
    </align>

    Substituting back:

    <\align>
      <tformat|<table|<row|<cell|<rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>>|<cell|=<frac|1|\<Gamma\>*<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|<around|(|2*k+p|)>!>*t<rsup|2*k+p+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*<frac|\<Gamma\>*<around|(|2*k+p+1|)>*\<Gamma\>*<around|(|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>|\<Gamma\>*<around|(|2*k+p+1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>*\<Gamma\>*<around|(|2*k+p+1|)>|<around|(|2*k+p|)>!\<Gamma\>*<around|(|2*k+p+1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>>*t<rsup|2*k+p+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>><eq-number>>>>>
    </align>

    Since <math|<around|(|2*k+p|)>!=\<Gamma\>*<around|(|2*k+p+1|)>>, we
    simplify to:

    <\align>
      <tformat|<table|<row|<cell|<rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|\<Gamma\>*<around|(|2*k+p+1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>>*t<rsup|2*k+p+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>><eq-number>>>>>
    </align>

    Now we analyze the cases based on parity of
    <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>>:

    <with|font-series|bold|Case 1:> When <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>>
    is even, <math|p=0>:

    <\align>
      <tformat|<table|<row|<cell|<rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|\<Gamma\>*<around|(|2*k+1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>>*t<rsup|2*k+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>><eq-number>>>|<row|<cell|>|<cell|=t<rsup|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>*t<rsup|2*k>|\<Gamma\>*<around|(|2*k+1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>><eq-number>>>|<row|<cell|>|<cell|=t<rsup|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-t<rsup|2>|)><rsup|k>|\<Gamma\>*<around|(|2*k+1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>><eq-number>>>>>
    </align>

    This matches the form of the Mittag-Leffler function with
    <math|\<alpha\>=2> and <math|\<beta\>=1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>:

    <\align>
      <tformat|<table|<row|<cell|<rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>=t<rsup|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*E<rsub|2,1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*<around|(|-t<rsup|2>|)><eq-number>>>>>
    </align>

    <with|font-series|bold|Case 2:> When <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>>
    is odd, <math|p=1>:

    <\align>
      <tformat|<table|<row|<cell|<rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|\<Gamma\>*<around|(|2*k+2+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>>*t<rsup|2*k+1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>><eq-number>>>|<row|<cell|>|<cell|=t<rsup|1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>*t<rsup|2*k>|\<Gamma\>*<around|(|2*k+2+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>><eq-number>>>|<row|<cell|>|<cell|=t<rsup|1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-t<rsup|2>|)><rsup|k>|\<Gamma\>*<around|(|2*k+2+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>|)>><eq-number>>>|<row|<cell|>|<cell|=t<rsup|1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*E<rsub|2,2+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*<around|(|-t<rsup|2>|)><eq-number>>>>>
    </align>

    But notice for odd <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>>, we can
    write <math|1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>=<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>+1>,
    and <math|2+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>=<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>+2>.

    For even <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>>, we have
    <math|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>> and
    <math|1+<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>=<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>+1>.

    Therefore, we can unify both cases as:

    <\align>
      <tformat|<table|<row|<cell|<rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>=t<rsup|<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>>*E<rsub|2,<around|\<lceil\>|\<alpha\>|\<rceil\>>-\<alpha\>+1>*<around|(|-t<rsup|2>|)><eq-number>>>>>
    </align>

    This completes the proof.
  </proof>
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