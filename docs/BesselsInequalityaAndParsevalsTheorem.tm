<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <\definition>
    \;

    The inner product for two functions <math|f<around|(|t|)>> and
    <math|g<around|(|t|)>> in a Hilbert space, such as
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>, is defined as:

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>><space|0.17em>d*t
    </equation>

    where <math|<wide|g<around|(|t|)>|\<bar\>>> denotes the complex conjugate
    of <math|g<around|(|t|)>>.
  </definition>

  <\definition>
    Bessel's Inequality can be formulated using the inner product as follows.
    Given a set of orthonormal functions <math|<around|{|e<rsub|n>|}>> in a
    Hilbert space and any function <math|f> in that space, Bessel's
    Inequality states:

    <\equation>
      <big|sum><rsub|n=1><rsup|N><around|\||<around|\<langle\>|f,e<rsub|n>|\<rangle\>>|\|><rsup|2>\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsup|2>
    </equation>

    where <math|<around|\<\|\|\>|f|\<\|\|\>><rsup|2>=<around|\<langle\>|f,f|\<rangle\>>>
    represents the norm of <math|f>, calculated as the inner product of
    <math|f> with itsel
  </definition>

  <\theorem>
    Parseval's Theorem, when expressed in terms of the inner product for a
    complete orthonormal system, states that for any function <math|f> in
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>, the sum of the squares of the
    inner product of <math|f> with the orthonormal basis functions equals the
    norm of <math|f>:

    <\equation>
      <big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><around|\||<around|\<langle\>|f,e<rsub|n>|\<rangle\>>|\|><rsup|2>=<around|\<\|\|\>|f|\<\|\|\>><rsup|2>
    </equation>
  </theorem>
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