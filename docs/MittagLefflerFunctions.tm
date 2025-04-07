<TeXmacs|2.1.4>

<style|<tuple|article|std-latex>>

<\body>
  The numerical scheme for computation of the Mittag-Leffler function given
  in pseudocode notation by the algorithm below is based on the results
  presented in Section 3. The algorithm uses the defining series (2) for
  arguments <math|z> of small magnitude, its asymptotic representations (6),
  (7) for arguments <math|z> of large magnitude, and special integral
  representations for intermediate values of the argument that include a
  monotonic part <math|<big|int>K<around|(|\<alpha\>,\<beta\>,\<chi\>,z|)>*d*\<chi\>>
  and an oscillatory part <math|<big|int>P<around|(|\<alpha\>,\<beta\>,\<epsilon\>,\<phi\>,z|)>*d*\<phi\>>,
  which can be evaluated using standard techniques.

  GIVEN <math|\<alpha\>\<gtr\>0>, <math|\<beta\>\<in\>\<bbb-R\>>,
  <math|z\<in\>\<bbb-C\>>, <math|\<rho\>\<gtr\>0> THEN<next-line>IF
  <math|1*<around|[|10+5*\<alpha\>|]>> THEN<next-line><math|k<rsub|0>=<around|\<lfloor\>|-ln
  <around|(|\<rho\>|)>/ln <around|(|<around|\||z|\|>|)>|\<rfloor\>>><next-line>IF
  <math|<around|\||arg z|\|>*\<alpha\>*\<pi\>> THEN<next-line>IF
  <math|\<beta\>\<leq\>1> THEN<next-line><math|E<rsub|\<alpha\>,\<beta\>><around|(|z|)>=<big|int><rsub|0><rsup|\<chi\><rsub|0>>K<around|(|\<alpha\>,\<beta\>,\<chi\>,z|)>*d*\<chi\>><next-line>ELSE<next-line><math|E<rsub|\<alpha\>,\<beta\>><around|(|z|)>=<big|int><rsub|0><rsup|\<chi\><rsub|0>>K<around|(|\<alpha\>,\<beta\>,\<chi\>,z|)>*d*\<chi\>+<big|int><rsub|-\<alpha\>*\<pi\>><rsup|\<alpha\>*\<pi\>>P<around|(|\<alpha\>,\<beta\>,1,\<phi\>,z|)>*d*\<phi\>><next-line>ELSIF
  <math|<around|\||arg z|\|>\<less\>\<alpha\>*\<pi\>> THEN<next-line>IF
  <math|\<beta\>\<leq\>1> THEN<next-line><math|E<rsub|\<alpha\>,\<beta\>><around|(|z|)>=<big|int><rsub|0><rsup|\<chi\><rsub|0>>K<around|(|\<alpha\>,\<beta\>,\<chi\>,z|)>*d*\<chi\>+<frac|1|\<alpha\>>*z<rsup|<frac|<around|(|1-\<beta\>|)>|\<alpha\>>>*e<rsup|z<rsup|1/\<alpha\>>>><next-line>ELSE<next-line><math|E<rsub|\<alpha\>,\<beta\>><around|(|z|)>=<big|int><rsub|<around|\||<frac|z|2>|\|>><rsup|\<chi\><rsub|0>>K<around|(|\<alpha\>,\<beta\>,\<chi\>,z|)>*d*\<chi\>+<big|int><rsub|-\<alpha\>*\<pi\>><rsup|\<alpha\>*\<pi\>>P<around|(|\<alpha\>,\<beta\>,<around|\||<frac|z|2>|\|>,\<phi\>,z|)>*d*\<phi\>+<frac|1|\<alpha\>>*z<rsup|<frac|<around|(|1-\<beta\>|)>|\<alpha\>>>*e<rsup|z<rsup|1/\<alpha\>>>><next-line>ELSE<next-line><math|E<rsub|\<alpha\>,\<beta\>><around|(|z|)>=<big|int><rsub|<frac|<around|(|<around|\||z|\|>+1|)>|2>><rsup|\<chi\><rsub|0>>K<around|(|\<alpha\>,\<beta\>,\<chi\>,z|)>*d*\<chi\>+<big|int><rsub|-\<alpha\>*\<pi\>><rsup|\<alpha\>*\<pi\>>P<around|(|\<alpha\>,\<beta\>,<frac|<around|(|<around|\||z|\|>+1|)>|2>,\<phi\>,z|)>*d*\<phi\>><next-line>END

  <with|font-series|bold|Remark 5.1.> The formulas for
  <math|E<rsub|\<alpha\>,\<beta\>><around|(|z|)>> in this algorithm are in
  error at most by <math|\<rho\>>. It is advisable to take
  <math|\<rho\>=\<epsilon\><rsub|m>=>machine precision.
</body>

<initial|<\collection>
</collection>>