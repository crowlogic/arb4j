<TeXmacs|2.1.1>

<style|<tuple|generic|framed-theorems|alt-colors|boring-white>>

<\body>
  <doc-data|<doc-date|>>

  The Sturm-Liouville equations are posed as follows:

  Given <math|p<around|(|x|)>\<gtr\>0>, <math|p<around|(|x|)>> continuous on
  <math|<around|[|a,b|]>>, and <math|w<around|(|x|)>\<gtr\>0>,
  <math|w<around|(|x|)>> continuous on <math|<around|[|a,b|]>>, consider the
  differential equation:

  <\Shaded>
    \ <Highlighting|| <NormalTok|\\frac{d}{dx}\\left(p(x)
    \\frac{dy}{dx}\\right) - q(x)y + \\lambda w(x) y = 0>>
  </Shaded>

  Subject to boundary conditions of the form:

  <\Shaded>
    \ <Highlighting|| <NormalTok|\\alpha_1 y(a) + \\alpha_2
    y<textquotesingle|>(a) = 0>>
  </Shaded>

  <\Shaded>
    \ <Highlighting|| <NormalTok|\\beta_1 y(b) + \\beta_2
    y<textquotesingle|>(b) = 0>>
  </Shaded>

  Where: - <math|\<alpha\><rsub|1>,\<alpha\><rsub|2>,\<beta\><rsub|1>,\<beta\><rsub|2>>
  are constants, not all zero. - <math|\<lambda\>> is the eigenvalue
  parameter. - <math|y> is the unknown function, or the eigenfunction
  associated with the eigenvalue <math|\<lambda\>>.

  The boundary conditions given here are more general than the ones
  previously mentioned, and they encompass a wider class of problems. Such
  boundary conditions can represent various physical constraints, from being
  held fixed, to being free, to some combination of these.

  Additionally, when discussing the Sturm-Liouville problem, there are the
  following important properties to consider:

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Orthogonality>: If <math|\<lambda\><rsub|n>>
    and <math|\<lambda\><rsub|m>> are two different eigenvalues of the
    problem, then their corresponding eigenfunctions
    <math|y<rsub|n><around|(|x|)>> and <math|y<rsub|m><around|(|x|)>> are
    orthogonal with respect to the weight function <math|w<around|(|x|)>>:
  </enumerate>

  <\Shaded>
    \ <Highlighting|| <NormalTok|\\int_a^b y_m(x) y_n(x) w(x) dx = 0>>
  </Shaded>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|1>

    <item><with|font-series|bold|Completeness>: The set of eigenfunctions
    forms a complete set, which means any piecewise continuous function can
    be expanded as a series of these eigenfunctions.

    <item><with|font-series|bold|Regular and Singular Points>: Points where
    <math|p,q>, and <math|w> are all continuous are termed regular. If any of
    these are not continuous at a point, the point is termed singular.

    <item><with|font-series|bold|Self-Adjoint Form>: The Sturm-Liouville
    equation can be written in a self-adjoint or self-adjoint form which has
    special mathematical properties and is given by:
  </enumerate>

  <\Shaded>
    \ <Highlighting|| <NormalTok|\\frac{d}{dx}\\left(p(x)
    \\frac{dy}{dx}\\right) - q(x)y = \\lambda w(x) y>>
  </Shaded>
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