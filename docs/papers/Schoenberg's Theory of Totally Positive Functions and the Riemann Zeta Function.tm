<TeXmacs|2.1.4>

<style|<tuple|article|boring-white|framed-theorems>>

<\body>
  <\hide-preamble>
    <assign|up|<macro|uncertainty principle>>

    <assign|tfa|<macro|time-frequency analysis>>

    <assign|tfr|<macro|time-frequency representation>>

    <assign|ft|<macro|Fourier transform>>

    <assign|stft|<macro|short-time Fourier transform>>

    <assign|qm|<macro|quantum mechanics>>

    <assign|tf|<macro|time-frequency>>

    <assign|fa|<macro|Fourier analysis>>

    <assign|fct|<macro|function>>

    <assign|fif|<macro|if and only if>>

    <assign|tfs|<macro|time-frequency shift>>

    <assign|fs|<macro|Fourier series>>

    <assign|on|<macro|orthonormal>>

    <assign|onb|<macro|orthonormal basis>>

    <assign|fco|<macro|Fourier coefficient>>

    <assign|sa|<macro|signal analysis>>

    <assign|psf|<macro|Poisson summation formula>>

    <assign|bdl|<macro|bandlimited>>

    <assign|prob|<macro|probability>>

    <assign|Wd|<macro|Wigner distribution>>

    <assign|gf|<macro|Gabor frame>>

    <assign|frop|<macro|frame operator>>

    <assign|gfrop|<macro|Gabor frame operator>>

    <assign|coeff|<macro|coefficient>>

    <assign|repr|<macro|representation>>

    <assign|rb|<macro|Riesz basis>>

    <assign|mdl|<macro|modulation>>

    <assign|distr|<macro|distribution>>

    <assign|modsp|<macro|modulation space>>

    <assign|psdo|<macro|pseudodifferential operator>>

    <assign|hei|<macro|Heisenberg group>>

    <assign|rep|<macro|representation>>

    <assign|ha|<macro|harmonic analysis>>

    <assign|lcg|<macro|locally compact group>>

    <assign|lcal|<macro|locally compact abelian>>

    <assign|srep|<macro|Schrödinger representation>>

    <assign|svn|<macro|Stone--von Neumann theorem>>

    <assign|iur|<macro|irreducible unitary representation>>

    <assign|gs|<macro|Gabor system>>

    <assign|zt|<macro|Zak transform>>

    <assign|blt|<macro|Balian--Low theorem>>

    <assign|wb|<macro|Wilson bas>>

    <assign|ws|<macro|Wilson system>>

    <assign|wt|<macro|wavelet transform>>

    <assign|wth|<macro|wavelet theory>>

    <assign|gex|<macro|Gabor expansion>>

    <assign|wl|<macro|Wiener's lemma>>

    <assign|opal|<macro|operator algebra>>

    <assign|trpo|<macro|trigonometric polynomial>>

    <assign|op|<macro|operator>>

    <assign|pde|<macro|partial differential equation>>

    <assign|knc|<macro|Kohn--Nirenberg correspondence>>

    <assign|fre|<macro|frequency>>

    <new-theorem|tm|Theorem>

    <new-theorem|exmp|Example>

    <new-theorem|exmps|Examples>

    <new-theorem|alg|Algorithm>

    <new-theorem|rems|Remarks>

    <assign|beqa|<macro|>>

    <assign|eeqa|<macro|>>

    <assign|*|<macro|<supp>>>

    <assign|*|<macro|<essupp>>>

    <assign|*|<macro|<essinf>>>

    <assign|*|<macro|<opl>>>

    <assign|field|<macro|1|<with|math-font|Bbb|<arg|1>>>>

    <assign|bR|<macro|<field|R>>>

    <assign|bN|<macro|<field|N>>>

    <assign|bZ|<macro|<field|Z>>>

    <assign|bC|<macro|<field|C>>>

    <assign|bQ|<macro|<field|Q>>>

    <assign|bT|<macro|<field|T>>>

    <assign|bH|<macro|<field|H>>>

    <assign|mylistlabel|<macro|1|<arg|1><htab|0pt>>>

    <newenvironment*|mylist|1| >

    <assign|Hr|<macro|<bH><space|0.17em> <rsub|r>>>

    <assign|bh|<macro|<math-bf|h>>>

    <assign|arro|<macro|<math|\<Rightarrow\>>>>

    <assign|al|<macro|\<alpha\>>>

    <assign|be|<macro|\<beta\>>>

    <assign|ga|<macro|\<gamma\>>>

    <assign|Ga|<macro|\<Gamma\>>>

    <assign|de|<macro|\<delta\>>>

    <assign|De|<macro|\<Delta\>>>

    <assign|la|<macro|\<lambda\>>>

    <assign|La|<macro|\<Lambda\>>>

    <assign|vp|<macro|\<varphi\>>>

    <assign|ve|<macro|\<varepsilon\>>>

    <assign|e|<macro|\<epsilon\>>>

    <assign|ka|<macro|\<kappa\>>>

    <assign|om|<macro|\<omega\>>>

    <assign|Om|<macro|\<Omega\>>>

    <assign|si|<macro|\<sigma\>>>

    <assign|Si|<macro|\<Sigma\>>>

    <assign|cF|<macro|\<cal-F\>>>

    <assign|cS|<macro|\<cal-S\>>>

    <assign|cD|<macro|\<cal-D\>>>

    <assign|cH|<macro|\<cal-H\>>>

    <assign|cB|<macro|\<cal-B\>>>

    <assign|cG|<macro|\<cal-G\>>>

    <assign|cM|<macro|\<cal-M\>>>

    <assign|cK|<macro|\<cal-K\>>>

    <assign|cU|<macro|\<cal-U\>>>

    <assign|cA|<macro|\<cal-A\>>>

    <assign|cE|<macro|\<cal-E\>>>

    <assign|cJ|<macro|\<cal-J\>>>

    <assign|cI|<macro|\<cal-I\>>>

    <assign|cC|<macro|\<cal-C\>>>

    <assign|cW|<macro|\<cal-W\>>>

    <assign|cO|<macro|\<cal-O\>>>

    <assign|cN|<macro|\<cal-N\>>>

    <assign|cP|<macro|\<cal-P\>>>

    <assign|cR|<macro|\<cal-R\>>>

    <assign|cT|<macro|\<cal-T\>>>

    <assign|cX|<macro|\<cal-X\>>>

    <assign|cZ|<macro|\<cal-Z\>>>

    <assign|a|<macro|\<aleph\>>>

    <assign|fhat|<macro|<wide|f|^>>>

    <assign|hg|<macro|<wide|g|^>>>

    <assign|bg|<macro|<wide|g|\<bar\>>>>

    <assign|hvp|<macro|<wide|<vp>|^>>>

    <assign|wh|<macro|1|<wide|<arg|1>|^>>>

    <assign|tW|<macro|<wide|W|~>>>

    <assign|tif|<macro|<wide|f|~>>>

    <assign|tig|<macro|<wide|g|~>>>

    <assign|tih|<macro|<wide|h|~>>>

    <assign|tz|<macro|<wide|\<zeta\>|~>>>

    <assign|Lac|<macro|\<Lambda\><rsup|\<circ\>>>>

    <assign|vgf|<macro|V<rsub|g>f>>

    <assign|cano|<macro|<rsup|\<circ\>>>>

    <assign|rd|<macro|<bR><rsup|d>>>

    <assign|cd|<macro|<bC><rsup|d>>>

    <assign|rdd|<macro|<bR><rsup|2d>>>

    <assign|zdd|<macro|<bZ><rsup|2d>>>

    <assign|ellzd|<macro|\<ell\><rsup|1>(<zd>)>>

    <assign|lr|<macro|L<rsup|2>(<bR>)>>

    <assign|lrd|<macro|L<rsup|2>(<rd>)>>

    <assign|lrdd|<macro|L<rsup|2>(<rdd>)>>

    <assign|zd|<macro|<bZ><rsup|d>>>

    <assign|td|<macro|<bT><rsup|d>>>

    <assign|mvv|<macro|M<rsub|v><rsup|1>>>

    <assign|intrd|<macro|<big|int><rsub|<rd>>>>

    <assign|intrdd|<macro|<big|int><rsub|<rdd>>>>

    <assign|intcd|<macro|<big|int><rsub|<cd>>>>

    <assign|infint|<macro|<big|int><rsub|-\<infty\>><rsup|\<infty\>>>>

    <assign|dint|<macro|<big|int><space|-0.17em><space|-0.17em><space|-0.17em><big|int>>>

    <assign|L|<macro|<left|(>>>

    <assign|R|<macro|<right|)>>>

    <assign|l|<macro|\<langle\>>>

    <assign|r|<macro|\<rangle\>>>

    <assign|\<|<macro|<left|\<less\>>>>

    <assign|\>|<macro|<right|\<gtr\>>>>

    <assign|ra|<macro|\<rightarrow\>>>

    <assign|lra|<macro|\<longrightarrow\>>>

    <assign|Lra|<macro|\<Longrightarrow\>>>

    <assign|Llra|<macro|\<Longleftrightarrow\>>>

    <assign|lms|<macro|\<longmapsto\>>>

    <assign|sset|<macro|\<subset\>>>

    <assign|sseq|<macro|\<subseteq\>>>

    <assign|IN|<macro|<space|-0.17em>\<in\><space|-0.17em>>>

    <assign|hats|<macro|<space|-0.17em><move|^|0pt|.6ex>>>

    <assign|prt|<macro|\<partial\>>>

    <assign|absl|<macro|<left|lvert>>>

    <assign|absr|<macro|<right|rvert>>>

    <assign|tamb|<macro|T<rsub|<al>k>M<rsub|<be>n>>>

    <assign|mbta|<macro|M<rsub|<be>n>T<rsub|<al>k>>>

    <assign|dsum|<macro|<below|<big|sum><space|-0.17em><big|sum>|k,n
    \<in\><zd>>>>

    <assign|lnsum|<macro|<below|<big|sum><space|-0.17em><big|sum>|l,n
    \<in\><zd>>>>

    <assign|invbe|<macro|<frac|1|<be>>>>

    <assign|inval|<macro|<frac|1|<al>>>>

    <assign|inv|<macro|<rsup|-1>>>

    <assign|ud|<macro|<space|0.17em> <math-up|d>>>

    <assign|bks|<macro|\<backslash\>>>

    <assign|nat|<macro|<space|0.17em>\<natural\><space|0.17em>>>

    <assign|intqa|<macro|<big|int><rsub|Q<rsub|1/<al>>>>>

    <assign|mv|<macro|M<rsub|v><rsup|1>>>

    <assign|alp|<macro|<tfrac|\<alpha\>|p><space|0.17em>>>

    <assign|zaa|<macro|Z<rsub|\<alpha\>>>>

    <assign|Lmpq|<macro|L<rsub|m><rsup|p,q>>>

    <assign|lmpq|<macro|\<ell\><rsub|<wide|m|~>><rsup|p,q>>>

    <assign|ltmpq|<macro|\<ell\><rsub|<wide|m|~>><rsup|p,q>>>

    <assign|Mmpq|<macro|M<rsub|m><rsup|p,q>>>

    <assign|phas|<macro|(x,\<omega\>)>>

    <assign|Hpol|<macro|<bH><space|0.17em> <rsup|pol>>>

    <assign|sgg|<macro|S<rsub|g,g>>>

    <assign|qed|<macro|<htab|0pt><rule|7pt|8pt> .2truein>>

    <assign|abs|<macro|1|\<lvert\><arg|1>\<rvert\>>>

    <assign|norm|<macro|1|\<lVert\><arg|1>\<rVert\>>>

    <assign|up|<macro|uncertainty principle>>

    <assign|tfa|<macro|time-frequency analysis>>

    <assign|tfr|<macro|time-frequency representation>>

    <assign|ft|<macro|Fourier transform>>

    <assign|stft|<macro|short-time Fourier transform>>

    <assign|qm|<macro|quantum mechanics>>

    <assign|tf|<macro|time-frequency>>

    <assign|fa|<macro|Fourier analysis>>

    <assign|fct|<macro|function>>

    <assign|fif|<macro|if and only if>>

    <assign|tfs|<macro|time-frequency shift>>

    <assign|fs|<macro|Fourier series>>

    <assign|on|<macro|orthonormal>>

    <assign|onb|<macro|orthonormal basis>>

    <assign|fco|<macro|Fourier coefficient>>

    <assign|sa|<macro|signal analysis>>

    <assign|psf|<macro|Poisson summation formula>>

    <assign|bdl|<macro|bandlimited>>

    <assign|prob|<macro|probability>>

    <assign|Wd|<macro|Wigner distribution>>

    <assign|gf|<macro|Gabor frame>>

    <assign|frop|<macro|frame operator>>

    <assign|gfrop|<macro|Gabor frame operator>>

    <assign|coeff|<macro|coefficient>>

    <assign|repr|<macro|representation>>

    <assign|rb|<macro|Riesz basis>>

    <assign|mdl|<macro|modulation>>

    <assign|distr|<macro|distribution>>

    <assign|modsp|<macro|modulation space>>

    <assign|psdo|<macro|pseudodifferential operator>>

    <assign|hei|<macro|Heisenberg group>>

    <assign|rep|<macro|representation>>

    <assign|ha|<macro|harmonic analysis>>

    <assign|lcg|<macro|locally compact group>>

    <assign|lcal|<macro|locally compact abelian>>

    <assign|srep|<macro|Schrödinger representation>>

    <assign|svn|<macro|Stone--von Neumann theorem>>

    <assign|iur|<macro|irreducible unitary representation>>

    <assign|gs|<macro|Gabor system>>

    <assign|zt|<macro|Zak transform>>

    <assign|blt|<macro|Balian--Low theorem>>

    <assign|wb|<macro|Wilson bas>>

    <assign|ws|<macro|Wilson system>>

    <assign|wt|<macro|wavelet transform>>

    <assign|wth|<macro|wavelet theory>>

    <assign|gex|<macro|Gabor expansion>>

    <assign|wl|<macro|Wiener's lemma>>

    <assign|opal|<macro|operator algebra>>

    <assign|trpo|<macro|trigonometric polynomial>>

    <assign|op|<macro|operator>>

    <assign|pde|<macro|partial differential equation>>

    <assign|knc|<macro|Kohn--Nirenberg correspondence>>

    <assign|fre|<macro|frequency>>

    <new-theorem|tm|Theorem>

    <new-theorem|exmp|Example>

    <new-theorem|exmps|Examples>

    <new-theorem|alg|Algorithm>

    <new-theorem|rems|Remarks>

    <assign|beqa|<macro|>>

    <assign|eeqa|<macro|>>

    <assign|*|<macro|<supp>>>

    <assign|*|<macro|<essupp>>>

    <assign|*|<macro|<essinf>>>

    <assign|*|<macro|<opl>>>

    <assign|field|<macro|1|<with|math-font|Bbb|<arg|1>>>>

    <assign|bR|<macro|<field|R>>>

    <assign|bN|<macro|<field|N>>>

    <assign|bZ|<macro|<field|Z>>>

    <assign|bC|<macro|<field|C>>>

    <assign|bQ|<macro|<field|Q>>>

    <assign|bT|<macro|<field|T>>>

    <assign|bH|<macro|<field|H>>>

    <assign|mylistlabel|<macro|1|<arg|1><htab|0pt>>>

    <newenvironment*|mylist|1| >

    <assign|Hr|<macro|<bH><space|0.17em> <rsub|r>>>

    <assign|bh|<macro|<math-bf|h>>>

    <assign|arro|<macro|<math|\<Rightarrow\>>>>

    <assign|al|<macro|\<alpha\>>>

    <assign|be|<macro|\<beta\>>>

    <assign|ga|<macro|\<gamma\>>>

    <assign|Ga|<macro|\<Gamma\>>>

    <assign|de|<macro|\<delta\>>>

    <assign|De|<macro|\<Delta\>>>

    <assign|la|<macro|\<lambda\>>>

    <assign|La|<macro|\<Lambda\>>>

    <assign|vp|<macro|\<varphi\>>>

    <assign|ve|<macro|\<varepsilon\>>>

    <assign|e|<macro|\<epsilon\>>>

    <assign|ka|<macro|\<kappa\>>>

    <assign|om|<macro|\<omega\>>>

    <assign|Om|<macro|\<Omega\>>>

    <assign|si|<macro|\<sigma\>>>

    <assign|Si|<macro|\<Sigma\>>>

    <assign|cF|<macro|\<cal-F\>>>

    <assign|cS|<macro|\<cal-S\>>>

    <assign|cD|<macro|\<cal-D\>>>

    <assign|cH|<macro|\<cal-H\>>>

    <assign|cB|<macro|\<cal-B\>>>

    <assign|cG|<macro|\<cal-G\>>>

    <assign|cM|<macro|\<cal-M\>>>

    <assign|cK|<macro|\<cal-K\>>>

    <assign|cU|<macro|\<cal-U\>>>

    <assign|cA|<macro|\<cal-A\>>>

    <assign|cE|<macro|\<cal-E\>>>

    <assign|cJ|<macro|\<cal-J\>>>

    <assign|cI|<macro|\<cal-I\>>>

    <assign|cC|<macro|\<cal-C\>>>

    <assign|cW|<macro|\<cal-W\>>>

    <assign|cO|<macro|\<cal-O\>>>

    <assign|cN|<macro|\<cal-N\>>>

    <assign|cP|<macro|\<cal-P\>>>

    <assign|cR|<macro|\<cal-R\>>>

    <assign|cT|<macro|\<cal-T\>>>

    <assign|cX|<macro|\<cal-X\>>>

    <assign|cZ|<macro|\<cal-Z\>>>

    <assign|a|<macro|\<aleph\>>>

    <assign|fhat|<macro|<wide|f|^>>>

    <assign|hg|<macro|<wide|g|^>>>

    <assign|bg|<macro|<wide|g|\<bar\>>>>

    <assign|hvp|<macro|<wide|<vp>|^>>>

    <assign|wh|<macro|1|<wide|<arg|1>|^>>>

    <assign|tW|<macro|<wide|W|~>>>

    <assign|tif|<macro|<wide|f|~>>>

    <assign|tig|<macro|<wide|g|~>>>

    <assign|tih|<macro|<wide|h|~>>>

    <assign|tz|<macro|<wide|\<zeta\>|~>>>

    <assign|Lac|<macro|\<Lambda\><rsup|\<circ\>>>>

    <assign|vgf|<macro|V<rsub|g>f>>

    <assign|cano|<macro|<rsup|\<circ\>>>>

    <assign|rd|<macro|<bR><rsup|d>>>

    <assign|cd|<macro|<bC><rsup|d>>>

    <assign|rdd|<macro|<bR><rsup|2d>>>

    <assign|zdd|<macro|<bZ><rsup|2d>>>

    <assign|ellzd|<macro|\<ell\><rsup|1>(<zd>)>>

    <assign|lr|<macro|L<rsup|2>(<bR>)>>

    <assign|lrd|<macro|L<rsup|2>(<rd>)>>

    <assign|lrdd|<macro|L<rsup|2>(<rdd>)>>

    <assign|zd|<macro|<bZ><rsup|d>>>

    <assign|td|<macro|<bT><rsup|d>>>

    <assign|mvv|<macro|M<rsub|v><rsup|1>>>

    <assign|intrd|<macro|<big|int><rsub|<rd>>>>

    <assign|intrdd|<macro|<big|int><rsub|<rdd>>>>

    <assign|intcd|<macro|<big|int><rsub|<cd>>>>

    <assign|infint|<macro|<big|int><rsub|-\<infty\>><rsup|\<infty\>>>>

    <assign|dint|<macro|<big|int><space|-0.17em><space|-0.17em><space|-0.17em><big|int>>>

    <assign|L|<macro|<left|(>>>

    <assign|R|<macro|<right|)>>>

    <assign|l|<macro|\<langle\>>>

    <assign|r|<macro|\<rangle\>>>

    <assign|\<|<macro|<left|\<less\>>>>

    <assign|\>|<macro|<right|\<gtr\>>>>

    <assign|ra|<macro|\<rightarrow\>>>

    <assign|lra|<macro|\<longrightarrow\>>>

    <assign|Lra|<macro|\<Longrightarrow\>>>

    <assign|Llra|<macro|\<Longleftrightarrow\>>>

    <assign|lms|<macro|\<longmapsto\>>>

    <assign|sset|<macro|\<subset\>>>

    <assign|sseq|<macro|\<subseteq\>>>

    <assign|IN|<macro|<space|-0.17em>\<in\><space|-0.17em>>>

    <assign|hats|<macro|<space|-0.17em><move|^|0pt|.6ex>>>

    <assign|prt|<macro|\<partial\>>>

    <assign|absl|<macro|<left|lvert>>>

    <assign|absr|<macro|<right|rvert>>>

    <assign|tamb|<macro|T<rsub|<al>k>M<rsub|<be>n>>>

    <assign|mbta|<macro|M<rsub|<be>n>T<rsub|<al>k>>>

    <assign|dsum|<macro|<below|<big|sum><space|-0.17em><big|sum>|k,n
    \<in\><zd>>>>

    <assign|lnsum|<macro|<below|<big|sum><space|-0.17em><big|sum>|l,n
    \<in\><zd>>>>

    <assign|invbe|<macro|<frac|1|<be>>>>

    <assign|inval|<macro|<frac|1|<al>>>>

    <assign|inv|<macro|<rsup|-1>>>

    <assign|ud|<macro|<space|0.17em> <math-up|d>>>

    <assign|bks|<macro|\<backslash\>>>

    <assign|nat|<macro|<space|0.17em>\<natural\><space|0.17em>>>

    <assign|intqa|<macro|<big|int><rsub|Q<rsub|1/<al>>>>>

    <assign|mv|<macro|M<rsub|v><rsup|1>>>

    <assign|alp|<macro|<tfrac|\<alpha\>|p><space|0.17em>>>

    <assign|zaa|<macro|Z<rsub|\<alpha\>>>>

    <assign|Lmpq|<macro|L<rsub|m><rsup|p,q>>>

    <assign|lmpq|<macro|\<ell\><rsub|<wide|m|~>><rsup|p,q>>>

    <assign|ltmpq|<macro|\<ell\><rsub|<wide|m|~>><rsup|p,q>>>

    <assign|Mmpq|<macro|M<rsub|m><rsup|p,q>>>

    <assign|phas|<macro|(x,\<omega\>)>>

    <assign|Hpol|<macro|<bH><space|0.17em> <rsup|pol>>>

    <assign|sgg|<macro|S<rsub|g,g>>>

    <assign|qed|<macro|<htab|0pt><rule|7pt|8pt> .2truein>>

    <assign|abs|<macro|1|\<lvert\><arg|1>\<rvert\>>>

    <assign|norm|<macro|1|\<lVert\><arg|1>\<rVert\>>>

    <assign|tp|<macro|totally positive>>

    <assign|lpc|<macro|Laguerre-Polya class>>

    <assign|pff|<macro|Polya frequency function>>
  </hide-preamble>

  <doc-data|<doc-title|Schoenberg's Theory of Totally Positive Functions and
  the Riemann Zeta Function>|<doc-date|>|<doc-author|<author-data|<author-name|Karlheinz
  Gröchenig>|<author-email|karlheinz.groechenig@univie.ac.at>|<\author-affiliation>
    Faculty of Mathematics

    University of Vienna

    Oskar-Morgenstern-Platz 1

    A-1090 Vienna, Austria
  </author-affiliation>|<author-note|K. G. was supported in part by the
  project P31887-N32 of the Austrian Science Fund (FWF)>>>>

  <abstract-data|<\abstract>
    We review Schoenberg's characterization of totally positive functions and
    its connection to the Laguerre-Polya class. This characterization yields
    a new condition that is equivalent to the truth of the Riemann
    hypothesis.
  </abstract>>

  In a series of papers in the 1950s Schoenberg investigated the properties
  of <tp> functions<nbsp><cite|CS66|sch47|Sch50|sch51|SW53>. He found several
  characterizations and used total positivity to prove fundamental properties
  of splines<nbsp><cite|SW53|Sch73>. The purpose of this note is to survey
  some aspects of Schoenberg's work on <tp> functions, to advertize the
  connection between <tp> functions and the Riemann hypothesis, and to
  provide some mathematical entertainment.

  One may speculate whether Schoenberg himself thought about the Riemann zeta
  function. He was the son-in-law of the eminent number theorist Edmund
  Landau, he collaborated with Polya, he knew deeply the work of Polya and
  Schur about the <lpc> of entire functions that remains influential in the
  study of the Riemann hypothesis. Yet, to my knowledge, he never mentioned
  any number theory in his work on <tp> functions and splines; by the same
  token, Schoenberg's name is not mentioned in analytic number theory.

  <vspace*|3mm><em|Totally positive functions.> A measurable function
  <math|\<Lambda\>> on <math|<bR>> is <tp>, if for every <math|n\<in\><bN>>
  and every two sets of increasing numbers
  <math|x<rsub|1>\<less\>x<rsub|2>\<less\>\<ldots\>\<less\>x<rsub|n>> and
  <math|y<rsub|1>\<less\>y<rsub|2>\<less\>\<ldots\>\<less\>y<rsub|n>> the
  matrix <math|<around*|(|\<Lambda\>*<around|(|x<rsub|j>-y<rsub|k>|)>|)><rsub|j,k=1,\<ldots\>,n>>
  has non-negative determinant:

  <\equation>
    <label|eq:1>det <around*|(|\<Lambda\>*<around|(|x<rsub|j>-y<rsub|k>|)>|)><rsub|j,k=1,\<ldots\>,n>\<geq\>0
  </equation>

  If in addition <math|\<Lambda\>> is integrable, then <math|\<Lambda\>> is
  called a Polya frequency function.

  If <math|\<Lambda\>> is <tp> and not equal to <math|e<rsup|a*x+b>>, there
  exist an exponential <math|e<rsup|c*x>>, such that
  <math|\<Lambda\><rsub|1><around|(|x|)>=e<rsup|c*x>*\<Lambda\><around|(|x|)>>
  is a <pff>, i.e., <math|\<Lambda\><rsub|1>> is <tp> and
  integrable<nbsp><cite-detail|sch51|Lemma<nbsp>4>. It is usually no loss of
  generality to restrict to <pff>s.

  The class of <tp> functions played and plays an important role in
  approximation theory, in particular in spline theory<nbsp><cite|SW53>, and
  in statistics<nbsp><cite|Efr65|karlin>. In a different and rather
  surprising direction, <tp> functions appear in the representation theory of
  infinite dimensional motion groups<nbsp><cite|Pick91>. Recently, <tp>

  functions appeared in sampling theory and in <tfa> <cite|GS13|GRS18|GRS20>,
  where they were instrumental in the derivation of optimal results.

  <vspace*|3mm><em|The Laguerre-Polya class.> An entire function
  <math|\<Psi\>> of order at most <math|2> belongs to the Laguerre-Polya
  class, if its Hadamard factorization is of the form

  <\equation>
    <label|eq:2>\<Psi\><around|(|s|)>=C*s<rsup|m>*e<rsup|-\<gamma\>*s<rsup|2>+\<delta\>*s>*<space|0.17em><big|prod><rsub|j=1><rsup|\<infty\>><around|(|1+\<delta\><rsub|j>*s|)>*e<rsup|-\<delta\><rsub|j>*s>*<space|2em>s\<in\><bC><space|0.17em>
  </equation>

  where <math|\<delta\><rsub|j><inv>\<in\><bR>> are the zeros of
  <math|\<Psi\>>, <math|m> is the order of the zero at <math|0>,
  <math|\<gamma\>\<geq\>0>, <math|\<delta\>\<in\><bR>>, and

  <\equation>
    <label|eq:3>0\<less\>\<gamma\>+<big|sum><rsub|j=1><rsup|\<infty\>>\<delta\><rsub|j><rsup|2>\<less\>\<infty\><space|0.17em>
  </equation>

  Thus the <lpc> consists of entire functions of order two with convergence
  exponent two with only real zeros. While the study of the distribution of
  zeros of entire functions is a perennial topic in complex analysis and of
  interest in its own right<nbsp><cite|Levin80>, the <lpc> has gained special
  prominence in analytic number theory: the Riemann hypothesis says that a
  relative of the Riemann zeta function belongs to the <lpc>.

  <vspace*|3mm><em|Schoenberg's characterization of <tp> functions.> The
  fundamental results about <tp> functions were derived by Schoenberg in a
  series of papers<nbsp><cite|sch47|Sch50|sch51|SW53>. A comprehensive
  treatment is contained in Karlin's monograph<nbsp><cite-detail|karlin|Ch.<nbsp>7>.

  The notions of <tp> functions and <lpc> are seemingly unrelated, yet there
  is a deep connection between them through the following characterization of
  Schoenberg<nbsp><cite|sch51>.

  <\tm>
    <label|tm:tp>(i) If <math|\<Lambda\>> is a Polya frequency function, then
    its (two-sided) Laplace transform converges in a vertical strip
    <math|<around|{|z\<in\><bC>:\<alpha\>\<less\><math-up|Re><space|0.17em>z\<less\>\<beta\>|}>,\<alpha\>\<less\>0\<less\>\<beta\>>,
    and

    <\equation>
      <label|eq:5><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Lambda\><around|(|x|)>*e<rsup|-s*x>*<space|0.17em>d*x=<frac|1|\<Psi\><around|(|s|)>>
    </equation>

    is the reciprocal of a function <math|\<Psi\>> in the <lpc> with
    <math|\<Psi\><around|(|0|)>\<gtr\>0>.

    (ii) Conversely, if <math|\<Psi\>> is in the <lpc> with
    <math|\<Psi\><around|(|0|)>\<gtr\>0>, then its reciprocal
    <math|1/\<Psi\>> is the Laplace transform of a Polya frequency function
    <math|\<Lambda\>>.
  </tm>

  This is a fascinating theorem, because it relates two function classes that
  seem to bear absolutely no resemblance to each other. Schoenberg's theorem
  establishes a bijection between the class of <pff>s, the <lpc>, and yields
  a parametrization by the set <math|<around|(|0,\<infty\>|)>\<times\><bR>\<times\>\<ell\><rsup|2><around|(|<bZ>|)>>.

  By using the Fourier transform instead of the Laplace transform,
  Schoenberg's theorem can be recast as follows: A function <math|\<Lambda\>>
  is <tp> and integrable, <fif> its Fourier transform possesses the
  factorization

  <\equation>
    <label|eq:6><wide|\<Lambda\>|^><around|(|\<tau\>|)>=C*e<rsup|-\<gamma\>*\<tau\><rsup|2>+2*\<pi\>*i*\<delta\>*\<tau\>>*<space|0.17em><big|prod><rsub|j=1><rsup|\<infty\>><around|(|1+2*\<pi\>*i*\<delta\><rsub|j>*\<tau\>|)><inv>e<rsup|2*\<pi\>*i*\<delta\><rsub|j>*\<tau\>>
  </equation>

  where <math|C\<gtr\>0>, <math|\<gamma\>\<geq\>0>,
  <math|\<delta\>,\<delta\><rsub|j>\<in\><bR>> and
  <math|<big|sum><rsub|j=1><rsup|\<infty\>>\<delta\><rsub|j><rsup|2>\<less\>\<infty\>>
  (and the product in <eqref|eq:6> may also be finite).

  If we drop the condition of integrability and exclude exponential
  functions, then the representation <eqref|eq:6> still holds for every <tp>
  function, but their Laplace transform of <math|\<Lambda\>> converges in
  some vertical strip <math|<around|{|z\<in\><bC>:\<alpha\>\<less\><math-up|Re><space|0.17em>z\<less\>\<beta\>|}>>
  that does not contain <math|0>.

  A similar result holds for one-sided <tp>
  functions<nbsp><cite-detail|sch51|Thm.<nbsp>2>.

  <\tm>
    <label|tm:onesided>(i) If <math|\<Lambda\>> is a Polya frequency function
    with support in <math|<around|[|0,\<infty\>|)>>, then its Laplace
    transform converges in a half-plane <math|<around|{|z\<in\><bC>:-\<alpha\>\<less\><math-up|Re><space|0.17em>z|}>,\<alpha\>\<gtr\>0>,
    and

    <\equation>
      <label|eq:5><big|int><rsub|0><rsup|\<infty\>>\<Lambda\><around|(|x|)>*e<rsup|-s*x>*<space|0.17em>d*x=<frac|1|\<Psi\><around|(|s|)>>
    </equation>

    is the reciprocal of an entire function <math|\<Psi\>> with Hadamard
    factorization

    <\equation>
      <label|eq:ne1>\<Psi\><around|(|s|)>=C*e<rsup|\<delta\>*s>*<big|prod><rsub|j=1><rsup|\<infty\>><around|(|1+\<delta\><rsub|j>*s|)><space|0.17em>,
    </equation>

    with <math|\<delta\>\<in\><bR>,\<delta\><rsub|j>\<geq\>0,<big|sum>\<delta\><rsub|j>\<less\>\<infty\>>.

    (ii) Conversely, if <math|\<Psi\>> possesses the factorization
    <eqref|eq:ne1>, then its reciprocal <math|1/\<Psi\>> is the Laplace
    transform of a Polya frequency function <math|\<Lambda\>> with support in
    <math|<around|[|0,\<infty\>|)>>.
  </tm>

  <vspace|3mm>

  <em|Elementary examples.> If <math|<wide|\<Lambda\>|^><around|(|\<tau\>|)>=<around|(|1+2*\<pi\>*i*\<delta\>*\<tau\>|)><inv>>,
  then <math|\<Lambda\><around|(|x|)>=\<delta\><inv>e<rsup|-x/\<delta\>>*\<chi\><rsub|<around|[|0,\<infty\>|)>><around|(|x|)>>
  is the one-sided exponential function. For
  <math|<wide|\<Lambda\>|^><around|(|\<tau\>|)>=e<rsup|-\<pi\>*\<gamma\>*\<tau\><rsup|2>>>
  for <math|\<gamma\>\<gtr\>0>, we obtain the Gaussian
  <math|\<Lambda\><around|(|x|)>=\<gamma\><rsup|-1/2>*e<rsup|-\<pi\>*x<rsup|2>/\<gamma\>>>.
  In both cases, it is easy to check directly that these functions are <tp>.

  <vspace*|3mm>The proof of the implication (ii) of
  Theorem<nbsp><reference|tm:tp> is based on the (non-trivial) fact that the
  convolution <math|\<Lambda\>=\<Lambda\><rsub|1>\<ast\>\<Lambda\><rsub|2>>
  of two <pff>s <math|\<Lambda\><rsub|1>,\<Lambda\><rsub|2>> is again a
  <pff>. The converse in Theorem<nbsp><reference|tm:tp> lies much deeper, and
  Schoenberg used heavily several results of Polya about functions in the
  <lpc><nbsp><cite|Pol15|PS1914>. See the end of this note for the essential
  step of the argument.

  Schoenberg's motivation was the characterization and deeper understanding
  of <tp> functions, and thus the implication (i) and the factorization
  <eqref|eq:6> can be considered his main insight about <tp> functions.
  However, instead of reading Schoenberg's theorem as a characterization of
  <tp> functions, one may read it as a characterization of the <lpc>. <em|A
  function <math|\<Psi\>> with <math|\<Psi\><around|(|0|)>\<gtr\>0> and
  <math|\<Psi\>\<neq\>e<rsup|a*s+b>> is in the <lpc>, <fif> the Fourier
  transform of <math|1/\<Psi\>> is a <pff>.>

  <vspace*|3mm><em|The Riemann hypothesis and <tp> functions.> Let
  <math|\<zeta\><around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-s>>
  for <math|s\<in\><bC>,<math-up|Re><space|0.17em>s\<gtr\>1>, be the Riemann
  zeta function and let

  <\align>
    <tformat|<table|<row|<cell|\<xi\><around|(|s|)>>|<cell|=<tfrac|1|2>s*<around|(|s-1|)>*\<pi\><rsup|-s/2>*\<Gamma\><around*|(|<frac|s|2>|)>*<space|0.17em>\<zeta\><around|(|s|)><eq-number><label|eq:6b>>>|<row|<cell|\<Xi\><around|(|s|)>>|<cell|=\<xi\>*<around*|(|<frac|1|2>+i*s|)><eq-number><label|eq:7>>>>>
  </align>

  be the Riemann xi-functions (where <math|\<Gamma\>> is the usual gamma
  function). Then the functional equation for the Riemann zeta function is
  expressed by the symmetry

  <\equation>
    <label|eq:8>\<xi\><around|(|s|)>=\<xi\>*<around|(|1-s|)>*<space|2em><text|and
    ><space|2em>\<Xi\><around|(|s|)>=\<Xi\>*<around|(|-s|)>
  </equation>

  for the xi-functions.

  The Riemann hypothesis conjectures that all non-trivial zeros of the zeta
  function lie on the critical line <math|1/2+i*t>. See the
  monographs<nbsp><cite|Iwa14|Ivi03|Tit86>, the two volumes about equivalents
  of the Riemann hypothesis<nbsp><cite|Br17-1|Br17-2> or the survey
  articles<nbsp><cite|Bom10|Conrey03>.

  Expressed in terms of the xi-functions, the Riemann hypothesis states that
  <math|\<Xi\>> has only real zeros, in other words, <em|<math|\<Xi\>>
  belongs to the <lpc>.> Thus many investigations of the zeta function
  involve complex analysis related to the <lpc>. Schoenberg's theorem
  immediately leads to the following equivalent condition for the Riemann
  hypothesis to hold.

  <\tm>
    <label|tm:equi1>The Riemann hypothesis holds, <fif> there exists a <pff>
    <math|\<Lambda\>>, such that

    <\equation>
      <label|eq:9><frac|1|\<Xi\><around|(|s|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Lambda\><around|(|x|)>*e<rsup|-s*x>*<space|0.17em>d*x*<space|2em>\<forall\>s\<in\><bC>,<around|\||<math-up|Re><space|0.17em>s|\|>\<less\>t<rsub|0><space|0.17em>
    </equation>

    where <math|1/2+i*t<rsub|0>> is the first zero of the zeta function on
    the critical line.
  </tm>

  Let us make this statement a bit more explicit by taking the Fourier
  transform instead of the Laplace transform.

  <\tm>
    <label|tm:equi2>The Riemann hypothesis holds, <fif>

    <\equation>
      <with|font-base-size|14|<label|eq:10>\<Lambda\><around|(|x|)>=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-i*x*\<tau\>>|\<xi\>*<around|(|<tfrac|1|2>+\<tau\>|)>>**<space|0.17em>d*\<tau\>|2*\<pi\>>*>
    </equation>

    is a Polya frequency function.
  </tm>

  The growth of <math|\<xi\>> in the complex plane is<nbsp><cite|Tit86>
  <math|<around|\||\<xi\><around|(|s|)>|\|>=<cO><around*|(|e<rsup|A<around|\||s|\|>*ln
  <around|\||s|\|>>|)><space|0.17em>>, and on the positive real line

  <\equation>
    ln \<xi\><around|(|\<sigma\>|)>\<asymp\><tfrac|1|2>\<sigma\>*log
    \<sigma\>*<space|2em>\<sigma\>\<gtr\>1
  </equation>

  Consequently <math|<frac|1|\<xi\><around|(|\<sigma\>|)>>\<leq\>C*e<rsup|-<around|\||\<sigma\>|\|>*log
  <around|\||\<sigma\>|\|>/2>> decays super-exponentially. Since
  <math|\<zeta\>> and thus <math|\<xi\>> do not have any real zeros in the
  interval <math|<around|[|0,1|]>> and <math|\<zeta\>\<gtr\>0> on
  <math|<around|(|1,\<infty\>|)>>, the function <math|\<xi\>> is therefore
  strictly positive on <math|<bR>> and <math|1/\<xi\>> is integrable. Thus
  its Fourier transform is well-defined.

  Using <math|s=2*\<pi\>*i*\<tau\>>, we can rewrite <eqref|eq:9> as a Fourier
  transform. The inversion formula for the Fourier transform now yields

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Lambda\><around|(|x|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|2*\<pi\>*i*x*\<tau\>>|\<Xi\>*<around|(|2*\<pi\>*i*\<tau\>|)>>**<space|0.17em>d*\<tau\>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|2*\<pi\>*i*x*\<tau\>>|\<xi\>*<around*|(|<frac|1|2>-2*\<pi\>*\<tau\>|)>>**<space|0.17em>d*\<tau\><space|0.17em>>>|<row|<cell|>|<cell|=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-i*x*\<tau\>>|\<xi\>*<around|(|<tfrac|1|2>+\<tau\>|)>>**<space|0.17em>d*\<tau\>|2*\<pi\>>>>>>>
  </equation>

  which is <eqref|eq:10>.

  <vspace*|3mm>Using the symmetry of <math|\<Xi\>>, there is an alternative
  formulation of Theorem<nbsp><reference|tm:equi1> with the restricted <lpc>
  defined in <eqref|eq:ne1>. Since <math|\<Xi\>> is symmetric, it can be
  written as <math|\<Xi\><around|(|s|)>=\<Xi\><rsub|1>*<around|(|-s<rsup|2>|)>>
  for an entire function <math|\<Xi\><rsub|1>> of order <math|1/2>.
  Furthermore, <math|\<Xi\>> has only real zeros, <fif> <math|\<Xi\><rsub|1>>
  has only negative zeros (with convergence exponent at most <math|1>). The
  characterization of one-sided <pff>s yields the following equivalence.

  <\tm>
    <label|tm:ones>The Riemann hypothesis holds, <fif> there exists a <pff>
    <math|\<Lambda\>> with support in <math|<around|[|0,\<infty\>|)>>, such
    that

    <\equation>
      <label|eq:9><frac|1|\<Xi\><rsub|1><around|(|s|)>>=<big|int><rsub|0><rsup|\<infty\>>\<Lambda\><around|(|x|)>*e<rsup|-s*x>*<space|0.17em>d*x*<space|2em><text|\<forall\>>s\<in\><bC>,<math-up|Re><space|0.17em>s\<gtr\>\<alpha\>
    </equation>

    for some <math|\<alpha\>\<less\>0>.
  </tm>

  These equivalences seem to be new. Schoenberg's name is not even mentioned
  in <nbsp><cite|Br17-1|Br17-2> on equivalents of the Riemann hypothesis.

  It is interesting that the characterization of
  Theorem<nbsp><reference|tm:equi2> is \Porthogonal\Q to most research on
  <math|\<zeta\>> and to the well-known criteria for the Riemann hypothesis.
  Theorem<nbsp><reference|tm:equi2> requires only <em|the values of
  <math|\<zeta\>> on the real line> to probe the secrets of <math|\<zeta\>>
  in the critical strip. This fact is remarkable, but the price to pay is the
  added difficulty to extract any meaningful statements about <math|\<xi\>>
  on the critical strip from its restriction to <math|<bR>>. This seems much
  harder, if not impossible.

  To work with Theorem<nbsp><reference|tm:equi2>, one would need a viable
  expression for the Fourier-Laplace transform of <math|1/\<xi\>>, but there
  seems to be none. The <math|1>-positivity in <eqref|eq:1> says that
  <math|\<Lambda\>\<geq\>0>, which is equivalent to the Fourier transform
  <math|<wide|\<Lambda\>|^>=1/\<xi\>> to be positive definite by Bochner's
  theorem. Explicitly, we would need to know that, for all choices of
  <math|c<rsub|j>\<in\><bC>,\<tau\><rsub|j>\<in\><bR>,j=1,\<ldots\>,n>, and
  all <math|n\<in\><bN>>, we have <math|<big|sum><rsub|j,k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<xi\>*<around|(|<tfrac|1|2>+\<tau\><rsub|j>-\<tau\><rsub|k>|)><inv>\<geq\>0>.
  Not even this property of <math|1/\<xi\>> seems to be known. It is
  therefore unlikely that much is gained by
  Theorems<nbsp><reference|tm:equi1> \U <reference|tm:ones>.

  By contrast, the Fourier transform of <math|\<Xi\><around|(|x|)>> on the
  critical line (!) was already known to Riemann
  (see<nbsp><cite-detail|Tit86|2.16.1>) and is the starting point of a
  program to prove the Riemann hypothesis that goes back to
  Polya<nbsp><cite|Pol26>. After important work of de Bruijn, Hejhal, and
  Newman this line of thought has recently culminated in the resolution of
  the Newman conjecture by Rodgers and Tao<nbsp><cite|RT20>.

  <vspace*|3mm><em|Some non-trivial <pff>s.> Perhaps Schoenberg had also the
  Riemann hypothesis in mind, when he investigated Polya frequency functions.
  The examples in<nbsp><cite|sch47|sch51> of <tp> functions smell of the zeta
  function.

  (i) The zero set <math|<around|{|0,-1,-2,\<ldots\>|}>> with multiplicity
  one yields the entire function

  <\equation>
    <label|eq:n1>\<Psi\><around|(|s|)>=e<rsup|\<gamma\>*s>*s*<big|prod><rsub|n=1><rsup|\<infty\>><around|(|1+<frac|s|n>|)>*<space|0.17em>e<rsup|-s/n><space|0.17em>
  </equation>

  where <math|\<gamma\>> is the Euler constant. By a classical result
  <math|\<Psi\>> is the reciprocal of the <math|\<Gamma\>>-function
  <math|\<Gamma\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s-1>*e<rsup|-x>*<space|0.17em>d*x>.
  Consequently, the Laplace transform of <math|\<Psi\><around|(|s|)><inv>=\<Gamma\><around|(|s|)>>
  is a <tp> function. Indeed, using the substitution <math|x=e<rsup|-t>> in
  the definition of <math|\<Gamma\>>, one obtains

  <\equation>
    <label|eq:n2>\<Gamma\><around|(|s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-e<rsup|-x>>*e<rsup|-s*x>*<space|0.17em>d*x<space|0.17em><space|2em><math-up|Re><space|0.17em>s\<gtr\>0<space|0.17em>
  </equation>

  Theorem<nbsp><reference|tm:tp> implies that

  <\equation*>
    \<Lambda\><around|(|x|)>=e<rsup|-e<rsup|-x>>
  </equation*>

  is <tp>. By removing the pole of <math|\<Gamma\>> at <math|0>, we obtain
  <math|\<forall\><math-up|Re>s\<gtr\>-1>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|s*\<Gamma\><around|(|s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Lambda\><rprime|'><around|(|x|)>*e<rsup|-s*x>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-x>*<space|0.17em>e<rsup|-e<rsup|-x>>*e<rsup|-s*x>*<space|0.17em>d*x<space|0.17em>>>>>>
  </equation>

  Consequently

  <\equation>
    \<Lambda\><rsub|1><around|(|x|)>=e<rsup|-x-e<rsup|-x>>
  </equation>

  \ is a <pff>.

  (ii) The zero set <math|<bZ>> with simple zeros yields

  <\equation>
    \<Psi\><around|(|s|)>=<frac|sin \<pi\>*s|\<pi\>>
  </equation>

  . By Theorem<nbsp><reference|tm:tp>, <math|1/\<Psi\>> is the Laplace
  transform of a <tp> function on a suitable strip of convergence.
  Schoenberg's calculation yields the <tp> function

  <\equation>
    \<Lambda\><around|(|x|)>=<frac|1|1+e<rsup|-x>><space|0.17em>
  </equation>

  (iii) Finally the zero set <math|<around|{|-n<rsup|2>:n\<in\><bN>|}>>
  yields the entire function

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Psi\><around|(|s|)>>|<cell|=s*<big|prod><rsub|n=1><rsup|\<infty\>><around|(|1+<frac|s|n<rsup|2>>|)>>>|<row|<cell|>|<cell|=-<frac|1|\<pi\>>*<sqrt|-s>*sin
    \<pi\>*<sqrt|-s><space|0.17em>>>>>>
  </equation>

  The associated <tp> function is the Jacobi theta function

  <\equation>
    \<Lambda\><around|(|x|)>=<choice|<tformat|<table|<row|<cell|<big|sum><rsub|j=-\<infty\>><rsup|\<infty\>><around|(|-1|)><rsup|j>*e<rsup|-j<rsup|2>*x>>|<cell|<text|for
    >x\<gtr\>0>>|<row|<cell|0>|<cell|<text|for >x\<leq\>0<space|0.17em>>>>>>
  </equation>

  All three functions show up prominently in the treatment of the functional
  equation of the zeta function: <math|\<Gamma\>> is contained in the
  definition of the xi-function, <math|sin> in the formulation of the
  functional equation, and a Jacobi theta function is used in several proofs
  of the functional equation (Riemann's original proof,
  see<nbsp><cite|Tit86>).

  <vspace*|3mm><em|Intrinsic characterization of <pff>s.> The fundamental
  property of <pff>s is their smoothing property or <em|variation diminishing
  property>. The relevance of smoothing properties for many applications is
  outlined in Schoenberg's survey<nbsp><cite|Sch53>. In this context the
  variation of a real-valued function on <math|<bR>> is measured either by
  the number of sign changes or by the number of <em|real> zeros. Formally,
  given <math|f:<bR>\<to\><bR>> let

  <\equation>
    <label|eq:v1>v<around|(|f|)>=max #<around|{|n\<in\><bN>:\<exists\>x<rsub|j>\<in\><bR>,x<rsub|0>\<less\>x<rsub|1>\<less\>\<ldots\>\<less\>x<rsub|n>*<text|with
    >f<around|(|x<rsub|j>|)>*f<around|(|x<rsub|j+1>|)>\<less\>0|}><space|0.17em>,
  </equation>

  and let <math|N<around|(|f|)>> be the number of <em|real> zeros of <math|f>
  counted with multiplicity.

  Given a function <math|\<Lambda\>>, let <math|T<rsub|\<Lambda\>>> be the
  convolution operator <math|T<rsub|\<Lambda\>>*f=f\<ast\>\<Lambda\>>.
  Schoenberg's second characterization of <pff>s is as
  follows<nbsp><cite|Sch50>.

  <\tm>
    <label|tm:vd>Let <math|\<Lambda\>> be integrable and continuous. Then
    <math|\<Lambda\>> is variation diminishing, i.e.,

    <\equation*>
      v*<around|(|T<rsub|\<Lambda\>>*f|)>\<leq\>v<around|(|f|)>
    </equation*>

    for all functions that are locally Riemann integrable, <fif> either
    <math|\<Lambda\>> or <math|-\<Lambda\>> is a <pff>.
  </tm>

  This characterization is \Pintrinsic\Q in the sense that it uses only the
  properties of the matrices occurring in the definition <eqref|eq:1> of
  total positivity.

  With a perturbation argument one can replace sign changes with zeros and
  obtains the following consequence.

  <\corollary>
    <label|zdim>Let <math|\<Lambda\>> be a <pff>. Then for every real-valued
    polynomial <math|p> the convolution <math|T<rsub|\<Lambda\>>> is
    zero-decreasing, i.e.,

    <\equation*>
      N*<around|(|T<rsub|\<Lambda\>>*p|)>\<leq\>N<around|(|p|)><space|0.17em>.
    </equation*>
  </corollary>

  <vspace|3mm>

  <em|Intrinsic characterizations of the <lpc>.> There are several
  characterizations of the <lpc> that require only their properties as entire
  functions. This is part of classical complex analysis and the results are
  due to Polya and Schur<nbsp><cite|Pol15|PS1914> building on work of
  Laguerre, Hadamard, and many others. These results relate the properties of
  the zero set to properties of the power series expansion of an entire
  function. Before formulating a sequence of equivalences, we note that every
  formal power series <math|F<around|(|s|)>\<sim\><big|sum><rsub|j=0><rsup|\<infty\>>a<rsub|j>*s<rsup|j>>
  yields a differential operator <math|F<around|(|D|)>*p<around|(|x|)>=<big|sum><rsub|j=0><rsup|\<infty\>>a<rsub|j>*D<rsup|j>*p<around|(|x|)>>
  with <math|D=<frac|d|d*x>>. The differential operator is well-defined at
  least on polynomials, and the mapping <math|F\<mapsto\>F<around|(|D|)>> is
  an algebra homomorphism and thus provides a simple functional calculus.

  <\tm>
    <label|tm:lpcc>Let <math|\<Psi\><around|(|s|)>=<big|sum><rsub|j=0><rsup|\<infty\>><frac|\<beta\><rsub|j>|j!>*s<rsup|j>>
    be an entire function. Then the following are equivalent:

    (i) <math|\<Psi\>> belongs to the <lpc>.

    (ii) <math|\<Psi\>> can be approximated uniformly on compact sets by
    polynomials with only real zeros.

    (iii) For all <math|n\<in\><bN>> the polynomials\ 

    <\equation>
      p<rsub|n><around|(|x|)>=<big|sum><rsub|j=0><rsup|n>\<beta\><rsub|j><binom|n|j>x<rsup|j>
    </equation>

    \ and

    <\equation>
      q<rsub|n><around|(|x|)>=<big|sum><rsub|j=0><rsup|n>\<beta\><rsub|j><binom|n|j>x<rsup|n-j>
    </equation>

    \ have only real zeros.

    (iv) If

    <\equation>
      p<around|(|x|)>=<big|sum><rsub|j=0><rsup|m>c<rsub|j>*x<rsup|j>
    </equation>

    \ is a polynomial with only real, <em|non-positive> zeros, then the
    polynomial

    <\equation>
      q<around|(|x|)>=<big|sum>\<beta\><rsub|j>*c<rsub|j>*x<rsup|j>
    </equation>

    has only real zeros.

    \;

    If, in addition, <math|\<Psi\><around|(|0|)>\<gtr\>0> and\ 

    <\equation>
      <frac|1|\<Psi\><around|(|s|)>>=<big|sum><rsub|j=0><rsup|\<infty\>><frac|\<gamma\><rsub|j>|j!>*s<rsup|j>
    </equation>

    , then the following property is equivalent to (i) -- (iv).

    (v) The transform <math|p\<mapsto\><frac|1|\<Psi\><around|(|D|)>>*p> is
    zero-decreasing, i.e., the polynomial

    <\equation>
      q<around|(|x|)>=<frac|1|\<Psi\><around|(|D|)>>
    </equation>

    <\equation>
      *p<around|(|x|)>=<big|sum><rsub|j=0><rsup|\<infty\>><frac|\<gamma\><rsub|j>|j!>*p<rsup|<around|(|j|)>><around|(|x|)>
    </equation>

    \;

    \ \ has at most as many real zeros as <math|p> (real-valued):

    <\equation>
      N*<around*|(|<frac|1|\<Psi\><around|(|D|)>>*p|)>\<leq\>N<around|(|p|)>
    </equation>
  </tm>

  Applying condition (iv) to the polynomials
  <math|x<rsup|n-1>*<around|(|1+x|)><rsup|2>>, one obtains a necessary
  condition on the Taylor coefficients of a function in the <lpc>, namely the
  so-called Turan inequalities.

  <\corollary>
    <label|turan>If\ 

    <\equation>
      \<Psi\><around|(|s|)>=<big|sum><rsub|j=0><rsup|\<infty\>><frac|\<beta\><rsub|j>|j!>*s<rsup|j>
    </equation>

    \ belongs to the <lpc>, then

    <\equation*>
      \<beta\><rsub|n><rsup|2>-\<beta\><rsub|n-1>*\<beta\><rsub|n+1>\<geq\>0*<space|2em><text|for
      all >n\<in\><bN>
    </equation*>
  </corollary>

  Applying condition (v) to polynomials of the form\ 

  <\equation>
    p<around|(|x|)>=<around*|(|<big|sum><rsub|k=1><rsup|n>a<rsub|k>*x<rsup|k>|)><rsup|2>
  </equation>

  \ and working out <math|\<Psi\><around|(|D|)><inv>p>, one obtains the
  following necessary condition for the <lpc><nbsp><cite-detail|Pol15|p.<nbsp>235>.

  <\corollary>
    <label|hankel>Assume that <math|\<Psi\>> belongs to the <lpc>,
    <math|\<Psi\><around|(|0|)>\<gtr\>0>,
    <math|\<Psi\><around|(|s|)>\<neq\>e<rsup|a*s+b>> and <math|1/\<Psi\>> has
    the Taylor expansion <math|>

    <\equation>
      <frac|1|\<Psi\><around|(|s|)>>=<big|sum><rsub|j=0><rsup|\<infty\>><frac|\<gamma\><rsub|j>|j!>*s<rsup|j>
    </equation>

    . Then for every <math|n\<in\><bN>> the <math|n\<times\>n> Hankel matrix
    <math|<around*|(|\<gamma\><rsub|j+k>|)><rsub|j,k=0,\<ldots\>,n-1>> is
    positive definite (and thus invertible).
  </corollary>

  However, the positivity of the Hankel matrices is not sufficient for
  <math|\<Psi\>> to be in the <lpc>, as was proved already by
  Hamburger<nbsp><cite|Ham20>.

  Theorem<nbsp><reference|tm:lpcc> and its corollaries are all contained in
  the seminal papers of Polya and Schur<nbsp><cite|Pol15|PS1914> from 1914
  and 1915 and have inspired a century of exciting mathematics. Each of the
  equivalent conditions in Theorem<nbsp><reference|tm:lpcc> is a point of
  departure for the study of the Riemann hypothesis.

  No list can do justice to all contributions between 1914 and 2020, so let
  us mention only a few directions whose origin is in Polya's work. Further
  references and more detailed history can be found in the cited articles.

  Condition (iii) applied to the Riemann function <math|\<Xi\>> yields an
  important equivalence of the Riemann hypothesis. The polynomials in
  condition (iii) are nowadays called Jensen polynomials. In modern language
  (iii) says that \Pthe Jensen polynomials for the Riemann function
  <math|\<Xi\><around|(|s|)>> must be hyperbolic\Q. Significant recent
  progress on this equivalence is reported in<nbsp><cite|GORZ>.

  The relations between the Jensen polynomials, the multiplier sequences of
  condition (iv), and the Turan inequalities and their generalizations have
  been studied in depth by Craven, Csordas, and
  Varga<nbsp><cite|Cso15|CC89|CV90> who found many additional equivalences to
  the Riemann hypothesis. A particular highlight is their proof that
  <math|\<Xi\>>, or rather the Taylor coefficients of
  <math|\<Xi\><around|(|<sqrt|s>|)>> satisfy the Turan
  inequalities<nbsp><cite|CNV86>, thereby resolving a 60 year old conjecture
  going back to \V Polya.

  Finally let us mention that total positivity enters the investigation of
  the <lpc> in yet another way. A entire function belongs to the restricted
  <lpc> defined by <eqref|eq:ne1>, <fif> the sequence of its Taylor
  coefficients <math|<around|(|a<rsub|n>|)>> is a Polya frequency
  <em|sequence><nbsp><cite|AS52>. This means that the infinite upper
  triangular Toeplitz matrix <math|A> with entries
  <math|A<rsub|j*k>=a<rsub|k-j>>, if <math|k\<geq\>j> and
  <math|A<rsub|j*k>=0>, if <math|k\<less\>j> has only positive minors. This
  aspect of total positivity has been used in<nbsp><cite|Kat07|Nut13> for the
  investigation of the zeta function.

  <vspace*|3mm><em|From total positivity to the <lpc>.> By comparing the two
  intrinsic characterizations in Theorems<nbsp><reference|tm:vd> and
  <reference|tm:lpcc> one may guess that the respective conditions on zero
  diminishing must play the decisive role in the proof of
  Theorem<nbsp><reference|tm:tp>(i). To give the gist of this argument, we
  cannot do better than repeat Schoenberg's beautiful argument.

  First, since <math|\<Lambda\>> is assumed to be a <pff>, <math|\<Lambda\>>
  must decay exponentially<nbsp><cite-detail|sch51|Lemma<nbsp>2>, therefore
  its moments of all orders exist. Let

  <\equation>
    \<mu\><rsub|n>=<big|int><rsub|<bR>>x<rsup|n>*\<Lambda\><around|(|x|)>*<space|0.17em>d*x
  </equation>

  be the <math|n>-th moment. By expanding the exponential

  <\equation>
    e<rsup|-s*x>=<big|sum><rsub|j=1><rsup|\<infty\>><frac|<around|(|-s|)><rsup|j>|j!>*x<rsup|j>
  </equation>

  \ we express the Laplace transform of <math|\<Lambda\>> as a power series

  <\equation>
    <label|eq:nn2><tabular|<tformat|<table|<row|<cell|<big|int><rsub|<bR>>e<rsup|-s*x>*\<Lambda\><around|(|x|)>*<space|0.17em>d*x>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|j>|j!>*s<rsup|j>\<mu\><rsub|j>*<space|0.17em>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|j>|j!>*s<rsup|j><big|int><rsub|<bR>>x<rsup|j>*\<Lambda\><around|(|x|)>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=F<around|(|s|)>>>>>>
  </equation>

  Since <math|\<Lambda\>\<nequiv\>0> and <math|\<Lambda\>\<geq\>0>, we have
  <math|F<around|(|0|)>\<gtr\>0>, and its reciprocal also possesses a power
  series expansion around <math|0> with a positive radius of convergence

  <\equation>
    \<Psi\><around|(|s|)>=<frac|1|F<around|(|s|)>>=<big|sum><rsub|j=0><rsup|\<infty\>><frac|\<beta\><rsub|j>|j!>*<space|0.17em>s<rsup|j><space|0.17em>
  </equation>

  Next, we consider the convolution of <math|\<Lambda\>> with a polynomial
  <math|p> of degree <math|N> and relate it to the moments of
  <math|\<Lambda\>>:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|q<around|(|x|)>>|<cell|=<around|(|\<Lambda\>\<ast\>p|)><around|(|x|)>>>|<row|<cell|>|<cell|=<big|int><rsub|<bR>>p*<around|(|x-t|)>*\<Lambda\><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around*|(|<big|sum><rsub|j=0><rsup|N><frac|<around|(|-t|)><rsup|j>|j!>*p<rsup|<around|(|j|)>><around|(|x|)>|)>*\<Lambda\><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|j=0><rsup|n><frac|<around|(|-1|)><rsup|j>|j!>*\<mu\><rsub|j>*<space|0.17em>p<rsup|<around|(|j|)>><around|(|x|)>>>|<row|<cell|>|<cell|=F<around|(|D|)>*p<around|(|x|)>>>>>>
  </equation>

  By Corollary<nbsp><reference|zdim> the number of real zeros of <math|q>
  (counted with multiplicity) does not exceed the number of real zeros of
  <math|p>,

  <\equation>
    <label|eq:nn3>N<around|(|q|)>=N*<around|(|F<around|(|D|)>*p|)>\<leq\>N<around|(|p|)>
  </equation>

  Using the functional calculus, we can invert <math|F<around|(|D|)>> and
  recover <math|p> from <math|q=\<Lambda\>\<ast\>p> via

  <\equation>
    <tabular|<tformat|<table|<row|<cell|p<around|(|x|)>>|<cell|=<frac|q<around|(|x|)>|F<around|(|D|)>>*>>|<row|<cell|>|<cell|=\<Psi\><around|(|D|)>>>>>>
  </equation>

  <\equation>
    *q<around|(|x|)>=<big|sum><rsub|j=0><rsup|\<infty\>><frac|\<beta\><rsub|j>|j!>*<space|0.17em>q<rsup|<around|(|j|)>><around|(|x|)><space|0.17em>
  </equation>

  For the monomial <math|q<around|(|x|)>=x<rsup|n>> we obtain the polynomial

  <\equation>
    <tabular|<tformat|<table|<row|<cell|q<rsub|n><around|(|x|)><space|0.17em>>|<cell|=\<Psi\><around|(|D|)>*x<rsup|n>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=0><rsup|n>\<beta\><rsub|j><binom|n|j>x<rsup|n-j>>>>>>
  </equation>

  of degree <math|n>. Since <math|x<rsup|n>=F<around|(|D|)>*q<rsub|n>>,
  <eqref|eq:nn3> implies the count of zeros (with multiplicities)

  <\equation>
    n=N<around|(|x<rsup|n>|)>\<leq\>N<around|(|q<rsub|n>|)>\<leq\>n<space|0.17em>
  </equation>

  For every <math|n>, <math|q<rsub|n>> therefore has only real zeros. This is
  precisely condition (iii) of Theorem<nbsp><reference|tm:lpcc>, and we
  conclude that <math|\<Psi\>> is in the <lpc>.

  <vspace*|3mm><em|Summary.> Schoenberg's characterization of <tp> functions
  implies a condition equivalent to the Riemann hypothesis. The
  characterization is interesting in itself because it involves only the
  values of the Riemann zeta function on the real axis. To the best of our
  knowledge, the characterization of the <lpc> by means of <tp> functions has
  not yet been tested on the Riemann zeta function.

  <\thebibliography|10>
    <bibitem|AS52>M.<nbsp>Aissen, I.<nbsp>J. Schoenberg, and A.<nbsp>M.
    Whitney. <newblock>On the generating functions of totally positive
    sequences. I. <newblock><with|font-shape|italic|J. Analyse Math.>,
    2:93\U103, 1952.

    <bibitem|Bom10>E.<nbsp>Bombieri. <newblock>The classical theory of zeta
    and <math|L>-functions. <newblock><with|font-shape|italic|Milan J.
    Math.>, 78(1):11\U59, 2010.

    <bibitem|Br17-1>K.<nbsp>Broughan. <newblock><with|font-shape|italic|Equivalents
    of the Riemann hypothesis. Vol. 1>, volume 164 of
    <with|font-shape|italic|Encyclopedia of Mathematics and its
    Applications>. <newblock>Cambridge University Press, Cambridge, 2017.
    <newblock>Arithmetic equivalents.

    <bibitem|Br17-2>K.<nbsp>Broughan. <newblock><with|font-shape|italic|Equivalents
    of the Riemann hypothesis. Vol. 2>, volume 165 of
    <with|font-shape|italic|Encyclopedia of Mathematics and its
    Applications>. <newblock>Cambridge University Press, Cambridge, 2017.
    <newblock>Analytic equivalents.

    <bibitem|Conrey03>J.<nbsp>B. Conrey. <newblock>The Riemann hypothesis.
    <newblock><with|font-shape|italic|Notices Amer. Math. Soc.>,
    50(3):341\U353, 2003.

    <bibitem|CC89>T.<nbsp>Craven and G.<nbsp>Csordas. <newblock>Jensen
    polynomials and the Turán and Laguerre inequalities.
    <newblock><with|font-shape|italic|Pacific J. Math.>, 136(2):241\U260,
    1989.

    <bibitem|Cso15>G.<nbsp>Csordas. <newblock>Fourier transforms of positive
    definite kernels and the Riemann <math|\<xi\>>-function.
    <newblock><with|font-shape|italic|Comput. Methods Funct. Theory>,
    15(3):373\U391, 2015.

    <bibitem|CNV86>G.<nbsp>Csordas, T.<nbsp>S. Norfolk, and R.<nbsp>S. Varga.
    <newblock>The Riemann hypothesis and the Turán inequalities.
    <newblock><with|font-shape|italic|Trans. Amer. Math. Soc.>,
    296(2):521\U541, 1986.

    <bibitem|CV90>G.<nbsp>Csordas and R.<nbsp>S. Varga. <newblock>Necessary
    and sufficient conditions and the Riemann hypothesis.
    <newblock><with|font-shape|italic|Adv. in Appl. Math.>, 11(3):328\U357,
    1990.

    <bibitem|CS66>H.<nbsp>B. Curry and I.<nbsp>J. Schoenberg. <newblock>On
    Pólya frequency functions. IV. The fundamental spline functions and their
    limits. <newblock><with|font-shape|italic|J. Analyse Math.>, 17:71\U107,
    1966.

    <bibitem|Efr65>B.<nbsp>Efron. <newblock>Increasing properties of Pólya
    frequency functions. <newblock><with|font-shape|italic|Ann. Math.
    Statist.>, 36:272\U279, 1965.

    <bibitem|GORZ>M.<nbsp>Griffin, K.<nbsp>Ono, L.<nbsp>Rolen, and
    D.<nbsp>Zagier. <newblock>Jensen polynomials for the Riemann zeta
    function and other sequences. <newblock><with|font-shape|italic|Proc.
    Natl. Acad. Sci. USA>, 116(23):11103\U11110, 2019.

    <bibitem|GRS18>K.<nbsp>Gröchenig, J.<nbsp>L. Romero, and
    J.<nbsp>Stöckler. <newblock>Sampling theorems for shift-invariant spaces,
    Gabor frames, and totally positive functions.
    <newblock><with|font-shape|italic|Invent. Math.>, 211(3):1119\U1148,
    2018.

    <bibitem|GRS20>K.<nbsp>Gröchenig, J.<nbsp>L. Romero, and
    J.<nbsp>Stöckler. <newblock>Sharp results on sampling with derivatives in
    shift-invariant spaces and multi-window Gabor frames.
    <newblock><with|font-shape|italic|Constr. Approx.>, 51(1):1\U25, 2020.

    <bibitem|GS13>K.<nbsp>Gröchenig and J.<nbsp>Stöckler. <newblock>Gabor
    frames and totally positive functions.
    <newblock><with|font-shape|italic|Duke Math. J.>, 162(6):1003\U1031,
    2013.

    <bibitem|Ham20>H.<nbsp>Hamburger. <newblock>Bemerkungen zu einer
    Fragestellung des Herrn Pólya. <newblock><with|font-shape|italic|Math.
    Z.>, 7(1-4):302\U322, 1920.

    <bibitem|Ivi03>A.<nbsp>Ivi¢. <newblock><with|font-shape|italic|The
    Riemann zeta-function>. <newblock>Dover Publications, Inc., Mineola, NY,
    2003. <newblock>Theory and applications, Reprint of the 1985 original
    [Wiley, New York; MR0792089 (87d:11062)].

    <bibitem|Iwa14>H.<nbsp>Iwaniec. <newblock><with|font-shape|italic|Lectures
    on the Riemann zeta function>, volume<nbsp>62 of
    <with|font-shape|italic|University Lecture Series>. <newblock>American
    Mathematical Society, Providence, RI, 2014.

    <bibitem|karlin>S.<nbsp>Karlin. <newblock><with|font-shape|italic|Total
    positivity. Vol. I>. <newblock>Stanford University Press, Stanford,
    Calif, 1968.

    <bibitem|Kat07>O.<nbsp>M. Katkova. <newblock>Multiple positivity and the
    Riemann zeta-function. <newblock><with|font-shape|italic|Comput. Methods
    Funct. Theory>, 7(1):13\U31, 2007.

    <bibitem|Levin80>B.<nbsp>J. Levin. <newblock><with|font-shape|italic|Distribution
    of zeros of entire functions>, volume<nbsp>5 of
    <with|font-shape|italic|Translations of Mathematical Monographs>.
    <newblock>American Mathematical Society, Providence, R.I., revised
    edition, 1980. <newblock>Translated from the Russian by R. P. Boas, J. M.
    Danskin, F. M. Goodspeed, J. Korevaar, A. L. Shields and H. P. Thielman.

    <bibitem|Nut13>J.<nbsp>Nuttall. <newblock>Wronskians, cumulants, and the
    Riemann hypothesis. <newblock><with|font-shape|italic|Constr. Approx.>,
    38(2):193\U212, 2013.

    <bibitem|Pick91>D.<nbsp>Pickrell. <newblock>Mackey analysis of infinite
    classical motion groups. <newblock><with|font-shape|italic|Pacific J.
    Math.>, 150(1):139\U166, 1991.

    <bibitem|Pol15>G.<nbsp>Pólya. <newblock>Algebraische Untersuchungen über
    ganze Funktionen vom Geschlechte Null und Eins.
    <newblock><with|font-shape|italic|J. Reine Angew. Math.>, 145: 224\U249,
    1915.

    <bibitem|Pol26>G.<nbsp>Pólya. <newblock>Bemerkung Über die
    Integraldarstellung der Riemannschen <math|\<xi\>>-Funktion.
    <newblock><with|font-shape|italic|Acta Math.>, 48(3-4):305\U317, 1926.

    <bibitem|Polcoll>G.<nbsp>Pólya. <newblock><with|font-shape|italic|Collected
    papers>. <newblock>The MIT Press, Cambridge, Mass.-London, 1974.
    <newblock>Vol. II: Location of zeros, Edited by R. P. Boas,
    Mathematicians of Our Time, Vol. 8.

    <bibitem|PS1914>G.<nbsp>Pólya and J.<nbsp>Schur. <newblock>Über zwei
    Arten von Faktorenfolgen in der Theorie der algebraischen Gleichungen.
    <newblock><with|font-shape|italic|J. Reine Angew. Math.>, 144:89\U113,
    1914.

    <bibitem|RT20>B.<nbsp>Rodgers and T.<nbsp>Tao. <newblock>The de
    Bruijn\UNewman constant is non-negative.
    <newblock><with|font-shape|italic|Forum Math. Pi>, 8:e6, 62, 2020.

    <bibitem|sch47>I.<nbsp>J. Schoenberg. <newblock>On totally positive
    functions, Laplace integrals and entire functions of the
    Laguerre-Polya-Schur type. <newblock><with|font-shape|italic|Proc. Nat.
    Acad. Sci. U. S. A.>, 33:11\U17, 1947.

    <bibitem|Sch50>I.<nbsp>J. Schoenberg. <newblock>On Pólya frequency
    functions. II. Variation-diminishing integral operators of the
    convolution type. <newblock><with|font-shape|italic|Acta Sci. Math.
    (Szeged)>, 12:97\U106, 1950.

    <bibitem|sch51>I.<nbsp>J. Schoenberg. <newblock>On Pólya frequency
    functions. I. The totally positive functions and their Laplace
    transforms. <newblock><with|font-shape|italic|J. Analyse Math.>,
    1:331\U374, 1951.

    <bibitem|Sch53>I.<nbsp>J. Schoenberg. <newblock>On smoothing operations
    and their generating functions. <newblock><with|font-shape|italic|Bull.
    Amer. Math. Soc.>, 59:199\U230, 1953.

    <bibitem|Sch73>I.<nbsp>J. Schoenberg.
    <newblock><with|font-shape|italic|Cardinal spline interpolation>.
    <newblock>Society for Industrial and Applied Mathematics, Philadelphia,
    Pa., 1973. <newblock>Conference Board of the Mathematical Sciences
    Regional Conference Series in Applied Mathematics, No. 12.

    <bibitem|SW53>I.<nbsp>J. Schoenberg and A.<nbsp>Whitney. <newblock>On
    Pólya frequence functions. III. The positivity of translation
    determinants with an application to the interpolation problem by spline
    curves. <newblock><with|font-shape|italic|Trans. Amer. Math. Soc.>,
    74:246\U259, 1953.

    <bibitem|Tit86>E.<nbsp>C. Titchmarsh.
    <newblock><with|font-shape|italic|The theory of the Riemann
    zeta-function>. <newblock>The Clarendon Press, Oxford University Press,
    New York, second edition, 1986. <newblock>Edited and with a preface by D.
    R. Heath-Brown.
  </thebibliography>

  The very same results of Polya<nbsp> were also the point of departure for
  the many investigations of the zeros of the Riemann zeta function after
  Polya, de Bruijn, Newman, Hejhal and many others<nbsp>. Yet, in none of the
  investigations of the zeros of the Riemann zeta function via zeros of
  integral transforms and the factorization<nbsp><eqref|eq:2> one finds a
  hint to <tp> functions or the work of Schoenberg.
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
    <associate|auto-1|<tuple|45|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-AS52|<tuple|AS52|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Bom10|<tuple|Bom10|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Br17-1|<tuple|Br17-1|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Br17-2|<tuple|Br17-2|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-CC89|<tuple|CC89|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-CNV86|<tuple|CNV86|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-CS66|<tuple|CS66|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-CV90|<tuple|CV90|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Conrey03|<tuple|Conrey03|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Cso15|<tuple|Cso15|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Efr65|<tuple|Efr65|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-GORZ|<tuple|GORZ|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-GRS18|<tuple|GRS18|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-GRS20|<tuple|GRS20|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-GS13|<tuple|GS13|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Ham20|<tuple|Ham20|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Ivi03|<tuple|Ivi03|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Iwa14|<tuple|Iwa14|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Kat07|<tuple|Kat07|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Levin80|<tuple|Levin80|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Nut13|<tuple|Nut13|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-PS1914|<tuple|PS1914|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Pick91|<tuple|Pick91|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Pol15|<tuple|Pol15|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Pol26|<tuple|Pol26|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Polcoll|<tuple|Polcoll|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-RT20|<tuple|RT20|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-SW53|<tuple|SW53|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Sch50|<tuple|Sch50|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Sch53|<tuple|Sch53|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Sch73|<tuple|Sch73|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Tit86|<tuple|Tit86|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-karlin|<tuple|karlin|12|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-sch47|<tuple|sch47|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-sch51|<tuple|sch51|13|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:10|<tuple|12|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:3|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:5|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:6|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:6b|<tuple|8|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:7|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:8|<tuple|10|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:9|<tuple|15|5|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:n1|<tuple|16|6|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:n2|<tuple|17|6|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:ne1|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:nn2|<tuple|38|10|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:nn3|<tuple|41|11|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:v1|<tuple|24|7|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|hankel|<tuple|10|9|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|tm:equi1|<tuple|3|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|tm:equi2|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|tm:lpcc|<tuple|8|8|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|tm:ones|<tuple|5|5|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|tm:onesided|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|tm:tp|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|tm:vd|<tuple|6|7|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|turan|<tuple|9|9|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|zdim|<tuple|7|7|../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      CS66

      sch47

      Sch50

      sch51

      SW53

      SW53

      Sch73

      sch51

      SW53

      Efr65

      karlin

      Pick91

      GS13

      GRS18

      GRS20

      Levin80

      sch47

      Sch50

      sch51

      SW53

      karlin

      sch51

      sch51

      Pol15

      PS1914

      Iwa14

      Ivi03

      Tit86

      Br17-1

      Br17-2

      Bom10

      Conrey03

      Tit86

      Br17-1

      Br17-2

      Tit86

      Pol26

      RT20

      sch47

      sch51

      Tit86

      Sch53

      Sch50

      Pol15

      PS1914

      Pol15

      Ham20

      Pol15

      PS1914

      GORZ

      Cso15

      CC89

      CV90

      CNV86

      AS52

      Kat07

      Nut13

      sch51
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>