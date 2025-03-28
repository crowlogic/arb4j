<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Uniform Convergence of Orthonormal Basis Projections
  in RKHS>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|<date|>>>

  <\definition>
    [Reproducing Kernel Hilbert Space] A Hilbert space <math|H> of functions
    on a set <math|D> is called a reproducing kernel Hilbert space (RKHS) if
    there exists a function <math|k:D\<times\>D\<to\>\<bbb-R\>> such that:

    <\enumerate>
      <item>For every <math|x\<in\>D>, the function
      <math|k<rsub|x><around|(|\<cdummy\>|)>=k<around|(|\<cdummy\>,x|)>>
      belongs to <math|H>.

      <item>For every <math|x\<in\>D> and every <math|f\<in\>H>, the
      reproducing property holds: <math|f<around|(|x|)>=<around|\<langle\>|f,k<rsub|x>|\<rangle\>><rsub|H>>.
    </enumerate>

    The function <math|k> is called the reproducing kernel of <math|H>.
  </definition>

  <\definition>
    [Orthonormal Basis in RKHS]<label|def:orthonormal_basis>A sequence of
    functions <math|<around|{|e<rsub|n>|}><rsub|n=1><rsup|\<infty\>>\<subset\>H>
    is an orthonormal basis of the RKHS <math|H> if:

    <\enumerate>
      <item>Orthonormality: For all indices <math|n,m>,
      <math|<around|\<langle\>|e<rsub|n>,e<rsub|m>|\<rangle\>><rsub|H>=\<delta\><rsub|n*m>>,
      where <math|\<delta\><rsub|n*m>> is the Kronecker delta.

      <item>Completeness: The span of <math|<around|{|e<rsub|n>|}><rsub|n=1><rsup|\<infty\>>>
      is dense in <math|H>, which means:

      <\enumerate>
        <item>For any <math|f\<in\>H>, if
        <math|<around|\<langle\>|f,e<rsub|n>|\<rangle\>><rsub|H>=0> for all
        <math|n>, then <math|f=0>

        <item>Equivalently, every function <math|f\<in\>H> can be represented
        as

        <\equation>
          f=<big|sum><rsub|n=1><rsup|\<infty\>><around|\<langle\>|f,e<rsub|n>|\<rangle\>><rsub|H>*e<rsub|n>
        </equation>

        with convergence in the <math|H>-norm:

        <\equation>
          lim<rsub|N\<to\>\<infty\>><around*|\||f-<big|sum><rsub|n=1><rsup|N><around|\<langle\>|f,e<rsub|n>|\<rangle\>><rsub|H>*e<rsub|n>|\|><rsub|H>=0
        </equation>
      </enumerate>

      <item>Parseval's Identity: For any <math|f\<in\>H>,

      <\equation>
        <around|\<\|\|\>|f|\<\|\|\>><rsub|H><rsup|2>=<big|sum><rsub|n=1><rsup|\<infty\>><around|\||<around|\<langle\>|f,e<rsub|n>|\<rangle\>><rsub|H>|\|><rsup|2>
      </equation>
    </enumerate>

    In an RKHS, each basis function satisfies the reproducing property:
    <math|e<rsub|n><around|(|x|)>=<around|\<langle\>|e<rsub|n>,k|(>\<cdot\>,x)\<rangle\><rsub|H>>
    for all <math|x\<in\>D>.
  </definition>

  <\theorem>
    <label|thm:uniform_convergence>Let <math|H> be a reproducing kernel
    Hilbert space (RKHS) on a set <math|D> with reproducing kernel <math|k>.
    Suppose that:

    <\enumerate>
      <item><math|<around|{|e<rsub|n>|}><rsub|n=1><rsup|\<infty\>>> is an
      orthonormal basis of <math|H> as defined in Definition
      <reference|def:orthonormal_basis>.

      <item>The kernel is uniformly bounded on <math|D>; that is, there
      exists a constant <math|M\<gtr\>0> such that

      <\equation>
        sup<rsub|x\<in\>D> <sqrt|k<around|(|x,x|)>>\<le\>M
      </equation>
    </enumerate>

    Then for any function <math|f\<in\>H> with orthonormal expansion

    <\equation>
      f=<big|sum><rsub|n=1><rsup|\<infty\>>c<rsub|n>*e<rsub|n>
    </equation>

    where <math|c<rsub|n>=<around|\<langle\>|f,e<rsub|n>|\<rangle\>><rsub|H>>,
    the partial sums

    <\equation>
      S<rsub|N>*f=<big|sum><rsub|n=1><rsup|N>c<rsub|n>*e<rsub|n>
    </equation>

    converge uniformly to <math|f> on <math|D>; in other words,

    <\equation>
      lim<rsub|N\<to\>\<infty\>> sup<rsub|x\<in\>D><around*|\||S<rsub|N>*f<around|(|x|)>-f<around|(|x|)>|\|>=0
    </equation>
  </theorem>

  <\proof>
    By the completeness property of the orthonormal basis (Definition
    <reference|def:orthonormal_basis>), every function <math|f\<in\>H> can be
    represented by its orthonormal expansion that converges in the
    <math|H>-norm. Since <math|H> is an RKHS, the evaluation functional at
    any <math|x\<in\>D> is bounded by <math|<sqrt|k<around|(|x,x|)>>>.
    Specifically, for each fixed <math|x\<in\>D>:

    <\equation>
      <around*|\<nobracket\>|<around*|\||f<around|(|x|)>-S<rsub|N>*f<around|(|x|)>|\|>=<around*|\||<around|\<langle\>|f-S<rsub|N>*f,k|(>\<cdot\>,x|)>\<rangle\><rsub|H>|\|>\<le\><around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>*<sqrt|k<around|(|x,x|)>>
    </equation>

    Taking the supremum over <math|x\<in\>D> yields

    <\equation>
      sup<rsub|x\<in\>D><around*|\||f<around|(|x|)>-S<rsub|N>*f<around|(|x|)>|\|>\<le\><around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>*<space|0.17em>sup<rsub|x\<in\>D>
      <sqrt|k<around|(|x,x|)>>\<le\>M*<around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>
    </equation>

    From the convergence property of orthonormal bases, we have:

    <\equation>
      lim<rsub|N\<to\>\<infty\>><around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>=0
    </equation>

    For any <math|\<varepsilon\>\<gtr\>0>, choose <math|N> such that for all
    <math|n\<ge\>N>:

    <\equation>
      <around|\<\|\|\>|f-S<rsub|n>*f|\<\|\|\>><rsub|H>\<less\><frac|\<varepsilon\>|M>
    </equation>

    Then for all <math|n\<ge\>N>:

    <\equation>
      sup<rsub|x\<in\>D><around*|\||f<around|(|x|)>-S<rsub|n>*f<around|(|x|)>|\|>\<less\>\<varepsilon\>
    </equation>

    Thus:

    <\equation>
      lim<rsub|N\<to\>\<infty\>> sup<rsub|x\<in\>D><around|\||S<rsub|N>*f<around|(|x|)>-f<around|(|x|)>|\|>=0
    </equation>
  </proof>

  <\remark>
    The uniform boundedness condition on the kernel is essential. Without it,
    norm convergence in the RKHS would not necessarily imply uniform
    convergence of the function evaluations on the domain.
  </remark>

  <\remark>
    It is important to emphasize that the domain <math|D> in Theorem
    <reference|thm:uniform_convergence> is not required to be compact. The
    result holds for any domain, including unbounded domains such as
    <math|D=\<bbb-R\><rsup|n>> or <math|D=<around|[|0,\<infty\>|)>>, provided
    that the kernel is uniformly bounded on that domain.
  </remark>

  <\remark>
    <label|rem:mercer_uniqueness>The uniform convergence described in Theorem
    <reference|thm:uniform_convergence> applies to any orthonormal basis when
    expanding functions in the RKHS <math|H>, whereas when expanding the
    reproducing kernel <math|k<around|(|x,y|)>> itself, only the Mercer
    eigenbasis <math|<around|{|e<rsub|n><rsup|\<ast\>>|}>>, defined by the
    equation

    <\equation>
      <big|int><rsub|D>k<around|(|x,y|)>*e<rsub|n><rsup|\<ast\>><around|(|y|)>*<space|0.17em>d*y=\<lambda\><rsub|n>*e<rsub|n><rsup|\<ast\>><around|(|x|)>
    </equation>

    converges uniformly, whereas non-Mercer orthonormal bases converge
    pointwise.
  </remark>

  <\thebibliography|9>
    <bibitem-with-key|Riesz(1907)|riesz1907> Riesz, F. (1907). Sur les
    systèmes orthogonaux de fonctions. <em|Comptes rendus de l'Académie des
    sciences>, 144:615\U619.

    <bibitem-with-key|Fischer(1907)|fischer1907> Fischer, E. (1907). Sur la
    convergence en moyenne. <em|Comptes rendus de l'Académie des sciences>,
    144:1022\U1024.

    <bibitem-with-key|Aronszajn(1950)|aronszajn1950> Aronszajn, N. (1950).
    Theory of reproducing kernels. <em|Transactions of the American
    Mathematical Society>, 68(3):337\U404.

    <bibitem-with-key|Berlinet and Thomas-Agnan(2004)|berlinet2004> Berlinet,
    A. and Thomas-Agnan, C. (2004). <em|Reproducing Kernel Hilbert Spaces in
    Probability and Statistics>. Springer, Boston, MA.
  </thebibliography>

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
    <associate|auto-1|<tuple|14|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-aronszajn1950|<tuple|Aronszajn(1950)|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-berlinet2004|<tuple|Berlinet and
    Thomas-Agnan(2004)|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-fischer1907|<tuple|Fischer(1907)|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-riesz1907|<tuple|Riesz(1907)|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|def:orthonormal_basis|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|rem:mercer_uniqueness|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|thm:uniform_convergence|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>