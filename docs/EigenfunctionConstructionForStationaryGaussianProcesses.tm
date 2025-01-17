<TeXmacs|2.1.2>

<style|<tuple|letter|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>

    <\abstract>
      The eigenfunctions of the covariance operator of a stationary Gaussian
      process are shown to be the orthogonal complement of the inverse
      Fourier transforms of polynomials orthogonal to the square root of its
      spectral density. Utilizing the convolution theorem and properties of
      the covariance operator, an explicit construction method for these
      eigenfunctions is provided. This result enables efficient computation
      and offers a comprehensive solution for all stationary Gaussian
      processes.
    </abstract>
  </author-affiliation>>>>

  <\definition>
    The Gram-Schmidt formula expresses the orthogonal complement
    <math|f<rsub|n><rsup|\<perp\>p><around|(|x|)>> of a function sequence
    <math|f<rsub|n><around|(|x|)>> with respect to the orthogonality measure
    <math|p<around|(|x|)>> by the recursive equation

    <\equation>
      f<rsub|k><rsup|\<perp\>p><around|(|x|)>=f<rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><frac|<around|\<langle\>|f<rsub|k>,f<rsub|j><rsup|\<perp\>p>|\<rangle\>><rsub|p>|<around|\<langle\>|f<rsub|j><rsup|\<perp\>p>,f<rsub|j><rsup|\<perp\>p>|\<rangle\>>>*f<rsub|j><rsup|\<perp\>p><around|(|x|)>
    </equation>

    where the inner product is defined as:

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>><rsub|p>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|<around|\||x|\|>|)>*g<around|(|<around|\||x|\|>|)>*p<around|(|<around|\||x|\|>|)>*\<mathd\>*x
    </equation>

    where <math|<around|\<langle\>|f,g|\<rangle\>>=<around|\<langle\>|f,g|\<rangle\>><rsub|1>>
    and the normalized functions are denoted with a wide bar

    <\equation>
      <wide|f<rsub|k><rsup|\<perp\>>|\<bar\>><around|(|x|)>=<frac|f<rsub|k><rsup|\<perp\>><around|(|x|)>|<around|\<\|\|\>|f<rsub|k><rsup|\<perp\>>|\<\|\|\>>>=<frac|f<rsub|k><rsup|\<perp\>><around|(|x|)>|<sqrt|<around|\<langle\>|f<rsub|k><rsup|\<perp\>>,f<rsub|k><rsup|\<perp\>>|\<rangle\>>>>
    </equation>
  </definition>

  <\definition>
    The Fourier transform <math|\<cal-F\>> and its inverse
    <math|\<cal-F\><rsup|-1>> are defined as:

    <\equation>
      \<cal-F\><around|[|f|]><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|<around|\||x|\|>|)>*e<rsup|-i*\<omega\>*x>*d*x
    </equation>

    <\equation>
      \<cal-F\><rsup|-1><around|[|g|]><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*d*\<omega\>
    </equation>
  </definition>

  <\theorem>
    The eigenfunctions of a stationary gaussian process are given by the
    orthogonal complement of the inverse Fourier transforms of the
    polynomials orthogonal to the square root of the spectral density.
  </theorem>

  <\proof>
    Let <math|S<around|(|\<omega\>|)>> be the spectral density of a
    stationary Gaussian process, <math|K<around|(|<around|\||x-y|\|>|)>=<around|(|\<cal-F\><rsup|-1><around|[|S<around|(|\<omega\>|)>|]>|)><around|(|<around|\||x-y|\|>|)>>
    be its covariance kernel and <math|<around|{|Q<rsub|k><around|(|\<omega\>|)>|}>>
    be the sequence of polynomials orthogonal with respect to
    <math|<sqrt|S<around|(|\<omega\>|)>>>

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>Q<rsub|k><around|(|\<omega\>|)>*Q<rsub|j><around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*<space|0.17em>d*\<omega\>=0\<forall\>k\<neq\>j
    </equation>

    Let

    <\equation>
      \<psi\><rsub|k><around|(|x|)>=\<cal-F\><rsup|-1><around|[|Q<rsub|k><around|(|\<omega\>|)>|]><around|(|<around|\||x|\|>|)><label|ift>
    </equation>

    be the inverse Fourier Transform of the polynomials orthogonal to the
    square root of the spectral density and

    <\equation>
      \<psi\><rsub|k><rsup|\<perp\>><around|(|x|)>=\<psi\><rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><frac|<around|\<langle\>|\<psi\><rsub|k>,\<psi\><rsub|j><rsup|\<perp\>>|\<rangle\>>|<around|\<langle\>|\<psi\><rsub|j><rsup|\<perp\>>,\<psi\><rsub|j><rsup|\<perp\>>|\<rangle\>>>*\<psi\><rsub|j><rsup|\<perp\>><around|(|x|)><label|eig>
    </equation>

    denote its orthogonal complement. Then apply the covariance operator

    <\equation>
      T<around|[|f|]><around|(|y|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||x-y|\|>|)>*f<around|(|<around|\||x|\|>|)>*\<mathd\>*x
    </equation>

    to <math|\<psi\><rsub|k><rsup|\<perp\>><around|(|x|)>> to get

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|T<around|[|\<psi\><rsub|k><rsup|\<perp\>>|]><around|(|x|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||x-y|\|>|)>*\<psi\><rsub|k><rsup|\<perp\>><around|(|<around|\||y|\|>|)>*\<mathd\>*y>>|<row|<cell|>|<cell|=\<cal-F\><rsup|-1>*<around|[|S<around|(|\<omega\>|)>\<cdot\>\<cal-F\><around|[|\<psi\><rsub|k><rsup|\<perp\>>|]><around|(|\<omega\>|)>|]><around|(|<around|\||x|\|>|)>>>>>><label|T>
    </equation>

    where the equality is due to the convolution theorem. By the linearity of
    the Fourier transform and the Gram-Schmidt construction in Equation
    (<reference|eig>):

    <\equation>
      \<cal-F\><around|[|\<psi\><rsub|k><rsup|\<perp\>>|]><around|(|\<omega\>|)>=Q<rsub|k><around|(|\<omega\>|)>-<big|sum><rsub|j=1><rsup|k-1><frac|<around|\<langle\>|\<psi\><rsub|k>,\<psi\><rsub|j><rsup|\<perp\>>|\<rangle\>>|<around|\<langle\>|\<psi\><rsub|j><rsup|\<perp\>>,\<psi\><rsub|j><rsup|\<perp\>>|\<rangle\>>>*\<cal-F\><around|[|\<psi\><rsub|j><rsup|\<perp\>>|]><around|(|\<omega\>|)>
    </equation>

    Substituting this into Equation (<reference|T>):

    <\equation>
      T<around|[|\<psi\><rsub|k><rsup|\<perp\>>|]><around|(|x|)>=\<cal-F\><rsup|-1>*<around|[|S<around|(|\<omega\>|)>\<cdot\><around|(|Q<rsub|k><around|(|\<omega\>|)>-<big|sum><rsub|j=1><rsup|k-1>c<rsub|j>*\<cal-F\><around|[|\<psi\><rsub|j><rsup|\<perp\>>|]><around|(|\<omega\>|)>|)>|]><around|(|<around|\||x|\|>|)>
    </equation>

    where

    <\equation>
      c<rsub|j>=<frac|<around|\<langle\>|\<psi\><rsub|k>,\<psi\><rsub|j><rsup|\<perp\>>|\<rangle\>>|<around|\<langle\>|\<psi\><rsub|j><rsup|\<perp\>>,\<psi\><rsub|j><rsup|\<perp\>>|\<rangle\>>>
    </equation>

    By the orthogonality of <math|Q<rsub|k><around|(|\<omega\>|)>> with
    respect to <math|<sqrt|S<around|(|\<omega\>|)>>>, and the fact that
    <math|Q<rsub|k><around|(|\<omega\>|)>> are constructed as orthogonal
    polynomials with respect to the weight
    <math|<sqrt|S<around|(|\<omega\>|)>>>, it follows that
    <math|Q<rsub|k><around|(|\<omega\>|)>> are eigenfunctions of the
    multiplication operator defined by <math|S<around|(|\<omega\>|)>>.
    Specifically, since <math|S<around|(|\<omega\>|)>=<around|(|<sqrt|S<around|(|\<omega\>|)>>|)><rsup|2>>,
    we have:

    <\equation>
      S<around|(|\<omega\>|)>*Q<rsub|k><around|(|\<omega\>|)>=\<lambda\><rsub|k>*Q<rsub|k><around|(|\<omega\>|)>
    </equation>

    And since:

    <\equation>
      S<around|(|\<omega\>|)>*\<cal-F\><around|[|\<psi\><rsub|j><rsup|\<perp\>>|]><around|(|\<omega\>|)>=\<lambda\><rsub|j>*\<cal-F\><around|[|\<psi\><rsub|j><rsup|\<perp\>>|]><around|(|\<omega\>|)>\<forall\>j\<less\>k
    </equation>

    Therefore:

    <\equation>
      T<around|[|\<psi\><rsub|k><rsup|\<perp\>>|]><around|(|x|)>=\<lambda\><rsub|k>*\<psi\><rsub|k><around|(|<around|\||x|\|>|)>-<big|sum><rsub|j=1><rsup|k-1>c<rsub|j>*\<lambda\><rsub|j>*\<psi\><rsub|j><rsup|\<perp\>><around|(|<around|\||x|\|>|)>
    </equation>

    By the construction of <math|\<psi\><rsub|k><rsup|\<perp\>><around|(|x|)>>,
    this equals:

    <\equation>
      T<around|[|\<psi\><rsub|k><rsup|\<perp\>>|]><around|(|x|)>=\<lambda\><rsub|k>*\<psi\><rsub|k><rsup|\<perp\>><around|(|<around|\||x|\|>|)>
    </equation>

    Thus <math|\<psi\><rsub|k><rsup|\<perp\>><around|(|<around|\||x|\|>|)>>
    is an eigenfunction of the integral covariance operator <math|T> with
    eigenvalue <math|\<lambda\><rsub|k>\<gtr\>0>.
  </proof>

  <\algorithm>
    \ <with|font-series|bold|Input:> Spectral density
    <math|S<around|(|\<omega\>|)>>

    1. Form weight function <math|w<around|(|\<omega\>|)>=<sqrt|S<around|(|\<omega\>|)>>>

    2. Apply Gram-Schmidt to <math|<around|{|1,\<omega\>,\<omega\><rsup|2>,...|}>>
    with inner product:\ 

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|\<omega\>|)>*g<around|(|\<omega\>|)>*w<around|(|\<omega\>|)>*d*\<omega\>
    </equation>

    \ to get polynomials <math|<around|{|Q<rsub|k><around|(|\<omega\>|)>|}>>

    3. Take inverse Fourier transforms:\ 

    <\equation>
      \<psi\><rsub|k><around|(|x|)>=\<cal-F\><rsup|-1><around|[|Q<rsub|k><around|(|\<omega\>|)>|]><around|(|<around|\||x|\|>|)>
    </equation>

    4. Apply Gram-Schmidt again to <math|<around|{|\<psi\><rsub|k><around|(|x|)>|}>>
    to get eigenfunctions <math|<around|{|\<psi\><rsub|k><rsup|\<perp\>><around|(|x|)>|}>>
  </algorithm>

  <\remark>
    The absolute value in the kernel <math|K<around*|(|<around*|\||x-y|\|>|)>>
    is not merely a notational choice but fundamentally defines the isotropic
    nature of the process. While stationarity requires
    <math|K<around*|(|x,y|)>=K<around*|(|y,x|)>>, isotropy imposes the
    stronger condition <math|K<around*|(|x,y|)>=K<around*|(|<around*|\||x-y|\|>|)>>,
    ensuring that correlations depend solely on distance. This property
    induces symmetries in both the spatial and spectral domains, with the
    spectral density <math|S<around*|(|\<omega\>|)>> necessarily being even
    and the eigenfunctions preserving these symmetry properties through the
    Fourier transform.
  </remark>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.4>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|T|<tuple|10|3>>
    <associate|eig|<tuple|8|2>>
    <associate|ift|<tuple|7|2>>
  </collection>
</references>