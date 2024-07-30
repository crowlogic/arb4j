<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|framed-theorems>>

<\body>
  <doc-data|<doc-title|Variance Structure Function(aka the
  variogram)>|<doc-author|<author-data|<author-name|Stephen Crowley>>>>

  This equation defines the semivariogram <math|\<gamma\><around|(|h|)>> for
  a stochastic process <math|Z<around|(|x|)>>. It has the two forms:

  <\enumerate>
    <item>The discrete form:

    <\equation*>
      \<gamma\><around|(|h|)>=lim<rsub|\<Delta\>*h\<to\>0>
      <frac|1|2*N*<around|(|\<Delta\>*h|)>>*<big|sum><rsub|i=1><rsup|N*<around|(|\<Delta\>*h|)>><around|(|Z<around|(|x<rsub|i>|)>-Z*<around|(|x<rsub|i>+\<Delta\>*h|)>|)><rsup|2>
    </equation*>

    This expression calculates the average squared differences between values
    of the process at points separated by a distance <math|\<Delta\>*h>, as
    <math|\<Delta\>*h> approaches zero. The factor of <math|<frac|1|2>>
    normalizes the semivariogram.

    <item>The continuous form:

    <\equation*>
      \<gamma\><around|(|h|)>=<frac|1|2*L>*<big|int><rsub|0><rsup|L><around|(|Z<around|(|x|)>-Z*<around|(|x+h|)>|)><rsup|2>*<space|0.17em>d*x
    </equation*>

    Here, the semivariogram is expressed as a continuous integral over a
    domain of length <math|L>, considering the squared differences of the
    process at every point <math|x> and its value at <math|x+h>.
  </enumerate>

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