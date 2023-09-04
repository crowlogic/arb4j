<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Orthogonalizing the Bessel function of the first kind
  of order 0>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  The Bessel function of the first kind of order zero
  <math|J<rsub|0><around|(|x|)>> is given by the power series:

  <\equation>
    J<rsub|0><around|(|x|)>=<big|sum><rsub|m=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|m>|<around|(|m!|)><rsup|2>><around*|(|<frac|x|2>|)><rsup|2*m>
  </equation>

  <subsubsection|Steps to Orthogonalize the Terms using Gram-Schmidt
  Procedure><label|steps-to-orthogonalize-the-terms-using-gram-schmidt-procedure><label|steps-to-orthogonalize-the-terms-using-gram-schmidt-procedure>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Identify the Summands>: The summands for
    <math|J<rsub|0><around|(|x|)>> are the terms
    <math|<frac|<around|(|-1|)><rsup|m>|<around|(|m!|)><rsup|2>><around*|(|<frac|x|2>|)><rsup|2*m>>.

    <item><with|font-series|bold|Write Terms as Vectors>: Consider each term
    as a vector in a function space. Here, the vectors will be functions

    <\equation>
      f<rsub|m><around|(|x|)>=<frac|<around|(|-1|)><rsup|m>|<around|(|m!|)><rsup|2>><around*|(|<frac|x|2>|)><rsup|2*m>
    </equation>

    <item><with|font-series|bold|Inner Product Definition>: Define an inner
    product for the function space. For functions <math|f<around|(|x|)>> and
    <math|g<around|(|x|)>>, an inner product might be

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*g<around|(|x|)>*d*x
    </equation>

    <item><with|font-series|bold|Initialize>: Start with
    <math|u<rsub|0>=f<rsub|0>> (the first term of the series).

    <item><with|font-series|bold|Gram-Schmidt Process>:

    <\itemize>
      <item>For each subsequent vector <math|f<rsub|m>>, subtract the
      projections onto the already orthogonalized vectors
      <math|u<rsub|0>,u<rsub|1>,...,u<rsub|m-1>>.

      <\equation>
        w<rsub|m><around*|(|x|)>=f<rsub|m>-<big|sum><rsub|k=0><rsup|m-1><frac|<around|\<langle\>|f<rsub|m>,u<rsub|k>|\<rangle\>>|<around|\<langle\>|u<rsub|k>,u<rsub|k>|\<rangle\>>>*u<rsub|k>
      </equation>

      <item>Normalize <math|w<rsub|m>> to get <math|u<rsub|m>>.
    </itemize>

    <item><with|font-series|bold|Normalization>: After calculating
    <math|w<rsub|m>>, normalize it to get

    <\equation>
      u<rsub|m><around*|(|x|)>=<frac|w<rsub|m><around*|(|x|)>|<around|\<\|\|\>|w<rsub|m>|\<\|\|\>>>=<frac|w<rsub|m><around*|(|x|)>|<sqrt|<around|\<langle\>|w<rsub|m>,w<rsub|m>|\<rangle\>>>>
    </equation>

    <item><with|font-series|bold|Resulting Series>: After completing the
    Gram-Schmidt procedure, you'll have a new set of orthogonal functions
    <math|u<rsub|0>,u<rsub|1>,...,u<rsub|m>>,....
  </enumerate>

  This will give you a set of orthogonalized functions from the terms of the
  Bessel function <math|J<rsub|0><around|(|x|)>> based on the Gram-Schmidt
  procedure.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|steps-to-orthogonalize-the-terms-using-gram-schmidt-procedure|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Steps to Orthogonalize the
      Terms using Gram-Schmidt Procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>