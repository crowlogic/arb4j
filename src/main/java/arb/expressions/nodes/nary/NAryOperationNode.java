package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.*;
import static arb.utensils.Utensils.indent;
import static org.objectweb.asm.Opcodes.*;

import java.util.List;
import java.util.Map.Entry;
import java.util.function.Consumer;

import org.objectweb.asm.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.Real;
import arb.exceptions.CompilerException;
import arb.expressions.*;
import arb.expressions.Context;
import arb.expressions.nodes.*;
import arb.functions.*;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.*;
import arb.functions.real.RealFunction;

/**
 * A node in the expression AST that compiles bounded n-ary operations — sums,
 * products, and analogous accumulations — into a tight JVM bytecode loop over
 * an {@link arb.Integer} index variable running from a lower limit to an upper
 * limit inclusive.
 *
 * <p>
 * The syntax parsed by this node is {@code ⊕f(k){k=a…b}}, where {@code ⊕} is
 * the operator sigil (Σ for sum, Π/∏ for product), {@code f(k)} is the operand
 * body (any expression in the index variable), and {@code {k=a…b}} binds the
 * index variable name and its limits. The operand body is compiled as a
 * separate {@link Sequence} class that shares the same
 * {@link arb.expressions.ExpressionClassLoader} and {@link Context} as the
 * enclosing expression. That compiled {@code Sequence} is held as a field on
 * the outer generated class and called once per loop iteration.
 *
 * <h2>Index variable — class field, not a method local</h2> The index variable
 * ({@code k} above) is declared as an {@code arb.Integer} field on the
 * generated class via {@link Expression#newIntermediateVariable}. Its generated
 * field name is stored in {@link #indexVariableGeneratedFieldName} and is
 * distinct from the logical index name held in {@link #indexVariableFieldName}.
 * Being a proper field means the {@code close()} method emitted by the compiler
 * will release its native memory, eliminating the per-call allocation and
 * native-memory leak that existed when it was a method-local.
 *
 * <h2>Operand expression initialisation sequence</h2> {@link #parseOperand()}
 * constructs the child {@link Expression} with the three-argument constructor,
 * which leaves its internal expression string null. Before calling
 * {@code resolve()} on the child, the parent's string is copied into it via
 * {@link arb.expressions.Expression#setExpression(String)} and the cursor via
 * {@link arb.expressions.Expression#setCursorState(arb.expressions.Expression.CursorState)}.
 * Without this step, {@code resolve()} immediately NPEs inside
 * {@code currentCodePoint() → getExpression().length()}. After
 * {@code resolve()} returns, the parent cursor is synced forward past the
 * tokens the child consumed, and then {@code updateStringRepresentation()}
 * trims the child's expression string to just the operand body. This ordering
 * is mandatory: setting the string before {@code resolve()} runs causes nested
 * {@link NAryOperationNode} constructors to find the parent sigil at position
 * zero and recurse without bound.
 *
 * <h2>Generated loop structure</h2> {@link #generate(MethodVisitor, Class)}
 * emits:
 * 
 * <pre>
 * // index is a field — allocated once at construction, closed by close()
 * accumulator.identity();
 * this.index.set(lowerLimit);
 * this.cachedUpper.set(upperLimit);
 * while (this.index.compareTo(this.cachedUpper) &lt;= 0)
 * {
 *   accumulator = accumulator.operation(operand.evaluate(this.index, bits, scratch), bits);
 *   this.index.increment();
 * }
 * result.set(accumulator);
 * </pre>
 * 
 * All of {@code accumulator}, {@code cachedUpper}, {@code scratch}, and
 * {@code index} are fields on the outer generated class.
 *
 * @param <D> domain type of the enclosing expression
 * @param <R> codomain / result type
 * @param <F> function interface of the enclosing expression
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class NAryOperationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              Node<D, R, F>
{
  public static final Logger                      logger                         = LoggerFactory.getLogger(NAryOperationNode.class);

  /**
   * The generated field name on the outer class for the {@code arb.Integer} index
   * variable (e.g. {@code jℤ0003}). Distinct from {@link #indexVariableFieldName}
   * which holds the logical name used inside the operand expression (e.g.
   * {@code j}). Assigned in {@link #declareIndexVariableField()}.
   */
  public String                                   indexVariableGeneratedFieldName;

  public static String                            operandEvaluateMethodSignature = Compiler.getMethodDescriptor(Object.class,
                                                                                                                Object.class,
                                                                                                                int.class,
                                                                                                                Object.class);

  public Label                                    beginLoop                      = new Label();

  public Label                                    endLoop                        = new Label();

  public Node<D, R, F>                            upperLimit;

  public String                                   upperLimitFieldName;

  public Expression<Integer, R, Sequence<R>>      operandExpression;

  public String                                   operandFunctionFieldName;

  public FunctionMapping<Integer, R, Sequence<R>> operandMapping;

  public String                                   operandValueFieldName;

  /** Generated {@code Real} field holding the {@code 2^-bits} convergence target. */
  public String                                   toleranceFieldName;

  /** Generated {@code Real} field holding {@code |term|} of the current summand. */
  public String                                   absTermFieldName;

  /**
   * Bytecode-level internal name of the owning {@link Expression}, captured once
   * at construction. Used as the {@code owner} argument to ASM
   * {@code visitFieldInsn}/{@code visitMethodInsn} calls in this class. See
   * {@link arb.expressions.Expression#internalName()} for the rule that
   * distinguishes this from the symbolic {@link arb.expressions.Expression#className()}.
   */
  public String                                   functionInternalName;

  public final String                             identity;

  public String                                   indexVariableFieldName;

  public String                                   familyIndexName;

  public final String                             operation;

  public boolean                                  parsed                         = false;

  public boolean                                  functionForm                   = false;

  public final String                             prefix;

  public Node<D, R, F>                            lowerLimit;

  public final String                             symbol;

  public List<Node<D, R, F>>                      cachedOperandBranches;

  public NAryOperationNode(Expression<D, R, F> expression, String identity, String prefix, String operation, String symbol)
  {
    this(expression,
         identity,
         prefix,
         operation,
         symbol,
         false);
  }

  public NAryOperationNode(Expression<D, R, F> expression, String identity, String prefix, String operation, String symbol, boolean functionForm)
  {
    super(expression);
    this.identity     = identity;
    this.prefix       = prefix;
    this.operation    = operation;
    this.symbol       = symbol;
    this.functionForm = functionForm;
    expression.getContext();
    // Two-phase field naming: parseOperand() needs the operand function field
    // name (it becomes the operand sub-class's class name and the key under
    // which the operandMapping is registered), but the operand VALUE field
    // (operandValueFieldName) is declared as a member of the OUTER class with a
    // specific type — and that type must match the operand body's actual
    // resolved type, which may be wider than expression.coDomainType (e.g.
    // Complex body inside a Real-valued outer expression where re/im extract
    // the Real part). So name the function field now; defer the value field
    // until after parseOperand has promoted operandExpression.coDomainType.
    assignOperandFunctionFieldNameIfNecessary();
    parseOperand();
    functionInternalName = expression.internalName();
    assert functionInternalName != null : "functionInternalName=expression.internalName() shan't be null for operandExpression=" + operandExpression;
    // The Sigma/Prod node's externally visible type is the operand body's actual
    // type (possibly wider than the outer codomain, e.g. a Complex body inside a
    // Real-codomain outer expression when re(Σ …)/im(Σ …) extract a Real result).
    // parseOperand() promotes operandExpression.coDomainType to the resolved body
    // type when wider; here we mirror that into generatedType so that upstream
    // type checks (e.g. FunctionNode.resultTypeFor("re") seeing arg.type() ==
    // Complex) work correctly.
    generatedType = (operandExpression != null && operandExpression.coDomainType != null)
                  ? operandExpression.coDomainType
                  : expression.coDomainType;
    // Now declare the value field at the promoted type so that GETFIELD at
    // codegen time (which uses generatedType) matches the field's actual
    // declared descriptor. Declaring it earlier (with expression.coDomainType)
    // would name the field Real while codegen GETFIELDs it as Complex, causing
    // NoSuchFieldError at first evaluate() call.
    assignOperandValueFieldNameIfNecessary(generatedType);
    parseOperatorLimitSpecifications();
  }

  /**
   * Constructor used by {@link #spliceInto(Expression)} and
   * {@link #substitute(String, Node)} — operand expression supplied directly.
   */
  public NAryOperationNode(Expression<D, R, F> expression,
                           String identity,
                           String prefix,
                           String operation,
                           String symbol,
                           Expression<Integer, R, Sequence<R>> operandExpression,
                           Node<D, R, F> lowerLimit,
                           Node<D, R, F> upperLimit)
  {
    super(expression);
    this.identity  = identity;
    this.prefix    = prefix;
    this.operation = operation;
    this.symbol    = symbol;
    expression.getContext();
    this.operandExpression = operandExpression;
    functionInternalName   = expression.internalName();
    assert functionInternalName != null : "functionInternalName=expression.internalName() shan't be null, expression=" + expression;
    generatedType   = expression.coDomainType;
    this.lowerLimit = lowerLimit;
    this.upperLimit = upperLimit;

    if (lowerLimit != null)
    {
      lowerLimit.parent = this;
    }
    if (upperLimit != null)
    {
      upperLimit.parent = this;
    }
  }

  @SuppressWarnings("unchecked")
  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    lowerLimit.accept(t);
    upperLimit.accept(t);
    if (operandExpression != null && operandExpression.rootNode != null)
    {
      operandExpression.rootNode.accept(node -> t.accept((Node<D, R, F>) (Node<?, ?, ?>) node));
    }
    t.accept(this);
  }

  @SuppressWarnings("unchecked")
  @Override
  public void replaceChild(Node<D, R, F> oldChild, Node<D, R, F> newChild)
  {
    if (operandExpression != null && operandExpression.rootNode == oldChild)
    {
      operandExpression.rootNode = (Node<Integer, R, Sequence<R>>) (Node<?, ?, ?>) newChild;
      newChild.parent            = this;
      oldChild.parent            = null;
    }
    else
    {
      throw new IllegalArgumentException(oldChild + " is not a child of " + this);
    }
  }

  @SuppressWarnings("unchecked")
  @Override
  public Node<D, R, F> getBody()
  {
    return operandExpression != null ? (Node<D, R, F>) (Node<?, ?, ?>) operandExpression.rootNode : null;
  }

  @SuppressWarnings("unchecked")
  @Override
  public void setBody(Node<D, R, F> body)
  {
    if (operandExpression != null)
    {
      operandExpression.rootNode = (Node<Integer, R, Sequence<R>>) (Node<?, ?, ?>) body;
    }
  }

  /**
   * Allocate the operand-function field name (used as the operand sub-class's
   * class name and the operandMapping registration key). Type-independent, so
   * it can be called before the operand body has been parsed/resolved.
   */
  protected void assignOperandFunctionFieldNameIfNecessary()
  {
    if (operandFunctionFieldName == null)
    {
      operandFunctionFieldName = expression.getNextIntermediateVariableFieldName(expression.className() + "operand", Function.class);
    }
  }

  /**
   * Allocate the operand-value field on the OUTER class with the given type.
   * Type-dependent, so it must be called only after parseOperand() has
   * resolved (and possibly promoted) the operand body type, otherwise the
   * field's declared descriptor will not match the GETFIELD descriptor used
   * by codegen.
   */
  protected void assignOperandValueFieldNameIfNecessary(Class<?> resultType)
  {
    if (operandValueFieldName == null)
    {
      operandValueFieldName = expression.newIntermediateVariable("value", resultType);
    }
  }

  protected void assignFieldNamesIfNecessary(Class<?> resultType)
  {
    assignOperandFunctionFieldNameIfNecessary();
    assignOperandValueFieldNameIfNecessary(resultType);
    if (Expression.traceNodes)
    {
      int indentation = 18 + getClass().getSimpleName().length();
      logFieldNameAssignment(resultType, indentation);
    }
  }

  protected void logFieldNameAssignment(Class<?> resultType, int indentation)
  {
    if (Expression.traceNodes)
    {
      logger.debug(String.format("%s.assignFieldNames(this=%s,resultType=%s,\n%soperandFunctionFieldName=%s,\n%soperandValueFieldName=%s)\n\n",
                                 getClass().getSimpleName(),
                                 expression.functionName,
                                 resultType,
                                 indent(indentation),
                                 operandFunctionFieldName,
                                 indent(indentation),
                                 operandValueFieldName));
    }
  }

  protected void assignResult(MethodVisitor mv, Class<?> resultType)
  {
    if (isRootNode)
    {
      Compiler.loadResultParameter(mv);
      var type = type();
      Compiler.cast(mv, type);
      loadIntermediateResultVariable(mv);
      invokeSetMethod(mv, type, type);
    }
    else
    {
      loadIntermediateResultVariable(mv);
    }
  }

  public MethodVisitor combine(MethodVisitor mv)
  {
    return invokeMethod(mv, generatedType, operation, getMethodDescriptor(generatedType, generatedType, int.class), false);
  }

  protected void compareIndexToUpperLimit(MethodVisitor mv)
  {
    loadFieldFromThis(mv, upperLimitFieldName, Integer.class);
    invokeMethod(mv, Integer.class, "compareTo", Compiler.getMethodDescriptor(int.class, Integer.class), false);
  }

  protected void evaluateOperand(MethodVisitor mv)
  {
    invokeMethod(mv, Type.getInternalName(Function.class), "evaluate", operandEvaluateMethodSignature, true);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (upperLimit.isPositiveInfinity())
    {
      return generateConvergentSum(mv, resultType);
    }
    resultType = assignTypes(resultType);

    assignFieldNamesIfNecessary(resultType);
    declareIndexVariableField();

    propagateInputToOperand(mv);
    initializeResultVariable(mv, resultType);
    setIndexToTheLowerLimit(mv);
    loadIndexVariable(mv);
    generateUpperLimit(mv);
    designateLabel(mv, beginLoop);
    compareIndexToUpperLimit(mv);
    jumpToIfGreaterThan(mv, endLoop);
    generateInnerLoop(mv);
    jumpTo(mv, beginLoop);
    designateLabel(mv, endLoop);
    assignResult(mv, resultType);
    return mv;
  }

  /**
   * Emits the {@code {n=n₀..∞}} sum. This is the <em>identical</em> loop as the
   * finite {@link #generate} case — {@code result += operand(index); index++} —
   * with only the <em>loop-termination criterion</em> changed: instead of
   * comparing the index against a fixed upper bound, the loop stops once the
   * summand {@code |f(n)|} has fallen to the {@code 2^-bits} precision floor, or
   * once it stops shrinking (the precision floor has been reached). Every
   * infinite sum is, by contract, convergent; a divergent series is a modelling
   * error detected at construction time, never a runtime branch here.
   */
  protected MethodVisitor generateConvergentSum(MethodVisitor mv, Class<?> resultType)
  {
    if (!"add".equals(operation))
    {
      throw new CompilerException(String.format("%s with an ∞ upper limit must be a sum (Σ), not %s(%s)",
                                                symbol,
                                                symbol,
                                                operation));
    }
    resultType = assignTypes(resultType);
    assignFieldNamesIfNecessary(resultType);
    declareIndexVariableField();
    declareConvergenceFields();

    propagateInputToOperand(mv);
    initializeResultVariable(mv, resultType);
    setIndexToTheLowerLimit(mv);
    generateConvergenceTarget(mv);
    designateLabel(mv, beginLoop);
    generateInnerLoop(mv);
    pop(mv);
    generateConvergenceTest(mv);
    jumpTo(mv, beginLoop);
    designateLabel(mv, endLoop);
    assignResult(mv, resultType);
    return mv;
  }

  /**
   * Declares the {@code Real} scratch fields the {@code {..∞}} termination test
   * uses: the {@code 2^-bits} tolerance, and the current/previous summand
   * magnitudes. Registered as intermediate variables so the compiler-emitted
   * {@code close()} releases their native memory.
   */
  protected void declareConvergenceFields()
  {
    if (toleranceFieldName == null)
    {
      toleranceFieldName = expression.newIntermediateVariable("tolerance", Real.class);
    }
    if (absTermFieldName == null)
    {
      absTermFieldName = expression.newIntermediateVariable("absTerm", Real.class);
    }
  }

  /**
   * Emits {@code tolerance = 2^-bits} once, before the loop: the summand
   * magnitude below which the tail contributes nothing at the working precision.
   */
  protected void generateConvergenceTarget(MethodVisitor mv)
  {
    // tolerance = 1 ; tolerance = tolerance · 2^(-bits)
    loadFieldFromThis(mv, toleranceFieldName, Real.class);
    invokeMethod(mv, Real.class, "one", getMethodDescriptor(Real.class), false);
    loadBitsParameterOntoStack(mv);
    mv.visitInsn(INEG);
    loadFieldFromThis(mv, toleranceFieldName, Real.class);
    invokeMethod(mv, Real.class, "mul2e", getMethodDescriptor(Real.class, int.class, Real.class), false);
    pop(mv);
  }

  /**
   * Emits the loop-termination criterion evaluated once per iteration on the
   * just-added summand held in {@link #operandValueFieldName}: stop once the
   * term magnitude has fallen to the {@code 2^-bits} precision floor.
   *
   * <pre>
   *   absTerm = |term|
   *   if (absTerm ≤ tolerance) break;
   * </pre>
   *
   * Every infinite sum is convergent by contract, so its terms necessarily fall
   * below any positive tolerance; a divergent series is a modelling error caught
   * at construction time, never here.
   */
  protected void generateConvergenceTest(MethodVisitor mv)
  {
    // absTerm = |term|
    loadFieldFromThis(mv, operandValueFieldName, generatedType);
    loadBitsParameterOntoStack(mv);
    loadFieldFromThis(mv, absTermFieldName, Real.class);
    invokeMethod(mv, generatedType, "abs", getMethodDescriptor(Real.class, int.class, Real.class), false);
    pop(mv);

    // if (absTerm ≤ tolerance) break;
    loadFieldFromThis(mv, absTermFieldName, Real.class);
    loadFieldFromThis(mv, toleranceFieldName, Real.class);
    invokeMethod(mv, Real.class, "compareTo", getMethodDescriptor(int.class, Real.class), false);
    jumpToIfLessThanOrEquals(mv, endLoop);
  }

  protected void declareIndexVariableField()
  {
    assert indexVariableFieldName != null : "indexVariableFieldName must be set before declareIndexVariableField";
    if (indexVariableGeneratedFieldName == null)
    {
      indexVariableGeneratedFieldName =
                                      expression.newIntermediateVariable(expression.getNextIntermediateVariableFieldName(indexVariableFieldName, generatedType),
                                                                         Integer.class);
    }
  }

  public Class<?> assignTypes(Class<?> resultType)
  {
    if (!expression.thisOrAnyUpstreamExpressionHasFunctionalCodomain())
    {
      resultType = scalarType(resultType);
    }
    else if (RealPolynomial.class.equals(resultType) || ComplexPolynomial.class.equals(resultType))
    {
      generatedType = resultType;
    }
    return resultType;
  }

  protected void generateUpperLimit(MethodVisitor mv)
  {
    upperLimitFieldName = expression.newIntermediateVariable("upperLimit", Integer.class);
    upperLimit.generate(loadFieldFromThis(mv, upperLimitFieldName, Integer.class), Integer.class);
    pop(invokeSetMethod(mv, Integer.class, Integer.class));
  }

  protected void generateInnerLoop(MethodVisitor mv)
  {
    loadIntermediateResultVariable(mv);
    loadOperand(mv);
    loadIndexVariable(mv);
    loadBitsParameterOntoStack(mv);
    loadOperandValue(mv);
    evaluateOperand(mv);
    cast(mv, generatedType);
    loadBitsParameterOntoStack(mv);
    combine(mv);
    pop(mv);
    incrementIndex(mv);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    if (operandExpression == null)
    {
      return List.of();
    }
    if (cachedOperandBranches == null)
    {
      var ast  = operandExpression.syntaxTree();
      var list = ast.indexedBranches.get(ast.getRoot());
      cachedOperandBranches = list.stream().map(element -> element.spliceInto(expression)).toList();
    }
    return cachedOperandBranches;
  }

  void getField(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    assert fieldName != null : String.format("field is null %s\n", this);
    if (Expression.traceNodes)
    {
      logger.debug(String.format("NAryOperation.getField(functionInternalName=%s,\n%sfieldName=%s,\n%sfieldTypeSignature=%s\n\n",
                                 functionInternalName,
                                 indent(9),
                                 fieldName,
                                 indent(9),
                                 fieldTypeSignature));
    }
    getFieldFromThis(methodVisitor, functionInternalName, fieldName, fieldTypeSignature);
  }

  @Override
  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public String getIndexVariableFieldName()
  {
    return indexVariableFieldName;
  }

  protected void incrementIndex(MethodVisitor mv)
  {
    generateVirtualMethodInvocation(loadIndexVariable(mv), Integer.class, "increment", Integer.class);
  }

  public void initializeResult(MethodVisitor mv, Class<?> resultType, String identityFunction, String prefix)
  {
    fieldName = expression.allocateIntermediateVariable(mv, prefix, resultType);
    pop(generateVirtualMethodInvocation(mv, resultType, identityFunction, resultType));
  }

  public void initializeResultVariable(MethodVisitor mv, Class<?> resultType)
  {
    initializeResult(mv, resultType, identity, prefix);
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("integral of NAryOperationNode not implemented");
  }

  @Override
  public boolean isAtomic()
  {
    return true;
  }

  protected void loadOperand(MethodVisitor mv)
  {
    getFieldFromThis(mv, functionInternalName, operandFunctionFieldName, operandMapping.functionFieldDescriptor());
  }

  protected void loadOperandValue(MethodVisitor mv)
  {
    if (Expression.traceNodes)
    {
      logger.debug(String.format("%s.loadOperandValue(operandValueFieldName=%s, generatedType=%s) expression=%s\n",
                                 getClass().getSimpleName(),
                                 operandValueFieldName,
                                 generatedType,
                                 expression));
    }
    loadFieldFromThis(mv, operandValueFieldName, generatedType);
  }

  /**
   * Loads the {@code arb.Integer} index field (named
   * {@link #indexVariableGeneratedFieldName}) from {@code this} onto the operand
   * stack via {@code GETFIELD}.
   */
  MethodVisitor loadIndexVariable(MethodVisitor methodVisitor)
  {
    assert indexVariableFieldName != null : String.format("indexVariableFieldName is null %s\n", this);
    assert indexVariableGeneratedFieldName != null : "indexVariableGeneratedFieldName not yet declared — call declareIndexVariableField() first";
    loadFieldFromThis(methodVisitor, indexVariableGeneratedFieldName, Integer.class);
    return methodVisitor;
  }

  public void loadIntermediateResultVariable(MethodVisitor methodVisitor)
  {
    if (Expression.traceNodes)
    {
      logger.debug(String.format("%s.loadResultvariable( resultVariable= %s, generatedType=%s )\n", getClass().getSimpleName(), fieldName, generatedType));
    }
    getFieldFromThis(methodVisitor, expression.internalName(), fieldName, generatedType);
  }

  private void parseUpperLimit()
  {
    upperLimit = expression.resolve();
  }

  /**
   * Parses the operand body of this n-ary operation and wires it into a freshly
   * allocated child {@link Expression} that will be compiled as a sibling class.
   *
   * <p>
   * When the operand uses explicit arrow syntax ({@code k➔f(k)}), the index
   * variable name is known immediately and variable resolution proceeds eagerly.
   * Otherwise, variable resolution is deferred: the operand body is parsed with
   * {@link Expression#deferVariableResolution} set, then
   * {@link #parseOperatorLimitSpecifications()} extracts the index variable name
   * from the {@code {k=a…b}} limit spec, assigns the input variable, and triggers
   * resolution via {@link Node#resolveVariables()}.
   */
  @SuppressWarnings("unchecked")
  private void parseOperand()
  {
    assert operandFunctionFieldName != null : "assignFieldNamesIfNecessary must be called before parseOperand";

    String arrowVar = expression.parseExplicitInputVariableIfPresent();
    if (arrowVar != null)
    {
      indexVariableFieldName = arrowVar;
    }

    Class<R> operandCoDomain = (Class<R>) (expression.isFunctional()
                  && !Polynomial.class.isAssignableFrom(expression.coDomainType) ? scalarCoDomain(expression.coDomainType) : expression.coDomainType);
    operandExpression = new Expression<>(Integer.class,
                                         operandCoDomain,
                                         Sequence.class);
    operandExpression.setExpression(expression.getExpression());
    operandExpression.setCursorState(expression.saveCursor());
    operandExpression.upstreamExpression = expression;
    operandExpression.setContext(expression.getContext());
    operandExpression.setIndependentVariable(null);
    operandExpression.setClassName(operandFunctionFieldName);

    if (arrowVar != null)
    {
      VariableNode<Integer, R, Sequence<R>> indexVar = new VariableNode<>(operandExpression,
                                                                          operandExpression.newVariableReference(indexVariableFieldName),
                                                                          false);
      operandExpression.assignInputVariable(indexVar);
    }
    else
    {
      operandExpression.deferVariableResolution = true;
    }

    operandExpression.rootNode = operandExpression.resolve();

    // Promote the operand sub-expression's coDomainType to the resolved body's
    // actual type when the body is wider (e.g. body evaluates to Complex but the
    // operand was provisionally typed Real because the outer expression is
    // Real-valued). Without this, the generated bytecode for the operand class
    // declares a Real return type while the actual operand value is Complex,
    // producing a VerifyError at class-load time. The widening is only applied
    // when the body type is strictly assignable upward from the provisional
    // coDomainType per Compiler.canBeAssignedTo, preserving the existing
    // promotion lattice.
    //
    // Only safe for the arrow form (k➔body): the explicit index variable is
    // already bound, so operandExpression.rootNode.type() resolves without
    // throwing. For the no-arrow form (Σ body {k=…}) variable resolution is
    // deferred until parseOperatorLimitSpecifications() binds the index, and
    // rootNode.type() would throw on still-unresolved references like a
    // co-bound dimension variable.
    if (arrowVar != null)
    {
      Class<?> resolvedBodyType = operandExpression.rootNode == null
                                ? null
                                : operandExpression.rootNode.type();
      if (resolvedBodyType != null
                    && !resolvedBodyType.equals(operandExpression.coDomainType)
                    && arb.expressions.Compiler.canBeAssignedTo(operandExpression.coDomainType, resolvedBodyType))
      {
        @SuppressWarnings("unchecked")
        Class<R> promoted = (Class<R>) resolvedBodyType;
        operandExpression.coDomainType = promoted;
      }
    }

    expression.setCursorState(operandExpression.saveCursor());
    operandExpression.updateStringRepresentation();
    registerOperand(operandFunctionFieldName, operandExpression);
    propagateContextVariablesToOperand();
  }

  /**
   * Parses {@code {k=a…b}}, records the index variable name and the lower and
   * upper limits. When the operand was parsed with deferred variable resolution
   * (no arrow syntax), this method also assigns the index variable as the
   * operand's input and triggers resolution of all deferred variable references.
   *
   * <p>
   * The index variable is declared as a field on the generated class (not a
   * method local) by {@link #declareIndexVariableField()}, which is called from
   * {@link #generate(MethodVisitor, Class)} once {@link #indexVariableFieldName}
   * is known.
   */
  public Node<D, R, F> parseOperatorLimitSpecifications()
  {
    boolean usedBrace;
    if (functionForm)
    {
      usedBrace = expression.nextCharacterIs('{');
      if (!usedBrace)
      {
        expression.require(',');
      }
    }
    else
    {
      expression.require('{');
      usedBrace = true;
    }

    String specifiedName = expression.parseName();
    if (specifiedName == null || specifiedName.isEmpty())
    {
      expression.throwUnexpectedCharacterException("index variable name cannot be null or empty");
    }

    if (indexVariableFieldName != null)
    {
      if (!indexVariableFieldName.equals(specifiedName))
      {
        throw new CompilerException(String.format("index variable specified in the limit specification '%s' does not match the index variable '%s' parsed from the operand",
                                                  specifiedName,
                                                  indexVariableFieldName));
      }
    }
    else
    {
      indexVariableFieldName = specifiedName;
    }

    if (expression.nextCharacterIs('\u2236'))
    {
      String firstFamilyIndexName = expression.parseName();
      expression.require('=');
      this.lowerLimit = expression.resolve();
      expression.require('\u2026');
      this.upperLimit             = expression.resolve();
      this.indexVariableFieldName = firstFamilyIndexName;
      operandExpression.setCursorState(expression.saveCursor());
      var loNode = this.lowerLimit.spliceInto(operandExpression);
      var hiNode = this.upperLimit.spliceInto(operandExpression);
      registerFamilyFunction(operandExpression, specifiedName, firstFamilyIndexName, loNode, hiNode, operandExpression.rootNode);
      expression.setCursorState(operandExpression.saveCursor());
      operandExpression.rootNode.resolveFunctions();
      expression.getContext().functions.values().forEach(fm ->
      {
        if (fm.expression != null && fm.expression.rootNode != null)
          fm.expression.rootNode.resolveFunctions();
      });
      if (usedBrace)
      {
        expression.require('}');
      }
      return this;
    }

    boolean resolveAfterMultisum = operandExpression.deferVariableResolution;
    if (resolveAfterMultisum)
    {
      operandExpression.deferVariableResolution = false;
      VariableNode<Integer, R, Sequence<R>> indexVar = new VariableNode<>(operandExpression,
                                                                          operandExpression.newVariableReference(indexVariableFieldName),
                                                                          false);
      operandExpression.assignInputVariable(indexVar);
    }

    expression.require('=');
    parseLowerLimit();
    parseUpperLimit();

    if (resolveAfterMultisum)
    {
      operandExpression.rootNode.resolveVariables();
      operandExpression.rootNode.resolveFunctions();
    }

    if (usedBrace)
    {
      expression.require('}');
    }

    return this;
  }

  /**
   * Registers a family function binding {@code name∶familyIndex=lo…hi} into
   * {@code currentOperandExpression}.
   *
   * <p>
   * The function {@code name} is backed by a generated class (a
   * {@link IntegerFunction}) whose {@code evaluate(Integer familyIndex, …)}</p>
   * method returns the value of the family member at {@code familyIndex} for the
   * current partition point. The partition enumeration is done by a
   * weighted-partition enumerator that is wired into the codegen of this Σ/Π node
   * via {@link #partitionEnumeratorFieldName}.
   *
   * <p>
   * After this call:
   * <ul>
   * <li>{@code name} is in {@code currentOperandExpression.context} as an
   * {@link IntegerFunction} mapping.</li>
   * <li>The operand expression's root node is left as {@code savedBody} (no
   * structural rewrite is needed — the body already calls
   * {@code name(familyIndex)} through FunctionNode).</li>
   * <li>A {@link WeightedPartitionEnumeratorNode} is inserted around the current
   * body to drive the partition loop.</li>
   * </ul>
   *
   * @param currentOperandExpression the expression into which to register
   * @param familyName               the name of the family function (e.g. "m")
   * @param familyIndexName          the family index variable name (e.g. "ℓ")
   * @param loNode                   lower bound of the family index
   * @param hiNode                   upper bound of the family index
   * @param bodyNode                 the summand body that references familyName
   */
  @SuppressWarnings("unchecked")
  private void registerFamilyFunction(Expression<Integer, R, Sequence<R>> currentOperandExpression,
                                      String familyName,
                                      String familyIndexName,
                                      Node<Integer, R, Sequence<R>> loNode,
                                      Node<Integer, R, Sequence<R>> hiNode,
                                      Node<Integer, R, Sequence<R>> bodyNode)
  {
    String arrayFieldName = currentOperandExpression.getNextIntermediateVariableFieldName(familyName + "Arr", int[].class);
    currentOperandExpression.newIntermediateVariable(arrayFieldName, int[].class);

    @SuppressWarnings("rawtypes")
    FunctionMapping<Integer, arb.Integer, IntegerFunction> familyMapping = currentOperandExpression.getContext()
                                                                                                   .registerFunctionMapping(familyName,
                                                                                                                            null,
                                                                                                                            arb.Integer.class,
                                                                                                                            arb.Integer.class,
                                                                                                                            IntegerFunction.class,
                                                                                                                            false,
                                                                                                                            null,
                                                                                                                            null);

    familyMapping.functionFieldDescriptor(true);
    currentOperandExpression.registerReferencedFunction(familyName, familyMapping);

    var enumeratorNode = new WeightedPartitionEnumeratorNode<>(this.expression,
                                                               currentOperandExpression,
                                                               familyName,
                                                               arrayFieldName,
                                                               familyMapping,
                                                               familyIndexName,
                                                               loNode,
                                                               hiNode,
                                                               bodyNode,
                                                               identity,
                                                               operation);
    currentOperandExpression.rootNode = (Node<Integer, R, Sequence<R>>) (Node<?, ?, ?>) enumeratorNode;
    expression.setCursorState(currentOperandExpression.saveCursor());
  }

  protected void propagateContextVariablesToOperand()
  {
    if (expression.getContext() != null && expression.getContext().variables != null)
    {
      expression.registerInitializer(mv ->
      {
        expression.getContext().variableEntries().forEach(entry -> propagateContextVariableToOperand(mv, entry));
      });
    }
  }

  protected void propagateContextVariableToOperand(MethodVisitor mv, Entry<String, Named> entry)
  {
    String fieldName = entry.getKey();
    Named  val       = entry.getValue();
    if (val != null)
    {
      Class<?> fieldType                = val.getClass();
      String   fieldTypeDescriptor      = fieldType.descriptorString();
      String   operandClassInternalName = operandExpression.internalName();
      String   operandFieldDescriptor   = String.format("L%s;", operandClassInternalName);

      Label    notNull                  = new Label();
      Label    end                      = new Label();

      loadThisOntoStack(mv);
      mv.visitFieldInsn(GETFIELD, expression.internalName(), operandFunctionFieldName, operandFieldDescriptor);
      mv.visitFieldInsn(GETFIELD, operandClassInternalName, fieldName, fieldTypeDescriptor);
      mv.visitJumpInsn(IFNONNULL, notNull);

      loadThisOntoStack(mv);
      mv.visitFieldInsn(GETFIELD, expression.internalName(), operandFunctionFieldName, operandFieldDescriptor);
      Compiler.generateNewObjectInstruction(mv, fieldType);
      Compiler.duplicateTopOfTheStack(mv);
      Compiler.invokeDefaultConstructor(mv, fieldType);
      mv.visitFieldInsn(PUTFIELD, operandClassInternalName, fieldName, fieldTypeDescriptor);

      mv.visitLabel(notNull);

      loadThisOntoStack(mv);
      mv.visitFieldInsn(GETFIELD, expression.internalName(), operandFunctionFieldName, operandFieldDescriptor);
      mv.visitFieldInsn(GETFIELD, operandClassInternalName, fieldName, fieldTypeDescriptor);
      loadThisOntoStack(mv);
      mv.visitFieldInsn(GETFIELD, expression.internalName(), fieldName, fieldTypeDescriptor);
      Compiler.generateVirtualMethodInvocation(mv, fieldType, "set", fieldType, fieldType);
      mv.visitInsn(Opcodes.POP);

      mv.visitLabel(end);
    }
  }

  private void parseLowerLimit()
  {
    lowerLimit = expression.resolve();
    expression.require('\u2026');
  }

  protected void propagateInputToOperand(MethodVisitor mv)
  {
    var independentVariableNode = expression.getIndependentVariable();

    if (independentVariableNode != null && !independentVariableNode.type().equals(Object.class))
    {
      generateCodeToPropagateIndependentVariableToOperand(mv, independentVariableNode);
    }

    if (operandExpression != null)
    {
      generateCodeToPropagateIndependentUpstreamVariablesToOperand(mv, independentVariableNode);
    }
  }

  protected void generateCodeToPropagateIndependentUpstreamVariablesToOperand(MethodVisitor mv, VariableNode<D, R, F> independentVariableNode)
  {
    operandExpression.getReferencedVariables()
                     .entrySet()
                     .forEach(entry -> generateCodeToPropagateIndependentUpstreamVariablesToOperand(mv, independentVariableNode, entry));
  }

  protected <N extends Node<D, R, F>>
            void
            generateCodeToPropagateIndependentUpstreamVariablesToOperand(MethodVisitor mv,
                                                                         VariableNode<D, R, F> independentVariableNode,
                                                                         Entry<String, VariableNode<Integer, R, Sequence<R>>> entry)
  {
    VariableNode<Integer, R, Sequence<R>> varNode = entry.getValue().asVariable();
    if (varNode.upstreamInput)
    {
      String   varName = entry.getKey();
      Class<?> varType = varNode.type();

      if (independentVariableNode != null && varName.equals(independentVariableNode.getName()))
      {
        return;
      }

      String varDesc                  = varType.descriptorString();
      String operandClassInternalName = operandExpression.internalName();
      String operandDesc              = String.format("L%s;", operandClassInternalName);

      Label  fieldNotNull             = new Label();

      expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
      mv.visitFieldInsn(GETFIELD, operandClassInternalName, varName, varDesc);
      mv.visitJumpInsn(IFNONNULL, fieldNotNull);

      expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
      generateNewObjectInstruction(mv, varType);
      duplicateTopOfTheStack(mv);
      invokeDefaultConstructor(mv, varType);
      putField(mv, operandClassInternalName, varName, varType);

      mv.visitLabel(fieldNotNull);

      expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
      mv.visitFieldInsn(GETFIELD, operandClassInternalName, varName, varDesc);
      loadFieldFromThis(mv, varName, varType);
      generateVirtualMethodInvocation(mv, varType, "set", varType, varType);
      mv.visitInsn(Opcodes.POP);

      if (Expression.traceNodes)
      {
        logger.debug("{}.propagateInputToOperand: propagating ascendent independent variable {} (type={}) to operand {}",
                     getClass().getSimpleName(),
                     varName,
                     varType,
                     operandFunctionFieldName);
      }
    }
  }

  protected void generateCodeToPropagateIndependentVariableToOperand(MethodVisitor mv, VariableNode<D, R, F> independentVariableNode)
  {
    String   varName                  = independentVariableNode.reference.name;
    Class<?> varType                  = independentVariableNode.type();
    String   varDesc                  = varType.descriptorString();
    String   operandClassInternalName = operandExpression.internalName();
    String   operandDesc              = String.format("L%s;", operandClassInternalName);

    Label    fieldNotNull             = new Label();

    expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
    mv.visitFieldInsn(GETFIELD, operandClassInternalName, varName, varDesc);
    Compiler.jumpToIfNotNull(mv, fieldNotNull);

    expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
    generateNewObjectInstruction(mv, varType);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, varType);
    putField(mv, operandClassInternalName, varName, varType);

    Compiler.designateLabel(mv, fieldNotNull);

    expression.loadThisAndFieldOntoStack(mv, operandFunctionFieldName, operandDesc);
    mv.visitFieldInsn(GETFIELD, operandClassInternalName, varName, varDesc);
    cast(loadInputParameter(mv), varType);
    generateVirtualMethodInvocation(mv, varType, "set", varType, varType);
    Compiler.pop(mv);

    if (Expression.traceNodes)
    {
      logInputPropagationToOperand(independentVariableNode);
    }
  }

  protected void logInputPropagationToOperand(VariableNode<D, R, F> independentVariableNode)
  {
    if (Expression.traceNodes)
    {
      logger.debug(String.format("%s.logInputPropagationToOperand( operandFunctionFieldName=%s,\n"
                                 + "%sindependentVariableNode=%s,\n"
                                 + "%sindependentVariableNode.type=%s)\n\n",
                                 getClass().getSimpleName(),
                                 operandFunctionFieldName,
                                 indent(48),
                                 independentVariableNode,
                                 indent(48),
                                 independentVariableNode.type()));
    }
  }

  void registerOperand(String expr, Expression<Integer, R, Sequence<R>> operandExpression)
  {
    assert operandFunctionFieldName != null : "operandFunctionFieldName shan't be null";

    operandMapping = expression.getContext()
                               .registerFunctionMapping(operandFunctionFieldName,
                                                        null,
                                                        Integer.class,
                                                        operandExpression.coDomainType,
                                                        Sequence.class,
                                                        true,
                                                        operandExpression,
                                                        expr);
    if (Expression.traceNodes)
    {
      logger.debug(String.format("\nregisterOperand(operandExpression=%s,\noperandMapping=%s\n)\n\n", operandExpression, operandMapping));
    }
    expression.registerReferencedFunction(operandFunctionFieldName, operandMapping);
  }

  /**
   * Returns the scalar element type for a given codomain type.
   *
   * <p>
   * For sequence/function interfaces that are not directly instantiable, returns
   * the concrete element type that can be used as an operand codomain. For
   * polynomial sequence interfaces ({@link ComplexPolynomialSequence},
   * {@link RealPolynomialSequence}), returns the corresponding polynomial element
   * type so that the operand expression accumulates polynomial values rather than
   * being demoted to a scalar. For scalar sequence/function types, returns the
   * scalar element type. For all other types, returns the type unchanged.
   *
   * <p>
   * <b>Critical invariant:</b> the returned type must be a concrete, instantiable
   * class — never an interface — because ASM will emit {@code NEW} against it.
   */
  public static Class<?> scalarCoDomain(Class<?> type)
  {
    if (RealSequence.class.equals(type))
    {
      return Real.class;
    }
    if (ComplexSequence.class.equals(type))
    {
      return Complex.class;
    }
    if (IntegerSequence.class.equals(type))
    {
      return Integer.class;
    }
    if (ComplexPolynomialSequence.class.equals(type))
    {
      return ComplexPolynomial.class;
    }
    if (RealPolynomialSequence.class.equals(type))
    {
      return RealPolynomial.class;
    }
    if (ComplexFunction.class.equals(type))
    {
      return Complex.class;
    }
    if (RealFunction.class.equals(type))
    {
      return Real.class;
    }
    if (RealToComplexFunction.class.equals(type))
    {
      return Complex.class;
    }
    return type;
  }

  public Class<?> scalarType(Class<?> resultType)
  {
    if (RealPolynomial.class.equals(resultType))
    {
      return resultType = generatedType = Real.class;
    }
    if (RealSequence.class.equals(resultType))
    {
      return resultType = generatedType = Real.class;
    }
    if (ComplexSequence.class.equals(resultType))
    {
      return resultType = generatedType = Complex.class;
    }
    if (IntegerSequence.class.equals(resultType))
    {
      return resultType = generatedType = Integer.class;
    }
    return resultType = generatedType = resultType;
  }

  protected void setIndexToTheLowerLimit(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    lowerLimit.generate(methodVisitor, Integer.class);
    invokeSetMethod(methodVisitor, Integer.class, Integer.class);
    Compiler.pop(methodVisitor);
  }

  @SuppressWarnings("unchecked")
  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    var splicedOperandExpression = (Expression<Integer, S, Sequence<S>>) (Expression<?, ?, ?>) operandExpression;
    var nAryOperationNode        = createSimilarNode(newExpression,
                                                     splicedOperandExpression,
                                                     lowerLimit.spliceInto(newExpression),
                                                     upperLimit.spliceInto(newExpression));
    nAryOperationNode.assignFieldNamesIfNecessary(newExpression.coDomainType);
    nAryOperationNode.indexVariableFieldName          = this.indexVariableFieldName;
    nAryOperationNode.indexVariableGeneratedFieldName = this.indexVariableGeneratedFieldName;
    // The index field was declared on the source expression; move that
    // declaration onto the expression this node is being spliced into so the
    // generated class actually declares the field it references.
    if (this.indexVariableGeneratedFieldName != null
                  && !newExpression.hasIntermediateVariable(this.indexVariableGeneratedFieldName))
    {
      newExpression.registerIntermediateVariable(this.indexVariableGeneratedFieldName, Integer.class, true);
    }
    nAryOperationNode.parsed                          = this.parsed;
    nAryOperationNode.functionInternalName            = newExpression.internalName();
    nAryOperationNode.operandFunctionFieldName        = this.operandFunctionFieldName;
    nAryOperationNode.operandMapping                  = (FunctionMapping<Integer, S, Sequence<S>>) (FunctionMapping<?, ?, ?>) this.operandMapping;
    newExpression.registerReferencedFunction(this.operandFunctionFieldName, this.operandMapping);
    // The operand sub-function was built in the source expression's context.
    // Splicing moves this node into newExpression, whose context both drives
    // declareFunctionReferences (it walks context.functions to decide which
    // reference fields to declare) and owns the ExpressionClassLoader the
    // generated classes are defined in. Re-home the operand mapping and its
    // expression into newExpression's context so (a) the operand-function field
    // is actually declared on newExpression's class — otherwise the emitted
    // GETFIELD has no matching field and instantiation throws NoSuchFieldError —
    // and (b) the operand sub-class is defined by the same loader as its parent,
    // so the parent's `this.<operand>.context = this.context` assignment does
    // not fail with a cross-loader protected-access IllegalAccessError.
    if (this.operandMapping != null && newExpression.getContext() != null)
    {
      if (newExpression.getContext().functions.get(this.operandFunctionFieldName) == null)
      {
        newExpression.getContext().functions.put(this.operandFunctionFieldName, this.operandMapping);
      }
      if (this.operandMapping.expression != null
                    && this.operandMapping.expression.getContext() != newExpression.getContext())
      {
        this.operandMapping.expression.setContext(newExpression.getContext());
      }
    }
    return nAryOperationNode;
  }

  @Override
  public Node<D, R, F> replaceConstantNodes()
  {
    lowerLimit = lowerLimit.replaceConstantNodes();
    upperLimit = upperLimit.replaceConstantNodes();
    return super.replaceConstantNodes();
  }

  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> substitution)
  {
    if (substitution.toString().equals(variable))
    {
      return this;
    }

    // Splice the substitution node into the operand's own expression and use the
    // Node-valued substitute overload. The operand references the outer variable
    // (e.g. a definite integral's integration variable) as an upstream variable;
    // substituting it with a limit node that is a literal constant or other
    // input-variable-free node would NPE in the Expression-valued overload, which
    // dereferences substitution.getInputVariable(). The substitution may itself
    // reference outer free variables (e.g. z in 2*z) that are not part of the
    // operand's local scope, so resolution is deferred across the splice to avoid
    // force-resolving them against the operand's context.
    boolean deferred = operandExpression.deferVariableResolution;
    operandExpression.deferVariableResolution = true;
    var splicedSubstitution = substitution.spliceInto(operandExpression);
    operandExpression.deferVariableResolution = deferred;
    operandExpression = operandExpression.substitute(variable, splicedSubstitution);
    lowerLimit        = lowerLimit.substitute(variable, substitution);
    upperLimit        = upperLimit.substitute(variable, substitution);
    return this;
  }

  @Override
  public String toString()
  {
    assert indexVariableFieldName != null : String.format("indexVariableFieldName is null in toString() for %s%s{null=%s…%s}",
                                                          symbol,
                                                          operandExpression,
                                                          lowerLimit,
                                                          upperLimit);
    return String.format("%s%s{%s=%s…%s}",
                         symbol,
                         operandExpression,
                         indexVariableFieldName,
                         lowerLimit,
                         upperLimit);
  }

  @Override
  public Class<?> type()
  {
    return generatedType;
  }

  @Override
  public String typeset()
  {
    return String.format("\\%s_{%s = %s}^{%s}{%s}",
                         operation.replace("mul", "prod").replace("add", "sum"),
                         indexVariableFieldName,
                         lowerLimit.typeset(),
                         upperLimit.typeset(),
                         operandExpression == null ? "null" : operandExpression.typeset());
  }

  /**
   * Symbolic derivative of a bounded summation with respect to an outer
   * variable. The summation operator is linear and its index limits are integer
   * bounds independent of {@code variable}, so differentiation commutes with the
   * summation:
   *
   * <pre>
   *   d/dv Σ_{i=L}^{U} f(i, v) = Σ_{i=L}^{U} ∂f(i, v)/∂v
   * </pre>
   *
   * The shared operand sub-expression is left untouched: a fresh operand
   * expression is deep-cloned, its root differentiated with respect to
   * {@code variable}, and wrapped in a new summation node over the same limits
   * with its own operand function field and mapping.
   *
   * <p>
   * Product ({@code ∏}) differentiation is not supported here; the callers in
   * this library only ever differentiate summations.
   */
  /**
   * Base n-ary operations have no generic differentiation rule; the concrete
   * behaviour lives on the subclass ({@link SumNode#differentiate} implements
   * summation linearity, {@link ProductNode#differentiate} the product rule).
   */
  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("differentiate of " + getClass().getSimpleName() + " is not implemented");
  }

  /**
   * Overridable factory that constructs a node of the SAME concrete type as
   * this one over a (possibly different) enclosing expression, operand and
   * limits. {@link SumNode} and {@link ProductNode} override it to return their
   * own type so that {@link #spliceInto(Expression)} and
   * {@link #wrapTransformedOperand(Expression)} preserve the subclass — and
   * therefore its {@link #differentiate(VariableNode)} and
   * {@link #integral(VariableNode)} overrides — instead of collapsing to a bare
   * {@link NAryOperationNode}.
   */
  protected <E, S, G extends Function<? extends E, ? extends S>> NAryOperationNode<E, S, G>
            createSimilarNode(Expression<E, S, G> newExpression,
                              Expression<Integer, S, Sequence<S>> operand,
                              Node<E, S, G> lower,
                              Node<E, S, G> upper)
  {
    return new NAryOperationNode<>(newExpression,
                                   identity,
                                   prefix,
                                   operation,
                                   symbol,
                                   operand,
                                   lower,
                                   upper);
  }

  /**
   * Wraps an operand sub-expression that has already been transformed
   * term-by-term (differentiated or integrated) back into a fully-wired n-ary
   * summation node over this node's limits. Copies every field the compiler
   * relies on — {@link #indexVariableFieldName}, the operand function field name
   * and its {@link FunctionMapping} registration, and the owning expression's
   * internal name — so the returned node is directly compilable. This is the
   * single wiring path shared by {@link SumNode#differentiate(VariableNode)} and
   * {@link SumNode#integral(VariableNode)}; skipping any of these steps leaves
   * {@code indexVariableFieldName} null and makes {@link #toString()} and
   * bytecode generation fail. The result preserves this node's concrete type via
   * {@link #createSimilarNode}.
   *
   * @param transformedOperand the operand expression whose root has already been
   *                           differentiated or integrated with respect to the
   *                           outer variable
   * @return a new summation node over the same limits with the transformed
   *         operand, simplified
   */
  protected Node<D, R, F> wrapTransformedOperand(Expression<Integer, R, Sequence<R>> transformedOperand)
  {
    NAryOperationNode<D, R, F> result = createSimilarNode(expression,
                                                          transformedOperand,
                                                          lowerLimit.spliceInto(expression),
                                                          upperLimit.spliceInto(expression));
    result.assignFieldNamesIfNecessary(transformedOperand.coDomainType);
    transformedOperand.setClassName(result.operandFunctionFieldName);
    result.indexVariableFieldName = this.indexVariableFieldName;
    result.functionInternalName   = expression.internalName();
    result.registerOperand(result.operandFunctionFieldName, transformedOperand);
    return result.simplify();
  }

  @Override
  public boolean isScalar()
  {
    return !(generatedType.isAssignableFrom(Polynomial.class));
  }

  @Override
  public char symbol()
  {
    return '\u2228';
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return lowerLimit.dependsOn(variable) || upperLimit.dependsOn(variable)
                  || (operandExpression != null && operandExpression.rootNode.dependsOn(variable.spliceInto(operandExpression).asVariable()));
  }
}
