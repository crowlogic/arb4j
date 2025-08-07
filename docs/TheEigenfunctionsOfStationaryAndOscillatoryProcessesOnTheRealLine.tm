<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Oscillatory Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\definition>
    <dueto|Stationary Process>A stochastic process
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> is stationary when
    <math|R<around|(|s,t|)>=R*<around|(|t-s|)>> for all
    <math|s,t\<in\>\<bbb-R\>>.
  </definition>

  <\theorem>
    <dueto|Filter Representation of Nonstationary Process>Oscillatory
    processes <math|Z<around*|(|t|)>> satisfy\ 

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<Phi\><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u
    </equation>

    where <math|A<rsub|t><around|(|\<omega\>|)>> is a gain function
    satisfying\ 

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>
    </equation>

    and <math|\<Phi\><around|(|\<omega\>|)>> is an orthogonal increment
    process.

    <\equation>
      X<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*d*\<Phi\><around|(|\<omega\>|)>
    </equation>
  </theorem>

  <\proof>
    \;

    <\equation>
      <tabular|<tformat|<table|<row|<cell|Z<around*|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*d*\<Phi\><around|(|\<omega\>|)>d*u>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|i*\<omega\>*u>*d*u*d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*<around|(|t-u|)>>*d*\<lambda\>*<space|0.27em>e<rsup|i*\<omega\>*u>*d*u*d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|t-u|)>>*e<rsup|i*\<omega\>*u>*d*u
      d*\<lambda\>*d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\>-\<lambda\>|)>*u>*d*u*d*\<lambda\>*d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<lambda\>|)>*d*\<lambda\>**d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<Phi\><around|(|\<omega\>|)>>>>>>
    </equation>

    where the interchanges are justified by quadratic integrability of the
    time-dependent gain functions <math|A<rsub|t><around*|(|\<lambda\>|)>>
    with respect to the spectral measure <math|S<around*|(|\<lambda\>|)>=d
    F<around*|(|\<lambda\>|)>\<forall\>t\<in\>\<bbb-R\>>
  </proof>

  <\theorem>
    <dueto|Eigenfunction Property for Stationary Processes>Let
    <math|R<around|(|\<tau\>|)>> be a stationary covariance function. Let the
    corresponding integral coariance operator be defined

    <\equation>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*f<around|(|s|)>*d*s
    </equation>

    then

    <\equation>
      K*e<rsup|i*\<omega\>*t>=S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation>

    where the eigenvalue is the correponding element of the spectral density

    <\equation>
      S<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
    </equation>
  </theorem>

  <\proof>
    \;

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|(|K*f|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*e<rsup|i*\<omega\>*s>*d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|i*\<omega\>*<around|(|t-\<tau\>|)>>*d*\<tau\>>>|<row|<cell|>|<cell|=e<rsup|i*\<omega\>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>>>|<row|<cell|>|<cell|=S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>>>>>
    </equation>

    \;
  </proof>

  <\theorem>
    <dueto|Eigenfunction Property for Oscillatory Processes>Let

    <\equation>
      C<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><around|(|\<omega\>|)>*A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*d*F<around|(|\<omega\>|)>
    </equation>

    and

    <\equation>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*f<around|(|s|)>*d*s
    </equation>

    then the oscillatory functions

    <\equation>
      \<phi\><around|(|t,\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation>

    are eigenfunction of <math|K> with eigenvalues
    <math|S<around*|(|\<lambda\>|)>=d*F<around|(|\<omega\>|)>\<forall\>\<omega\>>

    <\equation>
      <around*|(|K*\<phi\><around|(|\<cdummy\>,\<omega\>|)>|)><around|(|t|)>=\<phi\><rsub|t><around*|(|\<lambda\>|)>S<around*|(|\<lambda\>|)>
    </equation>
  </theorem>

  <\proof>
    \;

    <\equation>
      <tabular|<tformat|<table|<row|<cell|K*\<phi\><around|(|\<cdummy\>,\<omega\>|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*\<phi\><around|(|s,\<omega\>|)>*d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*A<rsub|s><rsup|\<ast\>><around|(|\<lambda\>|)>*d*F<around|(|\<lambda\>|)>|)>*A<rsub|s><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><rsup|\<ast\>><around|(|\<lambda\>|)>*A<rsub|s><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s|]>*d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=A<rsub|t><around|(|\<omega\>|)>*d*F<around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=\<phi\><around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>>>>>>
    </equation>

    \;
  </proof>

  <\lemma>
    <dueto|Orthogonality Property>

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><rsup|\<ast\>><around|(|\<lambda\>|)>*A<rsub|s><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>
    </equation*>
  </lemma>

  <\proof>
    The orthogonality of <math|\<Phi\><around|(|\<omega\>|)>> is

    <\equation*>
      \<bbb-E\>*<around|[|d*\<Phi\><around|(|\<lambda\>|)>*d*\<Phi\><rsup|\<ast\>><around|(|\<omega\>|)>|]>=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*F<around|(|\<lambda\>|)>.
    </equation*>

    The representation

    <\equation*>
      Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<Phi\><around|(|\<omega\>|)>
    </equation*>

    with this covariance property, forces the stated orthogonality among the
    time-varying modulating amplitudes.
  </proof>

  <\theorem>
    <dueto|Real-Valued Oscillatory Processes>The process
    <math|Z<around|(|t|)>> is real-valued if and only if

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>
    </equation>

    and

    <\equation>
      d*\<Phi\>*<around|(|-\<omega\>|)>=d*\<Phi\><rsup|\<ast\>><around|(|\<omega\>|)>
    </equation>
  </theorem>

  <\proof>
    Compute

    <\equation*>
      Z<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*\<Phi\><rsup|\<ast\>><around|(|\<omega\>|)>.
    </equation*>

    Set <math|\<omega\>=-\<nu\>>, so <math|d*\<omega\>=-d*\<nu\>>,

    <\equation*>
      Z<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|+\<infty\>><rsup|-\<infty\>>A<rsub|t><rsup|\<ast\>>*<around|(|-\<nu\>|)>*e<rsup|i*\<nu\>*t>*d*\<Phi\><rsup|\<ast\>>*<around|(|-\<nu\>|)>*<around|(|-d*\<nu\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<Phi\><rsup|\<ast\>>*<around|(|-\<omega\>|)>.
    </equation*>

    For <math|Z<around|(|t|)>> to be real-valued,

    <\equation*>
      Z<around|(|t|)>=Z<rsup|\<ast\>><around|(|t|)>
    </equation*>

    for all <math|t>, so it is necessary that for all <math|\<omega\>>,

    <\equation*>
      A<rsub|t><around|(|\<omega\>|)>=A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>,<space|2em>d*\<Phi\><around|(|\<omega\>|)>=d*\<Phi\><rsup|\<ast\>>*<around|(|-\<omega\>|)>.
    </equation*>

    If these hold, then

    <\equation*>
      Z<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<Phi\><rsup|\<ast\>>*<around|(|-\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<Phi\><around|(|\<omega\>|)>=Z<around|(|t|)>.
    </equation*>
  </proof>

  <\theorem>
    <dueto|Eigenfunction Conjugate Pairs><math|\<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)>=\<phi\><around|(|t,-\<omega\>|)>>.
  </theorem>

  <\proof>
    <\equation*>
      \<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)>=<around|[|A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>|]><rsup|\<ast\>>=A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*t>
    </equation*>

    By the conjugate symmetry property,

    <\equation*>
      A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*t>=A<rsub|t>*<around|(|-\<omega\>|)>*e<rsup|-i*\<omega\>*t>=A<rsub|t>*<around|(|-\<omega\>|)>*e<rsup|i*<around|(|-\<omega\>|)>*t>=\<phi\><around|(|t,-\<omega\>|)>
    </equation*>
  </proof>

  <\theorem>
    <dueto|Filter Kernel: Dual Fourier Formula>

    <\equation*>
      h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*d*\<omega\>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*u>*d*\<omega\>
    </equation*>
  </theorem>

  <\proof>
    <\equation*>
      <frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*u>*d*\<omega\>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>|]>*e<rsup|-i*\<omega\>*u>*d*\<omega\>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*d*\<omega\>
    </equation*>
  </proof>

  <\theorem>
    <dueto|Inverse Relations>

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u
    </equation>

    <\equation>
      \<phi\><around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*u>*d*u
    </equation>
  </theorem>

  <\proof>
    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*<around|(|t-u|)>>*d*\<lambda\>*<space|0.27em>e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u
    </equation*>

    <\equation*>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|t-u|)>>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u|]>*d*\<lambda\>
    </equation*>

    <\equation*>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*e<rsup|-i*\<omega\>*t><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*<around|(|\<lambda\>-\<omega\>|)>*u>*d*u|]>*d*\<lambda\>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*e<rsup|-i*\<omega\>*t>*2*\<pi\>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*\<lambda\>
    </equation*>

    <\equation*>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*e<rsup|-i*\<omega\>*t>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*\<lambda\>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*e<rsup|-i*\<omega\>*t>=A<rsub|t><around|(|\<omega\>|)>
    </equation*>

    The formula for <math|\<phi\><around|(|t,\<omega\>|)>> is found
    similarly.
  </proof>

  \;
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
    <associate|auto-1|<tuple|1|?|../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>