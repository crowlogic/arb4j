<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <doc-data|<doc-title|The Eigenfunctions of Stationary and Oscillatory
  Processes on the Real Line>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\definition>
    <dueto|Stationary Process>A stochastic process
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> is stationary when
    <math|R<around|(|s,t|)>=R*<around|(|t-s|)>> for all
    <math|s,t\<in\>\<bbb-R\>>.
  </definition>

  <\definition>
    <dueto|Oscillatory Process (Priestley)>A process
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> admits the
    evolutionary spectral representation

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation*>

    where <math|A<around|(|t,\<omega\>|)>> is a gain function and
    <math|Z<around|(|\<omega\>|)>> is an orthogonal increment process.
  </definition>

  <\theorem>
    <dueto|Eigenfunction Property for Stationary Processes>Let
    <math|R<around|(|\<tau\>|)>> be a stationary covariance function. Define

    <\equation*>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*f<around|(|s|)>*d*s.
    </equation*>

    For any <math|\<omega\>\<in\>\<bbb-R\>>,

    <\equation*>
      K*e<rsup|i*\<omega\>*t>=S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>,<space|2em>S<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>.
    </equation*>
  </theorem>

  <\proof>
    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|<around|(|K*f|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*e<rsup|i*\<omega\>*s>*d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|i*\<omega\>*<around|(|t-\<tau\>|)>>*d*\<tau\>>>|<row|<cell|>|<cell|=e<rsup|i*\<omega\>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>.>>|<row|<cell|>|<cell|>>>>
      </aligned>
    </equation*>
  </proof>

  <\theorem>
    <dueto|Eigenfunction Property for Oscillatory Processes>Let

    <\equation*>
      C<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|s,\<omega\>|)>*A<rsup|\<ast\>><around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>
    </equation*>

    and

    <\equation*>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*f<around|(|s|)>*d*s.
    </equation*>

    Then for any <math|\<omega\>>,

    <\equation*>
      \<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation*>

    is an eigenfunction of <math|K> with eigenvalue
    <math|d*F<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|K*\<phi\><around|(|\<cdummy\>,\<omega\>|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*\<phi\><around|(|s,\<omega\>|)>*d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*d*F<around|(|\<lambda\>|)>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s|]>*d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=A<around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>=\<phi\><around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>.>>|<row|<cell|>|<cell|>>>>
      </aligned>
    </equation*>
  </proof>

  <\theorem>
    <dueto|Reality and Conjugate Symmetry><math|X<around|(|t|)>> is
    real-valued if and only if <math|A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>>
    and <math|d*Z*<around|(|-\<omega\>|)>=d*Z<rsup|\<ast\>><around|(|\<omega\>|)>>
    for all <math|t,\<omega\>>. Also, <math|\<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)>=\<phi\><around|(|t,-\<omega\>|)>>.
  </theorem>

  <\proof>
    By definition,

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation*>

    and

    <\equation*>
      X<rsup|\<ast\>><around|(|t|)>=<around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>|)><rsup|\<ast\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>.
    </equation*>

    Substitute <math|\<nu\>=-\<omega\>> so <math|\<omega\>=-\<nu\>> and
    <math|d*\<omega\>=-d*\<nu\>>:

    <\equation*>
      X<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|+\<infty\>><rsup|-\<infty\>>A<rsup|\<ast\>><around|(|t,-\<nu\>|)>*e<rsup|i*\<nu\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<nu\>|)>*<around|(|-d*\<nu\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,-\<nu\>|)>*e<rsup|i*\<nu\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<nu\>|)>*d*\<nu\>
    </equation*>

    Rename dummy variable <math|\<nu\>\<mapsto\>\<omega\>>:

    <\equation*>
      X<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,-\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)>
    </equation*>

    For real-valued <math|X<around|(|t|)>>, require
    <math|X<rsup|\<ast\>><around|(|t|)>=X<around|(|t|)>> for all <math|t>.
    Uniqueness of the spectral representation forces

    <\equation*>
      A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>,<space|2em>d*Z*<around|(|-\<omega\>|)>=d*Z<rsup|\<ast\>><around|(|\<omega\>|)>.
    </equation*>

    For the eigenfunction conjugate pairs:

    <\equation*>
      \<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)>=<around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>|]><rsup|\<ast\>>=A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>=A<around|(|t,-\<omega\>|)>*e<rsup|-i*\<omega\>*t>=A<around|(|t,-\<omega\>|)>*e<rsup|i*<around|(|-\<omega\>|)>*t>=\<phi\><around|(|t,-\<omega\>|)>.
    </equation*>
  </proof>

  <\theorem>
    <dueto|Filter Kernel: Dual Fourier Formula>

    <\equation*>
      h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*d*\<omega\>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*u>*d*\<omega\>
    </equation*>
  </theorem>

  <\proof>
    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*u>*d*\<omega\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>|]>*e<rsup|-i*\<omega\>*u>*d*\<omega\>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*d*\<omega\>>>>>
      </aligned>
    </equation*>
  </proof>

  <\theorem>
    <dueto|Inverse Relations>

    <\equation*>
      A<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u,<space|2em>\<phi\><around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*u>*d*u
    </equation*>
  </theorem>

  <\proof>
    Start from

    <\equation*>
      h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*<around|(|t-u|)>>*d*\<lambda\>,
    </equation*>

    then multiply both sides by <math|e<rsup|-i*\<omega\>*<around|(|t-u|)>>>
    and integrate over <math|u>:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*<around|(|t-u|)>>*d*\<lambda\>|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u
    </equation*>

    <\equation*>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<lambda\>-\<omega\>|)>*<around|(|t-u|)>>*d*u|)>*d*\<lambda\>
    </equation*>

    <\equation*>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>\<cdot\>2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*\<lambda\>=A<around|(|t,\<omega\>|)>
    </equation*>

    The result for <math|\<phi\><around|(|t,\<omega\>|)>> follows similarly
    using the inverse Fourier transform in <math|u>.
  </proof>

  <\theorem>
    <dueto|Filter Representation of Nonstationary Process>If
    <math|X<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*d*Z<around|(|\<omega\>|)>>,
    then

    <\equation*>
      Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u
    </equation*>

    where <math|h<around|(|t,u|)>> is as above.
  </theorem>

  <\proof>
    Substitute the spectral representation for <math|X<around|(|u|)>>:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*d*Z<around|(|\<omega\>|)>|)>*d*u=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|i*\<omega\>*u>*d*u|)>*d*Z<around|(|\<omega\>|)>
    </equation*>

    Now substitute the kernel expression:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|i*\<omega\>*u>*d*u=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|t-u|)>>*e<rsup|i*\<omega\>*u>*d*u|)>*d*\<lambda\>
    </equation*>

    <\equation*>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\>-\<lambda\>|)>*u>*d*u|)>*d*\<lambda\>
    </equation*>

    <\equation*>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<lambda\>|)>*d*\<lambda\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*\<delta\>*<around|(|\<omega\>-\<lambda\>|)>*d*\<lambda\>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation*>

    Therefore,

    <\equation*>
      Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation*>
  </proof>
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
    <associate|auto-1|<tuple|?|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|3|?>>
    <associate|auto-4|<tuple|5|?>>
    <associate|auto-5|<tuple|7|?>>
  </collection>
</references>