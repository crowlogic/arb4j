<TeXmacs|2.1.1>

<style|generic>

<\body>
  <doc-data|<doc-title|On the prime factors of the swinging
  factorials>|<doc-author|<author-data|<\author-name>
    <chapter*|<label|firstHeading>Peter Luschny>
  </author-name>|<\author-affiliation>
    (transcribed by Stephen Crowley and some 'aye eye' thing)

    <slink|https://oeis.org/wiki/User:Peter_Luschny/PrimeFactorsSwingingFactorial>
  </author-affiliation>>>>

  <vspace*|2fn><no-indent><with|font-series|bold|KEYWORDS:> swinging
  factorial, central binomial coefficient, conjecture of Erdös, Graham et al.

  <no-indent><with|font-series|bold|Concerned with sequences:> A000984,
  A056040, A005836, A129508, A030979, A151750, A055246, A196747, A196748,
  A196749, A196750.

  <section*|<with|color|maroon|A conjecture of Erdös, Graham et al.>>

  Here we are concerned with a generalization of some simple divisibility
  properties of the central binomial coefficient. Or better, we consider a
  more natural formulation of some observations and conjectures which have as
  starting point the paper by P. Erdös, R. L. Graham, I. Z. Russa and E. G.
  Straus, <with|font-shape|italic|On the prime factors of C(2n,n)>, Math.
  Comp. 29 (1975), 83-92.

  We will use the following notation:

  <\equation*>
    n\<perp\><around|[|p<rsub|1>,\<ldots\>,p<rsub|k>|]>\<Longleftrightarrow\>n\<perp\>p<rsub|1>\<wedge\>\<cdots\>\<wedge\>n\<perp\>p<rsub|k>
  </equation*>

  This means that <math|n> is relatively prime to every <math|p<rsub|i>> in
  the list. It generalizes Knuth's notation for gcd(<math|n>,<math|k>) = 1.

  <section*|<with|color|maroon|Concerned with sequences>>

  The swinging factorial <math|n*\<wr\>> is sequence A056040 and the central
  binomial <math|<binom|2*n|n>> is sequence A000984.

  <\itemize>
    <item>A005836 <math|<binom|2*n|n>\<perp\><around|[|3|]>>

    <item>A129508 <math|<binom|2*n|n>\<perp\><around|[|3,5|]>>

    <item>A030979 <math|<binom|2*n|n>\<perp\><around|[|3,5,7|]>>

    <item>A151750 <math|<binom|2*n|n>\<perp\><around|[|3,5,7,11|]>>

    <item>A000000 <math|<binom|2*n|n>\<perp\><around|[|3,5,7,11,13|]>>
  </itemize>

  <\itemize>
    <item>A196747 <math|n*\<wr\>\<perp\><around|[|3|]>>

    <item>A196748 <math|n*\<wr\>\<perp\><around|[|3,5|]>>

    <item>A196749 <math|n*\<wr\>\<perp\><around|[|3,5,7|]>>

    <item>A196750 <math|n*\<wr\>\<perp\><around|[|3,5,7,11|]>>

    <item>A000000 <math|n*\<wr\>\<perp\><around|[|3,5,7,11,13|]>>
  </itemize>

  <subsection*|Sequences>

  <\verbatim>
    \;

    A196747: seq(search(i,[3],1),i=0..200);

    0, 1, 2, 6, 7, 8, 18, 19, 20, 24, 25, 26, 54, 55, 56,

    60, 61, 62, 72, 73, 74, 78, 79, 80, 162, 163, 164, 168,

    169, 170, 180, 181, 182, 186, 187, 188,

    \;

    A005836: seq(search(i,[3],2),i=0..250);

    0, 1, 3, 4, 9, 10, 12, 13, 27, 28, 30, 31, 36, 37, 39,

    40, 81, 82, 84, 85, 90, 91, 93, 94, 108, 109, 111, 112,

    117, 118, 120, 121, 243, 244, 246, 247

    \;

    A196748: seq(search(i,[3,5],1),i=0..6500);

    0, 1, 2, 20, 24, 54, 60, 61, 62, 72, 73, 74, 504, 510,

    511, 512, 560, 564, 1512, 1513, 1514, 1520, 1620, 1621,

    1622, 6320, 6324, 6372, 6373, 6374, 6500

    \;

    A129508: seq(search(i,[3,5],2),i=0..4000);

    0, 1, 10, 12, 27, 30, 31, 36, 37, 252, 255, 256, 280,

    282, 756, 757, 760, 810, 811, 3160, 3162, 3186, 3187,

    3250, 3252, 3276, 3277, 3280

    \;

    A196749: seq(search(i,[3,5,7],1),i=0..120000000);

    0, 1, 2, 20, 1512, 1513, 1514, 6320, 6372, 6373, 6374,

    6500, 15120, 15121, 15122, 15302, 40014, 119096754,

    119096802

    \;

    A030979: seq(search(i,[3,5,7],2),i=0..60000000);

    0, 1, 10, 756, 757, 3160, 3186, 3187, 3250, 7560, 7561,

    7651, 20007, 59548377, 59548401

    \;

    A196750: seq(search(i,[3,5,7,11],1),i=0..100000);

    0, 1, 2, 6320

    \;

    A151750: seq(search(i,[3,5,7,11],2),i=0..100000);

    0, 1, 3160

    \;

    A000000: seq(search(i,[3,5,7,11,13],1),i=0..100000);

    0, 1, 2

    \;

    A000000: seq(search(i,[3,5,7,11,13],2),i=0..100000);

    0, 1

    \;
  </verbatim>

  <section*|<with|color|maroon|Discoveries>>

  Now, what is the relation between the above binomial-based sequences and
  the swing-based sequences? If B is a binomial-based sequence then 2B is a
  subsequence of the corresponding swing-based sequence. What is the
  complement of this subsequence, in other words, what are the terms of the
  swing-based sequence which are not just the double of the binomial-based
  sequence?

  Starting with the most simple case, A005836 versus A196747, we find:

  <\verbatim>
    \;

    1, 7, 19, 25, 55, 61, 73, 79, 163, 169, 181, 187, 217,

    223, 235, 241, 487, 493, 505, 511, 541, 547, 559, 565,

    649, 655, 667, 673, 703, 709, 721, 727, 1459, 1465

    \;
  </verbatim>

  And this sequence is in OEIS! A196747 - 2*A005836 = A055246.

  A055246 is used for boundaries of open intervals which have to be erased in
  the Cantor middle third set construction.

  An unexpected relation! Clearly, we could consider along the same line the
  other pairs of sequences.

  <section*|<with|color|maroon|References>>

  Peter Luschny, <with|font-shape|italic|Divide, swing and conquer the
  factorial and the lcm{1,2,...,n}>, preprint, April 2008.
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-2|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-3|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-4|<tuple|<with|mode|<quote|math>|\<bullet\>>|2|../../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|3|../../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|4|../../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|firstHeading|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_33.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|Peter
      Luschny> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|<with|color|<quote|maroon>|A
      conjecture of Erdös, Graham et al.>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|<with|color|<quote|maroon>|Concerned
      with sequences>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Sequences
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|<with|color|<quote|maroon>|Discoveries>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|<with|color|<quote|maroon>|References>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>