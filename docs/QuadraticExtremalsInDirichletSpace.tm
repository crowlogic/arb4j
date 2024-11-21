<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|A Quadratic Extremal Problem on the Dirichlet
  Space>|<doc-author|<author-data|<author-name|STEPHEN D.
  FISHER>|<author-affiliation|Department of Mathematics, Northwestern
  University, Evanston, IL 60208, USA>>>|<\doc-date>
    Originally Appeared In <no-indent><with|font-shape|italic|Complex
    Variables>, 1995, Vol. 26, pp. 367\U380

    <vspace*|0.5cm>AMS No. 30D50, 30D45, 30D10, 30C15<next-line>Communicated:
    R. P. Gilbert<next-line>(Received October 2, 1993)\ 
  </doc-date>|<doc-note|In memory of Ralph P. Boas, Jr. (1912--1992).>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|INTRODUCTION>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1. EXISTENCE
    AND UNIQUENESS> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>
  </table-of-contents>

  <vspace*|1cm>It is shown that there is a unique solution <math|F> to the
  problem

  <\equation>
    \<lambda\>=sup <around*|{|<text|Re><big|int><rsub|\<Delta\>>F<rprime|'>*<wide|F|\<bar\>><rprime|'>*d*A:<big|int><rsub|\<Delta\>><around|\||F<rprime|'>|\|><rsup|2>*d*A\<leq\>1|}>
  </equation>

  The function <math|F> is entire with a number of special properties. The
  number <math|\<lambda\>> is the reciprocal of the smallest zero of the 0th
  Bessel function of the first kind.

  <vspace*|1cm><section*|INTRODUCTION>

  The Dirichlet space, <math|D>, on the open unit disc <math|\<Delta\>>
  consists of all analytic functions <math|f>

  <\equation>
    f<around|(|z|)>=<big|sum><rsub|k=1><rsup|\<infty\>>a<rsub|k>*z<rsup|k><space|1em>\<forall\><around|\||z|\|>\<less\>1,<space|1em>f<around|(|0|)>=0
  </equation>

  for which the quantity

  <\equation>
    <big|int><rsub|\<Delta\>><around|\||f<rprime|'><around|(|z|)>|\|><rsup|2>*d*A<around|(|z|)>=<big|sum><rsub|k=1><rsup|\<infty\>>k<around|\||a<rsub|k>|\|><rsup|2>=:<around|\<\|\|\>|f|\<\|\|\>><rsub|D><rsup|2>
  </equation>

  is finite. In connection with a generalization of Harnack's inequality,
  Boris Korenblum [2] has asked how large the quantity

  <\equation>
    \<lambda\>\<assign\>sup<rsub|f\<in\>D>
    <frac|<text|Re><around*|(|<big|sum><rsub|k=1><rsup|\<infty\>>a<rsub|k>*a<rsub|k+1>|)>|<big|sum><rsub|k=1><rsup|\<infty\>>k<around|\||a<rsub|k>|\|><rsup|2>>
  </equation>

  is and, if possible, to characterize all functions <math|F> which attain
  the value <math|\<lambda\>> in (2). The expression in the numerator in (2)
  is not a linear function of <math|f> but rather quadratic; hence, the title
  of this paper.

  It is simple to show that

  <\equation>
    <big|sum><rsub|i>a<rsub|k>*a<rsub|k+1>=<big|int><rsub|\<Delta\>><around|\||F<rprime|'><around|(|z|)>|\|><rsup|2>*d*A<around|(|z|)>
  </equation>

  <documentclass*|12pt|article> <usepackage|amsmath, amssymb, amsfonts>
  <usepackage|geometry>

  <no-indent>and therefore Korenblum's problem has this alternate form:

  <\equation*>
    \<lambda\>=sup <around*|{|<text|Re><around*|(|<big|int><rsub|\<Delta\>>F<rprime|'>*<wide|F|\<bar\>><rprime|'>*d*A|)>:<around|\<\|\|\>|f|\<\|\|\>><rsub|D>\<leq\>1|}>.
  </equation*>

  We show here that the extremal problem (2) or (4) has a unique solution
  <math|F>, up to multiplication by a constant; moreover, <math|F> is an
  entire function of exponential type with infinitely many zeros, all in the
  left half-plane, none of which lie in <math|\<Delta\>> or on the real axis,
  except for a first-order zero at the origin. Moreover, the number
  <math|\<lambda\>> is the reciprocal of the smallest positive zero of
  <math|J<rsub|0><around|(|x|)>>, the 0th Bessel function. Finally,

  <\equation*>
    F<around|(|z|)>=C*<big|sum><rsub|n=1><rsup|\<infty\>>J<rsub|n><around|(|\<lambda\>|)>*z<rsup|n>,
  </equation*>

  where <math|J<rsub|n>> is the nth Bessel function and <math|C> is a certain
  constant.

  The conclusions above are proved in Sections 1 and 2; Section 3 contains a
  number of results which generalize the extremal problem (2).

  <vspace*|0.5cm><section*|1. EXISTENCE AND UNIQUENESS>

  We begin by establishing simple bounds on <math|\<lambda\>>.

  \;

  <\proposition>
    <math|<frac|1|<sqrt|6>>\<less\>\<lambda\>\<leq\><frac|1|2>>.
  </proposition>

  <\proof>
    Since <math|2<space|0.17em><text|Re><around|(|z<wide|w|\<bar\>>|)>\<leq\><around|\||z|\|><rsup|2>+<around|\||w|\|><rsup|2>>,
    we have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|2*<space|0.17em><text|Re><around|(|a<rsub|1>*a<rsub|2>+a<rsub|2>*a<rsub|3>+\<cdots\>|)>>|<cell|\<leq\><around|\||a<rsub|1>|\|><rsup|2>+<around|\||a<rsub|2>|\|><rsup|2>+<around|\||a<rsub|3>|\|><rsup|2>+\<cdots\><rsup|2>>>|<row|<cell|>|<cell|=<around|\||a<rsub|1>|\|><rsup|2>+2\|a<rsub|2>*<around|\||<rsup|2>+3|\|>*a<rsub|3>\|<rsup|2>+\<cdots\>>>|<row|<cell|>|<cell|=<big|sum>k<around|\||a<rsub|k>|\|>>>>>>
    </equation>

    which implies that <math|\<lambda\>\<leq\>1/2>. The lower bound is
    obtained by the specific choices

    <\equation>
      a<rsub|2>=<sqrt|<frac|3|2>>*a<rsub|1>,<space|1em>a<rsub|3>=<frac|3|4>*a<rsub|1>,<space|1em>a<rsub|4>=a<rsub|5>=\<cdots\>=0
    </equation>

    which give

    <\equation>
      \<lambda\>=<frac|<around*|(|a<rsub|1>*a<rsub|2>+a<rsub|2>*a<rsub|3>|)>|<around*|(|a<rsub|1><rsup|2>+2*a<rsub|2><rsup|2>+3*a<rsub|3><rsup|2>|)>>=<frac|<sqrt|<frac|3|2>>+3<space|0.17em><around|(|<frac|3|4>|)>|1+2<space|0.17em><around|(|<frac|3|2>|)>+3<space|0.17em><around|(|<frac|9|16>|)>>=<frac|<sqrt|<frac|3|2>>+<around|(|<frac|9|4>|)>|1+<around|(|<frac|3|4>|)>+<around|(|<frac|27|16>|)>>=<frac|<sqrt|1>|6>
    </equation>
  </proof>

  To prove the existence of a solution, we shall need the following Lemma.

  <\lemma>
    Given <math|\<epsilon\>\<gtr\>0>, there is an
    <math|R<rsub|0>,0\<less\>R<rsub|0>\<less\>1>, such that

    <\equation*>
      <big|int><rsub|R><rsup|R+1>f*<around|(|r*e<rsup|i*t>|)><rsup|r>*d*t*d*r\<less\>e<around|\|||\|>*f<around|\|||\|><rsub|D><rsup|<around|(|5|)>>,f<around|(|0|)>=0
    </equation*>
  </lemma>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|5|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|INTRODUCTION>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.
      EXISTENCE AND UNIQUENESS> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>