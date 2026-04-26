package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.loadInputParameter;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.objectweb.asm.*;

import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.expressions.nodes.binary.ComparisonNode;
import arb.functions.Function;

/**
 * The {@link WhenNode} class represents a {@link Node} that the
 * {@link Expression#resolveFunction()} method creates when the {@code when}
 * keyword is encountered. Its surface syntax accepts a sequence of
 * {@code (predicate, value)} pairs followed by an {@code else} clause:
 *
 * <pre>
 * when(predicate1, value1, predicate2, value2, …, else, valueOtherwise)
 * </pre>
 *
 * <p>
 * Predicates are written as comparisons of an independent variable to an
 * integer literal: {@code k = 1}, {@code k < 3}, {@code k ≥ 0}. The supported
 * relational operators are {@code =}, {@code ≠} (or {@code !=}), {@code <},
 * {@code ≤} (or {@code <=}), {@code >}, {@code ≥} (or {@code >=}). The LHS of
 * each predicate must be an independent variable of this expression or any
 * enclosing curried expression; the RHS must be an integer literal. Boolean
 * composition of predicates with {@code ∧}/{@code ∨}/{@code ¬} is parsed by
 * the broader expression parser when that lands; today the parser inside
 * {@code when()} accepts only single comparisons.
 *
 * <p>
 * Two execution modes are emitted depending on the parsed form:
 *
 * <ul>
 * <li><b>Legacy fast path</b> — when every case predicate is the equality of
 * the same Integer-typed variable to a literal Integer (i.e. the historical
 * {@code when(k=1,…,k=2,…)} pattern), the generator emits a JVM
 * {@code lookupswitch}: O(log n) dispatch on the runtime value of the
 * variable. The emitted bytecode is identical to what was produced before
 * this refactor — every existing test that uses this pattern continues to
 * generate the same class file.</li>
 * <li><b>General path</b> — when any case predicate is a non-equality
 * comparison ({@code <}, {@code ≤}, {@code >}, {@code ≥}, {@code ≠}) or a
 * compound boolean expression, the generator emits an if-chain: each
 * predicate is evaluated to a JVM {@code int} 0/1, branched on with
 * {@code IFEQ}, and on success the corresponding value is computed and
 * jumped to the merge point. This is O(n) in the number of cases but
 * accommodates predicates that {@code lookupswitch} fundamentally cannot
 * express.</li>
 * </ul>
 *
 * <p>
 * The legacy detector inspects the parsed predicates exactly once at
 * generation time — every cases predicate must be a {@link ComparisonNode}
 * carrying {@link ComparisonNode.Operator#EQ}, with all LHS sides being
 * the same {@link VariableNode} and all RHS sides being literal integer
 * constants. A single {@code k<3} or {@code k≠0} clause anywhere in the
 * {@code when} drops the entire dispatch into the if-chain.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
@SuppressWarnings(
{ "unused" })
public class WhenNode<D, R, F extends Function<? extends D, ? extends R>> extends
                     UnaryOperationNode<D, R, F>
{

  private static final String INTEGER_CLASS_INTERNAL_NAME = Type.getInternalName(Integer.class);
  private static final String INT_METHOD_DESCRIPTOR       = Compiler.getMethodDescriptor(int.class);

  /**
   * One row of a {@code when} expression: a boolean predicate node and the
   * value to evaluate when it holds. Order in {@link WhenNode#cases} is the
   * order in source — the general-path generator preserves this exactly so
   * the first matching predicate selects the value (standard
   * {@code if/else if/else} semantics).
   */
  public static final class Case<D, R, F extends Function<? extends D, ? extends R>>
  {
    public Node<D, R, F> predicate;
    public Node<D, R, F> value;

    public Case(Node<D, R, F> predicate, Node<D, R, F> value)
    {
      this.predicate = predicate;
      this.value     = value;
    }
  }

  public static <D, R, F extends Function<? extends D, ? extends R>> Node<D, R, F> evaluateDefaultCase(Expression<D, R, F> expression)
  {
    expression.require(',');
    var defaultValue = expression.resolve();
    if (expression.character != ')')
    {
      throw new CompilerException(String.format("expected closing ) of when statement after else at position=%d expression=%s",
                                                expression.position,
                                                expression));
    }
    return defaultValue;
  }

  public List<Case<D, R, F>>    cases;

  private Label                 defaultLabel = new Label();
  private Label                 endSwitch    = new Label();
  private Label[]                labels      = null;
  private VariableNode<D, R, F> switchVariable;

  public WhenNode(Expression<D, R, F> expression)
  {
    super(expression, null);
    cases = new ArrayList<>();
    do
    {
      evaluateCase();
    }
    while (expression.nextCharacterIs(','));
    expression.require(')');
    if (arg == null)
    {
      throw new CompilerException("default value of when function not specified with else keyword at position="
                                  + expression.position
                                  + " of expression="
                                  + expression);
    }
  }

  /**
   * Splice / differentiate / integrate constructor. {@code sourceCases} is the
   * list of {@code (predicate,value)} pairs from a parent {@code WhenNode}
   * being copied or transformed; each side is independently {@code spliceInto}'d
   * the new expression so deep ownership is preserved.
   */
  public <E, S, G extends Function<? extends E, ? extends S>> WhenNode(Expression<D, R, F> expression,
                                                                       Node<D, R, F> defaultNode,
                                                                       List<Case<E, S, G>> sourceCases,
                                                                       VariableNode<D, R, F> switchVariable)
  {
    super(expression, defaultNode);
    this.switchVariable = switchVariable;
    this.cases          = new ArrayList<>();
    if (defaultNode != null)
    {
      defaultNode.parent = this;
    }
    for (var sourceCase : sourceCases)
    {
      Node<D, R, F> p = sourceCase.predicate.spliceInto(expression);
      Node<D, R, F> v = sourceCase.value.spliceInto(expression);
      p.parent = this;
      v.parent = this;
      this.cases.add(new Case<>(p, v));
    }
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    for (var c : cases)
    {
      c.predicate.accept(t);
      c.value.accept(t);
    }
    arg.accept(t);
    t.accept(this);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    if (switchVariable != null && switchVariable.reference.equals(variable.reference))
    {
      return true;
    }
    for (var c : cases)
    {
      if (c.predicate.dependsOn(variable) || c.value.dependsOn(variable))
      {
        return true;
      }
    }
    return arg.dependsOn(variable);
  }

  /**
   * Differentiate a piecewise function: each branch's value is differentiated;
   * the predicates and the {@code else} value are likewise differentiated.
   * The Dirac-delta contributions at predicate boundaries are <i>not</i>
   * introduced — this is the standard distribution-free piecewise
   * differentiation rule, consistent with the pre-refactor behavior.
   * Differentiating predicates is a no-op for the comparison forms supported
   * today (predicates depend only on the discriminator variable, which is
   * either constant w.r.t. the differentiation variable or the
   * differentiation variable itself, and {@code (k op c)' = 0} either way
   * symbolically — the derivative of a boolean is an indeterminate form).
   */
  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    List<Case<D, R, F>> differentiatedCases = new ArrayList<>(cases.size());
    for (var c : cases)
    {
      // Predicate differentiation is symbolically zero for the supported
      // forms; preserve the predicate verbatim by splicing it (to detach it
      // from the source tree's parent pointers).
      differentiatedCases.add(new Case<>(c.predicate, c.value.differentiate(variable)));
    }
    Node<D, R, F> differentiatedDefault = arg.differentiate(variable);
    return new WhenNode<>(expression, differentiatedDefault, differentiatedCases, switchVariable);
  }

  private boolean isIndependentVariableOfThisOrAncestorExpression(VariableNode<D, R, F> variable)
  {
    // Two-tier acceptance for {@code when} discriminators. A variable is
    // admissible if it is the independent variable of THIS expression
    // (the immediate, fast path) OR of any ENCLOSING expression reachable
    // through the superExpression chain. The latter is essential for
    // curried arrows like
    //
    //     a:k ➔ u ➔ when(k=1, ..., else, ...)
    //
    // where, while parsing the body of the inner {@code u ➔} arrow, the
    // inner expression's independent variable is {@code u}, not {@code k};
    // the discriminator {@code k} is bound on the outer arrow and resolves
    // through the super-expression chain. Variables bound by neither are
    // free symbols and rejected with a CompilerException by the caller.
    if (variable.isIndependent())
    {
      return true;
    }
    return expression.thisOrAnySuperIndependentVariableIsNamed(variable.getName());
  }

  /**
   * Recognize the relational operator at the cursor and consume it. Returns
   * {@code null} if no recognized operator is present.
   *
   * <p>
   * Two-character ASCII aliases ({@code <=}, {@code >=}, {@code !=}) are
   * dispatched by peeking at the character after the next: if the
   * follow-on is {@code =} we consume both characters and return the
   * matching operator; otherwise the single-character form is returned.
   */
  private ComparisonNode.Operator parseRelationalOperator()
  {
    // Parser.normalize() runs the input through NFD canonical decomposition,
    // which splits ≠ (U+2260) into '=' (U+003D) + combining long solidus
    // overlay '̸' (U+0338). We must detect that pair BEFORE the bare '='
    // case, otherwise '=' would be greedily consumed as EQ and the dangling
    // combining mark would derail the next resolve().
    if (expression.character == '=' && expression.characterAfterNextIs('̸'))
    {
      expression.nextCharacterIs('=');
      expression.nextCharacterIs('̸');
      return ComparisonNode.Operator.NE;
    }
    // Raw ≠ in case the source bypassed NFD normalization for any reason.
    if (expression.nextCharacterIs('≠'))
    {
      return ComparisonNode.Operator.NE;
    }
    if (expression.nextCharacterIs('='))
    {
      return ComparisonNode.Operator.EQ;
    }
    if (expression.nextCharacterIs('≤'))
    {
      return ComparisonNode.Operator.LE;
    }
    if (expression.nextCharacterIs('≥'))
    {
      return ComparisonNode.Operator.GE;
    }
    // Two-character ASCII forms: peek before consuming.
    if (expression.character == '!' && expression.characterAfterNextIs('='))
    {
      expression.nextCharacterIs('!');
      expression.nextCharacterIs('=');
      return ComparisonNode.Operator.NE;
    }
    if (expression.character == '<' && expression.characterAfterNextIs('='))
    {
      expression.nextCharacterIs('<');
      expression.nextCharacterIs('=');
      return ComparisonNode.Operator.LE;
    }
    if (expression.character == '>' && expression.characterAfterNextIs('='))
    {
      expression.nextCharacterIs('>');
      expression.nextCharacterIs('=');
      return ComparisonNode.Operator.GE;
    }
    if (expression.nextCharacterIs('<'))
    {
      return ComparisonNode.Operator.LT;
    }
    if (expression.nextCharacterIs('>'))
    {
      return ComparisonNode.Operator.GT;
    }
    return null;
  }

  /**
   * Parse a single case starting at the cursor. The leading expression has
   * already been consumed by {@link #evaluateCase()} and dispatched here; we
   * see a {@link VariableNode} representing the LHS of the predicate, and we
   * must consume the relational operator, the RHS literal, the {@code ,},
   * and the case's value expression.
   */
  void evaluateCase(VariableNode<D, R, F> variable)
  {
    if (!isIndependentVariableOfThisOrAncestorExpression(variable))
    {
      throw new CompilerException("condition of when statement must be the equality of an independent variable "
                                  + "of this or an enclosing expression, but got "
                                  + variable
                                  + " which is not an independent variable of "
                                  + expression
                                  + " or any of its ancestors");
    }

    if (switchVariable == null)
    {
      switchVariable = variable;
    }
    else if (!switchVariable.reference.equals(variable.reference))
    {
      throw new CompilerException("all cases in a when statement must switch on the same variable, got "
                                  + variable
                                  + " but expected "
                                  + switchVariable);
    }

    ComparisonNode.Operator op = parseRelationalOperator();
    if (op == null)
    {
      throw new CompilerException("expected one of '=' '≠' '<' '≤' '>' '≥' (or ASCII '!=' '<=' '>=') after "
                                  + variable
                                  + " in when case at position="
                                  + expression.position
                                  + " expression="
                                  + expression);
    }

    var rhs = evaluateLiteralRhs();
    Node<D, R, F> predicate = new ComparisonNode<>(expression, variable, op, rhs);
    predicate.parent = this;
    var value = expression.resolve();
    value.parent = this;
    cases.add(new Case<>(predicate, value));
  }

  public void evaluateCase()
  {
    Node<D, R, F> node = expression.resolve();
    if (node instanceof ElseNode)
    {
      arg        = evaluateDefaultCase(expression);
      arg.parent = this;
    }
    else if (node instanceof VariableNode<D, R, F> variable)
    {
      evaluateCase(variable);
    }
    else
    {
      throw new CompilerException("the cases of the when statement must be either an else statement or a VariableNode but it was a "
                                  + node.getClass()
                                  + " expr="
                                  + expression
                                  + "' with remaining='"
                                  + expression.remaining()
                                  + "'");
    }
  }

  /**
   * Parse the right-hand side of a comparison predicate, which today must be
   * an integer literal constant. Comma-terminated.
   */
  public LiteralConstantNode<D, R, F> evaluateLiteralRhs()
  {
    Node<D, R, F> rhs = expression.resolve();
    if (!rhs.isLiteralConstant())
    {
      throw new CompilerException("right-hand side of when comparison must be an Integer literal constant, but got "
                                  + rhs);
    }
    var literal = rhs.asLiteralConstant();
    expression.require(',');
    return literal;
  }

  // ============================================================
  // Code generation
  // ============================================================

  /**
   * Detect whether every case predicate is an {@link ComparisonNode} of
   * {@code EQ} flavor whose LHS is a single common {@link VariableNode} of
   * type {@link Integer} and whose RHS is a literal integer constant. If so,
   * the legacy {@code lookupswitch} fast path can dispatch the entire
   * {@code when}.
   */
  @SuppressWarnings("unchecked")
  private boolean isLegacyIntegerEqualityForm()
  {
    if (cases.isEmpty())
    {
      return false;
    }
    VariableNode<D, R, F> commonLhs = null;
    for (var c : cases)
    {
      if (!(c.predicate instanceof ComparisonNode<?, ?, ?> cmp))
      {
        return false;
      }
      if (cmp.operator != ComparisonNode.Operator.EQ)
      {
        return false;
      }
      ComparisonNode<D, R, F> typedCmp = (ComparisonNode<D, R, F>) cmp;
      if (!(typedCmp.left instanceof VariableNode<?, ?, ?> lhsVar))
      {
        return false;
      }
      if (!Integer.class.equals(typedCmp.left.type()))
      {
        return false;
      }
      if (!typedCmp.right.isLiteralConstant())
      {
        return false;
      }
      if (commonLhs == null)
      {
        commonLhs = (VariableNode<D, R, F>) lhsVar;
      }
      else if (!commonLhs.reference.equals(((VariableNode<?, ?, ?>) lhsVar).reference))
      {
        return false;
      }
    }
    return true;
  }

  /**
   * Build the {@code (key, value)} TreeMap consumed by the legacy lookupswitch
   * generator. Caller has already verified {@link #isLegacyIntegerEqualityForm}.
   */
  private TreeMap<Integer, Node<D, R, F>> legacyKeyValueMap()
  {
    TreeMap<Integer, Node<D, R, F>> map = new TreeMap<>();
    for (var c : cases)
    {
      ComparisonNode<D, R, F> cmp     = (ComparisonNode<D, R, F>) c.predicate;
      LiteralConstantNode<?, ?, ?> rhs = cmp.right.asLiteralConstant();
      Integer key = new Integer(rhs.stringValue);
      map.put(key, c.value);
    }
    return map;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert expression.coDomainType.equals(resultType) : String.format("expression.coDomainType = %s != resultType = %s",
                                                                      expression.coDomainType,
                                                                      resultType);

    for (var c : cases)
    {
      c.value.isRootNode = isRootNode;
    }
    arg.isRootNode = isRootNode;

    if (isLegacyIntegerEqualityForm())
    {
      generateLookupSwitch(mv, resultType);
    }
    else
    {
      generateIfChain(mv, resultType);
    }
    return mv;
  }

  /**
   * Emit a {@code lookupswitch} on the integer value of {@link #switchVariable},
   * dispatching to one branch per case key plus a default branch for the
   * {@code else} clause. This is the original generation strategy, preserved
   * verbatim for the legacy form.
   */
  private void generateLookupSwitch(MethodVisitor mv, Class<?> resultType)
  {
    TreeMap<Integer, Node<D, R, F>> map = legacyKeyValueMap();
    labels = new Label[map.size()];

    generateIndex(mv);

    for (int i = 0; i < labels.length; i++)
    {
      labels[i] = new Label();
    }

    int[] switchKeys = new int[map.size()];
    int   i          = 0;
    var   branches   = map.values().stream().toList();
    for (var key : map.keySet())
    {
      switchKeys[i++] = key.getSignedValue();
    }

    mv.visitLookupSwitchInsn(defaultLabel, switchKeys, labels);

    for (int j = 0; j < labels.length; j++)
    {
      Compiler.designateLabel(mv, labels[j]);
      var jthBranch     = branches.get(j);
      var jthBranchType = jthBranch.type();
      jthBranch.generate(mv, jthBranchType);
      Compiler.jumpTo(mv, endSwitch);
    }
    Compiler.designateLabel(mv, defaultLabel);
    super.generate(mv, resultType);
    Compiler.designateLabel(mv, endSwitch);
  }

  /**
   * Emit an if-chain over all cases:
   *
   * <pre>
   *   for each case (predicate, value):
   *     predicate.generate    -> int 0/1 on stack
   *     IFEQ falseLabel
   *     value.generate        -> result on stack
   *     GOTO endLabel
   *     falseLabel:
   *   defaultBranch.generate  -> result on stack
   *   endLabel:
   * </pre>
   */
  private void generateIfChain(MethodVisitor mv, Class<?> resultType)
  {
    Label endLabel = new Label();
    for (var c : cases)
    {
      Label falseLabel = new Label();
      c.predicate.generate(mv, int.class);
      mv.visitJumpInsn(Opcodes.IFEQ, falseLabel);
      c.value.generate(mv, resultType);
      Compiler.jumpTo(mv, endLabel);
      Compiler.designateLabel(mv, falseLabel);
    }
    super.generate(mv, resultType);
    Compiler.designateLabel(mv, endLabel);
  }

  /**
   * Load the discriminator value (an {@code int}) for the legacy lookupswitch
   * path. Not used by the if-chain path — that path's predicates load the
   * discriminator(s) themselves as part of comparison generation.
   */
  public void generateIndex(MethodVisitor mv)
  {
    if (switchVariable != null && !switchVariable.reference.equals(expression.getIndependentVariable().reference))
    {
      switchVariable.generate(mv, Integer.class);
    }
    else
    {
      cast(loadInputParameter(mv), expression.domainType);
    }
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       INTEGER_CLASS_INTERNAL_NAME,
                       "getSignedValue",
                       INT_METHOD_DESCRIPTOR,
                       false);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    var stream = cases.stream().flatMap(c -> Stream.of(c.predicate, c.value));
    return Stream.concat(stream, Stream.of(arg)).toList();
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    List<Case<D, R, F>> integratedCases = new ArrayList<>(cases.size());
    for (var c : cases)
    {
      integratedCases.add(new Case<>(c.predicate, c.value.integral(variable)));
    }
    Node<D, R, F> integratedDefault = arg.integral(variable);
    return new WhenNode<>(expression, integratedDefault, integratedCases, switchVariable);
  }

  @Override
  public boolean isAtomic()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return arg.isScalar();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new WhenNode<E, S, G>(newExpression,
                                 arg.spliceInto(newExpression),
                                 cases,
                                 switchVariable != null ? switchVariable.spliceInto(newExpression) : null);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable,
                                                                                       Node<E, S, G> arg)
  {
    for (var c : cases)
    {
      c.predicate = c.predicate.substitute(variable, arg);
      c.value     = c.value.substitute(variable, arg);
    }
    if (this.arg != null)
    {
      this.arg = this.arg.substitute(variable, arg);
    }
    return this;
  }

  @Override
  public char symbol()
  {
    return '≡';
  }

  @Override
  public String toString()
  {
    String caseString = cases.stream().map(this::formatCase).collect(Collectors.joining(","));
    return String.format("when(%s,else,%s)", caseString, arg);
  }

  protected String formatCase(Case<D, R, F> c)
  {
    return String.format("%s,%s", c.predicate, c.value);
  }

  @Override
  public Class<?> type()
  {
    return expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    StringBuilder sb = new StringBuilder();
    sb.append("\\\\left\\\\{\\\\begin{array}{ll}\\n");
    for (var c : cases)
    {
      sb.append(c.value.typeset());
      sb.append(" & \\\\text{if } ");
      sb.append(c.predicate.typeset());
      sb.append("\\\\\\\\\\n");
    }
    sb.append(arg.typeset());
    sb.append(" & \\\\text{otherwise}");
    sb.append("\\n\\\\end{array}\\\\right.");
    return sb.toString();
  }
}
