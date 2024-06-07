<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Hilbert-Schmidt Theory of Integral Equations With
  Symmetric Kernel>>

  <cite-detail|lecturesOnDifferentialAndIntegralEquations|2.2 Sec 19-24>

  <subsection|Ascoli-Arzelà theorem>

  We first consider the integral equation

  <\equation>
    \<psi\><around|(|x|)>=\<lambda\>*<big|int><rsub|a><rsup|b>G<around|(|x,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*d*\<xi\><label|19.1>
  </equation>

  which is equivalent to a boundary value problem for
  <math|L*\<psi\><around|(|y|)>=-\<lambda\>*\<psi\><around|(|y|)>>, as was
  shown in Ÿ1. Multiply both sides of (<reference|19.1>) by
  <math|<sqrt|r<around*|(|x|)>>>. (It is assumed that
  <math|r<around|(|x|)>\<gtr\>0>, see Part 16.) Then, setting

  <\equation>
    z<around|(|x|)>=<sqrt|r<around*|(|x|)>>*\<psi\><around|(|x|)>
  </equation>

  <\equation>
    K<around|(|x,\<xi\>|)>=<sqrt|r<around*|(|x|)>>*G<around|(|x,\<xi\>|)><sqrt|r<around*|(|\<xi\>|)>><label|19.3>
  </equation>

  we obtain

  <\equation>
    z<around|(|x|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|x,\<xi\>|)>*z<around|(|\<xi\>|)>*d*\<xi\>
  </equation>

  Here <math|K<around|(|x,\<xi\>|)>> is a real-valued continuous function
  which has the symmetry property

  <\equation>
    K<around|(|x,\<xi\>|)>=K<around|(|\<xi\>,x|)>
  </equation>

  just as <math|G<around|(|x,\<xi\>|)>>.

  If the integral equation (<reference|19.3>) with the symmetric kernel
  <math|K<around|(|x,\<xi\>|)>> has a non-trivial continuous solution
  <math|z<around|(|x|)>> for some value of parameter <math|\<lambda\>>, then
  such <math|z> is called an eigenvalue and <math|z<around|(|x|)>> an
  eigenfunction belonging to the eigenvalue <math|\<lambda\>>. The
  Hilbert-Schmidt theory for this eigenvalue problem is based upon the
  following existence theorem:

  <\theorem>
    <label|19.1>If <math|K*<around|(|x,\<xi\>|)>> is a real-valued continuous
    symmetric kernel and does not vanish identically, then the integral
    equation (<reference|19.3>) with the kernel
    <math|K*<around|(|x,\<xi\>|)>> possesses at least one non-zero
    eigenvalue.
  </theorem>

  We shall prove, in this paragraph, the <with|font-shape|italic|Ascoli-Arzela
  theorem>, which will play a fundamental role in the proof of Theorem
  <reference|19.1>.

  By means of the kernel <math|K*<around|(|x,\<xi\>|)>>, every complex-valued
  continuous function <math|f<around|(|x|)>> defined on the interval
  <math|<around|[|a,b|]>> is transformed into a continuous function

  <\equation>
    <around|(|K*f|)><around|(|x|)>=<big|int><rsub|a><rsup|b>K*<around|(|x,\<xi\>|)>*f<around|(|\<xi\>|)>*d*\<xi\>
  </equation>

  on the same interval. This is so because

  <\equation>
    <around*|\||<big|int><rsub|a><rsup|b><around|(|K*<around|(|x<rsub|1>,\<xi\>|)>-K*<around|(|x<rsub|2>,\<xi\>|)>|)>*f<around|(|\<xi\>|)>*d*\<xi\>|\|>\<leq\><around*|{|sup<rsub|\<xi\>\<in\><around|[|a,b|]>><around|\||f<around|(|\<xi\>|)>|\|>|}>*<big|int><rsub|a><rsup|b><around|\||K*<around|(|x<rsub|1>,\<xi\>|)>-K*<around|(|x<rsub|2>,\<xi\>|)>|\|>*d*\<xi\>
  </equation>

  tends to zero as <math|<around|\||x<rsub|1>-x<rsub|2>|\|>\<rightarrow\>0>
  because of the uniform continuity of <math|K*<around|(|x,\<xi\>|)>>. We
  denote by <math|K> the transformation

  <\equation>
    <around|(|K*f|)><around|(|x|)>=<big|int><rsub|a><rsup|b>K*<around|(|x,\<xi\>|)>*f<around|(|\<xi\>|)>*d*\<xi\><label|19.8>
  </equation>

  Obviously the transformation <math|K> satisfies

  <\align>
    <tformat|<table|<row|<cell|K*<around|(|f<rsub|1>+f<rsub|2>|)>>|<cell|=K*f<rsub|1>+K*f<rsub|2><eq-number><label|19.9>>>|<row|<cell|K*<around|(|a*f|)>>|<cell|=a*<around|(|K*f|)><space|1em><text|(for
    any constant <math|a>)><eq-number>>>>>
  </align>

  Accordingly, the transformation <math|K> is a
  <with|font-shape|italic|linear operator>. For each continuous function
  <math|f<around|(|x|)>>, we define its <with|font-shape|italic|norm> by

  <\equation>
    <around|\|||\|>*f<around|\|||\|>=<sqrt|<big|int><rsub|a><rsup|b><around|\||f<around|(|x|)>|\|><rsup|2>*d*x>
  </equation>

  Then we can prove that

  <\equation>
    <around|\||<around|(|K*f|)><around|(|x|)>|\|>\<leq\><around|\|||\|>*f<around|\|||\|><sqrt|<big|int><rsub|a><rsup|b><around|\||K*<around|(|x,\<xi\>|)>|\|><rsup|2>*d*\<xi\>>
  </equation>

  <\equation>
    <around|\||<around|(|K*f|)><around|(|x<rsub|1>|)>-<around|(|K*f|)><around|(|x<rsub|2>|)>|\|>\<leq\><around|\|||\|>*f<around|\|||\|><sqrt|<big|int><rsub|a><rsup|b><around|\||K*<around|(|x<rsub|1>,\<xi\>|)>-K*<around|(|x<rsub|2>,\<xi\>|)>|\|><rsup|2>*d*\<xi\>><label|19.13>
  </equation>

  In fact, these are easily derived from the <with|font-shape|italic|Schwarz
  inequality>

  <\equation>
    <around*|\||<big|int><rsub|a><rsup|b>g<around|(|\<xi\>|)>*h<around|(|\<xi\>|)>*d*\<xi\>|\|><rsup|2>\<leq\><big|int><rsub|a><rsup|b><around|\||g<around|(|\<xi\>|)>*<around|\||<rsup|2>d*\<xi\>*<big|int><rsub|a><rsup|b>|\|>*h<around|(|\<xi\>|)>|\|><rsup|2>*d*\<xi\>
  </equation>

  which will be proved in Part 20. Accordingly, we obtain the following
  theorem.

  <\theorem>
    <label|19.2>Let <math|<around|{|f<rsub|n><around|(|x|)>|}>> be a sequence
    of continuous functions on <math|<around|[|a,b|]>>. Let
    <math|<around|{|g<rsub|n><around|(|x|)>|}>> be
    <math|<around|{|K*f<rsub|n><around|(|x|)>|}>>. Then
    <math|<around|{|g<rsub|n><around|(|x|)>|}>> and
    <math|<around|\|||\|>*f<rsub|n><around|\|||\|>>, <math|n=1,2,3,\<ldots\>>
    satisfies

    <\equation>
      sup<rsub|a\<leq\>\<xi\>\<leq\>b><around|\||g<rsub|n><around|(|\<xi\>|)>|\|>\<less\>\<infty\>
    </equation>

    <\equation>
      lim<rsub|n\<rightarrow\>\<infty\>> sup<rsub|<stack|<tformat|<table|<row|<cell|a\<leq\>\<xi\>\<leq\>b>>|<row|<cell|<around|\||x<rsub|1>-x<rsub|2>|\|>\<less\>\<delta\>>>>>>><around|\||g<rsub|n><around|(|x<rsub|1>|)>-g<rsub|n><around|(|x<rsub|2>|)>|\|>=0
    </equation>
  </theorem>

  <\remark>
    A set of functions <math|<around|{|g<rsub|n><around|(|x|)>|}>> is said to
    be <with|font-shape|italic|equibounded> on <math|<around|[|a,b|]>> if it
    satisfies (19.8), and <with|font-shape|italic|equicontinuous> on
    <math|<around|[|a,b|]>> if it satisfies (<reference|19.9>). It should be
    noted that theorem <reference|19.2> does not hold for all linear
    operators. For example, an operator <math|T> defined by

    <\equation>
      f<around|(|x|)>\<rightarrow\><around|(|T*f|)><around|(|x|)>=\<alpha\><around|(|x|)>*f<around|(|x|)>
    </equation>

    where <math|\<alpha\><around|(|x|)>> is a continuous function does not
    satisfy (<reference|19.8>) nor (<reference|19.9>).
  </remark>

  Owing to the properties (19.8') and (19.9') of the operator <math|K>, we
  can apply the Ascoli-Arzela theorem, which reads as follows:

  <\theorem>
    <label|19.3>Let <math|<around|{|g<rsub|n><around|(|x|)>|}>> be a sequence
    of continuous functions. If <math|<around|{|g<rsub|n><around|(|x|)>|}>>
    satisfies the conditions (19.8') and (19.9'), then we can choose a
    subsequence <math|<around|{|g<rsub|n<rsub|k>><around|(|x|)>|}>> which
    converges uniformly on the interval <math|<around|[|a,b|]>>
  </theorem>

  <\proof>
    \ Since the set of all rational numbers in the interval
    <math|<around|[|a,b|]>> is denumerable, it may be arranged as
    <math|r<rsub|1>,r<rsub|2>,r<rsub|3>,\<ldots\>>

    On account of (19.8'), the sequence of numbers

    <\equation>
      g<rsub|1><around|(|r<rsub|1>|)>,g<rsub|2><around|(|r<rsub|1>|)>,g<rsub|3><around|(|r<rsub|1>|)>,\<ldots\>
    </equation>

    is bounded; hence by the Bolzano-Weierstrass theorem there exists a
    convergent subsequence

    <\equation>
      g<rsub|1<rprime|'>><around|(|r<rsub|1>|)>,g<rsub|2<rprime|'>><around|(|r<rsub|1>|)>,g<rsub|3<rprime|'>><around|(|r<rsub|1>|)>,\<ldots\>
    </equation>

    Similarly, we can select from the sequence of numbers

    <\equation>
      g<rsub|1<rprime|'>><around|(|r<rsub|2>|)>,g<rsub|2<rprime|'>><around|(|r<rsub|2>|)>,g<rsub|3<rprime|'>><around|(|r<rsub|2>|)>,\<ldots\>
    </equation>

    a convergent subsequence\ 

    <\equation>
      <math|g<rsub|1<rprime|''>><around|(|r<rsub|2>|)>,g<rsub|2<rprime|''>><around|(|r<rsub|2>|)>,g<rsub|3<rprime|''>><around|(|r<rsub|2>|)>,\<ldots\>>
    </equation>

    Repeating this procedure, we can select from each sequence of functions
    <math|n=1,2,\<ldots\>>

    <\equation>
      g<rsub|1<rsup|<around|(|n-1|)>>><around|(|r<rsub|n>|)>,g<rsub|2<rsup|<around|(|n-1|)>>><around|(|r<rsub|n>|)>,g<rsub|3<rsup|<around|(|n-1|)>>><around|(|r<rsub|n>|)>,\<ldots\>,<space|1em><around|(|g<rsub|k<rsup|<around|(|0|)>>><around|(|x|)>=g<rsub|k><around|(|x|)>|)>
    </equation>

    a subsequence of functions

    <\equation>
      g<rsub|1<rsup|<around|(|n|)>>><around|(|x|)>,g<rsub|2<rsup|<around|(|n|)>>><around|(|x|)>,g<rsub|3<rsup|<around|(|n|)>>><around|(|x|)>,\<ldots\><space|1em><around|(|n=1,2,3,\<ldots\>|)>
    </equation>

    which converges at the points <math|x=r<rsub|1>,r<rsub|2>,\<ldots\>,r<rsub|n>>.
    Accordingly, the subsequence

    <\equation>
      g<rsub|1<rprime|'>><around|(|x|)>,g<rsub|2<rprime|'>><around|(|x|)>,g<rsub|3<rprime|''>><around|(|x|)>,\<ldots\>,g<rsub|n<rsup|n>><around|(|x|)>,\<ldots\>
    </equation>

    of the original sequence <math|<around|{|g<rsub|n><around|(|x|)>|}>>
    converges for every rational number <math|r=r<rsub|1>,r<rsub|2>,\<ldots\>,r<rsub|n>,\<ldots\>>
    (This method of selection (<reference|19.13>) is an example of the
    so-called <with|font-shape|italic|diagonal method>.)

    Next, we shall prove that the sequence (19.13) converges uniformly on the
    interval <math|<around|[|a,b|]>>. For the sake of simplicity, we shall
    denote the sequence (19.13) by <math|<around|{|g<rsub|n><around|(|x|)>|}>>.
    According to (19.9'), there exists, for any positive number
    <math|\<varepsilon\>\<gtr\>0>, a positive number
    <math|\<delta\>=\<delta\><around|(|\<varepsilon\>|)>\<gtr\>0> such that

    <\equation*>
      <around|\||g<rsub|n><around|(|x<rsub|1>|)>-g<rsub|n><around|(|x<rsub|2>|)>|\|>\<leq\>\<varepsilon\>*<text|for
      all >n
    </equation*>

    whenever <math|<around|\||x<rsub|1>-x<rsub|2>|\|>\<leq\>\<delta\>>.

    On the other hand, the set of all rational numbers is dense in the
    interval <math|<around|[|a,b|]>>, hence for the above <math|\<delta\>>,
    there exists a number <math|N=N<around|(|\<delta\>|)>> such that

    <\equation*>
      min<rsub|1\<leq\>k\<leq\>N><around|\||x-r<rsub|k>|\|>\<less\>\<delta\>
    </equation*>

    for every number <math|x> in the interval. Further, since
    <math|<around|{|g<rsub|n><around|(|x|)>|}>> converges at the points
    <math|x=r<rsub|1>,r<rsub|2>,\<ldots\>,r<rsub|N>>, there exists, for the
    <math|\<varepsilon\>\<gtr\>0>, a number
    <math|M=M<around|(|\<varepsilon\>|)>> such that

    <\equation>
      m,n\<geq\>M*<text|implies ><around|\||g<rsub|n><around|(|r<rsub|k>|)>-g<rsub|m><around|(|r<rsub|k>|)>|\|>\<less\>\<varepsilon\>*<space|1em>\<forall\>1\<leq\>k\<leq\>N
    </equation>

    Therefore, for each <math|x>, there exists a rational number
    <math|r<rsub|k>*\<forall\>1\<leq\>k\<leq\>N> such that

    <\equation>
      <around|\||g<rsub|n><around|(|x|)>-g<rsub|m><around|(|x|)>|\|>\<leq\><around|\||g<rsub|n><around|(|x|)>-g<rsub|n><around|(|r<rsub|k>|)>|\|>+<around|\||g<rsub|n><around|(|r<rsub|k>|)>-g<rsub|m><around|(|r<rsub|k>|)>|\|>+<around|\||g<rsub|m><around|(|r<rsub|k>|)>-g<rsub|m><around|(|x|)>|\|>\<leq\>3*\<varepsilon\>
    </equation>

    wherever <math|m,n\<geq\>M>. This means that
    <math|<around|{|g<rsub|n><around|(|x|)>|}>> converges uniformly on the
    interval <math|<around|[|a,b|]>>, q.e.d.
  </proof>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-lecturesOnDifferentialAndIntegralEquations>\<#5409\>\<#7530\><nbsp>\<#8015\>\<#4F5C\>(K\<#14D\>saku
      Yosida). <newblock><with|font-shape|italic|Lectures on Differential and
      Integral Equations>, <localize|volume><nbsp>X<localize| of
      ><with|font-shape|italic|Pure and Applied Mathematics>.
      <newblock><tformat|<table|<row|<cell|Interscience Publishers/John
      Wiley>|<cell|Sons Inc.>>>>, New York/London/Sydney, 1960.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|19.1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|19.13|<tuple|13|2|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|19.2|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|19.3|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|19.8|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|19.9|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|auto-2|<tuple|26|4|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|bib-lecturesOnDifferentialAndIntegralEquations|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_34.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      lecturesOnDifferentialAndIntegralEquations
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>Ascoli-Arzelà theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>