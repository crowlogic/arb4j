<TeXmacs|2.1.4>

<style|generic>

<\body>
  <section|Stationary Dilations>

  <\definition>
    Let <math|<around|(|\<Omega\>,\<cal-F\>,P|)>> and
    <math|<around|(|<wide|\<Omega\>|~>,<wide|\<cal-F\>|~>,<wide|P|~>|)>> be
    probability spaces. We say that <math|<around|(|\<Omega\>,\<cal-F\>,P|)>>
    is a factor of <math|<around|(|<wide|\<Omega\>|~>,<wide|\<cal-F\>|~>,<wide|P|~>|)>>
    if there exists a measurable surjective map
    <math|\<phi\>:<wide|\<Omega\>|~>\<to\>\<Omega\>> such that:

    <\enumerate>
      <item>For all <math|A\<in\>\<cal-F\>>,
      <math|\<phi\><rsup|-1><around|(|A|)>\<in\><wide|\<cal-F\>|~>>

      <item>For all <math|A\<in\>\<cal-F\>>,
      <math|P<around|(|A|)>=<wide|P|~><around|(|\<phi\><rsup|-1><around|(|A|)>|)>>
    </enumerate>

    In other words, <math|<around|(|\<Omega\>,\<cal-F\>,P|)>> can be obtained
    from <math|<around|(|<wide|\<Omega\>|~>,<wide|\<cal-F\>|~>,<wide|P|~>|)>>
    by projecting the larger space onto the smaller one while preserving the
    probability measure structure.
  </definition>

  <\remark>
    In the context of stationary dilations, this means that the original
    nonstationary process <math|<around|{|X<rsub|t>|}>> can be recovered from
    the stationary dilation <math|<around|{|Y<rsub|t>|}>> through a
    measurable projection that preserves the probabilistic structure of the
    original process.
  </remark>

  <\definition>
    <dueto|Stationary Dilation>Let <math|<around|(|\<Omega\>,\<cal-F\>,P|)>>
    be a probability space and let <math|<around|{|X<rsub|t>|}><rsub|t\<in\>\<bbb-R\><rsub|+>>>
    be a nonstationary stochastic process. A stationary dilation of
    <math|<around|{|X<rsub|t>|}>> is a stationary process
    <math|<around|{|Y<rsub|t>|}><rsub|t\<in\>\<bbb-R\><rsub|+>>> defined on a
    larger probability space <math|<around|(|<wide|\<Omega\>|~>,<wide|\<cal-F\>|~>,<wide|P|~>|)>>
    such that:

    <\enumerate>
      <item><math|<around|(|\<Omega\>,\<cal-F\>,P|)>> is a factor of
      <math|<around|(|<wide|\<Omega\>|~>,<wide|\<cal-F\>|~>,<wide|P|~>|)>>

      <item>There exists a measurable projection operator <math|\<Pi\>> such
      that:

      <\equation>
        X<rsub|t>=\<Pi\>*Y<rsub|t><space|1em>\<forall\>t\<in\>\<bbb-R\><rsub|+>
      </equation>
    </enumerate>
  </definition>

  <\theorem>
    <dueto|Representation of Nonstationary Processes>For a continuous-time
    nonstationary process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>\<bbb-R\><rsub|+>>>,
    its stationary dilation exists which has sample paths
    <math|t\<mapsto\>X<rsub|t><around|(|\<omega\>|)>> which are continuous
    with probability one when <math|X<rsub|t>>:

    <\itemize>
      <item>is uniformly continuous in probability over compact intervals:

      <\equation>
        lim<rsub|s\<to\>t> P*<around|(|<around|\||X<rsub|s>-X<rsub|t>|\|>\<gtr\>\<epsilon\>|)>=0<space|1em>\<forall\>\<epsilon\>\<gtr\>0,t\<in\><around|[|0,T|]>,T\<gtr\>0
      </equation>

      <item>has finite second moments:

      <\equation>
        \<bbb-E\><around|[|<around|\||X<rsub|t>|\|><rsup|2>|]>\<less\>\<infty\><space|1em>\<forall\>t\<in\>\<bbb-R\><rsub|+>
      </equation>

      <item>has an integral representation of the form:

      <\equation>
        X<rsub|t>=<big|int><rsub|0><rsup|t>\<eta\><around|(|s|)>*d*s
      </equation>

      where <math|\<eta\><around|(|t|)>> is a measurable random function that
      is stationary in the wide sense (with
      <math|<big|int><rsub|0><rsup|t>\<bbb-E\><around|[|<around|\||\<eta\><around|(|s|)>|\|><rsup|2>|]>*<space|0.17em>d*s\<less\>\<infty\>>
      for all <math|t>)

      <item>and has a covariance operator

      <\equation>
        R<around|(|t,s|)>=\<bbb-E\>*<around|[|X<rsub|t>*X<rsub|s>|]>
      </equation>

      which is symmetric <math|<around|(|R<around|(|t,s|)>=R<around|(|s,t|)>|)>>,
      positive definite and continuous
    </itemize>

    Under these conditions, there exists a representation:

    <\equation>
      X<rsub|t>=M<around|(|t|)>\<cdot\>S<rsub|t>
    </equation>

    where:

    <\itemize>
      <item><math|M<around|(|t|)>> is a continuous deterministic modulation
      function

      <item><math|<around|{|S<rsub|t>|}><rsub|t\<in\>\<bbb-R\><rsub|+>>> is a
      stationary process
    </itemize>

    This representation can be obtained through the stationary dilation by
    choosing:

    <\equation>
      Y<rsub|t>=<around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|M<around|(|t|)>>>|<row|<cell|S<rsub|t>>>>>>|)>
    </equation>

    with the projection operator <math|\<Pi\>> defined as:

    <\equation>
      \<Pi\>*Y<rsub|t>=M<around|(|t|)>\<cdot\>S<rsub|t>
    </equation>
  </theorem>

  <\proposition>
    <dueto|Properties of Dilation>The stationary dilation satisfies:

    <\enumerate>
      <item>Preservation of moments:

      <\equation>
        \<bbb-E\><around|[|<around|\||X<rsub|t>|\|><rsup|p>|]>\<leq\>\<bbb-E\><around|[|<around|\||Y<rsub|t>|\|><rsup|p>|]><space|1em>\<forall\>p\<geq\>1
      </equation>

      <item>Minimal extension: Among all stationary processes that dilate
      <math|X<rsub|t>>, there exists a minimal one (unique up to isomorphism)
      in terms of the probability space dimension
    </enumerate>
  </proposition>

  <\corollary>
    For any nonstationary process satisfying the above conditions, the
    stationary dilation provides a canonical factorization into deterministic
    time-varying components and stationary stochastic components.
  </corollary>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_60.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Stationary
      Dilations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>