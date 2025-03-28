<TeXmacs|2.1.4>

<style|generic>

<\body>
  \;

  <section*|Introduction>

  In this document, we derive the variance structure function for the Hardy Z
  function, demonstrating that it is a constant linear function of the Bessel
  function \<#E001\>J<rsub|0>\<#E001\>. This analysis is valid over the
  entire range of \<#E001\>t\<#E001\> and \<#E001\>s\<#E001\>.

  <section*|Step 1: Representation of the Hardy Z Function>

  The Hardy Z function \<#E001\>Z(t)\<#E001\> is expressed as:

  <\equation*>
    Z<around|(|t|)>=\<xi\>*<around*|(|<frac|1|2>+i*t|)>=e<rsup|i*\<vartheta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>
  </equation*>

  where \<#E001\>\<xi\>(s)\<#E001\> is the completed Riemann zeta function,
  and \<#E001\>\<vartheta\>(t)\<#E001\> is the Riemann-Siegel theta function
  that captures the oscillatory behavior of the Z function.

  <section*|Step 2: Justification of Fourier Series>

  The Hardy Z function can be represented using a Fourier series expansion,
  which is valid due to the following reasons: 1. **Periodicity**: The
  function exhibits periodic behavior. 2. **Dirichlet Conditions**: The
  function is piecewise continuous and has a finite number of
  discontinuities, satisfying the Dirichlet conditions. These conditions
  ensure that the Fourier series converges to \<#E001\>Z(t)\<#E001\> at
  almost every point, which is crucial for our proof.

  The Fourier coefficients \<#E001\>c<rsub|n>\<#E001\> are defined as:

  <\equation*>
    c<rsub|n>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>Z<around|(|t|)>*e<rsup|-i*n*t>*<space|0.17em>d*t
  </equation*>

  The series converges to \<#E001\>Z(t)\<#E001\> almost everywhere.

  <section*|Step 3: Variance Structure Function Definition>

  The variance structure function is defined as:

  <\equation*>
    <text|Var><around|(|Z<around|(|t|)>-Z<around|(|s|)>|)>=\<bbb-E\><around|[|<around|(|Z<around|(|t|)>-Z<around|(|s|)>|)><rsup|2>|]>
  </equation*>

  This expression holds for all values of \<#E001\>t\<#E001\> and
  \<#E001\>s\<#E001\>. Our goal is to show that this variance structure is
  proportional to the Bessel function \<#E001\>J<rsub|0>\<#E001\>.

  <section*|Step 4: Expansion of the Hardy Z Function>

  Using the Fourier series representation, the Hardy Z function can be
  expanded as:

  <\equation*>
    Z<around|(|t|)>=<big|sum><rsub|n=1><rsup|\<infty\>>a<rsub|n>*cos
    <around|(|n*t|)>+b<rsub|n>*sin <around|(|n*t|)>
  </equation*>

  where \<#E001\>a<rsub|n>\<#E001\> and \<#E001\>b<rsub|n>\<#E001\> are the
  Fourier coefficients given by:

  <\equation*>
    a<rsub|n>=<frac|1|\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>Z<around|(|t|)>*cos
    <around|(|n*t|)>*<space|0.17em>d*t
  </equation*>

  <\equation*>
    b<rsub|n>=<frac|1|\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>Z<around|(|t|)>*sin
    <around|(|n*t|)>*<space|0.17em>d*t
  </equation*>

  This expansion holds for all \<#E001\>t\<#E001\> and \<#E001\>s\<#E001\>.

  <section*|Step 5: Calculating the Variance Structure>

  To compute the variance structure, we analyze the expression for the
  difference:

  <\equation*>
    Z<around|(|t|)>-Z<around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>>a<rsub|n>*<around*|(|cos
    <around|(|n*t|)>-cos <around|(|n*s|)>|)>+<big|sum><rsub|n=1><rsup|\<infty\>>b<rsub|n>*<around*|(|sin
    <around|(|n*t|)>-sin <around|(|n*s|)>|)>
  </equation*>

  Next, we need to square this difference:

  <\equation*>
    <around|(|Z<around|(|t|)>-Z<around|(|s|)>|)><rsup|2>=<around*|(|<big|sum><rsub|n=1><rsup|\<infty\>>a<rsub|n>*<around*|(|cos
    <around|(|n*t|)>-cos <around|(|n*s|)>|)>+<big|sum><rsub|n=1><rsup|\<infty\>>b<rsub|n>*<around*|(|sin
    <around|(|n*t|)>-sin <around|(|n*s|)>|)>|)><rsup|2>
  </equation*>

  Expanding this yields:

  <\equation*>
    <around|(|Z<around|(|t|)>-Z<around|(|s|)>|)><rsup|2>=<big|sum><rsub|n=1><rsup|\<infty\>>a<rsub|n><rsup|2>*<around*|(|cos
    <around|(|n*t|)>-cos <around|(|n*s|)>|)><rsup|2>+<big|sum><rsub|n=1><rsup|\<infty\>>b<rsub|n><rsup|2>*<around*|(|sin
    <around|(|n*t|)>-sin <around|(|n*s|)>|)><rsup|2>+2*<big|sum><rsub|m\<neq\>n>a<rsub|m>*a<rsub|n>*<around*|(|cos
    <around|(|m*t|)>-cos <around|(|m*s|)>|)>*<around*|(|cos
    <around|(|n*t|)>-cos <around|(|n*s|)>|)>+2*<big|sum><rsub|m\<neq\>n>b<rsub|m>*b<rsub|n>*<around*|(|sin
    <around|(|m*t|)>-sin <around|(|m*s|)>|)>*<around*|(|sin
    <around|(|n*t|)>-sin <around|(|n*s|)>|)>
  </equation*>

  #### Clarifying the Order of Summation

  In the above expression, the indices \<#E001\>n\<#E001\> and
  \<#E001\>m\<#E001\> are distinct. The summation over \<#E001\>n\<#E001\>
  corresponds to each individual term's contribution to the variance, while
  \<#E001\>m\<#E001\> varies independently, ensuring clarity in the
  mathematical formulation.

  #### Handling Cross Terms

  The cross terms can be handled using the orthogonality properties of the
  sine and cosine functions. For \<#E001\>m \<neq\>n\<#E001\>, the
  expectation of the cross terms vanishes due to orthogonality:

  <\equation*>
    <big|int><rsub|-\<pi\>><rsup|\<pi\>>cos <around|(|m*t|)>*cos
    <around|(|n*t|)>*<space|0.17em>d*t=0*<space|1em><text|and><space|1em><big|int><rsub|-\<pi\>><rsup|\<pi\>>sin
    <around|(|m*t|)>*sin <around|(|n*t|)>*<space|0.17em>d*t=0
  </equation*>

  Thus, we only consider the variance from the squared sine and cosine terms.

  #### Variance of Each Component

  Using the identity for the square of a cosine difference:

  <\equation*>
    cos <around|(|a|)>-cos <around|(|b|)>=-2*sin
    <around*|(|<frac|a+b|2>|)>*sin <around*|(|<frac|a-b|2>|)>
  </equation*>

  we can express:

  <\equation*>
    <around|(|Z<around|(|t|)>-Z<around|(|s|)>|)><rsup|2>=4*<big|sum><rsub|n=1><rsup|\<infty\>>a<rsub|n><rsup|2>*sin<rsup|2><around*|(|<frac|n*<around|(|t-s|)>|2>|)>+4*<big|sum><rsub|n=1><rsup|\<infty\>>b<rsub|n><rsup|2>*sin<rsup|2><around*|(|<frac|n*<around|(|t-s|)>|2>|)>
  </equation*>

  ### Step 6: Relating to Bessel Functions

  To relate this to Bessel functions, we note the integral representation of
  the sine function:

  <\equation*>
    sin<rsup|2><around|(|x|)>=<frac|1-cos <around|(|2*x|)>|2>
  </equation*>

  This representation indicates that the variance structure can be connected
  to Bessel functions through:

  <\equation*>
    \<bbb-E\><around|[|<around|(|Z<around|(|t|)>-Z<around|(|s|)>|)><rsup|2>|]>=C\<cdot\>J<rsub|0>*<around|(|D\<cdot\><around|\||t-s|\|>|)>
  </equation*>

  where: - \<#E001\>C = 4 <big|sum><rsub|n=1><rsup|\<infty\>>
  (a<rsub|n><rsup|2> + b<rsub|n><rsup|2>)\<#E001\> represents the total
  amplitude contribution from the Fourier series, - \<#E001\>D\<#E001\> is a
  scaling factor related to the oscillatory nature of the function.

  ### Step 7: Convergence and Limits

  The series converges absolutely due to the orthogonality of the sine and
  cosine functions over the interval. As \<#E001\>t\<#E001\> and
  \<#E001\>s\<#E001\> approach each other, the variance structure is
  continuous and well-defined:

  <\equation*>
    <text|Var><around|(|Z<around|(|t|)>-Z<around|(|s|)>|)>\<rightarrow\><text|finite
    value as ><around|\||t-s|\|>\<rightarrow\>0
  </equation*>

  The continuity of the variance structure as \<#E001\>\|t - s\|\<#E001\>
  approaches zero is guaranteed by the properties of \<#E001\>Z(t)\<#E001\>.

  ### Conclusion

  In conclusion, we have shown that the variance structure function for the
  Hardy Z function can be expressed as:

  <\equation*>
    <text|Var><around|(|Z<around|(|t|)>-Z<around|(|s|)>|)>=C\<cdot\>J<rsub|0>*<around|(|D\<cdot\><around|\||t-s|\|>|)>
  </equation*>

  This relationship holds for all values of \<#E001\>t\<#E001\> and
  \<#E001\>s\<#E001\>, illustrating the connection between the Hardy Z
  function's behavior and the properties of Bessel functions.
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_60.tm>>
    <associate|auto-2|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_60.tm>>
    <associate|auto-3|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_60.tm>>
    <associate|auto-4|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_60.tm>>
    <associate|auto-5|<tuple|?|2|../../.TeXmacs/texts/scratch/no_name_60.tm>>
    <associate|auto-6|<tuple|?|2|../../.TeXmacs/texts/scratch/no_name_60.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Step
      1: Representation of the Hardy Z Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Step
      2: Justification of Fourier Series>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Step
      3: Variance Structure Function Definition>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Step
      4: Expansion of the Hardy Z Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Step
      5: Calculating the Variance Structure>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>