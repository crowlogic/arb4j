<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<\doc-title>
    The Odd Conjugacy Classes of the Symmetric Group:
    <code|<code*|>>A060632<math|<around|(|n|)>=2<rsup|<text|wt><around|(|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>|)>>>
    in the OEIS\ 
  </doc-title>>

  <section*|Definition>

  The sequence <math|a<around*|(|n|)>=A060632<around*|(|n|)>> is defined as
  follows:

  <\equation*>
    a<around|(|n|)>=2<rsup|<text|wt><around|(|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>|)>>
  </equation*>

  Where:

  <\align*>
    <tformat|<table|<row|<cell|<text|wt><around|(|m|)>>|<cell|<text|is the
    number of 1s in the binary representation of
    >m>>|<row|<cell|<around|\<lfloor\>|x|\<rfloor\>>>|<cell|<text|is the
    floor function of >x>>>>
  </align*>

  <section*|Sequence>

  The first few terms of the sequence are: 1, 1, 2, 2, 2, 2, 4, 4, 2, 2, 4,
  4, 4, 4, 8, 8, 2, 2, 4, 4, 4, 4, 8, 8, 4, 4, 8, 8, 8, 8, 16, 16, 2, 2, 4,
  4, 4, 4, 8, 8, 4, 4, 8, 8, 8, 8, 16, 16, 4, 4, 8, 8, 8, 8, 16, 16, 8, 8,
  16, 16, 16, 16, 32

  <section*|Offset>

  The sequence starts at offset 0, and the first 3 terms are omitted.

  <section*|Comments>

  <\itemize>
    <item>Number of conjugacy classes in the symmetric group <math|S<rsub|n>>
    that have an odd number of elements.

    <item>Also, sequence A001316 doubled.

    <item>Number of even numbers whose binary expansion is a child of the
    binary expansion of <math|n>. - Nadia Heninger and N. J. A. Sloane, Jun
    06 2008

    <item>First differences of A151566. Sequence gives the number of
    toothpicks added at the n-th generation of the leftist toothpick sequence
    A151566. - N. J. A. Sloane, Oct 20 2010

    <item>The Fi1 and Fi1 triangle sums, see A180662 for their definitions,
    of Sierpi«ski's triangle A047999 equal this sequence. - Johannes W.
    Meijer, Jun 05 2011

    <item>Also, the number of odd entries in the n-th row of the triangle of
    Stirling numbers of the first kind. - Istvan Mezo, Jul 21 2017
  </itemize>

  <section*|References>

  <\enumerate>
    <item>I. G. MacDonald: Symmetric functions and Hall polynomials. Oxford:
    Clarendon Press, 1979. Page 21.
  </enumerate>

  <section*|Links>

  <\itemize>
    <item>Indranil Ghosh, Table of n, a(n) for n = 0..65536 (terms 0..1000
    from Harry J. Smith)

    <item>David Applegate, Omar E. Pol and N. J. A. Sloane, The Toothpick
    Sequence and Other Sequences from Cellular Automata, Congressus
    Numerantium, Vol. 206 (2010), 157-191. [There is a typo in Theorem 6:
    (13) should read u(n) = <math|4\<cdot\>3<rsup|<text|wt><around|(|n-1|)>-1>>
    for <math|n\<geq\>2>.]

    <item>Christina Talar Bekaro§lu, Analyzing Dynamics of Larger than Life:
    Impacts of Rule Parameters on the Evolution of a Bug's Geometry, Master's
    thesis, Calif. State Univ. Northridge (2023). See p. 92.

    <item>N. J. A. Sloane, Catalog of Toothpick and Cellular Automata
    Sequences in the OEIS

    <item>Index entries for sequences related to toothpick sequences
  </itemize>

  <section*|Formulas>

  <\align*>
    <tformat|<table|<row|<cell|>|<cell|>>|<row|<cell|a<around|(|n|)>>|<cell|=<big|sum><rsub|k=0><rsup|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>><binom|n|2*k><modulo|2><\footnote>
      <text|Paul Barry, Jan 03 2005, Edited by Harry J. Smith, Sep 15 2009>
    </footnote>>>|<row|<cell|>|<cell|>>|<row|<cell|a<around|(|n|)>>|<cell|=<text|gcd><around|(|A*056040<around|(|n|)>,2<rsup|n>|)>>>|<row|<cell|>|<cell|>>|<row|<cell|<text|Generating
    function:>>|<cell|<around|(|1+x|)>\<cdot\><big|prod><rsub|k\<geq\>0><around|(|1+2*x<rsup|2<rsup|k+1>>|)>>>>>
  </align*>

  <section*|Example>

  <math|a<around|(|3|)>=2> because in <math|S<rsub|3>> there are two
  conjugacy classes with an odd number of elements: the trivial conjugacy
  class and the conjugacy class of transpositions consisting of 3 elements:
  (12),(13),(23).

  <section*|Mathematica Code>

  <\verbatim>
    \;

    a[n_] := 2^DigitCount[Floor[n/2], 2, 1];

    Table[a[n], {n, 0, 94}] (* Jean-FranÃ§ois Alcover, Feb 25 2014 *)

    \;
  </verbatim>

  <section*|PARI Code>

  <\verbatim>
    \;

    for (n=0, 1000, write("b060632.txt", n, " ", sum(k=0, floor(n/2),
    binomial(n, 2*k) % 2)) )

    \\\\ Harry J. Smith, Sep 14 2009

    \;
  </verbatim>

  <section*|Author>

  Avi Peretz (njk(AT)netvision.net.il), Apr 15 2001

  <section*|Extensions>

  <\itemize>
    <item>More terms from James A. Sellers, Apr 16 2001

    <item>Edited by N. J. A. Sloane, Jun 06 2008; Oct 11 2010

    <item><math|a<around|(|0|)>=1> added by N. J. A. Sloane, Sep 14 2009

    <item>Formula corrected by Harry J. Smith, Sep 15 2009
  </itemize>

  <section*|Status>

  Approved
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-10|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-11|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-12|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-13|<tuple|<with|mode|<quote|math>|\<bullet\>>|3|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-2|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-3|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-4|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-6|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-7|<tuple|<with|mode|<quote|math>|\<bullet\>>|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-8|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-9|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|footnote-1|<tuple|1|?|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|footnr-1|<tuple|1|?|../../.TeXmacs/texts/scratch/no_name_23.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Definition>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Sequence>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Offset>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Comments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Links>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Formulas>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Example>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Mathematica
      Code> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|PARI
      Code> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Author>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Extensions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Status>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>