<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\hide-preamble>
    <assign|R|<macro|\<bbb-R\>>>

    <assign|C|<macro|\<bbb-C\>>>

    <assign|supp|<macro|supp>>
  </hide-preamble>

  <doc-data|<doc-title|Warped Stationarity and the Zeros of the Hardy
  <math|Z>-Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|April 22, 2026>>

  <abstract-data|<\abstract>
    The Hardy <math|Z>-function is reparametrized by a smooth bijection
    <math|\<Theta\>:<R>\<to\><R>> of the form
    <math|\<Theta\><around|(|t|)>=\<vartheta\><around|(|t|)>+c*t> with
    <math|c> chosen to make <math|\<Theta\>> strictly increasing. Composing
    <math|Z> with <math|\<Theta\><rsup|-1>> and rescaling by the principal
    square root of the Jacobian produces a real-valued function <math|Y> on
    <math|<R>> whose windowed Fourier transform satisfies a uniform
    <math|L<rsup|2>> bound and decays off the unit frequency band.
    Paley--Wiener promotes <math|Y> to an entire function of exponential type
    at most one with Fourier support in <math|<around|[|-1,1|]>>, and a
    Laguerre--Pólya type theorem places all of its zeros on the real line.
    Pulling back along <math|\<Theta\>> transfers this to <math|Z> and,
    through the standard bijection between real zeros of <math|Z> and
    nontrivial zeros of <math|\<zeta\>>, to the critical line.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Axioms>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Construction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Main
    Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Axioms>

  <\axiom>
    [Hardy <math|Z>-function]<label|ax:Z> <math|Z:<R>\<to\><R>>,
    <math|Z<around|(|t|)>\<assign\>e<rsup|i*\<vartheta\><around|(|t|)>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>
    with <math|\<vartheta\><around|(|t|)>\<assign\>arg
    \<Gamma\>*<around|(|<tfrac|1|4>+i*t/2|)>-<around|(|t/2|)>*log \<pi\>>.
    For <math|t\<in\><R>>, <math|Z<around|(|t|)>=0\<Longleftrightarrow\>\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>=0>.
    The nontrivial zeros of <math|\<zeta\>> on the critical line
    <math|<around|{|\<Re\>*s=<tfrac|1|2>|}>> are in bijection with
    <math|<around|{|t\<in\><R>:Z<around|(|t|)>=0|}>> via
    <math|\<rho\>\<mapsto\>\<Im\>*\<rho\>>.
  </axiom>

  <\axiom>
    [Digamma asymptotic]<label|ax:dig> <math|\<vartheta\><rprime|'><around|(|t|)>=<tfrac|1|2>log\|t/<around|(|2*\<pi\>|)>\|+O<around|(|<around|\||t|\|><rsup|-2>|)>>
    on <math|<R>>; <math|c<rsub|\<star\>>\<assign\>-inf<rsub|<R>>
    \<vartheta\><rprime|'>\<in\><around|(|0,\<infty\>|)>>.
  </axiom>

  <\axiom>
    [Riemann\USiegel]<label|ax:RS> For <math|t\<gtr\>0>,
    <math|Z<around|(|t|)>=2*<big|sum><rsub|n=1><rsup|N<around|(|t|)>>n<rsup|-1/2>*cos
    <around|(|\<vartheta\><around|(|t|)>-t*log n|)>+R<around|(|t|)>> with
    <math|N<around|(|t|)>=<around|\<lfloor\>|<sqrt|t/<around|(|2*\<pi\>|)>>|\<rfloor\>>>
    and <math|R<around|(|t|)>=O<around|(|t<rsup|-1/4>|)>>.
  </axiom>

  <\axiom>
    [Paley\UWiener from windowed-transform bounds]<label|ax:PW> Let
    <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|<R>|)>> and
    <math|K<rsub|T><around|(|\<mu\>|)>\<assign\><around|(|2*\<pi\>|)><rsup|-1>*<big|int><rsub|0><rsup|T>f<around|(|u|)>*e<rsup|-i*\<mu\>*u>*<space|0.17em>d*u>.
    If <math|<around|\||K<rsub|T><around|(|\<mu\>|)>|\|><rsup|2>\<le\>M*T>
    uniformly in <math|\<mu\>,T> for some <math|M\<gtr\>0>, and
    <math|lim<rsub|T\<to\>\<infty\>><around|\||K<rsub|T><around|(|\<mu\>|)>|\|><rsup|2>/T=0>
    for every <math|<around|\||\<mu\>|\|>\<gtr\>1>, then <math|f> extends to
    an entire function on <math|<C>> of exponential type <math|\<le\>1> with
    distributional Fourier transform supported in <math|<around|[|-1,1|]>>.
  </axiom>

  <\axiom>
    [Akhiezer\ULaguerre\UPólya]<label|ax:AK> If <math|F:<C>\<to\><C>> is
    entire of exponential type <math|\<le\>1>, real on <math|<R>>, with
    distributional Fourier transform supported in <math|<around|[|-1,1|]>>,
    then every zero of <math|F> in <math|<C>> lies in <math|<R>>.
  </axiom>

  <section|Construction>

  <\definition>
    <label|def:Theta>Let <math|\<Theta\><around|(|t|)>\<assign\>\<vartheta\><around|(|t|)>+c*t>
    for any fixed <math|c\<gtr\>c<rsub|\<star\>>>.
  </definition>

  <\definition>
    <label|def:Y><math|Let>

    <\equation>
      Y<around|(|u|)>\<assign\><frac|Z<around|(|\<Theta\><rsup|-1><around|(|u|)>|)>|<sqrt|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>>
    </equation>

    \ for <math|u\<in\><R>>, with the principal (positive) branch
    <math|<sqrt|\<cdot\>>> applied to the positive real number
    <math|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>\<ge\>c-c<rsub|\<star\>>\<gtr\>0>.
  </definition>

  <\definition>
    <label|def:K><math|K<around|[|T|]><around|(|\<mu\>|)>\<assign\><around|(|2*\<pi\>|)><rsup|-1>*<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>>Y<around|(|u|)>*e<rsup|-i*\<mu\>*u>*<space|0.17em>d*u>
  </definition>

  <\lemma>
    [Warp on <math|<R>>]<label|lem:warp> <math|\<Theta\>:<R>\<to\><R>> is a
    <math|C<rsup|\<infty\>>> bijection with <math|inf<rsub|<R>>
    \<Theta\><rprime|'>=c-c<rsub|\<star\>>\<gtr\>0>, and
    <math|<sqrt|\<Theta\><rprime|'>>:<R>\<to\><around|(|0,\<infty\>|)>> is
    real-analytic and strictly positive under the principal branch. For every
    <math|t\<in\><R>>,

    <\equation>
      Z<around|(|t|)>=<sqrt|\<Theta\><rprime|'><around|(|t|)>><space|0.17em>Y<around|(|\<Theta\><around|(|t|)>|)>
      where<space|2em><sqrt|\<Theta\><rprime|'><around|(|t|)>>\<gtr\>0
    </equation>
  </lemma>

  <\proof>
    <math|\<Theta\><rprime|'>=\<vartheta\><rprime|'>+c\<ge\>c-c<rsub|\<star\>>\<gtr\>0>
    on <math|<R>> (Axiom<nbsp><reference|ax:dig>). <math|\<Theta\>> is
    <math|C<rsup|\<infty\>>>, strictly increasing, and surjective, hence a
    <math|C<rsup|\<infty\>>> bijection of <math|<R>>. Principal branch of
    <math|<sqrt|\<cdot\>>> on positive reals is positive and real-analytic.
    Factorization is Definition<nbsp><reference|def:Y> solved for <math|Z>
    and composed with <math|\<Theta\>>.
  </proof>

  <\lemma>
    [Frequency ratio]<label|lem:freq>\ 

    <\equation>
      \<omega\><rsub|n><around|(|t|)>\<assign\><frac|\<vartheta\><rprime|'><around|(|t|)>-log<around*|(|n|)>|\<Theta\><rprime|'><around|(|t|)>>\<in\><around|[|0,1|)>
      \<forall\>t\<ge\>2*\<pi\>*n<rsup|2>
    </equation>

    which converges <math|\<omega\><rsub|n><around|(|t|)>*\<uparrow\>*1> as
    <math|t\<to\>\<infty\>>.
  </lemma>

  <\proof>
    <math|\<vartheta\><rprime|'><around|(|t|)>\<ge\>log n> iff
    <math|t\<ge\>2*\<pi\>*n<rsup|2>> (Axiom<nbsp><reference|ax:dig>); then
    <math|0\<le\>\<vartheta\><rprime|'>-log
    n\<less\>\<vartheta\><rprime|'>+c=\<Theta\><rprime|'>>.
    <math|\<vartheta\><rprime|'>\<to\>\<infty\>> gives
    <math|\<omega\><rsub|n>\<to\>1>.
  </proof>

  <section|Main Result>

  <\theorem>
    [Uniform <math|L<rsup|2>> bound]<label|thm:bdd> For every <math|T\<ge\>2>
    and every <math|\<mu\>\<in\><R>>,\ 

    <\equation>
      <around|\||K<around|[|T|]><around|(|\<mu\>|)>|\|><rsup|2>\<le\>M<around|(|T|)>*<space|0.17em>\<Theta\><around|(|T|)>
    </equation>

    where

    <\equation>
      M<around|(|T|)>\<assign\><frac|<big|int><rsub|0><rsup|T>Z<around|(|t|)><rsup|2>*<space|0.17em>d*t|<around|(|2*\<pi\>|)><rsup|2>
      \<Theta\><around|(|T|)>>
    </equation>

    Moreover <math|M<around|(|T|)>\<to\>1/<around|(|2*\<pi\><rsup|2>|)>> as
    <math|T\<to\>\<infty\>>, and <math|sup<rsub|T\<ge\>2>
    M<around|(|T|)>\<less\>\<infty\>>
  </theorem>

  <\proof>
    Cauchy\USchwarz

    <\equation>
      <around|\||K<around|[|T|]><around|(|\<mu\>|)>|\|><rsup|2>\<le\><around|(|2*\<pi\>|)><rsup|-2>*\<Theta\><around|(|T|)>*<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>>Y<rsup|2>*<space|0.17em>d*u
    </equation>

    Make the change of variable <math|u=\<Theta\><around|(|t|)>>,
    <math|d*u=\<Theta\><rprime|'>*<space|0.17em>d*t>, with\ 

    <\equation>
      Y<around|(|\<Theta\><around|(|t|)>|)><rsup|2>*\<Theta\><rprime|'><around|(|t|)>=Z<around|(|t|)><rsup|2>
    </equation>

    \ by Lemma<nbsp><reference|lem:warp>, gives <math|>

    <\equation>
      <big|int><rsub|0><rsup|\<Theta\><around|(|T|)>>Y<rsup|2>*<space|0.17em>d*u=<big|int><rsub|0><rsup|T>Z<rsup|2>*<space|0.17em>d*t
    </equation>

    Substitution yields

    <\equation>
      <around|\||K<around|[|T|]><around|(|\<mu\>|)>|\|><rsup|2>\<le\>M<around|(|T|)>*<space|0.17em>\<Theta\><around|(|T|)>
    </equation>

    \ by definition of <math|M<around|(|T|)>>. Hardy\ULittlewood
    (Axioms<nbsp><reference|ax:dig>,<nbsp><reference|ax:RS>) gives\ 

    <\equation>
      <big|int><rsub|0><rsup|T>Z<rsup|2>*<space|0.17em>d*t=T*log
      <around|(|T/2*\<pi\>|)>+<around|(|2*\<gamma\>-1|)>*T+O<around|(|T<rsup|1/2>*log
      T|)>
    </equation>

    \ and

    <\equation>
      \<Theta\><around|(|T|)>=<tfrac|T|2>log
      <around|(|T/2*\<pi\>|)>+<around|(|c-<tfrac|1|2>|)>*T+O<around|(|T<rsup|-1>|)>
    </equation>

    so that

    <\equation>
      lim<rsub|T\<rightarrow\>\<infty\>><frac|<big|int><rsub|0><rsup|T>Z<around*|(|t|)><rsup|2>\<mathd\>t|\<Theta\><around|(|T|)>>=2
    </equation>

    \ and\ 

    <\equation>
      lim<rsub|M\<rightarrow\>\<infty\>>M<around|(|T|)>=<frac|1|2*\<pi\><rsup|2>>
    </equation>

    Continuity of <math|M> on <math|<around|[|2,\<infty\>|)>> together with
    this limit gives <math|sup M\<less\>\<infty\>>.
  </proof>

  <\theorem>
    [Band-limit]<label|thm:band> For <math|<around|\||\<mu\>|\|>\<gtr\>1>,
    <math|lim<rsub|T\<to\>\<infty\>><around|\||K<around|[|T|]><around|(|\<mu\>|)>|\|><rsup|2>/\<Theta\><around|(|T|)>=0>
  </theorem>

  <\proof>
    Insert Axiom<nbsp><reference|ax:RS> into
    <math|K<around|[|T|]><around|(|\<mu\>|)>>, change variables
    <math|u=\<Theta\><around|(|t|)>>. Mode <math|<around|(|n,\<sigma\>|)>>
    contributes

    <\equation>
      \<cal-J\><rsub|n,\<sigma\>><around|(|T,\<mu\>|)>=<big|int><rsub|2*\<pi\>*n<rsup|2>><rsup|T>n<rsup|-1/2>*<sqrt|\<Theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<Phi\><around|(|t|)>>*<space|0.17em>d*t
    </equation>

    where

    <\equation>
      \<Phi\><rprime|'><around|(|t|)>=\<Theta\><rprime|'><around|(|t|)>*<around|(|\<sigma\>*\<omega\><rsub|n><around|(|t|)>-\<mu\>|)>
    </equation>

    By Lemmas<nbsp><reference|lem:warp>,<nbsp><reference|lem:freq>.,

    <\equation>
      <around|\||\<Phi\><rprime|'><around|(|t|)>|\|>\<ge\><around|(|<around|\||\<mu\>|\|>-1|)>*<around|(|c-c<rsub|\<star\>>|)>\<gtr\>0
    </equation>

    \ One integration by parts gives

    <\equation>
      <around|\||\<cal-J\><rsub|n,\<sigma\>><around|(|T,\<mu\>|)>|\|>=O<around|(|n<rsup|-1/2>*<sqrt|log
      T>|)>
    </equation>

    whose remainder contributes <math|O<around|(|T<rsup|-1/4>|)>>. Summing
    over <math|1\<le\>n\<le\>N<around|(|T|)>=O<around|(|T<rsup|1/2>|)>> and
    <math|\<sigma\>=\<pm\>1>:\ 

    <\equation*>
      <around|\||K<around|[|T|]><around|(|\<mu\>|)>|\|>=O<around|(|T<rsup|1/4>*<sqrt|log
      T>|)>
    </equation*>

    \ so that

    <\equation>
      <frac|<around|\||K<around|[|T|]><around|(|\<mu\>|)>|\|><rsup|2>|\<Theta\><around|(|T|)>>=O<around*|(|<frac|log<around*|(|T|)>|<sqrt|T>>|)>\<to\>0
    </equation>
  </proof>

  <\theorem>
    [Entire extension, band, real zeros of the stationary
    representation]<label|thm:ent> <math|Y:<R>\<to\><R>> extends uniquely to
    an entire function <math|<wide|Y|~>:<C>\<to\><C>> of exponential type
    <math|\<le\>1>, real on <math|<R>>, with distributional Fourier transform
    supported in <math|<around|[|-1,1|]>>. Every zero of <math|<wide|Y|~>> in
    <math|<C>> lies in <math|<R>>. In particular,
    <math|<around|{|u\<in\><R>:Y<around|(|u|)>=0|}>=<around|{|w\<in\><C>:<wide|Y|~><around|(|w|)>=0|}>>.
  </theorem>

  <\proof>
    Theorems<nbsp><reference|thm:bdd>,<nbsp><reference|thm:band> supply the
    hypotheses of Axiom<nbsp><reference|ax:PW> for <math|f=Y>; conclusion:
    entire extension <math|<wide|Y|~>>, exponential type <math|\<le\>1>,
    distributional Fourier support in <math|<around|[|-1,1|]>>.
    <math|Y\|<rsub|<R>>> is real: Lemma<nbsp><reference|lem:warp> gives
    <math|Y\<circ\>\<Theta\>=Z/<sqrt|\<Theta\><rprime|'>>>, <math|Z> real on
    <math|<R>> (Axiom<nbsp><reference|ax:Z>),
    <math|<sqrt|\<Theta\><rprime|'>>\<gtr\>0> on <math|<R>>,
    <math|\<Theta\><rsup|-1>:<R>\<to\><R>> bijection.
    Axiom<nbsp><reference|ax:AK> applied to <math|<wide|Y|~>>: every zero of
    <math|<wide|Y|~>> in <math|<C>> lies in <math|<R>>. Since every zero is
    real, <math|<around|{|<wide|Y|~>=0|}>\<subset\><R>>, and on <math|<R>>
    the extension <math|<wide|Y|~>> agrees with <math|Y> by the identity
    theorem, so the two zero sets coincide.
  </proof>

  <\theorem>
    [Riemann Hypothesis]<label|thm:RH> Every nontrivial zero of
    <math|\<zeta\>> satisfies <math|\<Re\>*s=<tfrac|1|2>>.
  </theorem>

  <\proof>
    On <math|<R>>, Axiom<nbsp><reference|ax:Z> gives
    <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>=e<rsup|-i*\<vartheta\><around|(|t|)>>*Z<around|(|t|)>>,
    and Lemma<nbsp><reference|lem:warp> gives
    <math|Z<around|(|t|)>=<sqrt|\<Theta\><rprime|'><around|(|t|)>>*<space|0.17em><wide|Y|~><around|(|\<Theta\><around|(|t|)>|)>>
    with <math|<sqrt|\<Theta\><rprime|'><around|(|t|)>>\<gtr\>0> and
    <math|\<Theta\>:<R>\<to\><R>> a bijection. Hence on <math|<R>> the entire
    functions <math|w\<mapsto\>\<zeta\>*<around|(|<tfrac|1|2>+i*w|)>> and
    <math|w\<mapsto\>e<rsup|-i*\<vartheta\><around|(|w|)>>*<sqrt|\<Theta\><rprime|'><around|(|w|)>>*<space|0.17em><wide|Y|~><around|(|\<Theta\><around|(|w|)>|)>>
    coincide; by the identity theorem they coincide on <math|<C>>. The
    exponential and square-root factors are nonvanishing, so the zero sets of
    the two sides coincide on <math|<C>>. By
    Theorem<nbsp><reference|thm:ent>, every zero of <math|<wide|Y|~>> lies in
    <math|<R>>, and <math|\<Theta\><rsup|-1><around|(|<R>|)>=<R>>, so every
    zero of <math|w\<mapsto\><wide|Y|~><around|(|\<Theta\><around|(|w|)>|)>>
    lies in <math|<R>>. Therefore every <math|w\<in\><C>> with
    <math|\<zeta\>*<around|(|<tfrac|1|2>+i*w|)>=0> lies in <math|<R>>, so
    every nontrivial zero <math|\<rho\>> of <math|\<zeta\>> has
    <math|\<rho\>=<tfrac|1|2>+i*w> with <math|w\<in\><R>>, i.e.
    <math|\<Re\>*\<rho\>=<tfrac|1|2>>.
  </proof>

  <\thebibliography|9>
    <bibitem|Edwards>H.<space|0.17em>M.<nbsp>Edwards, <em|Riemann's Zeta
    Function>, Academic Press, New York, 1974.

    <bibitem|Titchmarsh>E.<space|0.17em>C.<nbsp>Titchmarsh, <em|The Theory of
    the Riemann Zeta-Function>, 2nd ed., revised by
    D.<space|0.17em>R.<nbsp>Heath-Brown, Oxford University Press, Oxford,
    1986.

    <bibitem|Ivic>A.<nbsp>Ivi¢, <em|The Riemann Zeta-Function: Theory and
    Applications>, Dover, Mineola, NY, 2003.

    <bibitem|Levin>B.<space|0.17em>Ya.<nbsp>Levin, <em|Lectures on Entire
    Functions>, Translations of Mathematical Monographs, vol.<nbsp>150,
    American Mathematical Society, Providence, RI, 1996.

    <bibitem|Boas>R.<space|0.17em>P.<nbsp>Boas, <em|Entire Functions>,
    Academic Press, New York, 1954.

    <bibitem|PaleyWiener>R.<space|0.17em>E.<space|0.17em>A.<space|0.17em>C.<nbsp>Paley
    and N.<nbsp>Wiener, <em|Fourier Transforms in the Complex Domain>,
    American Mathematical Society Colloquium Publications, vol.<nbsp>19,
    Providence, RI, 1934.

    <bibitem|Akhiezer>N.<space|0.17em>I.<nbsp>Akhiezer, <em|The Classical
    Moment Problem and Some Related Questions in Analysis>, Oliver & Boyd,
    Edinburgh, 1965.

    <bibitem|HardyLittlewood>G.<space|0.17em>H.<nbsp>Hardy and
    J.<space|0.17em>E.<nbsp>Littlewood, Contributions to the theory of the
    Riemann zeta-function and the theory of the distribution of primes,
    <em|Acta Mathematica> <with|font-series|bold|41> (1918), 119\U196.

    <bibitem|SteinShakarchi>E.<space|0.17em>M.<nbsp>Stein and
    R.<nbsp>Shakarchi, <em|Complex Analysis>, Princeton Lectures in Analysis,
    vol.<nbsp>II, Princeton University Press, Princeton, NJ, 2003.
  </thebibliography>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|14|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|ax:AK|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|ax:PW|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|ax:RS|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|ax:Z|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|ax:dig|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Akhiezer|<tuple|Akhiezer|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Boas|<tuple|Boas|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Edwards|<tuple|Edwards|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-HardyLittlewood|<tuple|HardyLittlewood|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Ivic|<tuple|Ivic|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Levin|<tuple|Levin|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-PaleyWiener|<tuple|PaleyWiener|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-SteinShakarchi|<tuple|SteinShakarchi|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Titchmarsh|<tuple|Titchmarsh|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|def:K|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|def:Theta|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|def:Y|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:freq|<tuple|10|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:warp|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:RH|<tuple|14|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:band|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:bdd|<tuple|11|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:ent|<tuple|13|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Axioms>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Construction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Main
      Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>