package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.*;
import static arb.utensils.Utensils.indent;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.*;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.*;
import arb.expressions.Context;
import arb.expressions.nodes.*;
import arb.functions.Function;
import arb.functions.integer.Sequence;

/**
 * Represents a generic n-ary operation on {@link Node}s within
 * {@link Expression}s. This abstract base class provides the common structure
 * and behavior for operations that involve multiple operands, such as
 * {@link SumNode}, {@link ProductNode}, or other customized functions that
 * combine elements of a class over a coDomain of values.
 * <p>
 * It handles the initialization and execution of these operations, including
 * setting up the operation's parameters, executing the operation over the
 * specified coDomain, and managing intermediate results. The class leverages
 * ASM for bytecode manipulation, enabling dynamic generation and compilation of
 * expressions.
 * </p>
 * <p>
 * Generics <code>D</code>, <code>R</code>, and <code>F</code> represent the
 * domain, coDomain, and the function type of the operation, respectively. This
 * allows for operations over different types of expressions and results,
 * facilitating flexibility and reuse in various mathematical and computational
 * contexts.
 * </p>
 * <p>
 * The class integrates closely with the {@link arb.expressions.Compiler} and
 * {@link arb.utensils.Utensils} for expression parsing, bytecode generation,
 * and utility methods, ensuring a seamless operation within the arb framework.
 * </p>
 * 
 * @param <D> the domain type of the operands and the operation
 * @param <R> the coDomain type of the operation's result
 * @param <F> the function interface this operation implements, extending the
 *            {@link Function} interface with specific domain and coDomain types
 *
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class NAryOperationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              Node<D, R, F>
{


  public static String                            operandEvaluateMethodSignature =
                                                                                 Compiler.getMethodDescriptor(Object.class,
                                                                                                              Object.class,
                                                                                                              int.class,
                                                                                                              Object.class);

  public Label                                    beginLoop                      = new Label();

  public Label                                    endLoop                        = new Label();

  public Node<D, R, F>                            upperLimit;

  public String                                   upperLimitFieldName;

  public Expression<Integer, R, Sequence<R>>      operand;

  public String                                   operandExpressionString;

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

  public NAryOperationNode(Expression<D, R, F> expression,
                           String identity,
                           String prefix,
                           String operation,
                           String symbol)
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
    this.operandExpressionString = extractOperandExpression();
    functionClass                = expression.className;
    assert functionClass != null : "functionClass=expression.className shan't be null";
    generatedType = expression.coDomainType;

    parseOperatorLimitSpecifications();
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(upperLimit, operation, lowerLimit);
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
                  && Objects.equals(operation, other.operation)
                  && Objects.equals(lowerLimit, other.lowerLimit);
  }

  public NAryOperationNode(Expression<D, R, F> expression,
                           String identity,
                           String prefix,
                           String operation,
                           String symbol,
                           String operandExpression,
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
    this.operandExpressionString = operandExpression;
    assert functionClass != null : "functionClass=expression.className shan't be null";
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
    if (operandFunctionFieldName == null && operandValueFieldName == null)
    {
      operandFunctionFieldName = expression.getNextIntermediateVariableFieldName("operand",
                                                                                 resultType);
      operandValueFieldName    = expression.newIntermediateVariable("value", resultType);
      if (Expression.trace)
      {
        int indentation = 18 + getClass().getSimpleName().length();
        logFieldNameAssignment(resultType, indentation);
      }
    }
  }

  protected void logFieldNameAssignment(Class<?> resultType, int indentation)
  {
    if (Expression.trace)
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
    if (isResult)
    {
      Compiler.loadResultParameter(mv);
      var type = type();
      Compiler.cast(mv, type);
      loadResultVariable(mv);
      invokeSetMethod(mv, type, type);
    }
    else
    {
      loadResultVariable(mv);
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

  protected void evaluateOperand(MethodVisitor mv)
  {
    invokeMethod(mv,
                 Type.getInternalName(Function.class),
                 "evaluate",
                 operandEvaluateMethodSignature,
                 true);
  }

  public Node<D, R, F> parseOperatorLimitSpecifications()
  {
    expression.require('{');
    if (indexVariableFieldName != null)
    {
      String shouldBe = expression.parseName();
      if (!indexVariableFieldName.equals(shouldBe))
      {
        throw new CompilerException(String.format("index variable specified in the codomain specification '%s' != the index variable specified between the operator symbol and the right arrow '%s'",
                                                  shouldBe,
                                                  indexVariableFieldName));
      }
    }
    else
    {
      indexVariableFieldName = expression.parseName();
    }
    expression.context.variables.put(indexVariableFieldName, null);
    expression.require('=');
    parseLowerLimit();
    parseUpperLimit();
    return this;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    resultType = assignTypes(resultType);

    assignFieldNamesIfNecessary(resultType);
    prepareIndexVariable();
   
    if (operand == null)
    {
      compileOperandExpression(resultType);
    }
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

  @SuppressWarnings("unchecked")
  protected void generateUpperLimit(MethodVisitor mv)
  {
    upperLimitFieldName = expression.newIntermediateVariable("upperLimit", Integer.class);
    loadFieldFromThis(mv, upperLimitFieldName, Integer.class);
    upperLimit.generate(mv, Integer.class);
    invokeSetMethod(mv, Integer.class, Integer.class);
    pop(mv);
  }

  protected void generateInnerLoop(MethodVisitor mv)
  {
    loadResultVariable(mv);
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
    if (operand == null)
    {
      return List.of();
    }
    if (cachedOperandBranches == null)
    {
      var ast  = operand.syntaxTree();
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
    if (Expression.trace)
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
    return true;
  }

  protected void loadOperand(MethodVisitor mv)
  {
    getFieldFromThis(mv,
                     functionClass,
                     operandFunctionFieldName,
                     String.format("L%s;", operandFunctionFieldName));
  }

  protected void loadOperandValue(MethodVisitor mv)
  {
    if (Expression.trace)
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
    getField(methodVisitor, getIndexVariableFieldName(), Integer.class.descriptorString());
    return methodVisitor;
  }

  public void loadResultVariable(MethodVisitor methodVisitor)
  {
    if (Expression.trace)
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

  protected String extractOperandExpression()
  {
    if (Expression.trace)
    {
      logger.debug(String.format("extractOperandExpression(%s)\n", expression));
    }
    parsed = true;
    String stringExpression = expression.expression;
    int    startPos         = expression.position;
    int    arrowIndex       = stringExpression.indexOf('➔', expression.position);

    if (arrowIndex != -1)
    {
      indexVariableFieldName = stringExpression.substring(startPos, arrowIndex);
    }
    String lookingFor                 =
                      indexVariableFieldName != null ? String.format("{%s=", indexVariableFieldName)
                                                     : "{";
    int    rangeSpecificationPosition = stringExpression.indexOf(lookingFor, expression.position);
    if (rangeSpecificationPosition == -1)
    {
      expression.throwUnexpectedCharacterException("didn't find '"
                                                   + lookingFor
                                                   + "' remaining="
                                                   + expression.remaining());

    }
    String operandExpression = stringExpression.substring(startPos, rangeSpecificationPosition)
                                               .trim();
    expression.character =
                         expression.expression.charAt(expression.position +=
                                                                          operandExpression.length());
    return operandExpression;

  }

  @SuppressWarnings("unchecked")
  protected void compileOperandExpression(Class<?> resultType)
  {
    assert operand == null : "operand is already set and operandExpressionString is "
                             + operandExpressionString;

    registerOperand(operandExpressionString,
                    operand = Function.parse(operandFunctionFieldName,
                                             operandExpressionString,
                                             expression.context,
                                             Integer.class,
                                             resultType,
                                             Function.class,
                                             operandFunctionFieldName,
                                             expression));
  }

  private void parseLowerLimit()
  {
    lowerLimit = expression.resolve();
    expression.require('…');
  }

  protected void prepareIndexVariable()
  {
    var existingIndexVariable = getExistingIndexVariable();

    if (existingIndexVariable != null)
    {
      if (!existingIndexVariable.type.equals(Integer.class))
      {
        throw new CompilerException(String.format("index variable %s already declared  and not of Intger type so it cant be used as the index",
                                                  existingIndexVariable));
      }
    }
    else
    {
      expression.registerIntermediateVariable(getIndexVariableFieldName(), Integer.class, true);
    }
  }

  protected void propagateInputToOperand(MethodVisitor mv)
  {
    var independentVariableNode = expression.independentVariable;
    if (independentVariableNode != null && !independentVariableNode.type().equals(Object.class))
    {
      expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                    operandFunctionFieldName,
                                    String.format("L%s;", operandFunctionFieldName));

      cast(loadInputParameter(mv), independentVariableNode.type());
      if (Expression.trace)
      {
        logInputPropagationToOperand(independentVariableNode);
      }

      putField(mv,
               operandFunctionFieldName,
               independentVariableNode.reference.name,
               independentVariableNode.type());
    }
  }

  protected void logInputPropagationToOperand(VariableNode<D, R, F> independentVariableNode)
  {
    if (Expression.trace)
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

    operandMapping = registerOperandFunctionMapping(operandExpression, expr);
    if (Expression.trace)
    {
      logger.debug(String.format("\nregisterOperand(operandExpression=%s,\noperandMapping=%s\n)\n\n",
                                 operandExpression,
                                 operandMapping));
    }
    expression.referencedFunctions.put(operandFunctionFieldName, operandMapping);
  }

  public FunctionMapping<Integer, R, Sequence<R>>
         registerOperandFunctionMapping(Expression<Integer, R, Sequence<R>> operand, String expr)
  {
    if (Expression.trace)
    {
      logger.debug(String.format("registerOperandFunctionMapping(operand=%s)\n", operand));
    }
    return expression.context.registerFunctionMapping(operandFunctionFieldName,
                                                      null,
                                                      Integer.class,
                                                      operand.coDomainType,
                                                      null,
                                                      false,
                                                      operand,
                                                      expr);
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
    return new NAryOperationNode<E, S, G>(newExpression,
                                          identity,
                                          prefix,
                                          operation,
                                          symbol,
                                          operandExpressionString,
                                          lowerLimit.spliceInto(newExpression),
                                          upperLimit.spliceInto(newExpression));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> substitution)
  {
    if (substitution.toString().equals(variable))
    {
      return this;
    }
    // expression.reset();
    expression.context.functions.remove(this.operandFunctionFieldName);
    expression.context.variables.remove(this.operandValueFieldName);
    operandFunctionFieldName = null;
    operandValueFieldName    = null;
    operand                  = null;
    assignFieldNamesIfNecessary(expression.coDomainType);
    compileOperandExpression(expression.coDomainType);

    operand                 = operand.substitute(variable, substitution.expression);
    lowerLimit              = lowerLimit.substitute(variable, substitution);
    upperLimit              = upperLimit.substitute(variable, substitution);
    operandExpressionString = operand.toString();
    return this;
  }

  @Override
  public String toString()
  {

    return String.format("%s%s{%s=%s…%s}",
                         symbol,
                         operand != null ? operand.toString() : operandExpressionString,
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
                         operand.typeset());
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
    assert false : "TODO";
    return false;
  }

}