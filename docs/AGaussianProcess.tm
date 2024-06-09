<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  Let <math|\<theta\><around*|(|t|)>> be the Riemann-Siegel vartheta function
  then define:

  <\equation*>
    K<around|(|t,s|)>=J<rsub|0>*<around|(|t-s|)>\<cdot\>e<rsup|<frac|1|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)><rsup|2>>
  </equation*>

  The first derivative with respect to <math|t> is:

  <\equation*>
    K<rsub|t><around|(|t,s|)>=<frac|\<partial\>|\<partial\>*t>*<around*|[|J<rsub|0>*<around|(|t-s|)>\<cdot\>e<rsup|<frac|1|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)><rsup|2>>|]>
  </equation*>

  Using the product rule, we get:

  <\equation*>
    K<rsub|t><around|(|t,s|)>=J<rsub|0><rprime|'>*<around|(|t-s|)>\<cdot\>e<rsup|<frac|1|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)><rsup|2>>+J<rsub|0>*<around|(|t-s|)>\<cdot\><frac|\<partial\>|\<partial\>*t><around*|[|e<rsup|<frac|1|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)><rsup|2>>|]>
  </equation*>

  Applying the chain rule to the second term:

  <\equation*>
    K<rsub|t><around|(|t,s|)>=J<rsub|0><rprime|'>*<around|(|t-s|)>\<cdot\>e<rsup|<frac|1|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)><rsup|2>>+J<rsub|0>*<around|(|t-s|)>\<cdot\>e<rsup|<frac|1|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)><rsup|2>>\<cdot\><frac|2|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>\<cdot\>\<theta\><rprime|'><around|(|t|)>
  </equation*>

  So,

  <\equation*>
    K<rsub|t><around|(|t,s|)>=e<rsup|<frac|1|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)><rsup|2>>*<around*|[|J<rsub|0><rprime|'>*<around|(|t-s|)>+J<rsub|0>*<around|(|t-s|)>\<cdot\><frac|2|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>\<cdot\>\<theta\><rprime|'><around|(|t|)>|]>
  </equation*>

  Evaluating the second derivative at <math|t=s>:

  <\equation*>
    K<rsub|t*t><around|(|t,t|)>=<frac|\<partial\>|\<partial\>*t>*<around*|[|J<rsub|0><rprime|'><around|(|0|)>\<cdot\>e<rsup|0>+J<rsub|0><around|(|0|)>\<cdot\>e<rsup|0>\<cdot\><frac|2|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|t|)>|)>\<cdot\>\<theta\><rprime|'><around|(|t|)>|]>
  </equation*>

  Given <math|J<rsub|0><around|(|0|)>=1> and
  <math|J<rsub|0><rprime|'><around|(|0|)>=0>:

  <\equation*>
    K<rsub|t*t><around|(|t,t|)>=<frac|\<partial\>|\<partial\>*t>*<around*|[|0+1\<cdot\><frac|2|\<pi\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|t|)>|)>\<cdot\>\<theta\><rprime|'><around|(|t|)>|]>=<frac|2|\<pi\>><around|(|\<theta\><rprime|'><around|(|t|)>|)><rsup|2>
  </equation*>

  The Kac-Rice formula for the expected number of zeros is:

  <\equation*>
    E<around|[|N<around|(|a,b|)>|]>=<big|int><rsub|a><rsup|b><sqrt|<frac|-K<rsub|t*t><around|(|t,t|)>|2*\<pi\>*K<around|(|t,t|)>>>*<space|0.17em>d*t
  </equation*>

  Given <math|K<around|(|t,t|)>=1>:

  <\equation*>
    E<around|[|N<around|(|a,b|)>|]>=<big|int><rsub|a><rsup|b><sqrt|<frac|<frac|2|\<pi\>><around|(|\<theta\><rprime|'><around|(|t|)>|)><rsup|2>|2*\<pi\>>>*<space|0.17em>d*t
  </equation*>

  Simplifying:

  <\equation*>
    E<around|[|N<around|(|a,b|)>|]>=<big|int><rsub|a><rsup|b><frac|<sqrt|<frac|2|\<pi\>>><around|\||\<theta\><rprime|'><around|(|t|)>|\|>|<sqrt|2*\<pi\>>>*<space|0.17em>d*t=<big|int><rsub|a><rsup|b><frac|<sqrt|2/\<pi\>><around|\||\<theta\><rprime|'><around|(|t|)>|\|>|<sqrt|2*\<pi\>>>*<space|0.17em>d*t
  </equation*>

  Further simplification:

  <\equation*>
    E<around|[|N<around|(|a,b|)>|]>=<big|int><rsub|a><rsup|b><frac|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>|\<pi\>>*<space|0.17em>d*t
  </equation*>

  <\equation*>
    E<around|[|N<around|(|a,b|)>|]>=<frac|1|\<pi\>>*<around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>
  </equation*>
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