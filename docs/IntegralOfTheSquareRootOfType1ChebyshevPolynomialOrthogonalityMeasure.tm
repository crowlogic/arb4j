<TeXmacs|2.1.4>

<style|generic>

<\body>
  \;

  <with|font-series|bold|Proposition:>

  <\equation>
    <frac|2*\<Gamma\><around*|(|<frac|3|4>|)><rsup|2><sqrt|2>|<sqrt|\<pi\>>>=B<around*|(|<frac|1|2>,<frac|3|4>|)>
  </equation>

  <with|font-series|bold|Proof:> We will start with the integral definitions
  of the Gamma and Beta functions:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Gamma\><around|(|z|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>t<rsup|z-1>*e<rsup|-t>*<space|0.17em>d*t>>|<row|<cell|B<around|(|x,y|)>>|<cell|=<big|int><rsub|0><rsup|1>t<rsup|x-1>*<around|(|1-t|)><rsup|y-1>*<space|0.17em>d*t>>>>>
  </equation>

  <with|font-series|bold|1. Expressing Beta in terms of Gamma:> We begin by
  expressing the Beta function in terms of the Gamma function. To do this, we
  use the following relationship:

  <\equation>
    B<around|(|x,y|)>=<frac|\<Gamma\><around|(|x|)>*\<Gamma\><around|(|y|)>|\<Gamma\>*<around|(|x+y|)>>
  </equation>

  Applying this to our case:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<around*|(|<frac|1|2>,<frac|3|4>|)>>|<cell|=<frac|\<Gamma\><around*|(|<frac|1|2>|)>*\<Gamma\><around*|(|<frac|3|4>|)>|\<Gamma\>*<around*|(|<frac|1|2>+<frac|3|4>|)>>>>|<row|<cell|>|<cell|=<frac|\<Gamma\><around*|(|<frac|1|2>|)>*\<Gamma\><around*|(|<frac|3|4>|)>|\<Gamma\><around*|(|<frac|5|4>|)>>>>>>>
  </equation>

  <with|font-series|bold|2. Using the Gamma function property:> We use the
  property <math|\<Gamma\>*<around|(|z+1|)>=z*\<Gamma\><around|(|z|)>> to
  express <math|\<Gamma\><around*|(|<frac|5|4>|)>> in terms of
  <math|\<Gamma\><around*|(|<frac|1|4>|)>>:

  <\equation>
    \<Gamma\><around*|(|<frac|5|4>|)>=<frac|1|4>*\<Gamma\><around*|(|<frac|1|4>|)>
  </equation>

  Substituting this back into the expression:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<around*|(|<frac|1|2>,<frac|3|4>|)>>|<cell|=<frac|\<Gamma\><around*|(|<frac|1|2>|)>*\<Gamma\><around*|(|<frac|3|4>|)>|<frac|1|4>*\<Gamma\><around*|(|<frac|1|4>|)>>>>|<row|<cell|>|<cell|=4*<frac|\<Gamma\><around*|(|<frac|1|2>|)>*\<Gamma\><around*|(|<frac|3|4>|)>|\<Gamma\><around*|(|<frac|1|4>|)>>>>>>>
  </equation>

  <with|font-series|bold|3. Using the reflection formula:> Now, we use the
  reflection formula for the Gamma function:

  <\equation>
    \<Gamma\><around|(|z|)>*\<Gamma\>*<around|(|1-z|)>=<frac|\<pi\>|sin
    <around|(|\<pi\>*z|)>>
  </equation>

  Setting <math|z=<frac|1|4>>:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Gamma\><around*|(|<frac|1|4>|)>*\<Gamma\>*<around*|(|1-<frac|1|4>|)>>|<cell|=<frac|\<pi\>|sin
    <around*|(|<frac|\<pi\>|4>|)>>>>|<row|<cell|\<Gamma\><around*|(|<frac|1|4>|)>*\<Gamma\><around*|(|<frac|3|4>|)>>|<cell|=<frac|\<pi\>|<frac|<sqrt|2>|2>>>>|<row|<cell|\<Gamma\><around*|(|<frac|1|4>|)>*\<Gamma\><around*|(|<frac|3|4>|)>>|<cell|=<sqrt|2>*\<pi\>>>>>>
  </equation>

  Solving for <math|\<Gamma\><around*|(|<frac|1|4>|)>>:

  <\equation>
    \<Gamma\><around*|(|<frac|1|4>|)>=<frac|<sqrt|2>*\<pi\>|\<Gamma\><around*|(|<frac|3|4>|)>>
  </equation>

  Substituting this back into the expression for the Beta function:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<around*|(|<frac|1|2>,<frac|3|4>|)>>|<cell|=4*<frac|\<Gamma\><around*|(|<frac|1|2>|)>*\<Gamma\><around*|(|<frac|3|4>|)>|\<Gamma\><around*|(|<frac|1|4>|)>>>>|<row|<cell|>|<cell|=4*<frac|\<Gamma\><around*|(|<frac|1|2>|)>*\<Gamma\><around*|(|<frac|3|4>|)>|<frac|<sqrt|2>*\<pi\>|\<Gamma\><around*|(|<frac|3|4>|)>>>>>|<row|<cell|>|<cell|=4*<frac|\<Gamma\><around*|(|<frac|1|2>|)>*\<Gamma\><around*|(|<frac|3|4>|)><rsup|2>|<sqrt|2>*\<pi\>>>>>>>
  </equation>

  <with|font-series|bold|4. Evaluating <math|\<Gamma\><around*|(|<frac|1|2>|)>>:>
  Substituting <math|\<Gamma\><around*|(|<frac|1|2>|)>=<sqrt|\<pi\>>> into
  the equation:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<around*|(|<frac|1|2>,<frac|3|4>|)>>|<cell|=4*<frac|<sqrt|\<pi\>>*\<Gamma\><around*|(|<frac|3|4>|)><rsup|2>|<sqrt|2>*\<pi\>>>>|<row|<cell|>|<cell|=<frac|4|<sqrt|2>>*<frac|\<Gamma\><around*|(|<frac|3|4>|)><rsup|2>|<sqrt|\<pi\>>>>>|<row|<cell|>|<cell|=2*<sqrt|2>*<frac|\<Gamma\><around*|(|<frac|3|4>|)><rsup|2>|<sqrt|\<pi\>>>>>|<row|<cell|>|<cell|=<frac|2*\<Gamma\><around*|(|<frac|3|4>|)><rsup|2><sqrt|2>|<sqrt|\<pi\>>>>>>>>
  </equation>

  This completes the proof.

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