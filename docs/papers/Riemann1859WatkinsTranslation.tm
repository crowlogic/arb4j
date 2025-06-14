<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|On the Number of Prime Numbers less than a Given
  Quantity<next-line><with|font-size|1|(Ueber die Anzahl der Primzahlen unter
  einer gegebenen Grösse)>>|<doc-author|<author-data|<author-name|Bernhard
  Riemann>|<author-affiliation|Translated by David R.
  Wilkins>>>|<doc-date|Monatsberichte der Berliner Akademie, November
  1859<next-line>Preliminary Version: December 1998>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Zeta Function and Euler's Product> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Functional
    Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Xi Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Zeros
    of the Xi Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    Prime Counting Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Approximation
    and Periodic Terms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  I believe that I can best convey my thanks for the honour which the Academy
  has to some degree conferred on me, through my admission as one of its
  correspondents, if I speedily make use of the permission thereby received
  to communicate an investigation into the accumulation of the prime numbers;
  a topic which perhaps seems not wholly unworthy of such a communication,
  given the interest which Gauss and Dirichlet have themselves shown in it
  over a lengthy period.

  <section|The Zeta Function and Euler's Product>

  For this investigation my point of departure is provided by the observation
  of Euler that the product

  <\equation>
    <big|prod><rsub|p><frac|1|1-p<rsup|-s>>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|1|n<rsup|s>><label|eq:euler_product>
  </equation>

  if one substitutes for <math|p> all prime numbers, and for <math|n> all
  whole numbers.

  The function of the complex variable <math|s> which is represented by these
  two expressions, wherever they converge, I denote by
  <math|\<zeta\><around|(|s|)>>. Both expressions converge only when the real
  part of <math|s> is greater than 1; at the same time an expression for the
  function can easily be found which always remains valid.

  On making use of the equation

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>e<rsup|-n*x>*x<rsup|s-1>*d*x=<frac|\<Gamma\><around|(|s|)>|n<rsup|s>><label|eq:gamma_integral>
  </equation>

  one first sees that

  <\equation>
    \<Gamma\><around|(|s|)>*\<zeta\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>><frac|x<rsup|s-1>|e<rsup|x>-1>*d*x.<label|eq:zeta_integral>
  </equation>

  If one now considers the integral

  <\equation>
    <big|int><frac|<around|(|-x|)><rsup|s-1>|e<rsup|x>-1>*d*x<label|eq:contour_integral>
  </equation>

  from <math|+\<infty\>> to <math|+\<infty\>> taken in a positive sense
  around a domain which includes the value 0 but no other point of
  discontinuity of the integrand in its interior, then this is easily seen to
  be equal to

  <\equation>
    <around|(|e<rsup|-\<pi\>*s*i>-e<rsup|\<pi\>*s*i>|)>*<big|int><rsub|0><rsup|\<infty\>><frac|x<rsup|s-1>|e<rsup|x>-1>*d*x,<label|eq:contour_result>
  </equation>

  provided that, in the many-valued function
  <math|<around|(|-x|)><rsup|s-1>=e<rsup|<around|(|s-1|)>*log
  <around|(|-x|)>>>, the logarithm of <math|-x> is determined so as to be
  real when <math|x> is negative. Hence

  <\equation>
    2*sin <around|(|\<pi\>*s|)>*\<Gamma\><around|(|s|)>*\<zeta\><around|(|s|)>=i*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<around|(|-x|)><rsup|s-1>|e<rsup|x>-1>*d*x<label|eq:functional_relation_step>
  </equation>

  where the integral has the meaning just specified.

  <section|Functional Equation>

  This equation now gives the value of the function
  <math|\<zeta\><around|(|s|)>> for all complex numbers <math|s> and shows
  that this function is one-valued and finite for all finite values of
  <math|s> with the exception of 1, and also that it is zero if <math|s> is
  equal to a negative even integer.

  Through further analysis of the contour integral, one obtains the
  functional equation:

  <\equation>
    \<Gamma\><around*|(|<frac|s|2>|)>*\<pi\><rsup|-s/2>*\<zeta\><around|(|s|)>=\<Gamma\><around*|(|<frac|1-s|2>|)>*\<pi\><rsup|-<around|(|1-s|)>/2>*\<zeta\>*<around|(|1-s|)>.<label|eq:functional_equation>
  </equation>

  This property of the function induced me to introduce, in place of
  <math|\<Gamma\><around|(|s|)>>, the integral
  <math|\<Gamma\><around*|(|<frac|s|2>|)>> into the general term of the
  series <math|<big|sum><frac|1|n<rsup|s>>>, whereby one obtains a very
  convenient expression for the function <math|\<zeta\><around|(|s|)>>. In
  fact

  <\equation>
    <frac|1|n<rsup|s>>*\<Gamma\><around*|(|<frac|s|2>|)>*\<pi\><rsup|-s/2>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-n<rsup|2>*\<pi\>*x>*x<rsup|s/2-1>*d*x<label|eq:mellin_transform>
  </equation>

  thus, if one sets

  <\equation>
    \<psi\><around|(|x|)>=<big|sum><rsub|n=1><rsup|\<infty\>>e<rsup|-n<rsup|2>*\<pi\>*x><label|eq:psi_definition>
  </equation>

  then

  <\equation>
    \<Gamma\><around*|(|<frac|s|2>|)>*\<pi\><rsup|-s/2>*\<zeta\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>\<psi\><around|(|x|)>*x<rsup|s/2-1>*d*x<label|eq:zeta_psi_integral>
  </equation>

  <section|The Xi Function>

  Using the Jacobi identity

  <\equation>
    2*\<psi\><around|(|x|)>+1=x<rsup|-1/2>*<around*|(|2*\<psi\><around*|(|<frac|1|x>|)>+1|)><label|eq:jacobi_identity>
  </equation>

  we can derive

  <\equation>
    \<Gamma\><around*|(|<frac|s|2>|)>*\<pi\><rsup|-s/2>*\<zeta\><around|(|s|)>=<frac|1|s*<around|(|s-1|)>>+<big|int><rsub|1><rsup|\<infty\>>\<psi\><around|(|x|)>*<around*|(|x<rsup|s/2-1>+x<rsup|-s/2-1/2>|)>*d*x<label|eq:zeta_symmetric_integral>
  </equation>

  I now set <math|s=<frac|1|2>+t*i> and

  <\equation>
    \<xi\><around|(|t|)>=<frac|1|2>*s*<around|(|s-1|)>*\<Gamma\><around*|(|<frac|s|2>|)>*\<pi\><rsup|-s/2>*\<zeta\><around|(|s|)><label|eq:xi_definition>
  </equation>

  so that

  <\equation>
    \<xi\><around|(|t|)>=<frac|1|2>-<around*|(|t<rsup|2>+<frac|1|4>|)>*<big|int><rsub|1><rsup|\<infty\>>\<psi\><around|(|x|)>*x<rsup|-3/4>*cos
    <around*|(|<frac|1|2>*t*log x|)>*d*x<label|eq:xi_integral>
  </equation>

  or, in addition,

  <\equation>
    \<xi\><around|(|t|)>=4*<big|int><rsub|1><rsup|\<infty\>><frac|d*<around|(|x<rsup|3/2>*\<psi\><rprime|'><around|(|x|)>|)>|d*x>*x<rsup|-1/4>*cos
    <around*|(|<frac|1|2>*t*log x|)>*d*x<label|eq:xi_derivative_form>
  </equation>

  <section|Zeros of the Xi Function>

  This function is finite for all finite values of <math|t>, and allows
  itself to be developed in powers of <math|t<rsup|2>> as a very rapidly
  converging series.

  Since, for a value of <math|s> whose real part is greater than 1, <math|log
  \<zeta\><around|(|s|)>=-<big|sum>log <around|(|1-p<rsup|-s>|)>> remains
  finite, and since the same holds for the logarithms of the other factors of
  <math|\<xi\><around|(|t|)>>, it follows that the function
  <math|\<xi\><around|(|t|)>> can only vanish if the imaginary part of
  <math|t> lies between <math|<frac|1|2>*i> and <math|-<frac|1|2>*i>.

  <\theorem>
    [Riemann's Estimate for Zero Density] The number of roots of
    <math|\<xi\><around|(|t|)>=0>, whose real parts lie between 0 and
    <math|T> is approximately

    <\equation>
      <frac|T|2*\<pi\>>*log <frac|T|2*\<pi\>>-<frac|T|2*\<pi\>><label|eq:zero_density>
    </equation>
  </theorem>

  One now finds indeed approximately this number of real roots within these
  limits, and it is very probable that all roots are real. Certainly one
  would wish for a stricter proof here; I have meanwhile temporarily put
  aside the search for this after some fleeting futile attempts, as it
  appears unnecessary for the next objective of my investigation.

  If one denotes by <math|\<alpha\>> all the roots of the equation
  <math|\<xi\><around|(|\<alpha\>|)>=0>, one can express <math|log
  \<xi\><around|(|t|)>> as

  <\equation>
    log \<xi\><around|(|t|)>=<big|sum><rsub|\<alpha\>>log
    <around*|(|1-<frac|t<rsup|2>|\<alpha\><rsup|2>>|)>+log
    \<xi\><around|(|0|)><label|eq:xi_product_form>
  </equation>

  <section|The Prime Counting Function>

  With the assistance of these methods, the number of prime numbers that are
  smaller than <math|x> can now be determined. Let <math|F<around|(|x|)>> be
  equal to this number when <math|x> is not exactly equal to a prime number;
  but let it be greater by <math|<frac|1|2>> when <math|x> is a prime number,
  so that, for any <math|x> at which there is a jump in the value in
  <math|F<around|(|x|)>>,

  <\equation>
    F<around|(|x|)>=<frac|F*<around|(|x+0|)>+F*<around|(|x-0|)>|2><label|eq:prime_counting_definition>
  </equation>

  If in the identity

  <\equation>
    log \<zeta\><around|(|s|)>=-<big|sum><rsub|p>log
    <around|(|1-p<rsup|-s>|)>=<big|sum><rsub|p>p<rsup|-s>+<frac|1|2>*<big|sum><rsub|p>p<rsup|-2*s>+<frac|1|3>*<big|sum><rsub|p>p<rsup|-3*s>+\<cdots\><label|eq:zeta_prime_expansion>
  </equation>

  one now replaces <math|p<rsup|-s>> by <math|s*<big|int><rsub|p><rsup|\<infty\>>x<rsup|-s-1>*d*x>,
  <math|p<rsup|-2*s>> by <math|s*<big|int><rsub|p<rsup|2>><rsup|\<infty\>>x<rsup|-s-1>*d*x>,
  etc., one obtains

  <\equation>
    <frac|log \<zeta\><around|(|s|)>|s>=<big|int><rsub|1><rsup|\<infty\>>f<around|(|x|)>*x<rsup|-s-1>*d*x<label|eq:mellin_inversion_setup>
  </equation>

  if one denotes

  <\equation>
    f<around|(|x|)>=F<around|(|x|)>+<frac|1|2>*F<around|(|x<rsup|1/2>|)>+<frac|1|3>*F<around|(|x<rsup|1/3>|)>+\<cdots\><label|eq:f_definition>
  </equation>

  Using Mellin inversion, we obtain

  <\equation>
    f<around|(|y|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|a-\<infty\>*i><rsup|a+\<infty\>*i><frac|log
    \<zeta\><around|(|s|)>|s>*y<rsup|s>*d*s<label|eq:mellin_inversion>
  </equation>

  where the integration is carried out so that the real part of <math|s>
  remains constant.

  Substituting the expression for <math|log \<zeta\><around|(|s|)>> in terms
  of the zeros of <math|\<xi\><around|(|t|)>>, one obtains

  <\equation>
    f<around|(|x|)>=<text|Li><around|(|x|)>-<big|sum><rsub|\<alpha\>><around*|(|<text|Li><around|(|x<rsup|1/2+\<alpha\>*i>|)>+<text|Li><around|(|x<rsup|1/2-\<alpha\>*i>|)>|)>+<big|int><rsub|x><rsup|\<infty\>><frac|d*t|t*<around|(|t<rsup|2>-1|)>*log
    t>+log \<xi\><around|(|0|)><label|eq:explicit_formula>
  </equation>

  if in <math|<big|sum><rsub|\<alpha\>>> one substitutes for <math|\<alpha\>>
  all positive roots (or roots having a positive real part) of the equation
  <math|\<xi\><around|(|\<alpha\>|)>=0>, ordered by their magnitude.

  From <math|f<around|(|x|)>> one obtains <math|F<around|(|x|)>> by inversion
  of the relation in equation<nbsp><eqref|eq:f_definition>, to obtain the
  equation

  <\equation>
    F<around|(|x|)>=<big|sum><rsub|m><frac|<around|(|-1|)><rsup|\<mu\><around|(|m|)>>|m>*f<around|(|x<rsup|1/m>|)><label|eq:mobius_inversion>
  </equation>

  in which one substitutes for <math|m> the series consisting of those
  natural numbers that are not divisible by any square other than 1, and in
  which <math|\<mu\><around|(|m|)>> denotes the number of prime factors of
  <math|m>.

  <section|Approximation and Periodic Terms>

  If one restricts <math|<big|sum><rsub|\<alpha\>>> to a finite number of
  terms, then the derivative of the expression for <math|f<around|(|x|)>> or,
  up to a part diminishing very rapidly with growing <math|x>,

  <\equation>
    <frac|1|log x>-<frac|2*<big|sum><rsub|\<alpha\>>cos
    <around|(|\<alpha\>*log x|)>*x<rsup|-1/2>|log
    x><label|eq:prime_density_approximation>
  </equation>

  gives an approximating expression for the density of the prime number +
  half the density of the squares of the prime numbers + a third of the
  density of the cubes of the prime numbers etc. at the magnitude <math|x>.

  The known approximating expression <math|F<around|(|x|)>=<text|Li><around|(|x|)>>
  is therefore valid up to quantities of the order <math|x<rsup|1/2>> and
  gives somewhat too large a value; because the non-periodic terms in the
  expression for <math|F<around|(|x|)>> are, apart from quantities that do
  not grow infinite with <math|x>:

  <\equation>
    <text|Li><around|(|x|)>-<frac|1|2><text|Li><around|(|x<rsup|1/2>|)>-<frac|1|3><text|Li><around|(|x<rsup|1/3>|)>-<frac|1|5><text|Li><around|(|x<rsup|1/5>|)>+<frac|1|6><text|Li><around|(|x<rsup|1/6>|)>-<frac|1|7><text|Li><around|(|x<rsup|1/7>|)>+\<cdots\><label|eq:nonperiodic_terms>
  </equation>

  Indeed, in the comparison of Li<math|<around|(|x|)>> with the number of
  prime numbers less than <math|x>, undertaken by Gauss and Goldschmidt and
  carried through up to <math|x=> three million, this number has shown itself
  out to be, in the first hundred thousand, always less than
  Li<math|<around|(|x|)>>; in fact the difference grows, with many
  fluctuations, gradually with <math|x>. But also the increase and decrease
  in the density of the primes from place to place that is dependent on the
  periodic terms has already excited attention, without however any law
  governing this behaviour having been observed. In any future count it would
  be interesting to keep track of the influence of the individual periodic
  terms in the expression for the density of the prime numbers. A more
  regular behaviour than that of <math|F<around|(|x|)>> would be exhibited by
  the function <math|f<around|(|x|)>>, which already in the first hundred is
  seen very distinctly to agree on average with Li<math|<around|(|x|)>+log
  \<xi\><around|(|0|)>>.
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
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|2|2|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|3|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|4|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-5|<tuple|5|4|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-6|<tuple|6|5|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:contour_integral|<tuple|4|2|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:contour_result|<tuple|5|2|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:euler_product|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:explicit_formula|<tuple|23|5|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:f_definition|<tuple|21|4|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:functional_equation|<tuple|7|2|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:functional_relation_step|<tuple|6|2|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:gamma_integral|<tuple|2|2|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:jacobi_identity|<tuple|11|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:mellin_inversion|<tuple|22|5|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:mellin_inversion_setup|<tuple|20|4|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:mellin_transform|<tuple|8|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:mobius_inversion|<tuple|24|5|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:nonperiodic_terms|<tuple|26|5|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:prime_counting_definition|<tuple|18|4|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:prime_density_approximation|<tuple|25|5|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:psi_definition|<tuple|9|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:xi_definition|<tuple|13|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:xi_derivative_form|<tuple|15|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:xi_integral|<tuple|14|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:xi_product_form|<tuple|17|4|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:zero_density|<tuple|16|4|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:zeta_integral|<tuple|3|2|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:zeta_prime_expansion|<tuple|19|4|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:zeta_psi_integral|<tuple|10|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:zeta_symmetric_integral|<tuple|12|3|../../../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Zeta Function and Euler's Product> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Functional
      Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Xi Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Zeros
      of the Xi Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Prime Counting Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Approximation
      and Periodic Terms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>