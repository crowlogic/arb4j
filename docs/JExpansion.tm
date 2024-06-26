<TeXmacs|2.1.4>

<style|generic>

<\body>
  \;

  Given:

  <\equation*>
    J<rsub|0>*<around|(|x-y|)>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*J<rsub|k>*<around|(|-y|)>
  </equation*>

  \;

  <\equation*>
    <around|[|T*\<psi\><rsub|n>|]><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y
  </equation*>

  <\equation*>
    =<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|k>*<around|(|-y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y
  </equation*>

  Where <math|\<psi\><rsub|n><around|(|y|)>> is:

  <\equation*>
    \<psi\><rsub|n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>
  </equation*>

  <\equation*>
    =<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
  </equation*>

  Substituting\ 

  <\equation*>
    <big|int><rsub|0><rsup|\<infty\>>J<rsub|k>*<around|(|-y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y=<frac|<sqrt|4*n+1>*<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|<frac|k|2>+n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|-n+<frac|k|2>+<frac|1|2>|)>*\<Gamma\>*<around*|(|<frac|k|2>+n+1|)>*\<Gamma\>*<around*|(|n+1-<frac|k|2>|)>>
  </equation*>

  Now, putting it all back into the expansion for
  <math|<around|[|T*\<psi\><rsub|n>|]><around|(|x|)>>:

  <\equation*>
    <around|[|T*\<psi\><rsub|n>|]><around|(|x|)>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)><frac|<sqrt|4*n+1>*<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|<frac|k|2>+n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|-n+<frac|k|2>+<frac|1|2>|)>*\<Gamma\>*<around*|(|<frac|k|2>+n+1|)>*\<Gamma\>*<around*|(|n+1-<frac|k|2>|)>>
  </equation*>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>