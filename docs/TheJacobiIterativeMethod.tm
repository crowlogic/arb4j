<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Jacobi Iterative Method for Eigenvalues and
  Eigenfunctions>>

  <section|Introduction>

  The Jacobi Iterative Method is a computational algorithm used to find the
  eigenvalues and eigenfunctions (eigenvectors) of a real symmetric matrix.
  It employs a series of orthogonal (Givens) rotations to transform the
  matrix into a diagonal form, where the diagonal elements represent the
  eigenvalues, and the columns of the product of rotations represent the
  eigenfunctions.

  <section|Mathematical Background>

  A real symmetric matrix <math|A> can be diagonalized by an orthogonal
  transformation matrix <math|Q>, such that <math|Q<rsup|T>*A*Q=D>, where
  <math|D> is a diagonal matrix whose elements are the eigenvalues of
  <math|A>, and the columns of <math|Q> are the corresponding eigenfunctions.
  The Jacobi Iterative Method accomplishes this through a sequence of Givens
  rotations.

  <subsection|Givens Rotations>

  Givens rotations are used to introduce zeros into specific positions of a
  matrix, thereby reducing it towards diagonal form. A Givens rotation is an
  orthogonal rotation in a plane spanned by two coordinate axes, represented
  by a rotation matrix <math|R>. When applied to a matrix <math|A>, it
  rotates <math|A> in the plane defined by two axes, chosen to zero out a
  specific off-diagonal element.

  <subsection|Rotation Matrix>

  For a rotation targeting the <math|i<rsup|t*h>> and <math|j<rsup|t*h>>
  axes, the rotation matrix <math|R> is defined as follows:

  <\align*>
    <tformat|<table|<row|<cell|R<rsub|k*k>>|<cell|=1*<space|1em><text|for
    >k\<neq\>i,j>>|<row|<cell|R<rsub|i*i>>|<cell|=R<rsub|j*j>=cos
    <around|(|\<theta\>|)>>>|<row|<cell|R<rsub|i*j>>|<cell|=-R<rsub|j*i>=sin
    <around|(|\<theta\>|)>>>|<row|<cell|R<rsub|k*i>>|<cell|=R<rsub|k*j>=0*<space|1em><text|for
    >k\<neq\>i,j>>>>
  </align*>

  where <math|\<theta\>> is the rotation angle, determined to zero the
  <math|i*j<rsup|t*h>> off-diagonal element of <math|A>.

  <subsection|Determining the Rotation Angle>

  The angle <math|\<theta\>> is chosen such that the <math|i*j<rsup|t*h>>
  off-diagonal element of the rotated matrix <math|A<rprime|'>> is zero,
  leading to:

  <\equation*>
    tan <around|(|2*\<theta\>|)>=<frac|2*a<rsub|i*j>|a<rsub|i*i>-a<rsub|j*j>>
  </equation*>

  This condition ensures that each rotation step moves closer to
  diagonalizing <math|A>.

  <section|Jacobi Iterative Method Implementation>

  The following Java-like pseudocode illustrates the implementation of the
  Jacobi Iterative Method, focusing on calculating both eigenvalues and
  eigenfunctions.

  <\verbatim>
    \;

    public class JacobiIterativeMethod {

    \;

    \ \ \ \ public static arb.RealMatrix diagonalize(arb.RealMatrix matrix) {

    \ \ \ \ \ \ \ \ final int size = matrix.size();

    \ \ \ \ \ \ \ \ arb.RealMatrix eigenVectors =
    arb.RealMatrix.identity(size);

    \ \ \ \ \ \ \ \ arb.RealMatrix rotation = new arb.RealMatrix(size, size);

    \;

    \ \ \ \ \ \ \ \ boolean done = false;

    \ \ \ \ \ \ \ \ while (!done) {

    \ \ \ \ \ \ \ \ \ \ \ \ done = true;

    \;

    \ \ \ \ \ \ \ \ \ \ \ \ for (int i = 0; i \<less\> size; i++) {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for (int j = i + 1; j \<less\> size; j++)
    {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ arb.Real offDiagonal =
    matrix.get(i, j);

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if (Math.abs(offDiagonal.value())
    \<gtr\> some_tolerance) {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ done = false;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ performGivensRotation(matrix,
    eigenVectors, rotation, i, j);

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ }

    \;

    \ \ \ \ \ \ \ \ return eigenVectors; // Columns are the eigenfunctions

    \ \ \ \ }

    \;

    \ \ \ \ private static void performGivensRotation(arb.RealMatrix matrix,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ arb.RealMatrix eigenVectors,
    arb.RealMatrix rotation, int p, int q) {

    \ \ \ \ \ \ \ \ arb.Real alpha = matrix.get(p, p);

    \ \ \ \ \ \ \ \ arb.Real beta = matrix.get(q, q);

    \ \ \ \ \ \ \ \ arb.Real gamma = matrix.get(p, q);

    \;

    \ \ \ \ \ \ \ \ arb.Real theta = gamma.divide(alpha.subtract(beta).divide(new
    arb.Real(2))).atan();

    \ \ \ \ \ \ \ \ arb.Real c = theta.cos(); // cosine of rotation angle

    \ \ \ \ \ \ \ \ arb.Real s = theta.sin(); // sine of rotation angle

    \;

    \ \ \ \ \ \ \ \ rotation.identity();

    \ \ \ \ \ \ \ \ rotation.set(p, p, c).set(p, q, s.negate()).set(q, p,
    s).set(q, q, c);

    \;

    \ \ \ \ \ \ \ \ matrix.multiply(rotation).store(matrix);

    \ \ \ \ \ \ \ \ eigenVectors.multiply(rotation).store(eigenVectors); //
    Update eigenfunctions

    \ \ \ \ }

    }

    \;
  </verbatim>

  <section|Conclusion>

  The Jacobi Iterative Method, utilizing Givens rotations, provides a robust
  approach for computing the eigenvalues and eigenfunctions of real symmetric
  matrices. This method is particularly valued for its simplicity and
  effectiveness in numerical linear algebra and various applications in
  physics and engineering.
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
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|1>>
    <associate|auto-4|<tuple|2.2|1>>
    <associate|auto-5|<tuple|2.3|1>>
    <associate|auto-6|<tuple|3|2>>
    <associate|auto-7|<tuple|4|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mathematical
      Background> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Givens Rotations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Rotation Matrix
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Determining the Rotation
      Angle <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Jacobi
      Iterative Method Implementation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>