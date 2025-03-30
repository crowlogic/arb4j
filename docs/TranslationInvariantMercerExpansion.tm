<TeXmacs|2.1.4>

<style|generic>

<\body>
  <section|Theorem>

  For a translation-invariant kernel <math|k<around|(|t,s|)>=k*<around|(|t-s|)>>
  with spectral density <math|S<around|(|\<omega\>|)>> on
  <math|<around|[|0,\<infty\>|)>>, the Mercer expansion can be computed using
  an orthonormal basis and the square root of the spectral density
  <math|<sqrt|S<around|(|\<omega\>|)>>>.

  <section|Proof>

  <\itemize>
    <item>Define <math|h<around|(|t|)>> as the inverse Fourier transform of
    <math|<sqrt|S<around|(|\<omega\>|)>>>:

    <\equation>
      h<around|(|t|)>=\<cal-F\><rsup|-1><around|[|<sqrt|S<around|(|\<omega\>|)>>|]>=<frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
    </equation>

    <item>Let <math|<around|{|e<rsub|j><around|(|t|)>|}><rsub|j=1><rsup|\<infty\>>>
    be an orthonormal basis for <math|L<rsup|2>*<around|[|0,\<infty\>|)>>

    <item>Define <math|f<rsub|j><around|(|t|)>> as:

    <\equation>
      f<rsub|j><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>h*<around|(|t-\<tau\>|)>*e<rsub|j><around|(|\<tau\>|)>*d*\<tau\>
    </equation>

    <item>Define the covariance operator <math|C>:

    <\equation>
      <around|(|C*f|)><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*f<around|(|s|)>*d*s
    </equation>

    <item>The eigenvalue problem for <math|C> is:

    <\equation>
      C*\<phi\><rsub|n>=\<lambda\><rsub|n>*\<phi\><rsub|n>
    </equation>

    <item>Express <math|\<phi\><rsub|n><around|(|t|)>> in terms of
    <math|f<rsub|j><around|(|t|)>>:

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*f<rsub|j><around|(|t|)>
    </equation>

    <item>Substitute this into the eigenvalue equation:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*f<rsub|j><around|(|s|)>*d*s=\<lambda\><rsub|n>*<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*f<rsub|j><around|(|t|)>
    </equation>

    <item>Take the inner product with <math|e<rsub|i><around|(|t|)>>:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*<big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*f<rsub|j><around|(|s|)>*d*s*d*t=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*f<rsub|j><around|(|t|)>*d*t
    </equation>

    <item>Define the matrices:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|K<rsub|i*j>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*<big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*f<rsub|j><around|(|s|)>*d*s*d*t>>|<row|<cell|M<rsub|i*j>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*f<rsub|j><around|(|t|)>*d*t>>>>>
    </equation>

    <item>The eigenvalue problem becomes:

    <\equation>
      K*c<rsub|n>=\<lambda\><rsub|n>*M*c<rsub|n>
    </equation>

    where <math|c<rsub|n>> is the vector of coefficients <math|c<rsub|n*j>>

    This can be rewritten as a generalized eigenvalue problem:

    <\equation>
      <around|(|K-\<lambda\><rsub|n>*M|)>*c<rsub|n>=0
    </equation>

    <item>To solve this generalized eigenvalue problem:

    The eigenvalues <math|\<lambda\><rsub|n>> are found by solving the
    characteristic equation:

    <\equation>
      det <around|(|K-\<lambda\>*M|)>=0
    </equation>

    <item>For each eigenvalue <math|\<lambda\><rsub|n>>, the corresponding
    eigenvector <math|c<rsub|n>> is found by solving:

    <\equation>
      <around|(|K-\<lambda\><rsub|n>*M|)>*c<rsub|n>=0
    </equation>

    <item>The Mercer expansion is then:

    <\equation>
      k<around|(|t,s|)>=<big|sum><rsub|n=1><rsup|\<infty\>>\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>*\<phi\><rsub|n><around|(|s|)>
    </equation>

    where

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*f<rsub|j><around|(|t|)>
    </equation>

    <item>Verification that <math|\<phi\><rsub|n><around|(|t|)>> are
    eigenfunctions of <math|C>:

    <\enumerate>
      <item>We need to show that:

      <\equation*>
        <big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*\<phi\><rsub|n><around|(|s|)>*d*s=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>
      </equation*>

      <item>Left-hand side:

      <\align*>
        <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*\<phi\><rsub|n><around|(|s|)>*d*s>|<cell|=<big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*f<rsub|j><around|(|s|)>*d*s>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*<big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*f<rsub|j><around|(|s|)>*d*s>>>>
      </align*>

      <item>Right-hand side:

      <\equation*>
        \<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>=\<lambda\><rsub|n>*<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*f<rsub|j><around|(|t|)>
      </equation*>

      <item>From step 10, we have <math|K*c<rsub|n>=\<lambda\><rsub|n>*M*c<rsub|n>>.
      Let's expand this equation:

      <\align*>
        <tformat|<table|<row|<cell|K*c<rsub|n>>|<cell|=\<lambda\><rsub|n>*M*c<rsub|n>>>|<row|<cell|<big|sum><rsub|j=1><rsup|\<infty\>>K<rsub|i*j>*c<rsub|n*j>>|<cell|=\<lambda\><rsub|n>*<big|sum><rsub|j=1><rsup|\<infty\>>M<rsub|i*j>*c<rsub|n*j>*<space|1em><text|for
        all >i>>>>
      </align*>

      <item>Now, let's substitute the definitions of <math|K<rsub|i*j>> and
      <math|M<rsub|i*j>> from step 9:

      <\align*>
        <tformat|<table|<row|<cell|<big|sum><rsub|j=1><rsup|\<infty\>><around*|(|<big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*<big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*f<rsub|j><around|(|s|)>*d*s*d*t|)>*c<rsub|n*j>>|<cell|=\<lambda\><rsub|n>*<big|sum><rsub|j=1><rsup|\<infty\>><around*|(|<big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*f<rsub|j><around|(|t|)>*d*t|)>*c<rsub|n*j>>>>>
      </align*>

      <item>Rearranging the left-hand side:

      <\align*>
        <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*<big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*f<rsub|j><around|(|s|)>*d*s*d*t>|<cell|=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n*j>*f<rsub|j><around|(|t|)>*d*t>>>>
      </align*>

      <item>This equation is exactly equivalent to:

      <\equation>
        <big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*<big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*\<phi\><rsub|n><around|(|s|)>*d*s*d*t=<big|int><rsub|0><rsup|\<infty\>>e<rsub|i><around|(|t|)>*\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>*d*t
      </equation>

      <item>Since this equality holds for all basis functions
      <math|e<rsub|i><around|(|t|)>>, and
      <math|<around|{|e<rsub|i><around|(|t|)>|}><rsub|i=1><rsup|\<infty\>>>
      is a complete orthonormal basis, we can conclude that:

      <\equation*>
        <big|int><rsub|0><rsup|\<infty\>>k<around|(|t,s|)>*\<phi\><rsub|n><around|(|s|)>*d*s=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>
      </equation*>
    </enumerate>

    Thus, <math|\<phi\><rsub|n><around|(|t|)>> are indeed eigenfunctions of
    <math|C> with eigenvalues <math|\<lambda\><rsub|n>>.
  </itemize>

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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_54.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_54.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>