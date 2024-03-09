<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  Let <math|R<around*|(|t,s|)>> be defined by

  <\equation*>
    R<around|(|t,s|)>=c+a e<rsup|b<frac|\<vartheta\><around|(|t|)>+\<vartheta\><around|(|s|)>|2>>J<rsub|0>*<around*|(|\<beta\><around|\||t-s|\|>|)>
  </equation*>

  where <math|a>, <math|b>, and <math|\<beta\>> are scaling parameters,
  <math|c> is a baseline adjustment, and <math|J<rsub|0>> is the Bessel
  function of the first kind of order 0, and
  <math|\<vartheta\><around|(|t|)>> is the Riemann-Siegel theta function.\ 

  The integral covariance operator <math|\<cal-K\>> associated with this
  kernel, acting on a function <math|\<phi\>>, is given by

  <\equation>
    <around|(|\<cal-K\>f|)><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>R<around|(|t,s|)>*f<around|(|s|)>*<space|0.17em>d*s
  </equation>

  so that

  <\equation>
    <around|(|\<cal-K\>*\<phi\><rsub|n>|)><around|(|t|)>=\<lambda\><rsub|n><big|int><rsub|0><rsup|\<infty\>><around*|(|a
    e<rsup|b<frac|\<vartheta\><around|(|t|)>+\<vartheta\><around|(|s|)>|2>>J<rsub|0>*<around*|(|\<beta\><around|\||t-s|\|>|)>+c|)>*\<phi\><rsub|n><around|(|s|)>*<space|0.17em>d*s
  </equation>

  The eigenfunction equation for the integral covariance operator
  <math|\<cal-K\>> seeks functions <math|\<phi\><rsub|n><around|(|t|)>> such
  that

  <\equation>
    <around|(|\<cal-K\>*\<phi\><rsub|n>|)><around|(|t|)>=\<lambda\>*<rsub|n>\<phi\><rsub|n><around|(|t|)>
  </equation>

  which expands to

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>><around*|(|a
    e<rsup|b<frac|\<vartheta\><around|(|t|)>+\<vartheta\><around|(|s|)>|2>>J<rsub|0>*<around*|(|\<beta\><around|\||t-s|\|>|)>+c|)>*\<phi\><rsub|n><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|n>
    \<phi\><rsub|n><around|(|t|)>
  </equation>

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
    <associate|auto-1|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>