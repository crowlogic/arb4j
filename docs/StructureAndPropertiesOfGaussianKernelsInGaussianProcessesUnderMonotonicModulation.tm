<TeXmacs|2.1.2>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Structure and Properties of Gaussian Processes with
  Monotonically Modulated Gaussian <line-break>Kernels>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|The structural properties of Gaussian processes
  with monotonically modulated Gaussian kernels are derived. A class of
  functions satisfying specific continuity and monotonicity conditions is
  defined and two main theoretical results are presented. The first theorem
  demonstrates that for any admissible monotonic modulation function, the
  mean zero-counting function of the resulting process equals the modulation
  function. The second theorem demonstrates the eigenfunction structure of
  these modulated Gaussian kernel take the form of Hermite polynomials
  composed with the modulation function, multiplied by the exponential term
  and the square root of the modulation function's derivative. The analysis
  reveals an important invariance property of eigenvalues under monotonic
  modulation, connecting to similarity transformations in linear algebra
  through an explicit transformation operator. These results advance
  theoretical understanding of the Gaussian processes with monotonically
  modulated Gaussian kernels.>>

  <\definition>
    \ Let <math|\<cal-F\>> denote the class of functions
    <math|f:\<bbb-R\>\<to\>\<bbb-R\>> satisfying:

    <\enumerate>
      <item><math|f> is piecewise continuous with piecewise continuous first
      derivative

      <item><math|f> is monotonically increasing

      <item><math|<wide|f|\<dot\>>\<geq\>0> where it exists and is measurable

      <item><math|lim<rsub|t\<to\>\<infty\>> <wide|f|\<dot\>><around|(|t|)>>
      exists (finite or infinite)
    </enumerate>
  </definition>

  <\theorem>
    <dueto|Mean Zero-Counting Function>For any <math|f\<in\>\<cal-F\>>, the
    <math|f>-m<math|>odulated Gaussian kernel
    <math|e<rsup|-<around*|(|t-s|)><rsup|2>>>

    <\equation>
      K*<around|(|s,t|)>=e<rsup|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>>
    </equation>

    has mean zero-counting function:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=f<around|(|T|)>
    </equation>

    where <math|N<around|(|<around|[|0,T|]>|)>> denotes the counting measure
    of zeros in <math|<around|[|0,T|]>>.
  </theorem>

  <\proof>
    By the Kac-Rice formula:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=<big|int><rsub|0><rsup|T><sqrt|-lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K*<around|(|s,t|)>>*<space|0.17em>d*t
    </equation>

    Compute the derivatives:

    <\equation>
      <frac|\<partial\>|\<partial\>*s>*K*<around|(|s,t|)>=2*<around|(|f<around|(|t|)>-f<around|(|s|)>|)>*<wide|f|\<dot\>><around|(|s|)>*e<rsup|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>>
    </equation>

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K*<around|(|s,t|)>>|<cell|=2*<wide|f|\<dot\>><around|(|t|)><wide|f|\<dot\>><around|(|s|)>*e<rsup|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>>*<around|[|<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>-1|]>>>>>>
    </equation>

    Take the limit as <math|s\<to\>t>:

    <\equation>
      lim<rsub|s\<to\>t> <frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K*<around|(|s,t|)>=-<wide|f|\<dot\>><around|(|t|)><rsup|2>
    </equation>

    to see that

    <\equation*>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>>|<cell|=<big|int><rsub|0><rsup|T><sqrt|-<around|(|-<wide|f|\<dot\>><around|(|t|)><rsup|2>|)>>*d*t>|<cell|>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|T><sqrt|<around|\<nobracket\>|<wide|f|\<dot\>><around|(|t|)><rsup|2>|)>>*d*t>|<cell|>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|T><around|\||<wide|f|\<dot\>><around|(|t|)>|\|>*d*t>|<cell|>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|T><around|\||<wide|f|\<dot\>><around|(|t|)>|\|>*d*t>|<cell|<around*|(|since
      <wide|f|\<dot\>><around*|(|t|)>\<geqslant\>0\<forall\>t|)>>>|<row|<cell|>|<cell|=f<around|(|T|)>-f<around*|(|0|)>>|<cell|>>>>>
    </equation*>
  </proof>

  <\theorem>
    <dueto|Eigenfunction Structure>For the modulated Gaussian kernel
    <math|K*<around|(|s,t|)>=e<rsup|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>>>
    where <math|f\<in\>\<cal-F\>>, the eigenfunctions take the form:

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=c<rsub|n>*H<rsub|n><around|(|f<around|(|t|)>|)>*e<rsup|-<frac|f<around|(|t|)><rsup|2>|2>>*<sqrt|<wide|f|\<dot\>><around|(|t|)>>
    </equation>

    where <math|H<rsub|n>> are the Hermite polynomials and <math|c<rsub|n>>
    are normalization constants.
  </theorem>

  <\proof>
    The eigenfunction equation for kernel <math|K> is:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>>*\<phi\><rsub|n><around|(|s|)>*d*s=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>
    </equation>

    Under the change of variables <math|u=f<around|(|s|)>>,
    <math|v=f<around|(|t|)>>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<around|(|v-u|)><rsup|2>>**<frac|\<phi\><rsub|n><around|(|f<rsup|-1><around|(|u|)>|)>|<wide|f|\<dot\>><around|(|f<rsup|-1><around|(|u|)>|)>>d*u=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|f<rsup|-1><around|(|v|)>|)>
    </equation>

    Let

    <\equation>
      \<psi\><rsub|n><around|(|u|)>=<frac|\<phi\><rsub|n><around|(|f<rsup|-1><around|(|u|)>|)>|<sqrt|<wide|f|\<dot\>><around|(|f<rsup|-1><around|(|u|)>|)>>>
    </equation>

    Then:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<around|(|v-u|)><rsup|2>>*\<psi\><rsub|n><around|(|u|)><sqrt|<wide|f|\<dot\>><around|(|f<rsup|-1><around|(|u|)>|)>>*d*u=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|v|)><sqrt|<wide|f|\<dot\>><around|(|f<rsup|-1><around|(|v|)>|)>>
    </equation>

    This reduces to the standard Gaussian kernel eigenfunction equation:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<around|(|v-u|)><rsup|2>>*\<psi\><rsub|n><around|(|u|)>*d*u=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|v|)>
    </equation>

    Therefore\ 

    <\equation>
      \<psi\><rsub|n><around|(|u|)>=H<rsub|n><around|(|u|)>*e<rsup|-<frac|u<rsup|2>|2>>
    </equation>

    giving:

    <\equation*>
      \<phi\><rsub|n><around|(|t|)>=c<rsub|n>*H<rsub|n><around|(|f<around|(|t|)>|)>*e<rsup|-<frac|f<around|(|t|)><rsup|2>|2>>*<sqrt|<wide|f|\<dot\>><around|(|t|)>>
    </equation*>
  </proof>

  <\theorem>
    <dueto|Normalization Constants>For the eigenfunctions of the modulated
    Gaussian kernel <math|K<around|(|s,t|)>=e<rsup|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>>>
    where <math|f\<in\>\<cal-F\>>, the normalizing constants <math|c<rsub|n>>
    are:

    <\equation>
      c<rsub|n>=<frac|1|\<pi\><rsup|1/4>*2<rsup|n/2>*<sqrt|n!>>
    </equation>

    resulting in the complete orthonormal eigenfunction set:

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=<frac|H<rsub|n><around|(|f<around|(|t|)>|)>*e<rsup|-<frac|f<around|(|t|)><rsup|2>|2>>*<sqrt|<wide|f|\<dot\>><around|(|t|)>>|<sqrt|\<pi\>|4>*2<rsup|<frac|n|2>>*<sqrt|n!>>*
    </equation>
  </theorem>

  <\proof>
    The eigenfunctions must satisfy the normalization condition:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<phi\><rsub|n><around|(|t|)>|\|><rsup|2>*d*t=1
    </equation>

    Substituting the eigenfunction form:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>c<rsub|n><rsup|2>*H<rsub|n><rsup|2><around|(|f<around|(|t|)>|)>*e<rsup|-f<around|(|t|)><rsup|2>>*<wide|f|\<dot\>><around|(|t|)>*d*t=1
    </equation>

    Under the change of variables <math|u=f<around|(|t|)>>, this becomes:

    <\equation>
      c<rsub|n><rsup|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>H<rsub|n><rsup|2><around|(|u|)>*e<rsup|-u<rsup|2>>*d*u=1
    </equation>

    Using the correct orthogonality relation for Hermite polynomials:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>H<rsub|n><rsup|2><around|(|u|)>*e<rsup|-u<rsup|2>>*d*u=<sqrt|\<pi\>>*2<rsup|n>*n!
    </equation>

    Therefore:

    <\equation>
      c<rsub|n><rsup|2>*<sqrt|\<pi\>>*2<rsup|n>*n!=1
    </equation>

    Solving for <math|c<rsub|n>>:

    <\equation>
      c<rsub|n><rsup|2>=<frac|1|<sqrt|\<pi\>>*2<rsup|n>*n!>
    </equation>

    Taking the positive square root:

    <\equation>
      c<rsub|n>=<frac|1|<sqrt|\<pi\>|4>*2<rsup|<frac|n|2>>*<sqrt|n!>>
    </equation>
  </proof>

  <\remark>
    The invariance of eigenvalues under modulation by a monotonic function
    connects to linear algebra through similarity transformations
    <math|P<rsup|-1>*A*P>. The transformation operator

    <\equation>
      <around|(|T*\<phi\>|)><around|(|t|)>=<sqrt|<wide|f|\<dot\>><around|(|t|)>>*\<phi\><around|(|f<around|(|t|)>|)>
    </equation>

    makes this explicit, as the modulated kernel is essentially a
    conjugation:

    <\equation>
      K<rsub|f>=T<rsup|-1>*K<rsub|s*t*a*n*d*a*r*d>*T
    </equation>
  </remark>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-screen-margin|true>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?|../../.local/share/XmacsLabs/texts/scratch/no_name_1.tm>>
  </collection>
</references>