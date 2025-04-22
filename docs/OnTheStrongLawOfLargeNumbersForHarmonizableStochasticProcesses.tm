<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|ON THE STRONG LAW OF LARGE NUMBERS FOR HARMONIZABLE
  STOCHASTIC PROCESSES>|<doc-author|<author-data|<author-name|Akio
  Arimoto>|<author-affiliation|Dept. of Administration Engineering, Keio
  University, Yokohama 223, Japan>>>|<doc-date|Received Oct. 5, 1972>>

  <abstract-data|<\abstract>
    The harmonizable stochastic processes
    <math|X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*x>*Z*<around|(|d*x|)>>
    are additively built up by elementary harmonic oscillations
    <math|e<rsup|i*t*x>*Z*<around|(|d*x|)>>, each of which has an angular
    frequency <math|x>, while the random amplitude and the random phase are
    determined by the elementary increment <math|Z*<around|(|d*x|)>>. It is
    well known that the necessary and sufficient condition for the validity
    of the weak law of large numbers for such a process is described in terms
    of the spectral distribution <math|E*Z*<around|(|d*x|)><wide|Z*<around|(|d*y|)>|\<bar\>>>.
    However, for the strong law of large numbers, sufficient conditions have
    been given in terms of covariance functions for weakly stationary
    processes or some non-stationary stochastic processes. In this paper a
    sufficient condition for the strong law of large numbers is given in
    terms of the spectral distribution for harmonizable stochastic processes.
  </abstract>>

  <section|Introduction>

  Let

  <\equation>
    <label|eq:1>X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*x>*Z*<around|(|d*x|)>
  </equation>

  be a harmonizable stochastic process, in which <math|Z<around|(|S|)>> is an
  additive stochastic set function defined for each Borel set <math|S> on the
  real axis such that

  <\equation>
    <label|eq:2>E*Z<around|(|S|)>=0
  </equation>

  <\equation>
    <label|eq:3>E*Z<around|(|S<rsub|1>|)><wide|Z<around|(|S<rsub|2>|)>|\<bar\>>=<big|int><rsub|x\<in\>S<rsub|1>><big|int><rsub|y\<in\>S<rsub|2>>d*F<around|(|x,y|)>
  </equation>

  where <math|F<around|(|x,y|)>> is a function of limited total variation
  over the whole plane, that is,

  <\equation>
    <label|eq:4><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||d*F<around|(|x,y|)>|\|>\<less\>\<infty\>
  </equation>

  <math|X<around|(|t|)>> is a process of the second order with
  <math|E*X<around|(|t|)>=0> and the covariance function of
  <math|X<around|(|t|)>> is given by

  <\equation>
    <label|eq:5>r<around|(|s,t|)>=E*X<around|(|s|)><wide|X<around|(|t|)>|\<bar\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|s*x-t*y|)>>*d*F<around|(|x,y|)>
  </equation>

  which is continuous on <math|-\<infty\>\<less\>s,t\<less\>\<infty\>> and
  <math|F<around|(|x,y|)>> is hermitian symmetric;
  <math|F<around|(|x,y|)>=<wide|F<around|(|y,x|)>|\<bar\>>>.
  <math|F<around|(|x,y|)>> is called the spectral distribution function of
  <math|X<around|(|t|)>>. Such a process was first introduced by Loève (1948)
  and some applications of this process were discussed in Blanc-Lappierre and
  Fortet (1953). In Loève (1948), he has shown that if <math|X<around|(|t|)>>
  is a harmonizable stochastic process, then

  <\equation>
    <label|eq:6>Y<around|(|u|)>=<below|<text|li.m.>|T\<rightarrow\>\<infty\>><frac|1|2*T>*<big|int><rsub|-T><rsup|T>e<rsup|-i*u*t>*X<around|(|t|)>*d*t
  </equation>

  exists for every <math|u>, <math|E*Y<around|(|u|)>=0> and

  <\equation>
    <label|eq:7><with|font-base-size|9|E*Y<around|(|u|)><wide|Y<around|(|v|)>|\<bar\>>=F<around|(|u+0,v+0|)>-F<around|(|u-0,v+0|)>-F<around|(|u+0,v-0|)>+F<around|(|u-0,v-0|)>>
  </equation>

  That is, the weak law of large numbers for <math|X<around|(|t|)>> always
  holds, whenever <math|F<around|(|x,y|)>> is continuous at origin.

  Now we talk about the strong law of large numbers. Loève (1948) and
  Cramér-Leadbetter (1967) gave the sufficient conditions for the validity of
  the strong law of large numbers for general stochastic processes of second
  order.

  <\theorem>
    [Loève (1948)]<label|thm:A> Suppose that <math|X<around|(|t|)>> is a
    stochastic process which is continuous in the mean over all the finite
    segment. If, either

    <\enumerate>
      <item>for sufficiently large <math|t>,

      <\equation>
        <label|eq:8>r<around|(|t,t|)>\<less\>C\<less\>\<infty\>
      </equation>

      <\equation>
        <label|eq:9><frac|1|T<rsup|2-c>>*<big|int><rsup|T><big|int><rsup|T>r<around|(|u,v|)>*d*u*d*v\<less\>D\<less\>\<infty\>
      </equation>

      where <math|C\<gtr\>0,c\<gtr\>0,D> are some constants, or

      <item>with probability one,

      <\equation>
        <label|eq:10><around|\||X<around|(|t|)>|\|>\<less\>C<rprime|'>\<less\>\<infty\>,-\<infty\>\<less\>t\<less\>\<infty\>
      </equation>

      <\equation>
        <label|eq:11><big|int><rsup|\<infty\>><frac|d*T|T<rsup|3>>*<big|int><rsup|T><big|int><rsup|T><around|\||r<around|(|u,v|)>|\|>*d*u*d*v\<less\>D<rprime|'>\<less\>\<infty\>
      </equation>

      where <math|C<rprime|'>\<gtr\>0,D<rprime|'>\<gtr\>0> are some
      constants, then we have

      <\equation>
        <label|eq:12>lim<rsub|T\<rightarrow\>\<infty\>>
        <frac|1|T>*<big|int><rsup|T>X<around|(|t|)>*d*t=0
      </equation>

      with probability one.
    </enumerate>
  </theorem>

  <\theorem>
    [Cramér-Leadbetter (1967)]<label|thm:B> Suppose that
    <math|r<around|(|s,t|)>> is continuous for <math|s,t\<geq\>0> and that

    <\equation>
      <label|eq:13><around|\||r<around|(|s,t|)>|\|>\<less\>K<frac|s<rsup|\<alpha\>>+t<rsup|\<alpha\>>|1+<around|\||s-t|\|><rsup|\<beta\>>>
    </equation>

    where <math|K,\<alpha\>> and <math|\<beta\>> are constants such that
    <math|K\<gtr\>0,0\<leq\>2*\<alpha\>\<less\>\<beta\>\<less\>1>. Then we
    have

    <\equation>
      <label|eq:14>lim<rsub|T\<rightarrow\>\<infty\>>
      <frac|1|T>*<big|int><rsub|0><rsup|T>X<around|(|t|)>*d*t=0
    </equation>

    with probability one.
  </theorem>

  These can be applied to the case of harmonizable processes. On the other
  hand, Verbitskaya (1964) gave the condition for the strong law of large
  numbers for weakly stationary processes which were better than the above
  Loève and Cramér-Leadbetter's conditions applied to weakly stationary
  processes. However, a remarkable fact is that the method of the proof of
  Verbitskaya could be applied to the more general processes not necessarily
  stationary and in fact, Kawata (1972) has noticed the following result
  applying it to some other class of non-stationary processes:

  <\theorem>
    [Kawata (1972)]<label|thm:C> Let <math|X<around|(|t|)>> be a stochastic
    process of the second order with <math|E*X<around|(|t|)>=0,-\<infty\>\<less\>t\<less\>\<infty\>>.
    If

    <\enumerate>
      <item>

      <\equation>
        <label|eq:15><big|int><rsub|n><rsup|n+1>E<around|\||X<around|(|t|)>|\|><rsup|2>*d*t\<less\>K
      </equation>

      for all integer <math|n> with <math|-\<infty\>\<less\>n\<less\>\<infty\>,K>
      being a constant independent of <math|n>, and

      <item>there is a non-negative function
      <math|g<around|(|u|)>,0\<leq\>u\<less\>\<infty\>>, such that

      <\equation>
        <label|eq:16><around*|\||<big|int><rsub|0><rsup|x><big|int><rsub|0><rsup|x>r<around|(|u+\<tau\>,v+\<tau\>|)>*d*u*d*v|\|>\<leq\><big|int><rsub|0><rsup|x>g<around|(|u|)>*d*u
      </equation>

      for every <math|-\<infty\>\<less\>\<tau\>\<less\>\<infty\>,0\<leq\>x\<less\>\<infty\>>,
      where

      <\equation>
        <label|eq:17><big|int><rsub|1><rsup|\<infty\>><frac|log<rsup|2>
        x|x<rsup|2>>*g<around|(|x|)>*d*x\<less\>\<infty\>
      </equation>
    </enumerate>

    Then

    <\equation>
      <label|eq:18>lim<rsub|T\<rightarrow\>\<infty\>>
      <frac|1|T>*<big|int><rsub|0><rsup|T>X<around|(|t|)>*d*t=0
    </equation>

    with probability one.
  </theorem>

  In this paper, we shall, following Kawata's line, handle the problem and
  give sufficient conditions in terms of the spectral distribution
  <math|F<around|(|x,y|)>> for the strong law of large numbers in the case of
  harmonizable processes.

  <section|Main Results>

  Let <math|X<around|(|t|)>> be a given harmonizable process with
  <math|E*X<around|(|t|)>=0,-\<infty\>\<less\>t\<less\>\<infty\>>, and the
  spectral distribution function <math|F<around|(|x,y|)>>. We begin with the
  following lemma.

  <\lemma>
    <label|lem:1>Suppose that for <math|u\<rightarrow\>0+>,

    <\equation>
      <label|eq:19><big|int><rsub|D<rsub|1>><big|int><frac|1|<around|\||x|\|><rsup|a><around|\||y|\|><rsup|b>>*<around|\||d*F<around|(|x,y|)>|\|>=O<around*|(|<frac|1|u<rsup|a+b><around|\||log
      u|\|><rsup|3+\<delta\>>>|)>
    </equation>

    <\equation>
      <label|eq:20><big|int><rsub|D<rsub|2>><big|int><frac|1|<around|\||x|\|><rsup|c><around|\||y|\|><rsup|d>>*<around|\||d*F<around|(|x,y|)>|\|>=O<around*|(|<frac|1|u<rsup|c+d><around|\||log
      u|\|><rsup|3+\<delta\>>>|)>
    </equation>

    <\equation>
      <label|eq:21><big|int><rsub|D<rsub|3>><big|int><frac|1|<around|\||x|\|><rsup|e><around|\||y|\|><rsup|f>>*<around|\||d*F<around|(|x,y|)>|\|>=O<around*|(|<frac|1|u<rsup|e+f><around|\||log
      u|\|><rsup|3+\<delta\>>>|)>
    </equation>

    for some <math|a,b,c\<in\><around|[|0,\<infty\>|)>> and some
    <math|d,e,f\<in\><around|[|0,1|]>> and some <math|\<delta\>\<gtr\>0>,
    where

    <\equation>
      <label|eq:22>D<rsub|1>=<around|{|<around|(|x,y|)>:<around|\||x|\|>\<leq\>u,<around|\||y|\|>\<leq\>u|}>
    </equation>

    <\equation>
      <label|eq:23>D<rsub|2>=<around|{|<around|(|x,y|)>:<around|\||x|\|>\<leq\>u,u\<less\><around|\||y|\|>|}>
    </equation>

    and

    <\equation>
      <label|eq:24>D<rsub|3>=<around|{|<around|(|x,y|)>:u\<less\><around|\||x|\|>\<leq\>1,u\<less\><around|\||y|\|>\<leq\>1|}>
    </equation>

    Then

    <\equation>
      <label|eq:25><big|int><rsub|1><rsup|\<infty\>><frac|log<rsup|2>
      t|t<rsup|3>>*h<around|(|t,\<tau\>|)>*d*t\<less\>\<infty\>
    </equation>

    where

    <\equation>
      <label|eq:26>h<around|(|t,\<tau\>|)>=max<rsub|0\<leq\>s\<leq\>t><around*|{|<big|int><rsub|0><rsup|s><big|int><rsub|0><rsup|s>r<around|(|u+\<tau\>,v+\<tau\>|)>*d*u*d*v|}>,-\<infty\>\<less\>\<tau\>\<less\>\<infty\>.
    </equation>
  </lemma>

  <\proof>
    We can easily see by <eqref|eq:5> that

    <\equation>
      <label|eq:27><big|int><rsub|0><rsup|t><big|int><rsub|0><rsup|t>r<around|(|u+\<tau\>,v+\<tau\>|)>*d*u*d*v=4*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<tau\>+<frac|t|2>|)>*<around|(|x-y|)>>*<frac|sin
      <frac|x*t|2>*sin <frac|y*t|2>|x*y>*d*F<around|(|x,y|)>
    </equation>

    Therefore, we have

    <\equation>
      <label|eq:28><around*|\||<big|int><rsub|0><rsup|t><big|int><rsub|0><rsup|t>r<around|(|u+\<tau\>,v+\<tau\>|)>*d*u*d*v|\|>\<leq\>4*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|\||<frac|sin
      <frac|x*t|2>|x>*<frac|sin <frac|y*t|2>|y>|\|>*<around|\||d*F<around|(|x,y|)>|\|>
    </equation>

    which is split into five parts for large <math|t\<gtr\>0>

    <\equation>
      <label|eq:29><big|int><rsub|D<rsub|1><rsup|\<ast\>>><big|int>+<big|int><rsub|D<rsub|2><rsup|\<ast\>>><big|int>+<big|int><rsub|D<rsub|3><rsup|\<ast\>>><big|int>+<big|int><rsub|D<rsub|4><rsup|\<ast\>>><big|int>+<big|int><rsub|D<rsub|5><rsup|\<ast\>>><big|int>
    </equation>

    where

    <\equation>
      <label|eq:30>D<rsub|1><rsup|\<ast\>>=<around*|{|<around|(|x,y|)>:<around|\||x|\|>\<leq\><frac|2|t>,<around|\||y|\|>\<leq\><frac|2|t>|}>
    </equation>

    <\equation>
      <label|eq:31>D<rsub|2><rsup|\<ast\>>=<around*|{|<around|(|x,y|)>:<around|\||x|\|>\<leq\><frac|2|t>,<around|\||y|\|>\<gtr\><frac|2|t>|}>
    </equation>

    <\equation>
      <label|eq:32>D<rsub|3><rsup|\<ast\>>=<around*|{|<around|(|x,y|)>:<around|\||x|\|>\<gtr\><frac|2|t>,<around|\||y|\|>\<leq\><frac|2|t>|}>
    </equation>

    <\equation>
      <label|eq:33>D<rsub|4><rsup|\<ast\>>=<around*|{|<around|(|x,y|)>:<frac|2|t>\<less\><around|\||x|\|>\<leq\>1,<frac|2|t>\<less\><around|\||y|\|>\<leq\>1|}>
    </equation>

    and

    <\equation>
      <label|eq:34>D<rsub|5><rsup|\<ast\>>=<around|(|-\<infty\>,\<infty\>|)>\<times\><around|(|-\<infty\>,\<infty\>|)>-D<rsub|1><rsup|\<ast\>>\<cup\>D<rsub|2><rsup|\<ast\>>\<cup\>D<rsub|3><rsup|\<ast\>>\<cup\>D<rsub|4><rsup|\<ast\>>.
    </equation>

    Since <math|<around|\||sin x|\|>\<leq\><around|\||x|\|>>, we have

    <\equation>
      <label|eq:35><big|int><rsub|0><rsup|2/t><big|int><rsub|0><rsup|2/t><frac|sin
      <frac|x*t|2>*sin <frac|y*t|2>|x*y>*<around|\||d*F<around|(|x,y|)>|\|>\<leq\><around*|(|<frac|t|2>|)><rsup|2-a-b>*<big|int><rsub|0><rsup|2/t><big|int><rsub|0><rsup|2/t><frac|1|x<rsup|a>*y<rsup|b>>*<around|\||d*F<around|(|x,y|)>|\|>
    </equation>

    <\equation>
      <label|eq:36><big|int><rsub|0><rsup|2/t><big|int><rsub|2/t><rsup|\<infty\>><frac|sin
      <frac|x*t|2>*sin <frac|y*t|2>|x*y>*<around|\||d*F<around|(|x,y|)>|\|>\<leq\><around*|(|<frac|t|2>|)><rsup|1-c>*<big|int><rsub|0><rsup|2/t><big|int><rsub|2/t><rsup|\<infty\>><frac|1|x<rsup|c>*y>*<around|\||d*F<around|(|x,y|)>|\|>
    </equation>

    which is, since

    <\equation>
      <label|eq:37><frac|1|y>=<frac|1|y<rsup|d>*y<rsup|1-d>>\<leq\><frac|1|y<rsup|d>><around*|(|<frac|t|2>|)><rsup|1-d>*<text|for
      >y\<geq\><frac|2|t>
    </equation>

    <\equation>
      <label|eq:38>\<leq\><around*|(|<frac|t|2>|)><rsup|2-c-d>*<big|int><rsub|0><rsup|2/t><big|int><rsub|2/t><rsup|\<infty\>><frac|1|x<rsup|c>*y<rsup|d>>*<around|\||d*F<around|(|x,y|)>|\|>
    </equation>

    <\equation>
      <label|eq:39><big|int><rsub|2/t><rsup|1><big|int><rsub|2/t><rsup|1><frac|sin
      <frac|x*t|2>*sin <frac|y*t|2>|x*y>*<around|\||d*F<around|(|x,y|)>|\|>\<leq\><big|int><rsub|2/t><rsup|1><big|int><rsub|2/t><rsup|1><frac|1|x*y>*<around|\||d*F<around|(|x,y|)>|\|>
    </equation>

    <\equation>
      <label|eq:40>\<leq\><around*|(|<frac|t|2>|)><rsup|2-e-f>*<big|int><rsub|2/t><rsup|1><big|int><rsub|2/t><rsup|1><frac|1|x<rsup|e>*y<rsup|f>>*<around|\||d*F<around|(|x,y|)>|\|>
    </equation>

    and

    <\equation>
      <label|eq:41><big|int><rsub|1><rsup|\<infty\>><big|int><rsub|1><rsup|\<infty\>><frac|sin
      <frac|x*t|2>*sin <frac|y*t|2>|x*y>*<around|\||d*F<around|(|x,y|)>|\|>\<leq\><big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>><around|\||d*F<around|(|x,y|)>|\|>.
    </equation>

    We have similar estimates of the integrals in other quadrants. Thus, we
    have

    <\equation>
      <label|eq:42><tabular|<tformat|<cwith|1|-1|1|-1|font-base-size|9>|<table|<row|<cell|<around*|\||<frac|1|4>*<big|int><rsub|0><rsup|t><big|int><rsub|0><rsup|t>r<around|(|u+\<tau\>,v+\<tau\>|)>*d*u*d*v|\|>>|<cell|\<leq\><around*|(|<frac|t|2>|)><rsup|2-a-b>*<big|int><rsub|D<rsub|1><rsup|\<ast\>>><big|int><frac|1|<around|\||x|\|><rsup|a><around|\||y|\|><rsup|b>>*<around|\||d*F<around|(|x,y|)>|\|>>>|<row|<cell|>|<cell|+2<around*|(|<frac|t|2>|)><rsup|2-c-d>*<big|int><rsub|D<rsub|2><rsup|\<ast\>>><big|int><frac|1|<around|\||x|\|><rsup|c><around|\||y|\|><rsup|d>>*<around|\||d*F<around|(|x,y|)>|\|>>>|<row|<cell|>|<cell|+<around*|(|<frac|t|2>|)><rsup|2-e-f>*<big|int><rsub|D<rsub|4><rsup|\<ast\>>><big|int><frac|1|<around|\||x|\|><rsup|e><around|\||y|\|><rsup|f>>*<around|\||d*F<around|(|x,y|)>|\|>>>|<row|<cell|>|<cell|+<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||d*F<around|(|x,y|)>|\|>>>>>>
    </equation>

    Now we can easily see

    <\equation>
      <label|eq:43><around*|\||<big|int><rsub|0><rsup|t><big|int><rsub|0><rsup|t>r<around|(|u+\<tau\>,v+\<tau\>|)>*d*u*d*v|\|>\<leq\>t<rsup|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||d*F<around|(|x,y|)>|\|>.
    </equation>

    Hence, taking <math|u=2/t> in <eqref|eq:19>, <eqref|eq:20>, and
    <eqref|eq:21>, we have, for large <math|t>,

    <\equation>
      <label|eq:44>h<around|(|t,\<tau\>|)>\<leq\>C<frac|t<rsup|2>|log<rsup|3+\<delta\>>
      t>
    </equation>

    for some constant <math|C\<gtr\>0>, which completes the proof.
  </proof>

  Here we shall give the conditions for the strong law of large numbers for
  <math|X<around|(|t|)>> in the following theorem.

  <\theorem>
    <label|thm:1>Suppose that the spectral distribution function
    <math|F<around|(|x,y|)>> of a process <math|X<around|(|t|)>> satisfies
    the following conditions: for <math|\<delta\>\<gtr\>0>,

    <\equation>
      <label|eq:45><big|int><rsub|<around|\||x|\|>\<leq\>u><big|int><rsub|<around|\||y|\|>\<leq\>u><around|\||d*F<around|(|x,y|)>|\|>=O<around*|(|<frac|1|<around|\||log
      u|\|><rsup|3+\<delta\>>>|)>
    </equation>

    <\equation>
      <label|eq:46><big|int><rsub|<around|\||x|\|>\<leq\>u><big|int><rsub|<around|\||y|\|>\<gtr\>u><frac|1|<around|\||y|\|>>*<around|\||d*F<around|(|x,y|)>|\|>=O<around*|(|<frac|1|u<around|\||log
      u|\|><rsup|3+\<delta\>>>|)>
    </equation>

    and

    <\equation>
      <label|eq:47><big|int><rsub|<around|\||x|\|>\<gtr\>u><big|int><rsub|<around|\||y|\|>\<gtr\>u><frac|1|<around|\||x*y|\|>>*<around|\||d*F<around|(|x,y|)>|\|>=O<around*|(|<frac|1|u<rsup|2><around|\||log
      u|\|><rsup|3+\<delta\>>>|)>
    </equation>

    for small <math|u\<gtr\>0>. Then

    <\equation>
      <label|eq:48>lim<rsub|T\<rightarrow\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|t|)>*d*t=0
    </equation>

    with probability one.
  </theorem>

  <\proof>
    To prove the theorem we use the method of Verbitskaya (1964). We shall
    prove only that <math|<frac|1|T>*<big|int><rsub|0><rsup|T>X<around|(|t|)>*d*t\<rightarrow\>0>,
    since <math|<frac|1|T>*<big|int><rsub|-T><rsup|0>X<around|(|t|)>*d*t\<rightarrow\>0>
    can be proved in the same manner. Let

    <\equation>
      <label|eq:49>S<around|(|T|)>=<big|int><rsub|0><rsup|T>X<around|(|t|)>*d*t,T\<geq\>1
    </equation>

    For any given <math|T>, there exists a positive integer <math|n> such
    that <math|n\<leq\>T\<leq\>n+1>. Then, we have

    <\equation>
      <label|eq:50><around*|\||<frac|1|T>*<big|int><rsub|0><rsup|T>X<around|(|t|)>*d*t|\|>\<leq\><around*|\||<frac|1|n>*<big|int><rsub|0><rsup|n>X<around|(|t|)>*d*t|\|>+<frac|1|n>*<big|int><rsub|n><rsup|n+1><around|\||X<around|(|t|)>|\|>*d*t
    </equation>

    The second term of the right hand side approaches zero with probability
    one when <math|n> tends to infinity, because

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|sum><rsub|n>E*<around*|(|<frac|1|n>*<big|int><rsub|n><rsup|n+1><around|\||X<around|(|t|)>|\|>*d*t|)><rsup|2>>|<cell|\<leq\><big|sum><rsub|n><frac|1|n<rsup|2>>*E*<big|int><rsub|n><rsup|n+1><around|\||X<around|(|t|)>|\|><rsup|2>*d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|n><frac|1|n<rsup|2>>*E*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||d*F<around|(|x,y|)>|\|>\<less\>\<infty\>>>>>>
    </equation>

    Hence, it suffices to show that

    <\equation>
      <label|eq:52>lim<rsub|n\<rightarrow\>\<infty\>>
      <frac|S<around|(|n|)>|n>=0
    </equation>

    with probability one.

    Now any positive integer <math|n> can be uniquely represented in the form

    <\equation>
      <label|eq:53>n=2<rsup|k<rsub|1>>+2<rsup|k<rsub|2>>+2<rsup|k<rsub|3>>+\<cdots\>+2<rsup|k<rsub|s>>,k<rsub|1>\<gtr\>k<rsub|2>\<gtr\>k<rsub|3>*\<cdots\>\<gtr\>k<rsub|s>\<geq\>0,
    </equation>

    <math|k<rsub|i>>'s being integers. Then we can write

    <\equation>
      <label|eq:54><tabular|<tformat|<table|<row|<cell|<around|\||S<around|(|n|)>|\|>\<leq\><around|\||S<around|(|2<rsup|k<rsub|1>>|)>|\|>+<around|\||S*<around|(|2<rsup|k<rsub|1>>+2<rsup|k<rsub|2>>|)>-S<around|(|2<rsup|k<rsub|1>>|)>|\|>>>|<row|<cell|+\<cdots\>+\|S*<around|(|2<rsup|k<rsub|1>>+<around|(|2<rsup|k<rsub|2>-k<rsub|s>>+2<rsup|k<rsub|3>-k<rsub|s>>+\<cdots\>+2<rsup|k<rsub|s-1>-k<rsub|s>>+1|)>*2<rsup|k<rsub|s>>|)>>>|<row|<cell|-S*<around|{|2<rsup|k<rsub|1>>+<around|(|2<rsup|k<rsub|2>-k<rsub|s>>+\<cdots\>+2<rsup|k<rsub|s-1>-k<rsub|s>>|)>*2<rsup|k<rsub|s>>|}>\|>>>>>
    </equation>

    Using this relation, we have only to show that the series, for any
    <math|\<varepsilon\>\<gtr\>0> fixed,

    <\equation>
      <label|eq:55><big|sum><rsub|k=1><rsup|\<infty\>>P*<around*|{|<around*|\||<frac|1|2<rsup|k>>*S<around|(|2<rsup|k>|)>|\|>\<geq\><frac|\<varepsilon\>|k+1>|}>
    </equation>

    <\equation>
      <label|eq:56><big|sum><rsub|k=1><rsup|\<infty\>><big|sum><rsub|p=0><rsup|k-1><big|sum><rsub|q=0><rsup|2<rsup|k-p-1>>P*<around*|{|<around*|\||<frac|1|2<rsup|k>>*<around|(|S*<around|(|2<rsup|k>+<around|(|q+1|)>*2<rsup|p>|)>-S*<around|(|2<rsup|k>+q*2<rsup|p>|)>|)>|\|>\<geq\><frac|\<varepsilon\>|k+1>|}>
    </equation>

    are convergent (Verbitskaya 1964). But by the Tchebychev's inequality, we
    have

    <\equation>
      <label|eq:57><big|sum><rsub|k=1><rsup|\<infty\>>P*<around*|{|<around*|\||<frac|S<around|(|2<rsup|k>|)>|2<rsup|k>>|\|>\<geq\><frac|\<varepsilon\>|k+1>|}>\<leq\><frac|1|\<varepsilon\><rsup|2>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|k+1|)><rsup|2>|2<rsup|2*k>>*<big|int><rsub|0><rsup|2<rsup|k>><big|int><rsub|0><rsup|2<rsup|k>>r<around|(|u,v|)>*d*u*d*v
    </equation>

    which is

    <\equation>
      <label|eq:58>\<leq\><frac|1|\<varepsilon\><rsup|2>>*<big|sum><rsub|k=1><rsup|\<infty\>><frac|<around|(|k+1|)><rsup|2>|2<rsup|2*k>>*h<around|(|2<rsup|k>,0|)>\<leq\><frac|C|\<varepsilon\><rsup|2>>*<big|int><rsub|1><rsup|\<infty\>><frac|log<rsup|2>
      x|x<rsup|3>>*h<around|(|x,0|)>*d*x
    </equation>

    where <math|h<around|(|x,\<tau\>|)>> is the one in <eqref|eq:26> and
    <math|C> is a positive constant. Here the last term converges by virtue
    of Lemma <reference|lem:1>. For <eqref|eq:56> we have, again using the
    Tchebychev's inequality,

    <\equation>
      <label|eq:59>

      <\eqsplit>
        <tformat|<table|<row|<cell|<big|sum><rsub|k=1><rsup|\<infty\>><big|sum><rsub|p=0><rsup|k-1><big|sum><rsub|q=0><rsup|2<rsup|k-p-1>>P*<around*|{|<around*|\||<frac|1|2<rsup|k>>*<around|(|S*<around|(|2<rsup|k>+<around|(|q+1|)>*2<rsup|p>|)>-S*<around|(|2<rsup|k>+q*2<rsup|p>|)>|)>|\|>\<geq\><frac|\<varepsilon\>|k+1>|}>>>|<row|<cell|\<leq\><frac|1|\<varepsilon\><rsup|2>>*<big|sum><rsub|k=1><rsup|\<infty\>><big|sum><rsub|p=0><rsup|k-1><big|sum><rsub|q=0><rsup|2<rsup|k-p-1>><frac|<around|(|k+1|)><rsup|2>|2<rsup|2*k>><around*|\||<big|int><rsub|0><rsup|2<rsup|p>><big|int><rsub|0><rsup|2<rsup|p>>r<around|(|2<rsup|k>+q*2<rsup|p>+u,2<rsup|k>+q*2<rsup|p>+v|)>*d*u*d*v|\|>>>>>
      </eqsplit>
    </equation>

    which is

    <\equation>
      <label|eq:60>\<leq\><frac|C|\<varepsilon\><rsup|2>>*<big|sum><rsub|k=1><rsup|\<infty\>><big|sum><rsub|p=0><rsup|k-1><frac|<around|(|k+1|)><rsup|2>|2<rsup|k+p>>*h<around|(|2<rsup|p>,\<tau\><rsub|0>|)>
    </equation>

    where <math|\<tau\><rsub|0>> is such that

    <\equation>
      <label|eq:61>h<around|(|2<rsup|p>,\<tau\><rsub|0>|)>=max<rsub|0\<leq\>q\<leq\>2<rsup|k-p>-1><around|{|<around|\||h<around|(|2<rsup|p>,2<rsup|k>+q*2<rsup|p>|)>|\|>|}>
    </equation>

    which is

    <\equation>
      <label|eq:62>\<leq\><frac|C|\<varepsilon\><rsup|2>>*<big|sum><rsub|k=1><rsup|\<infty\>><frac|<around|(|k+1|)><rsup|2>|2<rsup|2*k>>*h<around|(|2<rsup|k>,\<tau\><rsub|0>|)>\<leq\><frac|C|\<varepsilon\><rsup|2>>*<big|int><rsub|1><rsup|\<infty\>><frac|log<rsup|2>
      x|x<rsup|3>>*h<around|(|x,\<tau\><rsub|0>|)>*d*x
    </equation>

    for some constant <math|C> and the last term is finite because of Lemma
    <reference|lem:1>. We have now completed the proof.
  </proof>

  Each of the conditions <eqref|eq:45>\U<eqref|eq:47> can be replaced
  respectively by a little better one, each of <eqref|eq:19>\U<eqref|eq:21>.

  <\theorem>
    <label|thm:2>Suppose that the spectral distribution function
    <math|F<around|(|x,y|)>> satisfies the conditions
    <eqref|eq:19>\U<eqref|eq:21>. Then

    <\equation>
      <label|eq:63>lim<rsub|T\<rightarrow\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|t|)>*d*t=0
    </equation>

    with probability one.
  </theorem>

  The proof is carried out in just the same way as that of Theorem
  <reference|thm:1>. Let us now turn to the special case of a uniformly
  bounded process.

  <\theorem>
    <label|thm:3>Suppose that a constant <math|K> exists such that with
    probability one,

    <\equation>
      <label|eq:64><around|\||X<around|(|t|)>|\|>\<leq\>K
    </equation>

    holds for any <math|t>. If for <math|u\<rightarrow\>+0>,

    <\equation>
      <label|eq:65><big|int><rsub|<around|\||x|\|>\<leq\>u><big|int><rsub|<around|\||y|\|>\<leq\>u><around|\||d*F<around|(|x,y|)>|\|>=O<around*|(|<frac|1|<around|\||log
      u|\|><rsup|1+\<delta\>>>|)>
    </equation>

    <\equation>
      <label|eq:66><big|int><rsub|<around|\||x|\|>\<leq\>u><big|int><rsub|<around|\||y|\|>\<gtr\>u><frac|1|<around|\||y|\|>>*<around|\||d*F<around|(|x,y|)>|\|>=O<around*|(|<frac|1|u<around|\||log
      u|\|><rsup|1+\<delta\>>>|)>
    </equation>

    and

    <\equation>
      <label|eq:67><big|int><rsub|<around|\||x|\|>\<gtr\>u><big|int><rsub|<around|\||y|\|>\<gtr\>u><frac|1|<around|\||x*y|\|>>*<around|\||d*F<around|(|x,y|)>|\|>=O<around*|(|<frac|1|u<rsup|2><around|\||log
      u|\|><rsup|1+\<delta\>>>|)>
    </equation>

    for <math|\<delta\>\<gtr\>0>, then we have

    <\equation>
      <label|eq:68>lim<rsub|T\<rightarrow\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|t|)>*d*t=0
    </equation>

    with probability one.
  </theorem>

  <eqref|eq:65>\U<eqref|eq:67> can be replaced by a little better ones as in
  Theorem <reference|thm:2>.

  The idea of the following proof is due to Verbitskaya. Partition the
  infinite interval <math|<around|[|1,\<infty\>|)>> into subintervals
  <math|<around|[|2<rsup|n>,2<rsup|n+1>|]>,n=0,1,2,\<ldots\>> and let
  <math|\<varepsilon\>> be a small positive real number prescribed in an
  arbitrary manner. Choose an integral <math|l> such that
  <math|K/l\<less\>\<varepsilon\>/2>. Now partition each interval
  <math|<around|[|2<rsup|n>,2<rsup|n+1>|]>> into <math|l> equal parts. Number
  all the resulting division points according to the order of increasing
  magnitude. This yields a sequence <math|<around|{|T<rsub|n>|}>> of division
  points, <math|T<rsub|n>\<rightarrow\>\<infty\>> as
  <math|n\<rightarrow\>\<infty\>>.

  Now suppose <math|T> is arbitrarily large. Then for any <math|T\<gtr\>0>,
  an integer <math|n> exists for which <math|T<rsub|n>\<leq\>T\<leq\>T<rsub|n+1>>.
  Let the interval <math|<around|[|2<rsup|m>,2<rsup|m+1>|]>> contain both
  <math|T<rsub|n>> and <math|T<rsub|n+1>>. Then clearly
  <math|T<rsub|n+1>-T<rsub|n>=2<rsup|m>/l>. Thus, for any
  <math|\<varepsilon\>\<gtr\>0>, we have, by <eqref|eq:64>

  <\equation>
    <label|eq:69><frac|1|T<rsub|n>>*<big|int><rsub|T<rsub|n>><rsup|T<rsub|n+1>><around|\||X<around|(|t|)>|\|>*d*t\<less\><frac|\<varepsilon\>|2>
  </equation>

  Hence, we have only to show

  <\equation>
    <label|eq:70><big|sum><rsub|n=1><rsup|\<infty\>>P*<around*|{|<frac|1|T<rsub|n>><around*|\||<big|int><rsub|0><rsup|T<rsub|n>>X<around|(|t|)>*d*t|\|>\<geq\><frac|\<varepsilon\>|2>|}>\<less\>\<infty\>
  </equation>

  we can see that

  <\equation>
    <label|eq:71><with|font-base-size|9|<big|sum><rsub|n=1><rsup|\<infty\>>P*<around*|{|<frac|1|T<rsub|n>><around*|\||<big|int><rsub|0><rsup|T<rsub|n>>X<around|(|t|)>*d*t|\|>\<geq\><frac|\<varepsilon\>|2>|}>=<big|sum><rsub|j=0><rsup|l-1><big|sum><rsub|n=1><rsup|\<infty\>>P*<around*|{|<around*|\||<frac|1|2<rsup|n>+j*<frac|2<rsup|n>|l>>*<big|int><rsub|0><rsup|2<rsup|n>+j*<around|(|2<rsup|n>/l|)>>X<around|(|t|)>*d*t|\|>\<geq\><frac|\<varepsilon\>|2>|}>>
  </equation>

  and

  <\equation>
    <tabular|<tformat|<table|<row|<cell|P*<around*|{|<frac|1|2<rsup|n>+j*<frac|2<rsup|n>|l>><around*|\||<big|int><rsub|0><rsup|2<rsup|n>+j*<around|(|2<rsup|n>/l|)>>X<around|(|t|)>*d*t|\|>\<geq\><frac|\<varepsilon\>|2>|}>>>|<row|<cell|\<leq\><frac|2<rsup|2>|\<varepsilon\><rsup|2>*<around|(|2<rsup|n>+j*<frac|2<rsup|n>|l>|)><rsup|2>>*E<around*|\||<big|int><rsub|0><rsup|2<rsup|n>+j*<around|(|2<rsup|n>/l|)>>X<around|(|t|)>*d*t|\|><rsup|2>>>|<row|<cell|\<leq\><frac|<around|(|2<rsup|n>+j*<frac|2<rsup|n>|l>|)>*2<rsup|2>|\<varepsilon\><rsup|2>*<around|(|2<rsup|n>+j*<frac|2<rsup|n>|l>|)><rsup|3>>*h<around|(|2<rsup|n>+j*2<rsup|n>/l,0|)>>>|<row|<cell|\<leq\><frac|4|\<varepsilon\><rsup|2>>*<big|int><rsub|2<rsup|n>+j*<around|(|2<rsup|n>/l|)>><rsup|2<rsup|n+1>+j*<around|(|2<rsup|n+1>/l|)>><frac|1|x<rsup|3>>*h<around|(|x,0|)>*d*x>>>>><label|eq:72>
  </equation>

  Therefore, the <eqref|eq:70> holds if

  <\equation>
    <label|eq:73><big|int><rsub|1><rsup|\<infty\>><frac|1|t<rsup|3>>*h<around|(|t,0|)>*d*t\<less\>\<infty\>
  </equation>

  and this is easily seen to be implied by <eqref|eq:65>\U<eqref|eq:67>,
  which completes the proof.

  Finally we give some remarks. Although our theorem is not really a
  generalization of Loève's theorem, the following consideration will tell us
  some connection between them.

  For any harmonizable process

  <\equation>
    <label|eq:74><around|\||r<around|(|t,t|)>|\|>\<leq\><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||d*F<around|(|x,y|)>|\|>,-\<infty\>\<less\>t\<less\>\<infty\>,
  </equation>

  holds and the conditions <eqref|eq:19>\U<eqref|eq:21> imply, by
  <eqref|eq:28>,

  <\equation>
    <label|eq:75><big|int><rsub|0><rsup|t><big|int><rsub|0><rsup|t>r<around|(|u,v|)>*d*u*d*v=O<around*|(|<frac|t<rsup|2>|log<rsup|3+\<delta\>>
    t>|)>
  </equation>

  which is a condition weaker than <eqref|eq:11>. Furthermore, if the right
  hand sides of <eqref|eq:19>\U<eqref|eq:21> are replaced by the respective
  weaker conditions <math|O<around*|(|<frac|1|u<rsup|a+b><around|\||log
  u|\|><rsup|1+\<delta\>>>|)>,O<around*|(|<frac|1|u<rsup|c+d><around|\||log
  u|\|><rsup|1+\<delta\>>>|)>> and <math|O<around*|(|<frac|1|u<rsup|e+f><around|\||log
  u|\|><rsup|1+\<delta\>>>|)>>, then

  <\equation>
    <label|eq:76><big|int><rsub|0><rsup|t><big|int><rsub|0><rsup|t>r<around|(|u,v|)>*d*u*d*v=O<around*|(|<frac|t<rsup|2>|log<rsup|1+\<delta\>>
    t>|)>
  </equation>

  holds and hence

  <\equation>
    <label|eq:77><big|int><rsub|1><rsup|\<infty\>><frac|d*t|t<rsup|3>>*<big|int><rsub|0><rsup|t><big|int><rsub|0><rsup|t>r<around|(|u,v|)>*d*u*d*v\<less\>\<infty\>
  </equation>

  holds. The condition <eqref|eq:77> is obviously weaker than <eqref|eq:11>.

  <section*|Acknowledgement>

  The author would like to express his thanks to Professor Tatsuo Kawata of
  Keio University for his constant encouragement and many helpful
  suggestions.

  <\thebibliography|99>
    <bibitem|blanc-fortet>Blanc-Lappierre, A., and Fortet, R. (1953): Theorie
    des function aleatoires, Libraires de L'Academie de Medecine, Paris.

    <bibitem|cramer-leadbetter>Cramér, H., and Leadbetter, M. R. (1967):
    Stationary and related stochastic processes, Wiley, New York.

    <bibitem|kawata>Kawata, T. (1972): On a class of linear processes, Read
    at the Second Japan-USSR Symposium (Kyoto), to appear.

    <bibitem|loeve>Loève, M. (1948): Fonctions aleatoires du second ordre,
    appendix to P. Levy, Processus stochastiques et movemont brownien,
    Gauthier Villars, Paris.

    <bibitem|verbitskaya>Verbitskaya, I. N. (1964): On conditions for the
    strong law of large numbers to be applicable to second order stationary
    processes, Theoriya Veroyatonostei i ee Primeneniya <math|9> pp. 325-331.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|4>>
    <associate|auto-3|<tuple|77|11>>
    <associate|auto-4|<tuple|77|11>>
    <associate|bib-blanc-fortet|<tuple|blanc-fortet|11>>
    <associate|bib-cramer-leadbetter|<tuple|cramer-leadbetter|11>>
    <associate|bib-kawata|<tuple|kawata|11>>
    <associate|bib-loeve|<tuple|loeve|11>>
    <associate|bib-verbitskaya|<tuple|verbitskaya|11>>
    <associate|eq:1|<tuple|1|1>>
    <associate|eq:10|<tuple|10|2>>
    <associate|eq:11|<tuple|11|2>>
    <associate|eq:12|<tuple|12|2>>
    <associate|eq:13|<tuple|13|3>>
    <associate|eq:14|<tuple|14|3>>
    <associate|eq:15|<tuple|15|3>>
    <associate|eq:16|<tuple|16|3>>
    <associate|eq:17|<tuple|17|3>>
    <associate|eq:18|<tuple|18|3>>
    <associate|eq:19|<tuple|19|4>>
    <associate|eq:2|<tuple|2|1>>
    <associate|eq:20|<tuple|20|4>>
    <associate|eq:21|<tuple|21|4>>
    <associate|eq:22|<tuple|22|4>>
    <associate|eq:23|<tuple|23|4>>
    <associate|eq:24|<tuple|24|4>>
    <associate|eq:25|<tuple|25|4>>
    <associate|eq:26|<tuple|26|4>>
    <associate|eq:27|<tuple|27|4>>
    <associate|eq:28|<tuple|28|5>>
    <associate|eq:29|<tuple|29|5>>
    <associate|eq:3|<tuple|3|1>>
    <associate|eq:30|<tuple|30|5>>
    <associate|eq:31|<tuple|31|5>>
    <associate|eq:32|<tuple|32|5>>
    <associate|eq:33|<tuple|33|5>>
    <associate|eq:34|<tuple|34|5>>
    <associate|eq:35|<tuple|35|5>>
    <associate|eq:36|<tuple|36|5>>
    <associate|eq:37|<tuple|37|5>>
    <associate|eq:38|<tuple|38|5>>
    <associate|eq:39|<tuple|39|5>>
    <associate|eq:4|<tuple|4|1>>
    <associate|eq:40|<tuple|40|5>>
    <associate|eq:41|<tuple|41|5>>
    <associate|eq:42|<tuple|42|6>>
    <associate|eq:43|<tuple|43|6>>
    <associate|eq:44|<tuple|44|6>>
    <associate|eq:45|<tuple|45|6>>
    <associate|eq:46|<tuple|46|6>>
    <associate|eq:47|<tuple|47|6>>
    <associate|eq:48|<tuple|48|6>>
    <associate|eq:49|<tuple|49|7>>
    <associate|eq:5|<tuple|5|1>>
    <associate|eq:50|<tuple|50|7>>
    <associate|eq:52|<tuple|52|7>>
    <associate|eq:53|<tuple|53|7>>
    <associate|eq:54|<tuple|54|7>>
    <associate|eq:55|<tuple|55|7>>
    <associate|eq:56|<tuple|56|7>>
    <associate|eq:57|<tuple|57|7>>
    <associate|eq:58|<tuple|58|8>>
    <associate|eq:59|<tuple|59|8>>
    <associate|eq:6|<tuple|6|2>>
    <associate|eq:60|<tuple|60|8>>
    <associate|eq:61|<tuple|61|8>>
    <associate|eq:62|<tuple|62|8>>
    <associate|eq:63|<tuple|63|8>>
    <associate|eq:64|<tuple|64|9>>
    <associate|eq:65|<tuple|65|9>>
    <associate|eq:66|<tuple|66|9>>
    <associate|eq:67|<tuple|67|9>>
    <associate|eq:68|<tuple|68|9>>
    <associate|eq:69|<tuple|69|9>>
    <associate|eq:7|<tuple|7|2>>
    <associate|eq:70|<tuple|70|9>>
    <associate|eq:71|<tuple|71|10>>
    <associate|eq:72|<tuple|72|10>>
    <associate|eq:73|<tuple|73|10>>
    <associate|eq:74|<tuple|74|10>>
    <associate|eq:75|<tuple|75|10>>
    <associate|eq:76|<tuple|76|10>>
    <associate|eq:77|<tuple|77|11>>
    <associate|eq:8|<tuple|8|2>>
    <associate|eq:9|<tuple|9|2>>
    <associate|lem:1|<tuple|4|4>>
    <associate|thm:1|<tuple|5|6>>
    <associate|thm:2|<tuple|6|8>>
    <associate|thm:3|<tuple|7|9>>
    <associate|thm:A|<tuple|1|2>>
    <associate|thm:B|<tuple|2|3>>
    <associate|thm:C|<tuple|3|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgement>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>