<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Exact Zero--Counting Function and Critical Strip
  Correspondence between the Riemann <math|\<zeta\>> Function and \ Hardy's
  <math|Z>--Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Notation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Theorem>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Reference>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>
  </table-of-contents>

  <section*|Notation>

  <\enumerate>
    <item>Critical strip of the <math|\<zeta\>> function

    <\equation>
      \<cal-S\><space|0.27em>=<space|0.27em><around|{|<space|0.17em>s\<in\>\<bbb-C\>:0\<less\>\<Re\>*s\<less\>1<space|0.17em>|}>
    </equation>

    <item>Critical strip of the Z function

    <\equation>
      \<cal-Z\><space|0.27em>=<space|0.27em><around|{|<space|0.17em>t\<in\>\<bbb-C\>:<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2><space|0.17em>|}>
    </equation>

    <\equation>
      \<Phi\><around|(|t|)>=<tfrac|1|2>+i*t
    </equation>

    <\equation>
      \<Phi\><rsup|-1><around|(|s|)>=-i*<around*|(|s-<tfrac|1|2>|)>
    </equation>

    <item><with|font-series|bold|Riemann\USiegel theta and Hardy's <math|Z>>

    <\equation>
      \<vartheta\><around|(|t|)>=\<Im\>*log
      \<Gamma\>*<around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log \<pi\>
    </equation>

    <\equation>
      Z<around|(|t|)>=e<rsup|i*\<vartheta\><around|(|t|)>>*<space|0.17em>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>
    </equation>

    <item><with|font-series|bold|Counting functions>

    <\enumerate>
      <item> (multiplicity; half\Uweight if <math|\<Im\>*\<rho\>=T>)

      <\equation>
        N<rsub|\<zeta\>><around|(|T|)>=#<around|{|\<rho\>\<in\>\<cal-S\>:0\<less\>\<Im\>*\<rho\>\<le\>T|}>
      </equation>

      <item><math|> (multiplicity; half\Uweight if <math|\<Re\>*t=T>)

      <\equation>
        N<rsub|Z><around|(|T|)>=#<around|{|t\<in\>\<cal-Z\>:0\<less\>\<Re\>*t\<le\>T|}>
      </equation>
    </enumerate>

    The bijection <math|\<Phi\>> gives <math|N<rsub|Z><around|(|T|)>=N<rsub|\<zeta\>><around|(|T|)>>
    for every <math|T\<gtr\>0>.

    <item><with|font-series|bold|Argument term>

    <\equation>
      S<around|(|T|)><space|0.27em>=<space|0.27em><frac|arg
      <space|-0.17em>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*T|)>|\<pi\>><space|0.17em>
    </equation>

    where <math|arg> is continuous along the path
    <math|2<space|-0.17em>\<to\><space|-0.17em>2+i*T<space|-0.17em>\<to\><space|-0.17em><tfrac|1|2>+i*T>.
  </enumerate>

  <section*|Theorem>

  <\theorem>
    Let <math|T\<gtr\>0>. If <math|Z<around|(|T|)>\<neq\>0>, then

    <\equation>
      N<rsub|Z><around|(|T|)><space|0.27em>=<space|0.27em><frac|\<vartheta\><around|(|T|)>|\<pi\>><space|0.27em>+<space|0.27em>1<space|0.27em>+<space|0.27em>S<around|(|T|)>
    </equation>

    If <math|Z<around|(|T|)>=0>, set

    <\equation>
      N<rsub|Z><around|(|T|)><space|0.27em>=<space|0.27em><tfrac|1|2><around*|(|N<rsub|Z><around|(|T<rsup|->|)>+N<rsub|Z><around|(|T<rsup|+>|)>|)>
    </equation>

    <\equation>
      S<around|(|T|)><space|0.27em>=<space|0.27em><tfrac|1|2><around*|(|S<around|(|T<rsup|->|)>+S<around|(|T<rsup|+>|)>|)>
    </equation>

    and the same identity holds.
  </theorem>

  <\proof>
    <\enumerate>
      <item>Choose the positively oriented rectangle bounded by the lines
      <math|\<Re\>*s=<tfrac|1|2>> and <math|\<Re\>*s=2>, and by
      <math|\<Im\>*s=0> and <math|\<Im\>*s=T>.

      <item>Write

      <\equation>
        \<pi\><rsup|-<frac|s|2>>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>*<space|0.17em>\<zeta\><around|(|s|)><space|0.17em><tfrac|1|2>s*<around|(|s-1|)><space|0.27em>=<space|0.27em><around*|[|\<pi\><rsup|-<frac|s|2>>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>|]>\<cdot\>\<zeta\><around|(|s|)>\<cdot\><around*|[|<tfrac|1|2>s*<around|(|s-1|)>|]>
      </equation>

      None of these factors vanishes on the chosen contour except
      <math|\<zeta\>>, whose zeros inside are exactly the set counted by
      <math|N<rsub|\<zeta\>><around|(|T|)>>.

      <item>The argument principle gives

      <\equation>
        2*\<pi\>*N<rsub|\<zeta\>><around|(|T|)><space|0.27em>=<space|0.27em>\<Delta\>*arg
        <space|-0.17em><around*|[|\<pi\><rsup|-s/2>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>|]><space|0.27em>+<space|0.27em>\<Delta\>*arg
        \<zeta\><around|(|s|)><space|0.27em>+<space|0.27em>\<Delta\>*arg
        <space|-0.17em><around*|[|<tfrac|1|2>s*<around|(|s-1|)>|]>
      </equation>

      <item>Computations on the top edge <math|<around*|(|2+i*T\<to\><tfrac|1|2>+i*T|)>>:

      <\itemize>
        <item><math|<with|math-display|true|\<Delta\>*arg
        <space|-0.17em><around*|[|\<pi\><rsup|-s/2>*\<Gamma\><space|-0.17em><around*|(|<tfrac|s|2>|)>|]>=\<vartheta\><around|(|T|)>>>

        <item><math|<with|math-display|true|\<Delta\>*arg
        <space|-0.17em><around*|[|<tfrac|1|2>s*<around|(|s-1|)>|]>=\<pi\>>>

        <item><math|<with|math-display|true|\<Delta\>*arg
        \<zeta\><around|(|s|)>=\<pi\>*S<around|(|T|)>>>
      </itemize>

      The remaining segments contribute 0.

      <item>Thus

      <\equation>
        2*\<pi\>*N<rsub|\<zeta\>><around|(|T|)><space|0.27em>=<space|0.27em>\<vartheta\><around|(|T|)><space|0.27em>+<space|0.27em>\<pi\><space|0.27em>+<space|0.27em>\<pi\>*S<around|(|T|)>
      </equation>

      so that

      <\equation>
        N<rsub|\<zeta\>><around|(|T|)>=<frac|\<vartheta\><around|(|T|)>|\<pi\>>+1+S<around|(|T|)>
      </equation>

      <item>Using the bijection <math|\<Phi\>>, zeros of <math|\<zeta\>> with
      <math|0\<less\>\<Im\>*s\<le\>T> correspond bijectively to zeros of
      <math|Z> with <math|0\<less\>\<Re\>*t\<le\>T>, whence

      <\equation>
        N<rsub|Z><around|(|T|)>=N<rsub|\<zeta\>><around|(|T|)>
      </equation>

      \ and the stated identity for <math|Z> follows.

      <item>When <math|T> coincides with <math|\<Re\>*t> of one or more
      zeros, both <math|N<rsub|Z>> and <math|S> jump by the total
      multiplicity. The stated midpoint rule gives the ordinary value at
      <math|T> and preserves equality.
    </enumerate>

    \;
  </proof>

  <section*|Reference>

  E.<space|0.17em>C.<nbsp>Titchmarsh, <em|The Theory of the Riemann
  Zeta-Function>, 2nd<nbsp>ed. (rev. D.<space|0.17em>R.<nbsp>Heath-Brown),
  Oxford University Press, 1986, Chs.<nbsp>9\U10.
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-2|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-3|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Notation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Reference>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>