<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|On A New Bessel Function Identity For The Fourier
  Transform of <math|J<rsub|0>>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>\<cdot\>
  </author-affiliation>>>>

  <\lemma>
    <label|nbfi>Let <math|J<rsub|n>> be the Bessel function of the first kind
    of order <math|n>, then

    <\equation>
      <big|sum><rsub|m=1><rsup|\<infty\>><around*|(|J<rsub|m-1><rsup|2>*<around|(|m*v|)>+J<rsub|m+1><rsup|2>*<around|(|m*v|)>|)>=<frac|1|<sqrt|1-v<rsup|2>>>\<forall\>0\<le\>v\<less\>1
    </equation>

    \;
  </lemma>

  <\proof>
    The case <math|v=0> is trivial as the only nonvanishing term on the
    left-hand side is <math|J<rsub|0><rsup|2><around|(|0|)>=1>. We henceforth
    assume <math|0\<less\>v\<less\>1>.

    Using the integral representation 10.9.26 in<nbsp><cite|NIST>,

    <\equation>
      J<rsup|2><rsub|n><around|(|z|)>=<frac|2|\<pi\>>*<big|int><rsub|0><rsup|<frac|\<pi\>|2>>J<rsub|2*n>*<around|(|2*z*cos
      \<theta\>|)><space|0.17em>\<mathd\>\<theta\>
    </equation>

    we have

    <align|<tformat|<table|<row|<cell|<big|sum><rsub|m=1><rsup|\<infty\>><around*|(|J<rsub|m-1><rsup|2>*<around|(|m*v|)>+J<rsub|m+1><rsup|2>*<around|(|m*v|)>|)>>|<cell|=<frac|2|\<pi\>>*<big|sum><rsub|m=1><rsup|\<infty\>><big|int><rsub|0><rsup|<frac|\<pi\>|2>><around*|(|J<rsub|2*m-2>*<around|(|2*m*v*cos
    \<theta\>|)>+J<rsub|2*m+2>*<around|(|2*m*v*cos
    \<theta\>|)>|)>\<mathd\>\<theta\>>>|<row|<cell|>|<cell|=<frac|2|\<pi\>>*<big|int><rsub|0><rsup|<frac|\<pi\>|2>>\<mathd\>\<theta\>*<big|sum><rsub|m=1><rsup|\<infty\>><around*|(|J<rsub|2*m-2>*<around|(|2*m*v*cos
    \<theta\>|)>+J<rsub|2*m+2>*<around|(|2*m*v*cos
    \<theta\>|)>|)><eq-number><label|eq:ident-int-1>>>>>>

    where the interchange of the sum and the integral is justified because
    the summands fall off exponentially in<nbsp><math|m>, uniformly
    in<nbsp><math|\<theta\>>, as seen from 10.20.4 in <cite|NIST>, recalling
    that <math|0\<le\>v*cos \<theta\>\<le\>v\<less\>1>.

    For <math|0\<le\>\<theta\>\<less\><frac|\<pi\>|2>>, we use Bessel
    function identities to rewrite the summands in <eqref|eq:ident-int-1> and

    <\equation>
      J<rsub|2*m-2>*<around|(|2*m*v*cos \<theta\>|)>+J<rsub|2*m+2>*<around|(|2*m*v*cos
      \<theta\>|)>=J<rsub|2*m>*<around|(|2*m*v*cos
      \<theta\>|)>*<around*|(|<frac|4|v<rsup|2>*cos<rsup|2>
      \<theta\>>-2|)>-<frac|<frac|<wide|J|\<dot\>><rsub|2*m>*<around|(|2*m*v*cos
      \<theta\>|)>|2*m>|v*cos \<theta\>>*
    </equation>

    and we then evaluate the sum over <math|m> by the identities

    <\subequations>
      <align|<tformat|<table|<row|<cell|<big|sum><rsub|m=1><rsup|\<infty\>>J<rsub|2*m>*<around|(|2*m*t|)>>|<cell|=<nbsp><frac|t<rsup|2>|2*<around|(|1-t<rsup|2>|)>><space|0.17em><eq-number>>>|<row|<cell|<big|sum><rsub|m=1><rsup|\<infty\>><frac|<wide|J|\<dot\>><rsub|2*m>*<around|(|2*m*t|)>|2*m>>|<cell|=<nbsp><frac|1|2>*<around*|(|<big|sum><rsub|k=1><rsup|\<infty\>><frac|<wide|J|\<dot\>><rsub|k>*<around|(|k*t|)>|k>-<big|sum><rsub|k=1><frac|<wide|J|\<dot\>><rsub|k>*<around|(|k*t|)>|k>*<around|(|-1|)><rsup|k-1>|)>>>|<row|<cell|>|<cell|=<nbsp><frac|1|2>*<around*|[|<frac|1|2>+<frac|t|4>-<around*|(|<frac|1|2>-<frac|t|4>|)>|]>>>|<row|<cell|>|<cell|=<nbsp><frac|t|4><space|0.17em><eq-number>>>>>>
    </subequations>

    \ valid for <math|0\<le\>t\<less\>1>, using 8.517.3, 8.518.1 and 8.518.2
    in<nbsp><cite|G+R>. Hence

    <align|<tformat|<table|<row|<cell|<big|sum><rsub|m=1><rsup|\<infty\>><around*|(|J<rsub|m-1><rsup|2>*<around|(|m*v|)>+J<rsub|m+1><rsup|2>*<around|(|m*v|)>|)>>|<cell|=<frac|2|\<pi\>>*<big|int><rsub|0><rsup|<frac|\<pi\>|2>><around*|[|<around*|(|<frac|4|v<rsup|2>*cos<rsup|2>
    \<theta\>>-2|)>*<frac|v<rsup|2>*cos<rsup|2>
    \<theta\>|2*<around|(|1-v<rsup|2>*cos<rsup|2> \<theta\>|)>>-<frac|4|v*cos
    \<theta\>>*<frac|v*cos \<theta\>|4>|]>\<mathd\>\<theta\>>>|<row|<cell|>|<cell|=<frac|2|\<pi\>>*<big|int><rsub|0><rsup|<frac|\<pi\>|2>><frac||1-v<rsup|2>*cos<rsup|2>
    \<theta\>>\<mathd\>\<theta\>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|1-v<rsup|2>>><space|0.17em><eq-number>>>>>>

    where the last integral is elementary.<cite|newBesselFunctionIdentity>\ 
  </proof>

  Lemma <reference|nbfi> it was proved in <cite|newBesselFunctionIdentity>
  \ that but they made no mention of the fact that this is the (one-sided)
  Fourier transform

  <\equation>
    \<lambda\><around*|(|v|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around*|(|x|)>e<rsup|i
    x v>\<mathd\>x=<frac|1|<sqrt|1-v<rsup|2>>>
  </equation>

  which is the orthogonality measure of the Chebyshev polynomials of the
  first kind

  <\equation>
    <big|int><rsub|-1><rsup|1><frac|T<rsub|n><around*|(|x|)>
    T<rsub|m><around*|(|x|)>|<sqrt|1-v<rsup|2>>>\<mathd\>x=\<delta\><rsub|n,m>
    <around*|\<\|\|\>|T<rsub|n>|\<\|\|\>>
  </equation>

  where <math|<around*|\<\|\|\>|T<rsub|n>|\<\|\|\>>=<big|int><rsub|-1><rsup|1>T<rsub|n><around*|(|x|)><rsup|2>\<mathd\>x>.

  \;

  <\bibliography|bib|tm-plain|refs2>
    <\bib-list|1>
      <bibitem*|1><label|bib-newBesselFunctionIdentity>Cameron<nbsp>R D
      Bunney<localize| and >Jorma Louko. <newblock>Circular motion analogue
      unruh effect in a 2+1 thermal bath: robbing from the rich and giving to
      the poor. <newblock><with|font-shape|italic|Classical and Quantum
      Gravity>, 40(15):155001\U27, 2023.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_31.tm>>
    <associate|bib-newBesselFunctionIdentity|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_31.tm>>
    <associate|eq:ident-int-1|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_31.tm>>
    <associate|nbfi|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_31.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      NIST

      NIST

      G+R

      newBesselFunctionIdentity

      newBesselFunctionIdentity
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>