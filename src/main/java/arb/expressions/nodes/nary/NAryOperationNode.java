package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.*;
import static arb.utensils.Utensils.indent;
import static org.objectweb.asm.Opcodes.*;

import java.util.List;
import java.util.Map.Entry;
import java.util.Objects;
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
import arb.functions.integer.Sequence;

/**
 * A node in the expression AST that compiles bounded n-ary operations — sums,
 * products, and analogous accumulations — into a tight JVM bytecode loop over
 * an {@link arb.Integer} index variable running from a lower limit to an upper
 * limit inclusive.
 *
 * <p>The syntax parsed by this node is {@code ⊕f(k){k=a…b}}, where {@code ⊕}
 * is the operator sigil (Σ for sum, Π/∏ for product), {@code f(k)} is the
 * operand body (any expression in the index variable), and {@code {k=a…b}}
 * binds the index variable name and its limits. The operand body is compiled
 * as a separate {@link Sequence} class that shares the same
 * {@link arb.expressions.ExpressionClassLoader} and {@link Context} as the
 * enclosing expression. That compiled {@code Sequence} is held as a field on
 * the outer generated class and called once per loop iteration.
 *
 * <h2>Index variable field ownership</h2>
 * The index variable — {@code k} in the example above — must be declared as a
 * {@code public arb.Integer} field on the <em>outer</em> generated class, not
 * on the operand class. The outer class owns the loop counter; the operand
 * class receives it by reference each iteration via
 * {@link #propagateInputToOperand}. Ownership is established in
 * {@link #parseOperatorLimitSpecifications()} by inserting a live
 * {@code new arb.Integer()} into {@link Context#variables} under the index
 * name. {@link arb.expressions.Expression#declareVariableEntry} then emits the
 * field when it iterates the context. A null value in the context map causes
 * that method to skip the entry silently, which is the root cause of
 * {@code NoSuchFieldError: Class ΣkkEq1To3 does not have member field
 * 'arb.Integer k'} — do not revert the non-null put.
 *
 * <h2>Operand expression initialisation sequence</h2>
 * {@link #parseOperand()} constructs the child {@link Expression} with the
 * three-argument constructor, which leaves its internal expression string null.
 * Before calling {@code resolve()} on the child, the parent's string and cursor
 * are copied into it via
 * {@link arb.expressions.Expression#continueParsingFrom(Expression)}. Without
 * this step, {@code resolve()} immediately NPEs inside
 * {@code currentCodePoint() → getExpression().length()}. After {@code resolve()}
 * returns, the parent cursor is synced forward past the tokens the child
 * consumed, and then {@code updateStringRepresentation()} trims the child's
 * expression string to just the operand body. This ordering is mandatory:
 * setting the string before {@code resolve()} runs causes nested
 * {@link NAryOperationNode} constructors to find the parent sigil at position
 * zero and recurse without bound.
 *
 * <h2>Generated loop structure</h2>
 * {@link #generate(MethodVisitor, Class)} emits:
 * <pre>
 *   accumulator.identity();
 *   index.set(lowerLimit);
 *   cachedUpper.set(upperLimit);
 *   while (index.compareTo(cachedUpper) &lt;= 0) {
 *       accumulator = accumulator.operation(operand.evaluate(index, bits, scratch), bits);
 *       index.increment();
 *   }
 *   result.set(accumulator);
 * </pre>
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

  public final String                             prefix;

  public Node<D, R, F>                            lowerLimit;

  public final String                             symbol;

  public List<Node<D, R, F>>                      cachedOperandBranches;

  public NAryOperationNode(Expression<D, R, F> expression, String identity, String prefix, String operation, String symbol)
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
    this.identity          = identity;
    this.prefix            = prefix;
    this.operation         = operation;
    this.symbol            = symbol;
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
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    lowerLimit.accept(t);
    upperLimit.accept(t);
    t.accept(this);
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
    prepareIndexVariable();

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

  public Class<?> assignTypes(Class<?> resultType)
  {
    if (!expression.thisOrAnyUpstreamExpressionHasIndeterminantVariable())
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

  IntermediateVariable<D, R, F> getExistingIndexVariable()
  {
    return expression.intermediateVariables.get(getIndexVariableFieldName());
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

  MethodVisitor loadIndexVariable(MethodVisitor methodVisitor)
  {
    assert fieldName != null : String.format("field is null %s\n", this);
    assert indexVariableFieldName != null : String.format("indexVariableFieldName is null %s\n", this);
    getField(methodVisitor, getIndexVariableFieldName(), Integer.class.descriptorString());
    return methodVisitor;
  }

  public void loadIntermediateResultVariable(MethodVisitor methodVisitor)
  {
    if (Expression.traceNodes)
    {
      logger.debug(String.format("%s.loadResultvariable( resultVariable= %s, generatedType=%s )\n",
                                 getClass().getSimpleName(),
                                 fieldName,
                                 generatedType));
    }
    getFieldFromThis(methodVisitor, expression.className, fieldName, generatedType);
  }

  private void parseUpperLimit()
  {
    upperLimit = expression.resolve();
    expression.require('}');
  }

  /**
   * Parses the operand body of this n-ary operation and wires it into a freshly
   * allocated child {@link Expression} that will be compiled as a sibling class.
   * See the class-level Javadoc for the mandatory initialisation sequence and the
   * reason {@link Expression#continueParsingFrom(Expression)} must be called
   * before {@code resolve()}.
   */
  private void parseOperand()
  {
    assert operandFunctionFieldName != null : "assignFieldNamesIfNecessary must be called before parseOperand";

    String  paramName = expression.parseName();
    boolean hasArrow  = false;
    expression.skipSpaces();

    if (expression.character == '\u2794')
    {
      expression.require('\u2794');
      hasArrow = true;
    }

    operandExpression = new Expression<>(Integer.class, expression.coDomainType, Sequence.class);

    if (!hasArrow)
    {
      expression.position -= paramName.length();
    }

    operandExpression.continueParsingFrom(expression);

    operandExpression.upstreamExpression  = expression;
    operandExpression.context             = expression.context;
    operandExpression.independentVariable = null;
    operandExpression.clearIndeterminateVariables();
    operandExpression.className           = operandFunctionFieldName;

    operandExpression.newVariableNode(paramName);
    indexVariableFieldName = paramName;

    operandExpression.rootNode = operandExpression.resolve();

    expression.continueParsingFrom(operandExpression);
    operandExpression.updateStringRepresentation();

    registerOperand(operandFunctionFieldName, operandExpression);
    propagateContextVariablesToOperand();
  }

  /**
   * Parses {@code {k=a…b}}, validates that the index variable name is consistent
   * with what {@link #parseOperand()} already recorded, and inserts a live
   * {@code new arb.Integer()} into the enclosing expression's context under the
   * index variable name.
   *
   * <p>The live instance is required — not null — because
   * {@link arb.expressions.Expression#declareVariableEntry} silently skips any
   * context entry whose value is null, which would prevent the {@code arb.Integer k}
   * field from being emitted in the outer generated class and cause
   * {@link NoSuchFieldError} at runtime when the generated {@code evaluate()}
   * method tries to read it.
   */
  public Node<D, R, F> parseOperatorLimitSpecifications()
  {
    expression.require('{');

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

    expression.context.variables.put(indexVariableFieldName, new arb.Integer());
    expression.require('=');
    parseLowerLimit();
    parseUpperLimit();
    return this;
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

  /**
   * Ensures the index variable has an allocated {@code arb.Integer} field on the
   * outer generated class before code generation begins. If it was already
   * registered as an intermediate variable (e.g. by a nested or reused node),
   * that registration is reused. Otherwise the field declaration was handled by
   * {@link #parseOperatorLimitSpecifications()} inserting a live instance into
   * {@link Context#variables}, which causes
   * {@link arb.expressions.Expression#declareVariableEntry} to emit it — nothing
   * further is required here.
   */
  protected void prepareIndexVariable()
  {
    var existingIndexVariable = getExistingIndexVariable();

    if (existingIndexVariable != null)
    {
      if (!existingIndexVariable.type.equals(Integer.class))
      {
        throw new CompilerException(String.format("index variable %s already declared with type %s, not arb.Integer",
                                                  existingIndexVariable,
                                                  existingIndexVariable.type));
      }
    }
  }

  protected void propagateInputToOperand(MethodVisitor mv)
  {
    var independentVariableNode = expression.independentVariable;

    if (independentVariableNode != null && !independentVariableNode.type().equals(Object.class))
    {
      generateCodeToPropagateIndependentVariableToOperand(mv, independentVariableNode);
    }

    if (operandExpression != null)
    {
      generateCodeToPropagateIndependentUpstreamVariablesToOperand(mv, independentVariableNode);
    }
  }

  protected void generateCodeToPropagateIndependentUpstreamVariablesToOperand(MethodVisitor mv,
                                                                               VariableNode<D, R, F> independentVariableNode)
  {
    operandExpression.getReferencedVariables()
                     .entrySet()
                     .forEach(entry -> generateCodeToPropagateIndependentUpstreamVariablesToOperand(mv,
                                                                                                    independentVariableNode,
                                                                                                    entry));
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

  protected void generateCodeToPropagateIndependentVariableToOperand(MethodVisitor mv,
                                                                      VariableNode<D, R, F> independentVariableNode)
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
      logger.debug(String.format("\nregisterOperand(operandExpression=%s,\noperandMapping=%s\n)\n\n",
                                 operandExpression,
                                 operandMapping));
    }
    expression.registerReferencedFunction(operandFunctionFieldName, operandMapping);
  }

  public Class<?> scalarType(Class<?> resultType)
  {
    return resultType = generatedType = (RealPolynomial.class.equals(resultType) ? Real.class : resultType);
  }

  protected void setIndexToTheLowerLimit(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    lowerLimit.generate(methodVisitor, Integer.class);
    invokeSetMethod(methodVisitor, Integer.class, Integer.class);
    Compiler.pop(methodVisitor);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    var nAryOperationNode = new NAryOperationNode<E, S, G>(newExpression,
                                                           identity,
                                                           prefix,
                                                           operation,
                                                           symbol,
                                                           null,
                                                           lowerLimit.spliceInto(newExpression),
                                                           upperLimit.spliceInto(newExpression));
    throw new UnsupportedOperationException("TODO: wire operandExpression into spliceInto");
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable,
                                                                                         Node<E, S, G> substitution)
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
                  || (operandExpression != null
                                && operandExpression.rootNode.dependsOn(variable.spliceInto(operandExpression)
                                                                                 .asVariable()));
  }
}
