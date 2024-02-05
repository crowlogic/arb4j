<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white>>

<\body>
  <doc-data|<doc-title|Resolution-Based Inference>>

  Resolution-based inference is a fundamental technique in automated theorem
  proving and logical reasoning. It's used to determine the validity of
  logical statements, resolve contradictions, and prove theorems. The core
  idea behind resolution is to show that if two contradictory statements
  (clauses) can be derived from a set of logical statements, then the
  original set of statements is unsatisfiable, meaning no assignment of truth
  values to variables can make all of them true simultaneously.

  Here's an explanation of how resolution-based inference works:

  <\itemize>
    <item><with|font-series|bold|Conversion to CNF:> To apply resolution, the
    given logical statements are first converted into Conjunctive Normal Form
    (CNF). This involves breaking down complex logical expressions into a
    conjunction (AND) of clauses, where each clause is a disjunction (OR) of
    literals (atomic propositions or their negations).

    <item><with|font-series|bold|Set of Clauses:> The CNF representation
    results in a set of clauses, where each clause is a disjunction of
    literals.

    <item><with|font-series|bold|Resolution Rule:> The resolution rule states
    that if there are two clauses that contain complementary literals (one
    contains a literal, and the other contains its negation), they can be
    resolved to produce a new clause. This new clause is formed by taking the
    union of the two clauses after removing the complementary literals.

    For example, if we have the clauses:

    <\align*>
      <tformat|<table|<row|<cell|>|<cell|1.*<space|1em><around|(|A\<vee\>B|)>>>|<row|<cell|>|<cell|2.*<space|1em><around|(|\<neg\>A\<vee\>C|)>>>>>
    </align*>

    We can resolve them on 'A' and '<math|\<neg\>A>' to get:

    <\align*>
      <tformat|<table|<row|<cell|>|<cell|3.*<space|1em><around|(|B\<vee\>C|)>>>>>
    </align*>

    <item><with|font-series|bold|Repeated Resolution:> Resolution is applied
    repeatedly to the set of clauses until one of the following conditions is
    met: - A clause containing no literals (an empty clause) is derived. In
    this case, it means the original set of clauses is unsatisfiable. - No
    further resolutions are possible, and no contradiction is found. In this
    case, it means the original set of clauses is satisfiable.

    <item><with|font-series|bold|Unsatisfiability:> If an empty clause is
    derived through resolution, it means that the original set of clauses is
    unsatisfiable, and the logical statements are contradictory.
  </itemize>

  Resolution-based inference is complete, which means that if there is a
  proof of a statement's validity, the resolution procedure will eventually
  find it. It's also sound, meaning it won't produce a false contradiction.

  This method plays a central role in SAT solving (Boolean satisfiability),
  automated reasoning, and various theorem proving systems. By using
  resolution-based inference, one can efficiently check the consistency of
  logical statements and establish the validity of theorems and logical
  arguments.

  <section|Definitions Related to Clauses and Logical Expressions>

  In the context of logical expressions and clauses, several key terms and
  concepts are important to understand:

  <\enumerate>
    <item><with|font-series|bold|Literal:> A literal is a basic building
    block of a logical expression. It can be either an atomic proposition (a
    variable or a constant) or the negation of an atomic proposition. For
    example, in the expression "A \<vee\>\<neg\>B," "A" and "\<neg\>B" are
    literals.

    <item><with|font-series|bold|Clause:> A clause is a disjunction (OR) of
    one or more literals. It represents a set of possible conditions that can
    make the clause true.\ 

    <\example>
      In the expression

      <\equation>
        <text|(A \<vee\>\<neg\>B) \<vee\>C>
      </equation>

      \ (A \<vee\>\<neg\>B) and C are two clauses.
    </example>

    <item><with|font-series|bold|Conjunction:> Conjunction (AND) is a logical
    operation that combines two or more statements or clauses in such a way
    that the resulting compound statement is true only when all the
    individual statements or clauses are true. For example, in the expression
    "A \<wedge\>B," both "A" and "B" must be true for the entire expression
    to be true.

    <item><with|font-series|bold|Disjunction:> Disjunction (OR) is a logical
    operation that combines two or more statements or clauses in such a way
    that the resulting compound statement is true if at least one of the
    individual statements or clauses is true. For example, in the expression
    "A \<vee\>B," either "A" or "B" (or both) must be true for the entire
    expression to be true.

    <item><with|font-series|bold|Implication:> Implication (\<Rightarrow\>)
    is a logical operation that represents a conditional relationship between
    two statements. It states that if the antecedent (the statement on the
    left) is true, then the consequent (the statement on the right) must also
    be true. For example, "A \<Rightarrow\>B" means that if "A" is true, then
    "B" must also be true.

    <item><with|font-series|bold|Negation:> Negation (\<sim\>) is a unary
    logical operation that reverses the truth value of a statement or a
    literal. For example, "\<sim\>A" represents the negation of "A" and is
    true when "A" is false.

    <item><with|font-series|bold|Logical Formula:> A logical formula is a
    statement that consists of various logical connectives (including
    conjunction, disjunction, implication, and negation) and atomic
    propositions (literals). It represents a logical relationship between
    atomic propositions and is evaluated to either true or false based on the
    truth values of its constituent parts.

    <item><with|font-series|bold|Conjunctive Normal Form (CNF):> CNF is a
    specific way of representing logical formulas. In CNF, a logical formula
    is expressed as a conjunction (AND) of clauses, where each clause is a
    disjunction (OR) of literals. CNF is often used in automated reasoning
    and theorem proving due to its simplicity and suitability for
    resolution-based inference.

    <item><with|font-series|bold|Resolution-Based Inference:> Resolution is a
    fundamental inference rule used to establish the validity of logical
    statements and resolve contradictions. It involves deriving new clauses
    from existing clauses by applying the resolution rule, which combines
    complementary literals in pairs to simplify or extend the set of clauses.
    If an empty clause is derived through resolution, it indicates
    unsatisfiability and a contradiction in the original set of clauses.
  </enumerate>

  These definitions provide a foundation for understanding clauses and their
  role in logical expressions and reasoning.
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
    <associate|auto-1|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Definitions
      Related to Clauses and Logical Expressions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>