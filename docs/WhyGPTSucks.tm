<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|A Modest Proposal: Statistical Token Prediction Is No
  Replacement for Syntactic Construction>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Current
    Generative-Pretrained-Transformer Architecture>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Required
    Reformulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Parsing
    and Generation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Why
    Current GPT Fails> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Abstract
    Syntax Tree Implementation Architecture>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Logical
    Framework Implementation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <with|par-left|1tab|Syntactic Level <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|Semantic Level <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|Pragmatic Level <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Generation
    Algorithm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Current Generative-Pretrained-Transformer Architecture>

  Given vocabulary <math|V>, <math|<around|\||V|\|>=v>, current models map
  token sequences to vectors:

  <\equation>
    <around|(|t<rsub|1>,\<ldots\>,t<rsub|n>|)>\<mapsto\>X\<in\>\<bbb-R\><rsup|n\<times\>d>
  </equation>

  Through layers of transformations:

  <\equation>
    <text|softmax><around|(|Q*K<rsup|T>/<sqrt|d>|)>*V
  </equation>

  where <math|Q=X*W<rsub|Q>>, <math|K=X*W<rsub|K>>, <math|V=X*W<rsub|V>>

  Optimizing:

  <\equation>
    max<rsub|\<theta\>> <big|sum>log P<around|(|t<rsub|n+1>\|t<rsub|1>,\<ldots\>,t<rsub|n>;\<theta\>|)>
  </equation>

  <section|Required Reformulation>

  Instead, construct Abstract Syntax Trees where each node <math|\<eta\>>
  must satisfy:

  <\equation>
    \<eta\>\<in\>{<text|Noun>,<text|Verb>,<text|Adjective>,<text|Conjunction>,\<ldots\>}
  </equation>

  With composition rules <math|R> such that for nodes
  <math|\<eta\><rsub|1>,\<eta\><rsub|2>>:

  <\equation>
    R<around|(|\<eta\><rsub|1>,\<eta\><rsub|2>|)>=<choice|<tformat|<table|<row|<cell|<text|valid_subtree>>|<cell|<text|if
    grammatically valid>>>|<row|<cell|\<emptyset\>>|<cell|<text|otherwise>>>>>>
  </equation>

  And logical constraints <math|L> such that for any subtree <math|T>:

  <\equation>
    L<around|(|T|)>=<choice|<tformat|<table|<row|<cell|T>|<cell|<text|if
    logically consistent>>>|<row|<cell|\<emptyset\>>|<cell|<text|if
    contradictory>>>>>>
  </equation>

  <section|Parsing and Generation>

  Input text <math|s> maps to valid AST <math|T> or error <math|E>:

  <\equation>
    <text|parse><around|(|s|)>=<choice|<tformat|<table|<row|<cell|T>|<cell|<text|if
    >\<exists\><text|valid AST>>>|<row|<cell|E(<text|closest_valid>,<text|violation>)>|<cell|<text|otherwise>>>>>>
  </equation>

  Generation must traverse only valid AST constructions:

  <\equation>
    <text|generate><around|(|c|)>=<around|{|T\|R<around|(|T|)>\<neq\>\<emptyset\>\<wedge\>L<around|(|T|)>\<neq\>\<emptyset\>|}>
  </equation>

  where <math|c> is the context/prompt.

  <section|Why Current GPT Fails>

  The statistical model:

  <\equation>
    <text|softmax><around|(|Q*K<rsup|T>/<sqrt|d>|)>*V
  </equation>

  Has no inherent conception of:

  <\itemize>
    <item>Syntactic validity

    <item>Logical consistency

    <item>Conceptual preservation
  </itemize>

  It merely maximizes:

  <\equation>
    P<around|(|t<rsub|n+1>\|t<rsub|1>,\<ldots\>,t<rsub|n>|)>
  </equation>

  Based on training patterns, with no guaranteed constraints on:

  <\equation>
    <big|prod><rsub|i=1><rsup|n>P<around|(|t<rsub|i>\|t<rsub|1>,\<ldots\>,t<rsub|i-1>|)>
  </equation>

  This allows generation of:

  <\itemize>
    <item>Grammatically invalid sequences

    <item>Logically contradictory statements

    <item>Conceptually inconsistent responses
  </itemize>

  <section|Abstract Syntax Tree Implementation Architecture>

  The AST construction process operates through a multi-stage pipeline:

  <\equation>
    <text|Pipeline>=<text|Tokenize>\<circ\><text|Parse>\<circ\><text|Validate>\<circ\><text|Generate>
  </equation>

  Where each node undergoes type-theoretic validation:

  <\equation>
    <text|TypeCheck><around|(|\<eta\>|)>=<big|prod><rsub|i=1><rsup|n><around|{|\<tau\><rsub|i>\|\<tau\><rsub|i>\<in\><text|Types>,<text|Valid><around|(|\<tau\><rsub|i>|)>|}>
  </equation>

  The grammar engine implements Combinatory Categorial Grammar (CCG):

  <\equation>
    <text|CCG><around|(|\<alpha\>,\<beta\>|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<gamma\>>|<cell|<text|if
    >\<alpha\>/\<beta\>*<text|or >\<beta\>\<setminus\>\<alpha\>>>|<row|<cell|\<emptyset\>>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
  </equation>

  <section|Logical Framework Implementation>

  The logical framework operates on three levels:

  <subsection*|Syntactic Level>

  <\equation>
    <text|SynValid><around|(|T|)>=<big|wedge><rsub|i=1><rsup|n><text|CCG>(<text|node><rsub|i>,<text|node><rsub|i+1>)
  </equation>

  <subsection*|Semantic Level>

  <\equation>
    <text|SemValid><around|(|T|)>=\<exists\>M.*<around|(|M\<models\>T|)>\<wedge\><text|Consistent><around|(|M|)>
  </equation>

  <subsection*|Pragmatic Level>

  <\equation>
    <text|PragValid><around|(|T,c|)>=<text|Relevant><around|(|T,c|)>\<wedge\><text|Coherent><around|(|T|)>
  </equation>

  The complete validation function combines all levels:

  <\equation>
    <text|Validate><around|(|T,c|)>=<text|SynValid><around|(|T|)>\<wedge\><text|SemValid><around|(|T|)>\<wedge\><text|PragValid><around|(|T,c|)>
  </equation>

  <section|Generation Algorithm>

  The generation process follows a deterministic path:

  <\equation>
    <text|BuildTree><around|(|\<eta\>,c|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<eta\>>|<cell|<text|if
    leaf node>>>|<row|<cell|<text|Compose><around|(|<text|BuildTree><around|(|\<eta\><rsub|l>|)>,<text|BuildTree><around|(|\<eta\><rsub|r>|)>|)>>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
  </equation>

  Where composition is constrained by:

  <\equation>
    <text|Compose><around|(|\<alpha\>,\<beta\>|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<gamma\>>|<cell|<text|if
    Valid><around|(|\<gamma\>|)>\<wedge\><text|Entails><around|(|c,\<gamma\>|)>>>|<row|<cell|<text|Backtrack><around|(|\<alpha\>,\<beta\>|)>>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
  </equation>

  The backtracking function maintains logical consistency:

  <\equation>
    <text|Backtrack><around|(|\<alpha\>,\<beta\>|)>=arg
    max<rsub|\<gamma\>\<in\><text|Valid>><text|Similarity><around|(|\<gamma\>,<around|{|\<alpha\>,\<beta\>|}>|)>
  </equation>

  This ensures all generated trees satisfy:

  <\equation>
    \<forall\>T.<text|Generate><around|(|T|)>\<Longrightarrow\><around|(|<text|SynValid><around|(|T|)>\<wedge\><text|SemValid><around|(|T|)>\<wedge\><text|PragValid><around|(|T|)>|)>
  </equation>

  \P`latex

  <section|Conclusion>

  The AST-based approach with formal backtracking represents more than an
  incremental improvement - it is a fundamental paradigm shift in how we
  construct artificial language systems. By enforcing syntactic validity,
  semantic consistency, and pragmatic coherence through explicit constraints
  rather than implicit statistical patterns, we move from probability-based
  approximation to proof-based generation.

  The key innovation lies in the backtracking mechanism:

  <\equation>
    <text|Backtrack><around|(|\<alpha\>,\<beta\>|)>=arg
    max<rsub|\<gamma\>\<in\><text|Valid>><text|Similarity><around|(|\<gamma\>,<around|{|\<alpha\>,\<beta\>|}>|)>
  </equation>

  This ensures the system can never generate invalid output, as it
  systematically explores the space of valid constructions rather than
  blindly predicting tokens.

  The implications are profound. Rather than training ever-larger models on
  ever-larger datasets hoping to approximate linguistic competence, we can
  now construct systems that provably generate valid language by design. This
  approach scales with computational resources while maintaining perfect
  validity - a property no statistical model can claim.

  A system built on actual logical foundations and truth preservation would
  be fundamentally incapable of spewing self-contradictory nonsense, whether
  it's coming from an LLM or a politician.

  The parallel between:

  <\enumerate>
    <item>Statistical models generating plausible-sounding but logically
    inconsistent text

    <item>A certain US presidential candidate in the year 2024 doing exactly
    the same thing
  </enumerate>

  Is mathematically apt. Both demonstrate what happens in the absence of
  foundational logical constraints.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-10|<tuple|7|4|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-11|<tuple|8|4|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-5|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-6|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-7|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-8|<tuple|15|4|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-9|<tuple|16|4|../../.TeXmacs/texts/scratch/no_name_55.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Current
      Generative-Pretrained-Transformer Architecture>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Required
      Reformulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Parsing
      and Generation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Why
      Current GPT Fails> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Abstract
      Syntax Tree Implementation Architecture>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Logical
      Framework Implementation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Syntactic Level
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|Semantic Level
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|Pragmatic Level
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Generation
      Algorithm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>