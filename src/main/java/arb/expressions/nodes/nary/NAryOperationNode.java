package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.*;
import static arb.utensils.Utensils.indent;
import static org.objectweb.asm.Opcodes.*;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.*;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.*;
import arb.expressions.Context;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Represents a generic n-ary operation on {@link Node}s within
 * {@link Expression}s. This abstract base class provides the common structure
 * and behavior for operations that involve multiple operands, such as
 * {@link SumNode}, {@link ProductNode}, or other customized functions that
 * combine elements of a class over a coDomain of values.
 * <p>
 * The operand body is parsed inline by the parent expression's parser
 * (via expression.resolve()), not extracted as a string and compiled
 * separately. This eliminates the need for variable propagation between
 * parent and child expressions.
 * </p>
 *
 * @param <D> the domain type of the operands and the operation
 * @param <R> the coDomain type of the operation's result
 * @param <F> the function interface this operation implements, extending the
 *            {@link Function} interface with specific domain and coDomain types
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class NAryOperationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              Node<D, R, F>
{

  public Label                beginLoop = new Label();

  public Label                endLoop   = new Label();

  public Node<D, R, F>       upperLimit;

  public String               upperLimitFieldName;

  public Node<D, R, F>       operandNode;

  public VariableNode<D, R, F> indexVariableNode;

  public String               functionClass;

  public final String         identity;

  public String               indexVariableFieldName;

  public final String         operation;

  public final String         prefix;

  public Node<D, R, F>       lowerLimit;

  public final String         symbol;

  public String               operandValueFieldName;

  /**
   * PARSING constructor — called when the parser hits Σ, Π, sum(, etc.
   * Parses the operand body inline via expression.resolve().
   *
   * @param functionForm true if syntax is sum(...) / prod(...) with parens
   */
/**
 * PARSING constructor — called when the parser hits Σ, Π, sum(, etc.
 * Parses the operand body inline via expression.resolve().
 *
 * @param functionForm true if syntax is sum(...) / prod(...) with parens
 */
/**
 * PARSING constructor — called when the parser hits Σ, Π, sum(, etc.
 * Parses the operand body inline via expression.resolve().
 *
 * @param functionForm true if syntax is sum(...) / prod(...) with parens
 */
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

  // --- Inline parsing (IntegralNode style) ---

  // 1. Try to parse "k➔" lambda prefix
  int  savedPos  = expression.position;
  char savedChar = expression.character;

  if (expression.isIdentifierCharacter())
  {
    String maybeName = expression.parseName();
    expression.skipSpaces();
    if (expression.nextCharacterIs('➔'))
    {
      indexVariableFieldName = maybeName;
      // Register the index variable — always Integer (discrete loop counter),
      // and resolve=false because resolveReference() would misclassify it
      // as an indeterminate and overwrite the type with coDomainType
      indexVariableNode = new VariableNode<>(expression,
                                             new VariableReference<>(indexVariableFieldName,
                                                                     null,
                                                                     Integer.class),
                                             expression.position,
                                             false);
    }
    else
    {
      // No arrow — backtrack, let resolve() handle it
      expression.position  = savedPos;
      expression.character = savedChar;
    }
  }

  // 2. Parse the operand body as an AST node
  operandNode = expression.resolve();

  // 3. Parse limit specification
  if (functionForm)
  {
    // sum(k➔f(k), k=a…b)  — comma then var=lower…upper then )
    expression.require(',');
    parseLimitSpecification();
  }
  else
  {
    // Σk➔f(k){k=a…b}  — braces
    parseLimitSpecification();
  }
}


  /**
   * SPLICE constructor — called by spliceInto() with pre-built nodes.
   * No parsing happens here at all.
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

  @Override
  public int hashCode()
  {
    return Objects.hash(upperLimit, operandNode, operation, lowerLimit);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    NAryOperationNode<?, ?, ?> other = (NAryOperationNode<?, ?, ?>) obj;
    return Objects.equals(upperLimit, other.upperLimit)
                  && Objects.equals(operandNode, other.operandNode)
                  && Objects.equals(operation, other.operation)
                  && Objects.equals(lowerLimit, other.lowerLimit);
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    operandNode.accept(t);
    lowerLimit.accept(t);
    upperLimit.accept(t);
    t.accept(this);
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

  public MethodVisitor combine(MethodVisitor mv)
  {
    return invokeMethod(mv,
                        generatedType,
                        operation,
                        getMethodDescriptor(generatedType, generatedType, int.class),
                        false);
  }

  protected void compareIndexToUpperLimit(MethodVisitor mv)
  {
    loadFieldFromThis(mv, upperLimitFieldName, Integer.class);
    invokeMethod(mv,
                 Integer.class,
                 "compareTo",
                 Compiler.getMethodDescriptor(int.class, Integer.class),
                 false);
  }

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

  protected void generateUpperLimit(MethodVisitor mv)
  {
    upperLimitFieldName = expression.newIntermediateVariable("upperLimit", Integer.class);
    upperLimit.generate(loadFieldFromThis(mv, upperLimitFieldName, Integer.class), Integer.class);
    pop(invokeSetMethod(mv, Integer.class, Integer.class));
  }

  protected void generateInnerLoop(MethodVisitor mv)
  {
    loadIntermediateResultVariable(mv);
    operandNode.generate(mv, generatedType);
    cast(mv, generatedType);
    loadBitsParameterOntoStack(mv);
    combine(mv);
    pop(mv);
    incrementIndex(mv);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(operandNode, lowerLimit, upperLimit);
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

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  MethodVisitor loadIndexVariable(MethodVisitor methodVisitor)
  {
    assert fieldName != null : String.format("field is null %s\n", this);
    assert indexVariableFieldName != null : String.format("indexVariableFieldName is null %s\n",
                                                          this);
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

  /**
   * Unified limit parsing — handles both {k=a…b} and k=a…b forms.
   */
  private void parseLimitSpecification()
  {
    boolean hasBrace = expression.nextCharacterIs('{');

    String specifiedName = expression.parseName();
    if (specifiedName == null || specifiedName.isEmpty())
    {
      expression.throwUnexpectedCharacterException("index variable name cannot be null or empty");
    }

    if (indexVariableFieldName != null)
    {
      if (!indexVariableFieldName.equals(specifiedName))
      {
        throw new CompilerException(String.format("index variable in range spec '%s' != lambda variable '%s'",
                                                  specifiedName,
                                                  indexVariableFieldName));
      }
    }
    else
    {
      indexVariableFieldName = specifiedName;
    }

    expression.context.variables.put(indexVariableFieldName, null);
    expression.require('=');
    lowerLimit = expression.resolve();
    expression.require('…');
    upperLimit = expression.resolve();

    if (hasBrace)
    {
      expression.require('}');
    }
  }

  protected void prepareIndexVariable()
  {
    var existingIndexVariable = getExistingIndexVariable();

    if (existingIndexVariable != null)
    {
      if (!existingIndexVariable.type.equals(Integer.class))
      {
        throw new CompilerException(String.format("index variable %s already declared and not of Integer type so it cant be used as the index",
                                                  existingIndexVariable));
      }
    }
    else
    {
      expression.registerIntermediateVariable(getIndexVariableFieldName(), Integer.class, true);
    }
  }

  public Class<?> scalarType(Class<?> resultType)
  {
    return resultType = generatedType = (RealPolynomial.class.equals(resultType) ? Real.class
                                                                                 : resultType);
  }

  protected void setIndexToTheLowerLimit(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    lowerLimit.generate(methodVisitor, Integer.class);
    invokeSetMethod(methodVisitor, Integer.class, Integer.class);
    Compiler.pop(methodVisitor);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    var nAryOperationNode = new NAryOperationNode<E, S, G>(newExpression,
                                                           identity,
                                                           prefix,
                                                           operation,
                                                           symbol,
                                                           operandNode.spliceInto(newExpression),
                                                           lowerLimit.spliceInto(newExpression),
                                                           upperLimit.spliceInto(newExpression),
                                                           indexVariableFieldName);
    return nAryOperationNode;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> substitution)
  {
    operandNode = operandNode.substitute(variable, substitution);
    lowerLimit  = lowerLimit.substitute(variable, substitution);
    upperLimit  = upperLimit.substitute(variable, substitution);
    return this;
  }

  @Override
  public String toString()
  {
    assert indexVariableFieldName
                  != null : String.format("indexVariableFieldName is null in toString() for %s%s{null=%s…%s}",
                                          symbol,
                                          operandNode,
                                          lowerLimit,
                                          upperLimit);

    return String.format("%s%s{%s=%s…%s}",
                         symbol,
                         operandNode,
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
                         operandNode.typeset());
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
