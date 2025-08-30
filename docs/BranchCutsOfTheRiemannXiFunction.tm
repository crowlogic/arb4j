<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  \<cdot\><doc-data|<doc-title|Branch-Cut Discontinuities of
  <math|<frac|1|2>*log \<xi\>*<around*|(|<frac|1|2>+i*t|)>>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    <label|thm:branch_cut_discontinuities>Let <math|\<xi\><around|(|s|)>>
    denote Riemann's <math|\<xi\>>-function, which is entire, and fix a
    single-valued branch <math|<math-up|Log>> of the complex logarithm on
    <math|\<bbb-C\>\<setminus\><around|(|-\<infty\>,0|]>> (the principal
    branch). Consider the function

    <\equation>
      F<around|(|t|)>=<frac|1|2><space|0.17em><math-up|Log><around*|(|\<xi\>*<around*|(|<frac|1|2>+i*t|)>|)>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    defined wherever <math|\<xi\>*<around*|(|<frac|1|2>+i*t|)>\<nin\><around|(|-\<infty\>,0|]>>.
    Then the following hold:

    <\enumerate>
      <item><label|item:continuity> <math|F> is continuous on any maximal
      open interval of <math|t> for which
      <math|\<xi\>*<around*|(|<frac|1|2>+i*t|)>> avoids
      <math|<around|(|-\<infty\>,0|]>>.

      <item><label|item:jump_discontinuity> At any <math|t<rsub|0>> with
      <math|\<xi\>*<around*|(|<frac|1|2>+i*t<rsub|0>|)>\<in\><around|(|-\<infty\>,0|]>>
      and <math|\<xi\>*<around*|(|<frac|1|2>+i*t<rsub|0>|)>\<neq\>0>, the
      one-sided limits of <math|F> exist and satisfy

      <\equation>
        lim<rsub|t\<to\>t<rsub|0><rsup|+>>
        F<around|(|t|)>-lim<rsub|t<rsub|0><rsup|->> F<around|(|t|)>=\<pi\>*i
      </equation>

      i.e., <math|F> exhibits a jump discontinuity of size <math|\<pi\>*i>
      (equivalently, <math|<math-up|Log>> jumps by <math|2*\<pi\>*i> and the
      prefactor <math|<frac|1|2>> halves the jump).

      <item><label|item:characterization> The set of <math|t> at which these
      discontinuities occur is precisely the preimage of the negative real
      axis under the map <math|t\<mapsto\>\<xi\>*<around*|(|<frac|1|2>+i*t|)>>,
      excluding zeros of <math|\<xi\>>; consequently, the observed
      discontinuities are branch-cut crossings of
      <math|<math-up|Log>\<circ\>\<xi\>> and not singularities of
      <math|\<xi\>>.
    </enumerate>
  </theorem>

  <\proof>
    The proof proceeds in three steps corresponding to parts
    <eqref|item:continuity>, <eqref|item:jump_discontinuity>, and
    <eqref|item:characterization> of Theorem<nbsp><reference|thm:branch_cut_discontinuities>.

    <paragraph|Step 1: Proof of <eqref|item:continuity>.> Since
    <math|\<xi\><around|(|s|)>> is entire by construction, <math|\<xi\>> has
    no poles or branch points in <math|s> and
    <math|\<xi\>*<around*|(|<frac|1|2>+i*t|)>> is a continuous function of
    <math|t> into <math|\<bbb-C\>>. Since the only multivalued object in
    <math|F> is <math|<math-up|Log>>, all discontinuities of <math|F> must
    arise from the branch structure of <math|<math-up|Log>> applied to the
    continuous path <math|t\<mapsto\>\<xi\>*<around*|(|<frac|1|2>+i*t|)>>.
    This establishes the reduction to the logarithm.

    The principal branch <math|<math-up|Log>> with branch cut along
    <math|<around|(|-\<infty\>,0|]>> is analytic and thus continuous on
    <math|\<bbb-C\>\<setminus\><around|(|-\<infty\>,0|]>>. Therefore <math|F>
    is continuous at any <math|t<rsub|0>> for which
    <math|\<xi\>*<around*|(|<frac|1|2>+i*t<rsub|0>|)>\<nin\><around|(|-\<infty\>,0|]>>.

    <paragraph|Step 2: Proof of <eqref|item:jump_discontinuity>.> Let
    <math|w<around|(|t|)>\<assign\>\<xi\>*<around*|(|<frac|1|2>+i*t|)>> and
    suppose <math|w<around|(|t<rsub|0>|)>\<in\><around|(|-\<infty\>,0|]>>
    with <math|w<around|(|t<rsub|0>|)>\<neq\>0>. Because <math|w> is
    continuous and nonzero at <math|t<rsub|0>>, there exists
    <math|\<delta\>\<gtr\>0> such that:

    <\enumerate>
      <item><math|w<around|(|t|)>\<neq\>0> for
      <math|<around|\||t-t<rsub|0>|\|>\<less\>\<delta\>>, and

      <item>the image <math|w<around|(|<around|(|t<rsub|0>-\<delta\>,t<rsub|0>+\<delta\>|)>|)>>
      crosses the branch cut transversely at <math|w<around|(|t<rsub|0>|)>>.
    </enumerate>

    Approaching <math|w<around|(|t<rsub|0>|)>> from the upper half-plane
    corresponds to arguments <math|arg w<around|(|t|)>\<to\>\<pi\><rsup|->>,
    while from the lower half-plane corresponds to <math|arg
    w<around|(|t|)>\<to\><around|(|-\<pi\>|)><rsup|+>> (principal values).
    Hence

    <\equation>
      lim<rsub|t\<to\>t<rsub|0><rsup|+>><math-up|Log>w<around|(|t|)>-lim<rsub|t\<to\>t<rsub|0><rsup|->><math-up|Log>w<around|(|t|)>=2*\<pi\>*i
    </equation>

    the standard <math|2*\<pi\>*i> jump across the negative real axis for the
    principal logarithm. Multiplying by <math|<frac|1|2>> yields the stated
    jump <math|\<pi\>*i> for <math|F>.

    <paragraph|Step 3: Proof of <eqref|item:characterization>.> By
    definition, the principal branch is continuous precisely off its branch
    cut. Therefore one-sided jumps can only occur when the continuous path
    <math|w<around|(|t|)>> intersects the branch cut, i.e., when
    <math|w<around|(|t|)>\<in\><around|(|-\<infty\>,0|]>>.

    If <math|w<around|(|t|)>=0>, then <math|<math-up|Log>w<around|(|t|)>> is
    undefined and a different analysis is required (zeros are branch points
    of <math|<math-up|Log>\<circ\>w>), but by hypothesis these are excluded
    from consideration in part<nbsp><eqref|item:jump_discontinuity>.

    Conversely, every transverse crossing of <math|<around|(|-\<infty\>,0|]>>
    yields the jump quantified in part<nbsp><eqref|item:jump_discontinuity>.
    Thus the discontinuity set is exactly
    <math|w<rsup|-1><around|(|<around|(|-\<infty\>,0|]>|)>\<setminus\>w<rsup|-1><around|(|<around|{|0|}>|)>>.
  </proof>

  <\corollary>
    <label|cor:specific_locations>Any specific numerical locations of
    discontinuities (e.g., <math|t=\<pm\><around|(|e-1|)>> in a given plot)
    are exactly the real parameters for which
    <math|\<xi\>*<around*|(|<frac|1|2>+i*t|)>> lands on the negative real
    axis under the chosen branch. These values therefore solve

    <\equation>
      arg \<xi\>*<around*|(|<frac|1|2>+i*t|)>\<equiv\>\<pi\><pmod|2*\<pi\>>
    </equation>
  </corollary>

  <\corollary>
    <label|cor:nature_of_discontinuities>Since <math|\<xi\>> is entire, the
    discontinuities described in Theorem<nbsp><reference|thm:branch_cut_discontinuities>
    are not singularities of <math|\<xi\>>; they arise solely from composing
    the entire function <math|\<xi\>> with a single-valued branch of
    <math|<math-up|Log>> along the critical line.
  </corollary>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|cor:nature_of_discontinuities|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|cor:specific_locations|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|item:characterization|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|item:continuity|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|item:jump_discontinuity|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|thm:branch_cut_discontinuities|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|3tab>|Step 1: Proof of
      (<reference|item:continuity>). <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|3tab>|Step 2: Proof of
      (<reference|item:jump_discontinuity>).
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|3tab>|Step 3: Proof of
      (<reference|item:characterization>).
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>