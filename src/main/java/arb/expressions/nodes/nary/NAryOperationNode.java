package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.*;
import static arb.utensils.Utensils.indent;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.*;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.integer.Sequence;

/**
 * N-ary fold node (Σ sum / Π product). The operand is parsed inline on the
 * parent expression's character stream, then compiled as a separate
 * subexpression via clone/spliceInto/compile/registerSubexpression — the same
 * pattern as {@link arb.expressions.nodes.IntegralNode#compileIndefiniteIntegral()}.
 * The compiled operand is a {@code Sequence<R>} (i.e. {@code Function<Integer, R>})
 * whose independent variable is the index variable (e.g. k). At each loop
 * iteration the parent calls {@code operand.evaluate(k, order, bits, tmp)}.
 * <p>
 * Arrow syntax ({@code k➔expr}) is optional. If omitted, the first variable
 * encountered becomes the independent variable via normal resolution.
 * </p>
 *
 * @param <D> domain type of the parent expression
 * @param <R> codomain type
 * @param <F> function type
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class NAryOperationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              Node<D, R, F>
{

  public Label                                                         beginLoop = new Label();
  public Label                                                         endLoop   = new Label();

  public Node<D, R, F>                                                 upperLimit;
  public String                                                        upperLimitFieldName;

  public Node<D, R, F>                                                 operandNode;

  public Expression<Integer, R, Sequence<? extends R>>                 operandExpression;
  public FunctionMapping<Integer, R, Sequence<? extends R>>            operandMapping;

  public VariableNode<D, R, F>                                         indexVariableNode;
  public String                                                        functionClass;
  public final String                                                  identity;
  public String                                                        indexVariableFieldName;
  public final String                                                  operation;
  public final String                                                  prefix;
  public Node<D, R, F>                                                 lowerLimit;
  public final String                                                  symbol;
  public String                                                        operandValueFieldName;

  /**
   * PARSING constructor. Parses the operand inline on the parent's character
   * stream. After parsing and limit resolution, compiles the operand as a
   * separate subexpression via clone/spliceInto/compile/registerSubexpression.
   */
  @SuppressWarnings("unchecked")
  public NAryOperationNode(Expression<D, R, F> expression,
                           String identity,
                           String prefix,
                           String operation,
                           String symbol,
                           boolean functionForm)
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
    functionClass = expression.className;
    assert functionClass != null : "functionClass=expression.className shan't be null";
    generatedType = expression.coDomainType;

    // ── Step 1: Optional arrow "k➔" ──────────────────────────────────────
    int  savedPos  = expression.position;
    char savedChar = expression.character;

    if (expression.isIdentifierCharacter())
    {
      String maybeName = expression.parseName();
      expression.skipSpaces();
      if (expression.nextCharacterIs('➔'))
      {
        indexVariableFieldName = maybeName;
      }
      else
      {
        expression.position  = savedPos;
        expression.character = savedChar;
      }
    }

    // ── Step 2: Clear independent variable so k resolves as independent ──
    VariableNode<D, R, F> savedIndependentVariable = expression.independentVariable;
    expression.independentVariable = null;

    // ── Step 3: Parse operand body on parent's character stream ───────────
    operandNode = expression.resolve();

    // ── Step 4: Restore parent's independent variable ────────────────────
    expression.independentVariable = savedIndependentVariable;

    // ── Step 5: Parse limit specification ─────────────────────────────────
    if (functionForm)
    {
      expression.require(',');
    }
    parseLimitSpecification();

    // ── Step 6: Compile operand as a separate subexpression ──────────────
    compileOperandSubexpression();
  }

  /**
   * Clone the parent expression, configure it as a {@link Sequence}
   * ({@code Function<Integer, R>} where {@code R} is the parent's codomain),
   * splice the operand AST into the clone, compile it, and register it as a
   * subexpression on the parent.
   * <p>
   * The clone inherits the parent's {@code functionClass} and its derived
   * fields ({@code genericFunctionClassInternalName},
   * {@code functionClassDescriptor}). When the parent is a nullary function
   * (e.g. {@code RealNullaryFunction} with domain {@code Object.class}),
   * those fields are wrong for an operand whose domain is
   * {@code Integer.class}. All four fields must be set consistently so that
   * the generated bytecode implements the correct {@link Sequence} interface.
   */
  @SuppressWarnings("unchecked")
  private void compileOperandSubexpression()
  {
    String operandClassName = expression.className + "Σoperand"
                              + System.identityHashCode(this);

    operandExpression           = expression.cloneExpression();
    operandExpression.className = operandClassName;

    // The operand is a Sequence<R>: Integer -> R (where R is the parent's codomain).
    // Set domain, functionClass, and both derived ASM descriptor fields consistently.
    operandExpression.domainType                       = Integer.class;
    operandExpression.functionClass                    = Sequence.class;
    operandExpression.genericFunctionClassInternalName = Type.getInternalName(Sequence.class);
    operandExpression.functionClassDescriptor          = Sequence.class.descriptorString();

    operandExpression.rootNode = (Node) operandNode.spliceInto(operandExpression);

    operandExpression.compile();

    operandMapping = expression.registerSubexpression(operandExpression);

    expression.referencedFunctions.put(operandClassName, operandMapping);
  }

  /**
   * SPLICE constructor — pre-built nodes, no parsing.
   */
  public NAryOperationNode(Expression<D, R, F> expression,
                           String identity,
                           String prefix,
                           String operation,
                           String symbol,
                           Node<D, R, F> operandNode,
                           Node<D, R, F> lowerLimit,
                           Node<D, R, F> upperLimit,
                           String indexVariableFieldName)
  {
    super(expression);
    this.identity               = identity;
    this.prefix                 = prefix;
    this.operation              = operation;
    this.symbol                 = symbol;
    this.operandNode            = operandNode;
    this.lowerLimit             = lowerLimit;
    this.upperLimit             = upperLimit;
    this.indexVariableFieldName = indexVariableFieldName;
    if (expression.context == null)
    {
      expression.context = new Context();
    }
    functionClass = expression.className;
    assert functionClass != null : "functionClass shan't be null, expression=" + expression;
    generatedType = expression.coDomainType;
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // PARSING
  // ═══════════════════════════════════════════════════════════════════════════

  private void parseLimitSpecification()
  {
    boolean hasBrace      = expression.nextCharacterIs('{');
    String  specifiedName = expression.parseName();

    if (specifiedName == null || specifiedName.isEmpty())
    {
      expression.throwUnexpectedCharacterException("index variable name cannot be null or empty");
    }

    if (indexVariableFieldName != null)
    {
      if (!indexVariableFieldName.equals(specifiedName))
      {
        throw new CompilerException(
            String.format("index variable in range spec '%s' != bound variable '%s'",
                          specifiedName, indexVariableFieldName));
      }
    }
    else
    {
      indexVariableFieldName = specifiedName;
    }

    expression.require('=');
    lowerLimit = expression.resolve();
    expression.require('…');
    upperLimit = expression.resolve();

    if (hasBrace)
    {
      expression.require('}');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // CODE GENERATION
  // ═══════════════════════════════════════════════════════════════════════════

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    resultType = assignTypes(resultType);
    assignFieldNamesIfNecessary(resultType);
    prepareIndexVariable();

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
   * <pre>
   *   result.op(this.operandFunc.evaluate(this.k, order, bits, this.tmp), bits)
   *   this.k.increment()
   * </pre>
   */
  protected void generateInnerLoop(MethodVisitor mv)
  {
    loadIntermediateResultVariable(mv);

    // this.operandFunc
    loadThisOntoStack(mv);
    mv.visitFieldInsn(Opcodes.GETFIELD,
                      functionClass,
                      operandExpression.className,
                      operandMapping.functionFieldDescriptor());

    // .evaluate(this.k, order, bits, this.operandValue)
    loadIndexVariable(mv);
    loadOrderParameter(mv);
    loadBitsParameterOntoStack(mv);
    getFieldFromThis(mv, functionClass, operandValueFieldName, generatedType);

    operandMapping.call(mv, generatedType);
    cast(mv, generatedType);

    loadBitsParameterOntoStack(mv);
    combine(mv, generatedType);
    pop(mv);

    incrementIndex(mv);
  }

  public Class<?> assignTypes(Class<?> resultType)
  {
    if (!expression.thisOrAnyAscendentExpressionHasIndeterminantVariable())
    {
      resultType = scalarType(resultType);
    }
    else if (RealPolynomial.class.equals(resultType) || ComplexPolynomial.class.equals(resultType))
    {
      generatedType = resultType;
    }
    return resultType;
  }

  protected void assignFieldNamesIfNecessary(Class<?> resultType)
  {
    if (operandValueFieldName == null)
    {
      operandValueFieldName = expression.newIntermediateVariable("value", resultType);
      if (Expression.traceNodes)
      {
        int indentation = 18 + getClass().getSimpleName().length();
        logFieldNameAssignment(resultType, indentation);
      }
    }
  }

  protected void logFieldNameAssignment(Class<?> resultType, int indentation)
  {
    if (Expression.traceNodes)
    {
      logger.debug(String.format("%s.assignFieldNames(this=%s,resultType=%s,\n%soperandValueFieldName=%s)\n\n",
                                 getClass().getSimpleName(),
                                 expression.functionName,
                                 resultType,
                                 indent(indentation),
                                 operandValueFieldName));
    }
  }

  protected void prepareIndexVariable()
  {
    var existing = expression.intermediateVariables.get(indexVariableFieldName);
    if (existing != null)
    {
      if (!existing.type.equals(Integer.class))
      {
        throw new CompilerException(
            String.format("index variable %s already declared as %s, not Integer",
                          existing, existing.type));
      }
    }
    else
    {
      expression.registerIntermediateVariable(indexVariableFieldName, Integer.class, true);
    }
  }

  protected void generateUpperLimit(MethodVisitor mv)
  {
    upperLimitFieldName = expression.newIntermediateVariable("upperLimit", Integer.class);
    upperLimit.generate(loadFieldFromThis(mv, upperLimitFieldName, Integer.class), Integer.class);
    pop(invokeSetMethod(mv, Integer.class, Integer.class));
  }

  protected void setIndexToTheLowerLimit(MethodVisitor mv)
  {
    loadIndexVariable(mv);
    lowerLimit.generate(mv, Integer.class);
    invokeSetMethod(mv, Integer.class, Integer.class);
    Compiler.pop(mv);
  }

  MethodVisitor loadIndexVariable(MethodVisitor mv)
  {
    assert fieldName != null : String.format("field is null %s\n", this);
    assert indexVariableFieldName != null;
    getFieldFromThis(mv, functionClass, indexVariableFieldName, Integer.class);
    return mv;
  }

  protected void compareIndexToUpperLimit(MethodVisitor mv)
  {
    loadFieldFromThis(mv, upperLimitFieldName, Integer.class);
    invokeMethod(mv, Integer.class, "compareTo",
                 Compiler.getMethodDescriptor(int.class, Integer.class), false);
  }

  protected void incrementIndex(MethodVisitor mv)
  {
    invokeVirtualMethod(loadIndexVariable(mv), Integer.class, "increment", Integer.class);
  }

  public void initializeResult(MethodVisitor mv,
                                Class<?> resultType,
                                String identityFunction,
                                String prefix)
  {
    fieldName = expression.allocateIntermediateVariable(mv, prefix, resultType);
    pop(invokeVirtualMethod(mv, resultType, identityFunction, resultType));
  }

  public void initializeResultVariable(MethodVisitor mv, Class<?> resultType)
  {
    initializeResult(mv, resultType, identity, prefix);
  }

  protected void assignResult(MethodVisitor mv, Class<?> resultType)
  {
    if (isResult)
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

  public void loadIntermediateResultVariable(MethodVisitor mv)
  {
    if (Expression.traceNodes)
    {
      logger.debug(String.format("%s.loadResultvariable( resultVariable= %s, generatedType=%s )\n",
                                 getClass().getSimpleName(),
                                 fieldName,
                                 generatedType));
    }
    getFieldFromThis(mv, expression.className, fieldName, generatedType);
  }

  public MethodVisitor combine(MethodVisitor mv, Class<?> operandType)
  {
    return invokeMethod(mv, generatedType, operation,
                        getMethodDescriptor(generatedType, operandType, int.class), false);
  }

  public Class<?> scalarType(Class<?> resultType)
  {
    return resultType = generatedType = (RealPolynomial.class.equals(resultType) ? Real.class
                                                                                 : resultType);
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

  // ═══════════════════════════════════════════════════════════════════════════
  // AST OPERATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    operandNode.accept(t);
    lowerLimit.accept(t);
    upperLimit.accept(t);
    t.accept(this);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(operandNode, lowerLimit, upperLimit);
  }

  IntermediateVariable<D, R, F> getExistingIndexVariable()
  {
    return expression.intermediateVariables.get(indexVariableFieldName);
  }

  public String getIndexVariableFieldName()
  {
    return indexVariableFieldName;
  }

  @Override
  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(upperLimit, operandNode, operation, lowerLimit);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    NAryOperationNode<?, ?, ?> other = (NAryOperationNode<?, ?, ?>) obj;
    return Objects.equals(upperLimit, other.upperLimit)
        && Objects.equals(operandNode, other.operandNode)
        && Objects.equals(operation, other.operation)
        && Objects.equals(lowerLimit, other.lowerLimit);
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new NAryOperationNode<>(newExpression, identity, prefix, operation, symbol,
                                   operandNode.spliceInto(newExpression),
                                   lowerLimit.spliceInto(newExpression),
                                   upperLimit.spliceInto(newExpression),
                                   indexVariableFieldName);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F> substitute(String variable, Node<E, S, G> substitution)
  {
    operandNode = operandNode.substitute(variable, substitution);
    lowerLimit  = lowerLimit.substitute(variable, substitution);
    upperLimit  = upperLimit.substitute(variable, substitution);
    return this;
  }

  @Override
  public String toString()
  {
    assert indexVariableFieldName != null
        : String.format("indexVariableFieldName is null in toString() for %s%s{null=%s…%s}",
                        symbol, operandNode, lowerLimit, upperLimit);

    return String.format("%s%s{%s=%s…%s}", symbol, operandNode,
                         indexVariableFieldName, lowerLimit, upperLimit);
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
                         indexVariableFieldName, lowerLimit.typeset(),
                         upperLimit.typeset(), operandNode.typeset());
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public boolean isScalar()
  {
    return !(generatedType.isAssignableFrom(Polynomial.class));
  }

  @Override
  public char symbol()
  {
    return '∨';
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return lowerLimit.dependsOn(variable) || upperLimit.dependsOn(variable)
        || operandNode.dependsOn(variable);
  }
}
