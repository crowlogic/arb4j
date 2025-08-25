<TeXmacs|2.1.4>

<style|<tuple|article|boring-white|framed-theorems>>

<\body>
  \;

  <new-theorem|theorem|Theorem>

  <\theorem>
    [Integral correlation length for the Bessel kernel] Let
    <math|\<rho\><around|(|t|)>=J<rsub|0>*<around|(|2*\<pi\>*t|)>> for
    <math|t\<in\>\<bbb-R\>>, where <math|J<rsub|0>> denotes the Bessel
    function of the first kind of order <math|0>. Then the correlation time
    of the corresponding stationary Gaussian process is

    <\equation>
      \<ell\><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<rho\><around|(|t|)>*<space|0.17em>d*t<space|0.27em>=<space|0.27em>2*<big|int><rsub|0><rsup|\<infty\>>\<rho\><around|(|t|)>*<space|0.17em>d*t=1
    </equation>

    Consequently, the corresponding characteristic frequency scale
    <math|f<rsub|c>\<assign\>1/\<ell\>> equals <math|1> (in cycles per unit
    of the time variable used in <math|\<rho\>>).
  </theorem>

  <\proof>
    By evenness of <math|J<rsub|0>>, one has

    <\equation>
      \<ell\><space|0.27em>=<space|0.27em>2*<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|2*\<pi\>*t|)>*<space|0.17em>d*t
    </equation>

    Apply the change of variables <math|u=2*\<pi\>*t>, so that
    <math|d*t=<frac|d*u|2*\<pi\>>> and <math|t\<in\><around|[|0,\<infty\>|)>>
    corresponds to <math|u\<in\><around|[|0,\<infty\>|)>>. This gives

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|2*\<pi\>*t|)>*<space|0.17em>d*t<space|0.27em>=<space|0.27em><frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|u|)>*<space|0.17em>d*u
    </equation>

    It is a classical integral identity that

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|u|)>*<space|0.17em>d*u<space|0.27em>=<space|0.27em>1
    </equation>

    Therefore,

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|2*\<pi\>*t|)>*<space|0.17em>d*t<space|0.27em>=<space|0.27em><frac|1|2*\<pi\>>,<space|1em><text|and
      hence><space|1em>\<ell\><space|0.27em>=<space|0.27em>2\<cdot\><frac|1|2*\<pi\>><space|0.27em>=<space|0.27em>1
    </equation>

    Defining the characteristic frequency by
    <math|f<rsub|c>\<assign\>1/\<ell\>> (cycles per unit time) yields
    <math|f<rsub|c>=1>.
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