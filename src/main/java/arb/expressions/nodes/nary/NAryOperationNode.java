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
import arb.exceptions.CompilerException;
import arb.expressions.*;
import arb.expressions.Context;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexSequence;
import arb.functions.integer.IntegerSequence;
import arb.functions.integer.RealSequence;
import arb.functions.integer.Sequence;
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
 * <h2>Index variable — method-local, not a field</h2> The index variable
 * ({@code k} above) is allocated as a method-local {@code arb.Integer} in the
 * {@code evaluate()} bytecode (local slot {@code indexVariableLocalSlot}).
 * It is never registered in the {@link Context} and never declared as a class
 * field. This avoids polluting the shared context and eliminates the need to
 * temporarily mutate context state during operand parsing. The operand receives
 * the index value as the first argument to its {@code evaluate()} call each
 * iteration.
 *
 * <h2>Operand expression initialisation sequence</h2> {@link #parseOperand()}
 * constructs the child {@link Expression} with the three-argument constructor,
 * which leaves its internal expression string null. Before calling
 * {@code resolve()} on the child, the parent's string and cursor are copied
 * into it via
 * {@link arb.expressions.Expression#continueParsingFrom(Expression)}. Without
 * this step, {@code resolve()} immediately NPEs inside
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
 * arb.Integer index = new arb.Integer(); // local slot 5
 * accumulator.identity();
 * index.set(lowerLimit);
 * cachedUpper.set(upperLimit);
 * while (index.compareTo(cachedUpper) &lt;= 0)
 * {
 *   accumulator = accumulator.operation(operand.evaluate(index, bits, scratch), bits);
 *   index.increment();
 * }
 * result.set(accumulator);
 * </pre>
 * 
 * All of {@code accumulator}, {@code cachedUpper}, and {@code scratch} are
 * intermediate variables allocated on the outer generated class.
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
   * Local variable slot in the generated {@code evaluate()} method for the
   * {@code arb.Integer} index variable. Dynamically allocated via
   * {@link Expression#allocateLocalVariableSlot()} to avoid conflicts with
   * cache locals or other generated code. Assigned in
   * {@link #allocateLocalIndexVariable(MethodVisitor)}.
   */
  public int                                        indexVariableLocalSlot         = -1;

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

  public String                                   functionClass;

  public final String                             identity;

  public String                                   indexVariableFieldName;

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
    if (expression.context == null)
    {
      expression.context = new Context();
    }
    assignFieldNamesIfNecessary(expression.coDomainType);
    parseOperand();
    functionClass = expression.className;
    assert functionClass != null : "functionClass=expression.className shan't be null for operandExpression=" + operandExpression;
    generatedType = expression.coDomainType;
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
    if (expression.context == null)
    {
      expression.context = new Context();
    }
    this.operandExpression = operandExpression;
    functionClass          = expression.className;
    assert functionClass != null : "functionClass=expression.className shan't be null, expression=" + expression;
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

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    lowerLimit.accept(t);
    upperLimit.accept(t);
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
    return operandExpression != null ? (Node<D, R, F>) (Node<?, ?, ?>) operandExpression.rootNode
                                     : null;
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

  protected void assignFieldNamesIfNecessary(Class<?> resultType)
  {
    if (operandFunctionFieldName == null)
    {
      operandFunctionFieldName = expression.getNextIntermediateVariableFieldName("operand", Function.class);
    }
    if (operandValueFieldName == null)
    {
      operandValueFieldName = expression.newIntermediateVariable("value", resultType);
    }
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
    resultType = assignTypes(resultType);

    assignFieldNamesIfNecessary(resultType);
    allocateLocalIndexVariable(mv);

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
   * Emits bytecode to allocate a fresh {@code arb.Integer} in local slot
   * {@code indexVariableLocalSlot}:
   * 
   * <pre>
   *   NEW arb/Integer
   *   DUP
   *   INVOKESPECIAL arb/Integer.&lt;init&gt;()V
   *   ASTORE 5
   * </pre>
   */
  protected void allocateLocalIndexVariable(MethodVisitor mv)
  {
    indexVariableLocalSlot = expression.allocateLocalVariableSlot();
    Compiler.generateNewObjectInstruction(mv, Integer.class);
    Compiler.duplicateTopOfTheStack(mv);
    Compiler.invokeDefaultConstructor(mv, Integer.class);
    mv.visitVarInsn(ASTORE, indexVariableLocalSlot);
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
      logger.debug(String.format("NAryOperation.getField(functionClass=%s,\n%sfieldName=%s,\n%sfieldTypeSignature=%s\n\n",
                                 functionClass,
                                 indent(9),
                                 fieldName,
                                 indent(9),
                                 fieldTypeSignature));
    }
    getFieldFromThis(methodVisitor, functionClass, fieldName, fieldTypeSignature);
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
    getFieldFromThis(mv, functionClass, operandFunctionFieldName, String.format("L%s;", operandFunctionFieldName));
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
   * Loads the method-local {@code arb.Integer} index variable from local slot
   * {@code indexVariableLocalSlot} onto the operand stack.
   */
  MethodVisitor loadIndexVariable(MethodVisitor methodVisitor)
  {
    assert indexVariableFieldName != null : String.format("indexVariableFieldName is null %s\n", this);
    assert indexVariableLocalSlot >= 0 : "indexVariableLocalSlot not yet allocated";
    methodVisitor.visitVarInsn(ALOAD, indexVariableLocalSlot);
    return methodVisitor;
  }

  public void loadIntermediateResultVariable(MethodVisitor methodVisitor)
  {
    if (Expression.traceNodes)
    {
      logger.debug(String.format("%s.loadResultvariable( resultVariable= %s, generatedType=%s )\n", getClass().getSimpleName(), fieldName, generatedType));
    }
    getFieldFromThis(methodVisitor, expression.className, fieldName, generatedType);
  }

  private boolean usedBraceInLimitSpec;

  private void parseUpperLimit()
  {
    upperLimit = expression.resolve();
    // The closing '}' is consumed by parseOperatorLimitSpecifications AFTER any
    // additional comma-separated bindings have been processed, not here.
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

    Class<R> operandCoDomain = (Class<R>) (expression.isFunctional() && !Polynomial.class.isAssignableFrom(expression.coDomainType)
                                             ? scalarCoDomain(expression.coDomainType)
                                             : expression.coDomainType);
    operandExpression = new Expression<>(Integer.class,
                                         operandCoDomain,
                                         Sequence.class);
    operandExpression.continueParsingFrom(expression);
    operandExpression.superExpression  = expression;
    operandExpression.context             = expression.context;
    operandExpression.setIndependentVariable(null);
    operandExpression.className           = operandFunctionFieldName;

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

    expression.continueParsingFrom(operandExpression);
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
   * The index variable is <em>not</em> registered in the {@link Context} — it
   * lives as a method-local {@code arb.Integer} in slot
   * {@code indexVariableLocalSlot}, allocated by
   * {@link #allocateLocalIndexVariable(MethodVisitor)}.
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

    if (operandExpression.deferVariableResolution)
    {
      operandExpression.deferVariableResolution = false;
      VariableNode<Integer, R, Sequence<R>> indexVar = new VariableNode<>(operandExpression,
                                                                          operandExpression.newVariableReference(indexVariableFieldName),
                                                                          false);
      operandExpression.assignInputVariable(indexVar);
      operandExpression.rootNode.resolveVariables();
    }

    expression.require('=');
    usedBraceInLimitSpec = usedBrace;
    parseLowerLimit();
    parseUpperLimit();

    parseAdditionalBindings();

    if (usedBraceInLimitSpec)
    {
      expression.require('}');
    }
    return this;
  }

  /**
   * Handles the iterated-sum / iterated-product syntax extension:
   * {@code Σf(v1,v2,…,vN){v1=lo1…hi1, v2=lo2…hi2, …, vN=loN…hiN}}.
   *
   * <p>After the primary (first-listed, outermost) binding has been parsed by
   * {@link #parseOperatorLimitSpecifications()}, this method consumes any
   * additional comma-separated bindings and rewrites the AST so that each
   * subsequent binding becomes an inner sum/product nested inside the operand of
   * the previous one. No new node types are introduced — each added level is
   * itself a {@link SumNode} or {@link ProductNode} of the same operation as the
   * enclosing level, constructed through the normal parsing constructor so that
   * all of the existing operand-expression wiring ({@link #parseOperand()},
   * {@link #parseOperatorLimitSpecifications()}, upstream-input propagation,
   * function-mapping registration) runs for free.
   *
   * <p>Mechanism: for each comma in the limit specification, this method
   * synthesises an inner {@code Σ}/{@code Π} node by driving the parser on a
   * clone of the current operand expression. The clone's remaining source
   * begins at the position of the comma; by substituting the already-parsed
   * tail of the primary binding's body with the clone's freshly-parsed sum
   * body, we obtain a nested sum whose body is the original body and whose
   * limit spec is {@code {vk=lok…hik, …}}. Concretely, what is re-parsed is
   * the sum symbol, the (identical) body, and the remaining bindings — but
   * only the bindings are new; the body node comes from the already-built
   * primary-level operandExpression and is reused via {@link Node#spliceInto}.
   *
   * <p>Scoping: for each new binding {@code vk=lok…hik}, the sub-expressions
   * {@code lok} and {@code hik} are parsed in the scope of the expression that
   * CONTAINS the new inner sum (i.e. the operand expression of the
   * immediately preceding level). In that scope, {@code v_{k-1}} is the
   * independent variable and {@code v_1,…,v_{k-2}} are upstream inputs, so
   * dependent bounds such as {@code b=0…n-a} resolve through the existing
   * upstream-input propagation.
   */
  @SuppressWarnings("unchecked")
  private void parseAdditionalBindings()
  {
    Expression<Integer, R, Sequence<R>> currentOperandExpression = this.operandExpression;

    while (expression.nextCharacterIs(','))
    {
      // Transfer the cursor into the current operand expression so the next
      // binding's name/limits are parsed in the scope where the prior binding's
      // index variable is the independent variable.
      currentOperandExpression.continueParsingFrom(expression);

      // Save the already-parsed body node for the current level. We will
      // splice a clone of it into the NEW (inner) operand expression as its
      // body, leaving the CURRENT level's body replaced by the freshly-built
      // inner NAryOperationNode.
      Node<Integer, R, Sequence<R>> savedBody = currentOperandExpression.rootNode;

      // Parse the next binding's name.
      String extraName = currentOperandExpression.parseName();
      if (extraName == null || extraName.isEmpty())
      {
        currentOperandExpression.throwUnexpectedCharacterException("index variable name cannot be null or empty");
      }
      currentOperandExpression.require('=');
      Node<Integer, R, Sequence<R>> extraLower = currentOperandExpression.resolve();
      currentOperandExpression.require('\u2026');
      Node<Integer, R, Sequence<R>> extraUpper = currentOperandExpression.resolve();

      // Clone the current operand expression to host the inner level's operand
      // body. Clear its rootNode and re-use the saved body by splicing it in
      // under the cloned expression, assigning the new binding's name as the
      // independent variable.
      Expression<Integer, R, Sequence<R>> innerOperandExpression = currentOperandExpression.cloneExpression();
      innerOperandExpression.superExpression        = currentOperandExpression;
      innerOperandExpression.context                = currentOperandExpression.context;
      innerOperandExpression.clearIndependentVariable();
      innerOperandExpression.rootNode               = null;
      innerOperandExpression.deferVariableResolution = false;

      // Allocate a unique className/field-name for the inner operand on the
      // outer expression; the non-parsing NAryOperationNode constructor below
      // does not itself name the operand field, so we do it here the same way
      // assignFieldNamesIfNecessary does for the primary binding.
      String innerOperandFieldName = currentOperandExpression.getNextIntermediateVariableFieldName("operand",
                                                                                                    Function.class);
      innerOperandExpression.className = innerOperandFieldName;

      VariableNode<Integer, R, Sequence<R>> innerIndexVar = new VariableNode<>(innerOperandExpression,
                                                                               innerOperandExpression.newVariableReference(extraName),
                                                                               false);
      innerOperandExpression.assignInputVariable(innerIndexVar);

      innerOperandExpression.rootNode = savedBody.spliceInto(innerOperandExpression);
      innerOperandExpression.rootNode.resolveVariables();
      innerOperandExpression.updateStringRepresentation();

      // Construct the new inner-level NAryOperationNode via the non-parsing
      // constructor. It lives as a node in currentOperandExpression's tree.
      NAryOperationNode<Integer, R, Sequence<R>> innerLevel = new NAryOperationNode<>(currentOperandExpression,
                                                                                      identity,
                                                                                      prefix,
                                                                                      operation,
                                                                                      symbol,
                                                                                      innerOperandExpression,
                                                                                      extraLower,
                                                                                      extraUpper);
      innerLevel.indexVariableFieldName   = extraName;
      innerLevel.operandFunctionFieldName = innerOperandFieldName;
      innerLevel.functionClass            = currentOperandExpression.className;
      innerLevel.assignFieldNamesIfNecessary(innerOperandExpression.coDomainType);

      // Register the inner operand expression as a function mapping on the
      // shared context and on the current level's referencedFunctions, exactly
      // as registerOperand() does for the primary binding.
      innerLevel.operandMapping = currentOperandExpression.context.registerFunctionMapping(innerOperandFieldName,
                                                                                           null,
                                                                                           Integer.class,
                                                                                           innerOperandExpression.coDomainType,
                                                                                           Sequence.class,
                                                                                           true,
                                                                                           innerOperandExpression,
                                                                                           innerOperandFieldName);
      currentOperandExpression.registerReferencedFunction(innerOperandFieldName, innerLevel.operandMapping);

      // Replace the current level's body with the newly built inner sum/product.
      currentOperandExpression.rootNode = (Node<Integer, R, Sequence<R>>) (Node<?, ?, ?>) innerLevel;

      // Hand the cursor back to the outer expression so the next iteration
      // (or the final '}' check) sees the right position.
      expression.continueParsingFrom(currentOperandExpression);

      // Descend for the next binding.
      currentOperandExpression = innerOperandExpression;
    }
  }

  protected void propagateContextVariablesToOperand()
  {
    if (expression.context != null && expression.context.variables != null)
    {
      expression.registerInitializer(mv ->
      {
        expression.context.variableEntries().forEach(entry -> propagateContextVariableToOperand(mv, entry));
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
      String   operandClassInternalName = operandFunctionFieldName;

      Label    notNull                  = new Label();
      Label    end                      = new Label();

      loadThisOntoStack(mv);
      mv.visitFieldInsn(GETFIELD, expression.className, operandFunctionFieldName, String.format("L%s;", operandFunctionFieldName));
      mv.visitFieldInsn(GETFIELD, operandClassInternalName, fieldName, fieldTypeDescriptor);
      mv.visitJumpInsn(IFNONNULL, notNull);

      loadThisOntoStack(mv);
      mv.visitFieldInsn(GETFIELD, expression.className, operandFunctionFieldName, String.format("L%s;", operandFunctionFieldName));
      Compiler.generateNewObjectInstruction(mv, fieldType);
      Compiler.duplicateTopOfTheStack(mv);
      Compiler.invokeDefaultConstructor(mv, fieldType);
      mv.visitFieldInsn(PUTFIELD, operandClassInternalName, fieldName, fieldTypeDescriptor);

      mv.visitLabel(notNull);

      loadThisOntoStack(mv);
      mv.visitFieldInsn(GETFIELD, expression.className, operandFunctionFieldName, String.format("L%s;", operandFunctionFieldName));
      mv.visitFieldInsn(GETFIELD, operandClassInternalName, fieldName, fieldTypeDescriptor);
      loadThisOntoStack(mv);
      mv.visitFieldInsn(GETFIELD, expression.className, fieldName, fieldTypeDescriptor);
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

      String varDesc      = varType.descriptorString();
      String operandDesc  = String.format("L%s;", operandFunctionFieldName);

      Label  fieldNotNull = new Label();

      expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
      mv.visitFieldInsn(GETFIELD, operandFunctionFieldName, varName, varDesc);
      mv.visitJumpInsn(IFNONNULL, fieldNotNull);

      expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
      generateNewObjectInstruction(mv, varType);
      duplicateTopOfTheStack(mv);
      invokeDefaultConstructor(mv, varType);
      putField(mv, operandFunctionFieldName, varName, varType);

      mv.visitLabel(fieldNotNull);

      expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
      mv.visitFieldInsn(GETFIELD, operandFunctionFieldName, varName, varDesc);
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
    String   varName      = independentVariableNode.reference.name;
    Class<?> varType      = independentVariableNode.type();
    String   varDesc      = varType.descriptorString();
    String   operandDesc  = String.format("L%s;", operandFunctionFieldName);

    Label    fieldNotNull = new Label();

    expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
    mv.visitFieldInsn(GETFIELD, operandFunctionFieldName, varName, varDesc);
    Compiler.jumpToIfNotNull(mv, fieldNotNull);

    expression.loadFieldOntoStack(loadThisOntoStack(mv), operandFunctionFieldName, operandDesc);
    generateNewObjectInstruction(mv, varType);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, varType);
    putField(mv, operandFunctionFieldName, varName, varType);

    Compiler.designateLabel(mv, fieldNotNull);

    expression.loadThisAndFieldOntoStack(mv, operandFunctionFieldName, operandDesc);
    mv.visitFieldInsn(GETFIELD, operandFunctionFieldName, varName, varDesc);
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

    operandMapping = expression.context.registerFunctionMapping(operandFunctionFieldName,
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
   * Returns the scalar element type for a given codomain type. For sequence
   * types, returns the element type (e.g., RealSequence → Real). For non-sequence
   * types, returns the type as-is.
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
    if (RealPolynomial.class.equals(type))
    {
      return Real.class;
    }
    if (ComplexFunction.class.equals(type) || ComplexPolynomial.class.equals(type))
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
    var nAryOperationNode        = new NAryOperationNode<E, S, G>(newExpression,
                                                                  identity,
                                                                  prefix,
                                                                  operation,
                                                                  symbol,
                                                                  splicedOperandExpression,
                                                                  lowerLimit.spliceInto(newExpression),
                                                                  upperLimit.spliceInto(newExpression));
    nAryOperationNode.assignFieldNamesIfNecessary(newExpression.coDomainType);
    nAryOperationNode.indexVariableFieldName   = this.indexVariableFieldName;
    nAryOperationNode.parsed                   = this.parsed;
    nAryOperationNode.functionClass            = newExpression.className;
    nAryOperationNode.operandFunctionFieldName = this.operandFunctionFieldName;
    nAryOperationNode.operandMapping           = (FunctionMapping<Integer, S, Sequence<S>>) (FunctionMapping<?, ?, ?>) this.operandMapping;
    newExpression.registerReferencedFunction(this.operandFunctionFieldName, this.operandMapping);
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

    operandExpression = operandExpression.substitute(variable, substitution.expression);
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
    return String.format("%s%s{%s=%s…%s}", symbol, operandExpression, indexVariableFieldName, lowerLimit, upperLimit);
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

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("differentiate of NAryOperationNode not implemented");
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
