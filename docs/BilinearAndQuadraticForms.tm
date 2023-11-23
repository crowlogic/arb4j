<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Bilinear and Quadratic Forms>>

  <section|Relationship Between Quadratic Forms and Bilinear
  Forms><label|relationship-between-quadratic-forms-and-bilinear-forms><label|relationship-between-quadratic-forms-and-bilinear-forms>

  <subsection|Quadratic Forms vs Bilinear Forms in Real Vector
  Spaces><label|quadratic-forms-vs-bilinear-forms-in-real-vector-spaces><label|quadratic-forms-vs-bilinear-forms-in-real-vector-spaces>

  In real vector spaces, every quadratic form is indeed associated with a
  unique symmetric bilinear form.

  <subsubsection|Quadratic Form><label|quadratic-form><label|quadratic-form>

  <\itemize>
    <item>A <with|font-series|bold|quadratic form> in a real vector space is
    a function <math|Q:V\<to\>\<bbb-R\>> defined by
    <math|Q<around|(|v|)>=B<around|(|v,v|)>> for a symmetric bilinear form
    <math|B>.

    <item>Given a vector <math|x\<in\>\<bbb-R\><rsup|n>> and a symmetric
    matrix <math|A\<in\>\<bbb-R\><rsup|n\<times\>n>>, a quadratic form is an
    expression of the form <math|Q<around|(|x|)>=x<rsup|T>*A*x>.
  </itemize>

  <subsubsection|Bilinear Form><label|bilinear-form><label|bilinear-form>

  <\itemize>
    <item>A <with|font-series|bold|bilinear form>
    <math|B:V\<times\>V\<to\>\<bbb-R\>> is a function that is linear in each
    of its two arguments.

    <item>The bilinear form is symmetric if
    <math|B<around|(|u,v|)>=B<around|(|v,u|)>> for all <math|u,v\<in\>V>.
  </itemize>

  <subsubsection|Relationship><label|relationship><label|relationship>

  <\itemize>
    <item>For a quadratic form <math|Q> on a real vector space, there exists
    a unique symmetric bilinear form <math|B> such that
    <math|Q<around|(|v|)>=B<around|(|v,v|)>>.

    <item>This bilinear form <math|B> is determined by the polarization
    identity:

    <\equation>
      B<around*|(|u,v|)>=<frac|1|2><around*|(|Q<around*|(|u+v|)>-Q<around*|(|u|)>-Q<around*|(|v|)>|)>
    </equation>
  </itemize>

  <subsection|Complex Vector Spaces><label|complex-vector-spaces><label|complex-vector-spaces>

  In complex vector spaces, the relationship between quadratic forms and
  bilinear forms is more nuanced due to the role of complex conjugation.

  <subsubsection|Sesquilinear Form><label|sesquilinear-form><label|sesquilinear-form>

  <\itemize>
    <item>In a complex vector space, a sesquilinear form is linear in its
    first argument and conjugate-linear in its second argument.

    <item>A <with|font-series|bold|Hermitian form> is a sesquilinear form
    satisfying <math|B<around|(|u,v|)>=<wide|B<around|(|v,u|)>|\<bar\>>>.
  </itemize>

  <subsubsection|Quadratic Forms in Complex
  Spaces><label|quadratic-forms-in-complex-spaces><label|quadratic-forms-in-complex-spaces>

  <\itemize>
    <item>Defining a quadratic form in complex spaces is less straightforward
    and involves a Hermitian form, but the relationship is not as direct as
    in real spaces.
  </itemize>

  <subsubsection|Polarization Identity in Complex
  Spaces><label|polarization-identity-in-complex-spaces><label|polarization-identity-in-complex-spaces>

  <\itemize>
    <item>The polarization identity in complex spaces involves complex
    conjugation and works with Hermitian forms.
  </itemize>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1.1|1>>
    <associate|auto-4|<tuple|1.1.2|1>>
    <associate|auto-5|<tuple|1.1.3|1>>
    <associate|auto-6|<tuple|1.2|1>>
    <associate|auto-7|<tuple|1.2.1|1>>
    <associate|auto-8|<tuple|1.2.2|1>>
    <associate|auto-9|<tuple|1.2.3|1>>
    <associate|bilinear-form|<tuple|1.1.2|1>>
    <associate|complex-vector-spaces|<tuple|1.2|1>>
    <associate|polarization-identity-in-complex-spaces|<tuple|1.2.3|1>>
    <associate|quadratic-form|<tuple|1.1.1|1>>
    <associate|quadratic-forms-in-complex-spaces|<tuple|1.2.2|1>>
    <associate|quadratic-forms-vs-bilinear-forms-in-real-vector-spaces|<tuple|1.1|1>>
    <associate|relationship|<tuple|1.1.3|1>>
    <associate|relationship-between-quadratic-forms-and-bilinear-forms|<tuple|1|1>>
    <associate|sesquilinear-form|<tuple|1.2.1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Relationship
      Between Quadratic Forms and Bilinear Forms>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Quadratic Forms vs Bilinear
      Forms in Real Vector Spaces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>Quadratic Form
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.1.2<space|2spc>Bilinear Form
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.1.3<space|2spc>Relationship
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Complex Vector Spaces
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Sesquilinear Form
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Quadratic Forms in Complex
      Spaces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|1.2.3<space|2spc>Polarization Identity in
      Complex Spaces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>
    </associate>
  </collection>
</auxiliary>