<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|On the Number of Prime Numbers less than a Given
  Quantity (Ueber die Anzahl der Primzahlen unter einer gegebenen
  Grösse)>|<doc-author|<author-data|<author-name|Bernhard
  Riemann<next-line>Translated by David R. Wilkins<next-line>Preliminary
  Version: December 1998>|<\author-affiliation>
    Retypeset By: Stephen Crowley on <date|>
  </author-affiliation>|<\author-affiliation>
    \;
  </author-affiliation>>>>

  I believe that I can best convey my thanks for the honour which the Academy
  has to some degree conferred on me, through my admission as one of its
  correspondents, if I speedily make use of the permission thereby received
  to communicate an investigation into the accumulation of the prime numbers;
  a topic which perhaps seems not wholly unworthy of such a communication,
  given the interest which Gauss and Dirichlet have themselves shown in it
  over a lengthy period.

  For this investigation my point of departure is provided by the observation
  of Euler that the product

  <\equation>
    <big|prod><rsub|p><around*|(|1-<frac|1|p<rsup|s>>|)><rsup|-1>=<big|sum><frac|1|n<rsup|s>>
  </equation>

  if one substitutes for <math|p> all prime numbers, and for <math|n> all
  whole numbers. The function of the complex variable <math|s> which is
  represented by these two expressions, wherever they converge, I denote by
  <math|\<zeta\><around|(|s|)>>. Both expressions converge only when the real
  part of <math|s> is greater than 1; at the same time an expression for the
  function can easily be found which always remains valid. On making use of
  the equation

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>e<rsup|-n*x>*x<rsup|s-1>*d*x=<frac|\<Gamma\><around|(|s|)>|n<rsup|s>>
  </equation>

  one first sees that

  <\equation>
    \<Pi\>*<around|(|s-1|)>*\<zeta\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>><frac|x<rsup|s-1>|e<rsup|x>-1>*<space|0.17em>d*x
  </equation>

  If one now considers the integral

  <\equation>
    <big|int><frac|<around|(|-x|)><rsup|s-1>|e<rsup|x>-1>*<space|0.17em>d*x
  </equation>

  from <math|-\<infty\>> to <math|+\<infty\>> taken in a positive sense
  around a domain which includes the value 0 but no other point of
  discontinuity of the integrand in its interior, then this is easily seen to
  be equal to

  <\equation>
    <around*|(|e<rsup|-\<pi\>*s*i>-e<rsup|\<pi\>*s*i>|)>*<big|int><rsub|0><rsup|\<infty\>><frac|x<rsup|s-1>|e<rsup|x>-1>*<space|0.17em>d*x
  </equation>

  provided that, in the many-valued function
  <math|<around|(|-x|)><rsup|s-1>=e<rsup|<around|(|s-1|)>*log
  <around|(|-x|)>>>, the logarithm of <math|-x> is determined so as to be
  real when <math|x> is negative. Hence

  <\equation>
    2*sin \<pi\>*s*\<Pi\>*<around|(|s-1|)>*\<zeta\><around|(|s|)>=i*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<around|(|-x|)><rsup|s-1>|e<rsup|x>-1>*<space|0.17em>d*x
  </equation>

  where the integral has the meaning just specified.

  This equation now gives the value of the function
  <math|\<zeta\><around|(|s|)>> for all complex numbers <math|s> and shows
  that this function is one-valued and finite for all finite values of
  <math|s> with the exception of 1, and also that it is zero if <math|s> is
  equal to a negative even integer.

  If the real part of <math|s> is negative, then, instead of being taken in a
  positive sense around the specified domain, this integral can also be taken
  in a negative sense around that domain containing all the remaining complex
  quantities, since the integral taken though values of infinitely large
  modulus is then infinitely small. However, in the interior of this domain,
  the integrand has discontinuities only where <math|x> becomes equal to a
  whole multiple of <math|2*\<pi\>*i>, and the integral is thus equal to the
  sum of the integrals taken in a negative sense around these values. But the
  integral around the value <math|n*2*\<pi\>*i> is
  <math|=(-<around|(|n*2*\<pi\>*i|)><rsup|s-1>*<around|(|-2*\<pi\>*i|)>>, one
  obtains from this

  <\equation>
    2*sin \<pi\>*s*\<Pi\>*<around|(|s-1|)>*\<zeta\><around|(|s|)>=<around|(|2*\<pi\>|)><rsup|2*n>*<big|sum><rsub|n=1><rsup|\<infty\>><around|(|<around|(|-1|)><rsup|s-1>+i<rsup|s-1>|)>
  </equation>

  thus a relation between <math|\<zeta\><around|(|s|)>> and
  <math|\<zeta\>*<around|(|1-s|)>>, which, through the use of known
  properties of the function <math|\<Pi\>>, may be expressed as follows:

  <\equation>
    \<Pi\>*<around*|(|<frac|s|2>-1|)>*\<pi\><rsup|-<frac|s|2>>*\<zeta\><around|(|s|)>
  </equation>

  remains unchanged when <math|s> is replaced by <math|1-s>. This property of
  the function induced me to introduce, in place of
  <math|\<Pi\>*<around|(|1-s|)>>, the integral
  <math|\<Pi\>*<around*|(|<frac|1|2>-s|)>> into the general term of the
  series <math|<big|sum><frac|1|n<rsup|s>>>, whereby one obtains a very
  convenient expression for the function <math|\<zeta\><around|(|s|)>>. In
  fact

  <\equation>
    <frac|1|n<rsup|s>>*\<Pi\>*<around*|(|<frac|1|2>-s|)>*\<pi\><rsup|-s>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-n<rsup|2>*\<pi\>*x>*x<rsup|s-1>*<space|0.17em>d*x
  </equation>

  thus, if one sets

  <\equation>
    <big|sum><rsub|1><rsup|\<infty\>>e<rsup|-n*\<pi\>*x>=\<psi\><around|(|x|)>
  </equation>

  then

  <\equation>
    \<Pi\>*<around*|(|<frac|1|2>-s|)>*\<pi\><rsup|-s>*\<zeta\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>\<psi\><around|(|x|)>*x<rsup|s-1>*<space|0.17em>d*x
  </equation>

  or since

  <\equation*>
    2*\<psi\><around|(|x|)>+1=x<rsup|-<frac|1|2>>*<around*|(|2*\<psi\><around*|(|<frac|1|<sqrt|x>>|)>+1|)>,<space|1em><text|(Jacobi,
    Fund. S. 184)>
  </equation*>

  <\equation>
    \<Pi\>*<around*|(|<frac|1|2>-s|)>*\<pi\><rsup|-s>*\<zeta\><around|(|s|)>=<big|int><rsub|1><rsup|\<infty\>>\<psi\><around|(|x|)>*x<rsup|s-1>*<space|0.17em>d*x+<big|int><rsub|1><rsup|\<infty\>>\<psi\><around*|(|<frac|1|x>|)>*x<rsup|-s-3>*<space|0.17em>d*x
  </equation>

  <\equation>
    +<frac|1|2>*<big|int><rsub|0><rsup|1><around*|(|x<rsup|-s-3>-x<rsup|s-1>|)>*<space|0.17em>d*x
  </equation>

  <\equation*>
    =<frac|1|s*<around|(|s-1|)>>+<big|int><rsub|1><rsup|\<infty\>>\<psi\><around|(|x|)>*<around*|(|x<rsup|s-1>+x<rsup|-<frac|1|2>-s>|)>*<space|0.17em>d*x
  </equation*>

  I now set <math|s=<frac|1|2>+t*i> and

  <\equation>
    \<Pi\><around*|(|<frac|1|2>|)>*<around|(|s-1|)>*\<pi\><rsup|-s>*\<zeta\><around|(|s|)>=\<zeta\><around|(|t|)>
  </equation>

  so that

  <\equation>
    \<zeta\><around|(|t|)>=<frac|1|2>*<around*|(|<around|(|t+<frac|1|4>|)><rsup|-1>+<big|int><rsub|1><rsup|\<infty\>>\<psi\><around|(|x|)>*x<rsup|-3>*cos
    <around|(|t*log x|)>*<space|0.17em>d*x|)>
  </equation>

  or, in addition,

  <\equation>
    \<zeta\><around|(|t|)>=4*<big|int><rsub|1><rsup|\<infty\>><around*|(|<frac|d<rsup|2>*<sqrt|x*\<psi\><around|(|x|)>>|d*x<rsup|2>>|)>*x<rsup|-4>*cos
    <around*|(|<frac|1|2>*t*log x|)>*<space|0.17em>d*x
  </equation>

  This function is finite for all finite values of <math|t>, and allows
  itself to be developed in powers of <math|t> as a very rapidly converging
  series. Since, for a value of <math|s> whose real part is greater than
  <math|1>, <math|log <around|(|\<zeta\><around|(|s|)>|)>=-<big|sum><rsub|n=1><rsup|\<infty\>><frac|log
  <around|(|1-p<rsup|-s>|)>|n>> remains finite, and since the same holds for
  the logarithms of the other factors of <math|\<zeta\><around|(|t|)>>, it
  follows that the function <math|\<zeta\><around|(|t|)>> can only vanish if
  the imaginary part of <math|t> lies between <math|<frac|1|2>*i> and
  <math|-<frac|1|2>*i>. The number of roots of
  <math|\<zeta\><around|(|t|)>=0>, whose real parts lie between <math|0> and
  <math|T> is approximately

  <\equation>
    <frac|T|2*\<pi\>>*log <frac|T|2*\<pi\>>-<frac|T|2*\<pi\>>
  </equation>

  because the integral <math|<big|int>d*log \<zeta\><around|(|t|)>>, taken in
  a positive sense around the region consisting of the values of <math|t>
  whose imaginary parts lie between <math|<frac|1|2>*i> and
  <math|-<frac|1|2>*i>, and whose real parts lie between <math|0> and
  <math|T>, is (up to a fraction of the order of magnitude of the quantity
  <math|<frac|1|log T>>) equal to <math|<frac|T|2*\<pi\>>*log
  <frac|T|2*\<pi\>>-<frac|T|2*\<pi\>>>; this integral however is equal to the
  number of roots of <math|\<zeta\><around|(|t|)>=<frac|1|2*\<pi\>>> lying
  within this region, multiplied by <math|2*\<pi\>>. One now finds indeed
  approximately this number of real roots within these limits, and it is very
  probable that all roots are real. Certainly one would wish for a stricter
  proof here; I have meanwhile temporarily put aside the search for this
  after some fleeting futile attempts, as it appears unnecessary for the next
  objective of my investigation.

  If one denotes by <math|\<alpha\>> all the roots of the equation
  <math|\<zeta\><around|(|\<alpha\>|)>=0>, one can express <math|log
  \<zeta\><around|(|t|)>> as

  <\equation>
    <big|sum>log <around|(|1-<frac|t|\<alpha\>>|)>+log \<zeta\><around|(|0|)>
  </equation>

  for, since the density of the roots of the quantity <math|t> grows with
  <math|t> only as <math|<frac|1|log t>>, it follows that this expression
  converges and becomes for an infinite <math|t> only infinite as <math|log
  t>; thus it differs from <math|log \<zeta\><around|(|t|)>> by a function of
  <math|t>, that for a finite <math|t> remains continuous and finite and,
  when divided by <math|t>, becomes infinitely small for infinite <math|t>.
  This difference is consequently a constant, whose value can be determined
  through setting <math|t=0>.

  With the assistance of these methods, the number of prime numbers that are
  smaller than <math|x> can now be determined.

  Let <math|F<around|(|x|)>> be equal to this number when <math|x> is not
  exactly equal to a prime number; but let it be greater by <math|<frac|1|2>>
  when <math|x> is a prime number, so that, for any <math|x> at which there
  is a jump in the value in <math|F<around|(|x|)>>,

  <\equation>
    F<around|(|x|)>=<frac|F*<around|(|x+0|)>+F*<around|(|x-0|)>|2>
  </equation>

  If in the identity

  <\equation>
    log \<zeta\><around|(|s|)>=-\<zeta\>*log
    <around|(|1-p<rsup|-s>|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|s<rsup|n>|n>+<frac|1|2>*p<rsup|-2*s>+<frac|1|3>*p<rsup|-3*s>+\<ldots\>
  </equation>

  one now replaces

  <\equation>
    p<rsup|-s>*<text|by ><big|int><rsub|<frac|1|p>><rsup|\<infty\>>x<rsup|-s-1>*<space|0.17em>d*s,<space|1em>p<rsup|-2*s>*<text|by
    ><big|int><rsub|<frac|1|p<rsup|2>>><rsup|\<infty\>>x<rsup|-s-1>*<space|0.17em>d*s,\<ldots\>
  </equation>

  one obtains

  <\equation>
    <frac|log \<zeta\><around|(|s|)>|s>=<big|int><rsub|1><rsup|\<infty\>>f<around|(|x|)>*x<rsup|-s-1>*<space|0.17em>d*x
  </equation>

  if one denotes

  <\equation>
    F<around|(|x|)>+<frac|1|2>*F<rprime|''><around|(|x<rsup|2>|)>+<frac|1|3>*F<rprime|'''><around|(|x<rsup|3>|)>+\<ldots\>
  </equation>

  by <math|f<around|(|x|)>>. This equation is valid for each complex value
  <math|a+b*i> of <math|s> for which <math|a\<gtr\>1>. If, though, the
  equation

  <\equation>
    g<around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>h<around|(|x|)>*x<rsup|-s>*log
    x*<space|0.17em>d*x
  </equation>

  holds within this range, then, by making use of Fourier's theorem, one can
  express the function <math|h> in terms of the function <math|g>. The
  equation decomposes, if <math|h<around|(|x|)>> is real and

  <\equation>
    g*<around|(|a+b*i|)>=g<rsub|1><around|(|b|)>+i*g<rsub|2><around|(|b|)>
  </equation>

  into the two following:

  <\equation>
    g<rsub|1><around|(|b|)>=<big|int><rsub|0><rsup|\<infty\>>h<around|(|x|)>*x<rsup|-a>*cos
    <around|(|b*log x|)>*<space|0.17em>d*x
  </equation>

  <\equation>
    i*g<rsub|2><around|(|b|)>=-i*<big|int><rsub|0><rsup|\<infty\>>h<around|(|x|)>*x<rsup|-a>*sin
    <around|(|b*log x|)>*<space|0.17em>d*x
  </equation>

  If one multiplies both equations with

  <\equation>
    <around|(|cos <around|(|b*log y|)>+i*sin <around|(|b*log
    y|)>|)>*<space|0.17em>d*b
  </equation>

  and integrates them from <math|-\<infty\>> to <math|+\<infty\>>, then one
  obtains <math|r*h<around|(|y|)>*y<rsup|-a>> on the right hand side in both,
  on account of Fourier's theorems; thus, if one adds both equations and
  multiplies them by <math|i*y<rsup|a>>, one obtains

  <\equation>
    2*\<pi\>*i*h<around|(|y|)>=<big|int><rsub|-\<infty\>><rsup|a+i*\<infty\>>g<around|(|s|)>*y<rsup|-s>*<space|0.17em>d*s
  </equation>

  where the integration is carried out so that the real part of <math|s>
  remains constant. For a value of <math|y> at which there is a jump in the
  value of <math|h<around|(|y|)>>, the integral takes on the mean of the
  values of the function <math|h> on either side of the jump. From the manner
  in which the function <math|f> was defined, we see that it has the same
  property, and hence in full generality

  <\equation>
    f<around|(|y|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|a-i*\<infty\>><rsup|a+i*\<infty\>><frac|log
    \<zeta\><around|(|s|)>|s>*y<rsup|-s>*d*s
  </equation>

  One can substitute for <math|log \<zeta\>> the expression

  <\equation>
    <frac|log \<pi\>|2>-log <around|(|s-1|)>-log
    \<Gamma\><around*|(|<frac|s|2>|)>+<big|sum><rsub|\<alpha\>>log
    <around*|(|1+<around*|(|<frac|s-1|2*\<alpha\>>|)><rsup|2>|)>+log
    \<xi\><around|(|0|)>
  </equation>

  found earlier; however the integrals of the individual terms of this
  expression do not converge, when extended to infinity, for which reason it
  is appropriate to convert the previous equation by means of integration by
  parts into

  <\equation>
    f<around|(|x|)>=<frac|1|2*\<pi\>*i*log
    x>*<big|int><rsub|a-i*\<infty\>><rsup|a+i*\<infty\>><frac|d|d*s>*<frac|log
    \<zeta\><around|(|s|)>|s>*d*s\<cdot\>x<rsup|-s>
  </equation>

  Since

  <\equation>
    -log \<Gamma\><around*|(|<frac|s|2>|)>=lim<rsub|m\<rightarrow\>\<infty\>><around*|(|<big|sum><rsub|n=1><rsup|m>log
    <around*|(|1+<frac|s|2*n>|)>-<frac|s|2>*log m|)>
  </equation>

  for <math|m=\<infty\>> and therefore

  <\equation>
    <frac|d|d*s>*log \<Gamma\><around*|(|<frac|s|2>|)>\<approx\>-<frac|d|d*s>*log
    <around*|(|1+<frac|s|2*n>|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|1|1+<frac|s|2*n>>
  </equation>

  it then follows that all the terms of the expression for
  <math|f<around|(|x|)>>, with the exception of

  <\equation>
    <frac|1|2*\<pi\>*i*log x>*<big|int><rsub|a-i*\<infty\>><rsup|a+i*\<infty\>><frac|1|s<rsup|2>>*log
    \<xi\><around|(|0|)>*x<rsup|-s>*d*s=log \<xi\><around|(|0|)>
  </equation>

  take the form

  <\equation>
    \<pm\><frac|1|2*\<pi\>*i*log x>*<big|int><rsub|a-i*\<infty\>><rsup|a+i*\<infty\>><frac|d|d*s><around*|(|log
    <around*|(|1-<frac|s|\<alpha\>>|)>|)>*x<rsup|-s>*d*s
  </equation>

  But now

  <\equation>
    <frac|d|d*\<beta\>>*<around*|(|<frac|1|s>*log
    <around*|(|<frac|1-s|1-\<beta\>>|)>|)>=<frac|1|<around|(|\<beta\>-s|)><rsup|2>>
  </equation>

  and, if the real part of <math|s> is larger than the real part of
  <math|\<beta\>>,

  <\equation>
    <frac|1|2*\<pi\>*i>*<big|int><rsub|a-i*\<infty\>><rsup|a+i*\<infty\>><frac|x<rsup|s>|<around|(|s-\<beta\>|)><rsup|3>>*d*s=<frac|x<rsup|\<beta\>>|\<beta\><rsup|3>>*<frac|x|2*\<pi\>*i>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>x<rsup|n-1>*d*x
  </equation>

  or

  <\equation>
    =<big|int><rsub|0><rsup|x>x<rsup|n-1>*d*x
  </equation>

  depending on whether the real part of <math|\<beta\>> is negative or
  positive. One has as a result

  <\equation>
    <frac|1|2*\<pi\>*i*log x>*<big|int><rsub|a-i*\<infty\>><rsup|a+i*\<infty\>><around*|(|<frac|1|s>*log
    <around*|(|<frac|1-s|1-\<beta\>>|)>|)><frac|x<rsup|s>|s>*d*s
  </equation>

  <\equation>
    =-<frac|1|2*\<pi\>*i>*<big|int><rsub|a-i*\<infty\>><rsup|a+i*\<infty\>><frac|1|s>*log
    <around*|(|<frac|1-s|1-\<beta\>>|)>*x<rsup|s>*d*s
  </equation>

  <\equation>
    =<big|int><rsub|\<infty\>><rsup|x><frac|x<rsup|n-1>|log
    x>*d*x+<text|const.>
  </equation>

  in the first, and

  <\equation>
    <big|int><rsub|0><rsup|x><frac|x<rsup|n-1>|log x>*d*x+<text|const.>
  </equation>

  in the second case.

  In the first case the constant of integration is determined if one lets the
  real part of <math|\<beta\>> become infinitely negative; in the second case
  the integral from 0 to <math|x> takes on values separated by
  <math|2*\<pi\>*i>, depending on whether the integral on <math|s> is taken
  through complex values with positive or negative argument, and becomes
  infinitely small, for the former path, when the coefficient of <math|i> in
  the value of <math|\<beta\>> becomes infinitely positive, but for the
  latter, when this coefficient becomes infinitely negative. From this it is
  seen how on the left hand side

  <\equation*>
    log <around*|(|<frac|1|1-\<beta\>>|)>
  </equation*>

  is to be determined in order that the constants of integration disappear.
  Through the insertion of these values in the expression for
  <math|f<around|(|x|)>> one obtains

  <\equation>
    f<around|(|x|)>=L*i<around|(|x|)>-<big|sum><around*|(|L*i<around*|(|x<rsup|<frac|1|2>+i*\<gamma\>>|)>+L*i<around*|(|x<rsup|<frac|1|2>-i*\<gamma\>>|)>|)>+<big|int><rsub|x><rsup|\<infty\>><frac|d*t|t<rsup|2>-1*log
    t>+log \<xi\><around|(|0|)>
  </equation>

  if in <math|<big|sum>> one substitutes for <math|\<alpha\>> all positive
  roots (or roots having a positive real part) of the equation
  <math|\<xi\><around|(|s|)>=0>, ordered by their magnitude. It may easily be
  shown, by means of a more thorough discussion of the function
  <math|\<xi\>>, that with this ordering of terms the value of the series

  <\equation>
    <big|sum><around*|(|L*i<around*|(|x<rsup|<frac|1|2>+i*\<gamma\>>|)>+L*i<around*|(|x<rsup|<frac|1|2>-i*\<gamma\>>|)>|)>*log
    x
  </equation>

  agrees with the limiting value to which

  <\equation>
    <frac|1|2*\<pi\>*i>*<big|int><rsub|a-b*i><rsup|a+b*i><frac|d|d*s><around*|[|log
    <around*|(|1+<around*|(|<frac|s-<frac|1|2>|\<alpha\>>|)><rsup|2>|)>|]>*x<rsup|s>*d*s
  </equation>

  converges as the quantity <math|b> increases without bound; however when
  reordered it can take on any arbitrary real value.

  From <math|f<around|(|x|)>> one obtains <math|F<around|(|x|)>> by inversion
  of the relation

  <\equation>
    f<around|(|x|)>=<big|sum><frac|1|n>*F<around*|(|x<rsup|<frac|1|n>>|)>
  </equation>

  to obtain the equation

  <\equation>
    F<around|(|x|)>=<big|sum><around|(|-1|)><rsup|k><frac|1|m>*f<around*|(|x<rsup|<frac|1|m>>|)>
  </equation>

  in which one substitutes for <math|m> the series consisting of those
  natural numbers that are not divisible by any square other than 1, and in
  which <math|\<mu\>> denotes the number of prime factors of <math|m>.

  If one restricts <math|<big|sum>> to a finite number of terms, then the
  derivative of the expression for <math|f<around|(|x|)>> or, up to a part
  diminishing very rapidly with growing <math|x>,

  <\equation>
    <frac|1|log x>-<frac|2*\<zeta\><rprime|'>*\<alpha\>|\<zeta\>*\<alpha\>*log
    x>*cos <around|(|\<alpha\>*log x|)>*x<rsup|-<frac|1|2>>
  </equation>

  gives an approximating expression for the density of the prime number
  <math|+> half the density of the squares of the prime numbers <math|+> a
  third of the density of the cubes of the prime numbers etc. at the
  magnitude <math|x>.

  The known approximating expression <math|F<around|(|x|)>=L*i<around|(|x|)>>
  is therefore valid up to quantities of the order <math|x<rsup|<frac|1|2>>>
  and gives somewhat too large a value; because the non-periodic terms in the
  expression for <math|F<around|(|x|)>> are, apart from quantities that do
  not grow infinite with <math|x>:

  <\equation>
    L*i<around|(|x|)>-<frac|1|2>*L*i<around|(|x<rsup|<frac|1|2>>|)>-<frac|1|3>*L*i<around|(|x<rsup|<frac|1|3>>|)>-<frac|1|5>*L*i<around|(|x<rsup|<frac|1|5>>|)>+<frac|1|6>*L*i<around|(|x<rsup|<frac|1|6>>|)>-<frac|1|7>*L*i<around|(|x<rsup|<frac|1|7>>|)>+\<ldots\>
  </equation>

  Indeed, in the comparison of <math|L*i<around|(|x|)>> with the number of
  prime numbers less than <math|x>, undertaken by Gauss and Goldschmidt and
  carried through up to <math|x=> three million, this number has shown itself
  out to be, in the first hundred thousand, always less than
  <math|L*i<around|(|x|)>>; in fact the difference grows, with many
  fluctuations, gradually with <math|x>. But also the increase and decrease
  in the density of the primes from place to place that is dependent on the
  periodic terms has already excited attention, without however any law
  governing this behaviour having been observed. In any future count it would
  be interesting to keep track of the influence of the individual periodic
  terms in the expression for the density of the prime numbers. A more
  regular behaviour than that of <math|F<around|(|x|)>> would be exhibited by
  the function <math|f<around|(|x|)>>, which already in the first hundred is
  seen very distinctly to agree on average with <math|L*i<around|(|x|)>+log
  \<epsilon\><around|(|0|)>>.
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