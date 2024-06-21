<TeXmacs|2.1.4>

<style|<tuple|article|boring-white>>

<\body>
  <\hide-preamble>
    <assign|R|<macro|\<bbb-R\>>>
  </hide-preamble>

  <doc-data|<doc-title|Correlation Functions of Eigenvalues of Random
  Matrices>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  The study of correlation functions of eigenvalues of random matrices is a
  significant area in mathematical physics, especially in quantum theory and
  statistical mechanics. These correlation functions are statistical measures
  that describe the interrelationships among the eigenvalues of random
  matrices.

  The joint probability density of the eigenvalues of <math|n\<times\>n>
  random Hermitian matrices <math|M\<in\><math-bf|H><rsup|n\<times\>n>> with
  partition functions of the form

  <\equation>
    Z<rsub|n,V>=<big|int><rsub|M\<in\><math-bf|H><rsup|n\<times\>n>>e<rsup|<text|tr><around|(|V<around|(|M|)>|)>>*<space|0.17em>d*\<mu\><rsub|0><around|(|M|)>
  </equation>

  where

  <\equation>
    V<around|(|x|)>\<assign\><big|sum><rsub|j=1><rsup|\<infty\>>v<rsub|j>*x<rsup|j>
  </equation>

  and <math|d*\<mu\><rsub|0><around|(|M|)>> is the standard Lebesgue measure
  on the space <math|<math-bf|H><rsup|n\<times\>n>> of Hermitian
  <math|n\<times\>n> matrices, is given by

  <\equation>
    p<rsub|n,V><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>=<around*|(|<frac|*e<rsup|-<big|sum><rsub|i=1><rsup|n>V<around|(|x<rsub|i>|)>>|Z<rsub|n,V>><big|prod><rsub|i=1><rsup|n-1><big|prod><rsub|j=i+1><rsup|n><around|(|x<rsub|i>-x<rsub|j>|)><rsup|2>|)>
  </equation>

  The <math|k>-point correlation functions (or marginal distributions) are
  defined as

  <\equation>
    R<rsup|<around|(|k|)>><rsub|n,V><around|(|x<rsub|1>,\<ldots\>,x<rsub|k>|)>=<frac|n!|<around|(|n-k|)>!>*<big|int><rsub|<math-bf|R>>p<rsub|n,V><around|(|x<rsub|1>,x<rsub|2>,\<ldots\>,x<rsub|n>|)>d*x<rsub|k+1>*\<cdots\>*<big|int><rsub|<math-bf|R>>d*x<rsub|n>*
  </equation>

  which are skew symmetric functions of their variables. In particular, the
  one-point correlation function, or density of states, is

  <\equation>
    R<rsup|<around|(|1|)>><rsub|n,V><around|(|x<rsub|1>|)>=n*<big|int><rsub|<math-bf|R>>p<rsub|n,V><around|(|x<rsub|1>,x<rsub|2>,\<ldots\>,x<rsub|n>|)>d*x<rsub|2>*\<cdots\>*<big|int><rsub|<math-bf|R>>d*x<rsub|n>*
  </equation>

  Its integral over a Borel set <math|B\<subset\><math-bf|R>> gives the
  expected number of eigenvalues contained in <math|B>:

  <\equation>
    <big|int><rsub|B>R<rsup|<around|(|1|)>><rsub|n,V><around|(|x|)>*<space|0.17em>d*x=<math-bf|E><around*|(|#<around|{|<text|eigenvalues
    in >B|}>|)>
  </equation>

  <\theorem>
    <with|font-series|bold|The Dyson-Mehta Theorem>

    For any <math|k>, <math|1\<leq\>k\<leq\>n> the <math|k>-point correlation
    function <math|R<rsup|<around|(|k|)>><rsub|n,V>> can be written as a
    determinant

    <\equation>
      R<rsup|<around|(|k|)>><rsub|n,V><around|(|x<rsub|1>,x<rsub|2>,\<ldots\>,x<rsub|k>|)>=det<rsub|1\<leq\>i,j\<leq\>k><around|(|K<rsub|n,V><around|(|x<rsub|i>,x<rsub|j>|)>|)>
    </equation>

    where <math|K<rsub|n,V><around|(|x,y|)>> is the <math|n>-th
    Christoffel-Darboux kernel

    <\equation>
      K<rsub|n,V><around|(|x,y|)>\<assign\><big|sum><rsub|k=0><rsup|n-1>\<psi\><rsub|k><around|(|x|)>*\<psi\><rsub|k><around|(|y|)>,
    </equation>

    associated to <math|V>, written in terms of the quasipolynomials

    <\equation>
      \<psi\><rsub|k><around|(|x|)>=<frac|p<rsub|k><around|(|z|)>*<space|0.17em>e<rsup|-<frac|V<around|(|z|)>|2>>|<sqrt|h<rsub|k>>>
    </equation>

    where <math|<around|{|p<rsub|k><around|(|x|)>|}><rsub|k\<in\><math-bf|N>>>
    is a complete sequence of monic polynomials, of the degrees indicated,
    satisfying the orthogonality conditions

    <\equation>
      <big|int><rsub|<math-bf|R>>\<psi\><rsub|j><around|(|x|)>*\<psi\><rsub|k><around|(|x|)>*<space|0.17em>d*x=\<delta\><rsub|j*k>
    </equation>
  </theorem>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>