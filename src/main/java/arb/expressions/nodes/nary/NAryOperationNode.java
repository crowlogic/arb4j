package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.getFieldFromThis;
import static arb.expressions.Compiler.getMethodDescriptor;
import static arb.expressions.Compiler.invokeMethod;
import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.invokeVirtualMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.loadInputParameter;
import static arb.expressions.Compiler.loadThisOntoStack;
import static arb.utensils.Utensils.indent;
import static java.lang.System.err;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.GOTO;
import static org.objectweb.asm.Opcodes.IFGT;
import static org.objectweb.asm.Opcodes.IFLE;
import static org.objectweb.asm.Opcodes.POP;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.ComplexPolynomial;
import arb.Integer;
import arb.Polynomial;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.expressions.IntermediateVariable;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.integer.Sequence;
import arb.utensils.Utensils;

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
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NAryOperationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              Node<D, R, F>
{

  public static String                            factorEvaluateMethodSignature =
                                                                                Type.getMethodDescriptor(Type.getType(Object.class),
                                                                                                         Type.getType(Object.class),
                                                                                                         Type.getType(int.class),
                                                                                                         Type.getType(Object.class));

  public Label                                    beginLoop            = new Label();

  public Label                                    endLoop                  = new Label();

  public Node<D, R, F>                            upperLimit;

  public String                                   upperLimitFieldName;

  public Expression<Integer, R, Sequence<R>>      factor;

  public String                                   factorExpressionString;

  public String                                   factorFunctionFieldName;

  public FunctionMapping<Integer, R, Sequence<R>> factorMapping;

  public String                                   factorValueFieldName;

  public String                                   functionClass;

  public final String                             identity;

  public String                                   indexVariableFieldName;

  public final String                             operation;

  public boolean                                  parsed                        = false;

  public final String                             prefix;

  public Node<D, R, F>                            lowerLimit;

  public final String                             symbol;

  public List<Node<D, R, F>>                      cachedFactorBranches;

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
    this.factorExpressionString = parseFactorExpression();
    functionClass               = expression.className;
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
                           String factorExpression,
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
    this.factorExpressionString = factorExpression;
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
    if (factorFunctionFieldName == null && factorValueFieldName == null)
    {
      factorFunctionFieldName =
                              expression.getNextIntermediateVariableFieldName("factor", resultType);
      factorValueFieldName    = expression.newIntermediateVariable("value", resultType);
      if (Expression.trace)
      {
        int indentation = 18 + getClass().getSimpleName().length();
        logFieldNameAssignment(resultType, indentation);
      }
    }
  }

  protected void logFieldNameAssignment(Class<?> resultType, int indentation)
  {
    System.out.format("%s.assignFieldNames(this=%s,resultType=%s,\n%sfactorFunctionFieldName=%s,\n%sfactorValueFieldName=%s)\n\n",
                      getClass().getSimpleName(),
                      expression.functionName,
                      resultType,
                      indent(indentation),
                      factorFunctionFieldName,
                      indent(indentation),
                      factorValueFieldName);
  }

  protected void assignResult(MethodVisitor mv, Class<?> resultType)
  {
    if (isResult)
    {
      Compiler.loadResultParameter(mv);
      Class<?> type = type();
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

  protected void designateLabel(MethodVisitor mv, Label label)
  {
    if (Expression.trace)
    {
      System.out.format("%s.designateLabel( label=%s)\n\n",
                        getClass().getSimpleName(),
                        label,
                        Utensils.indent(35));
    }
    mv.visitLabel(label);

  }

  protected void evaluateFactor(MethodVisitor mv)
  {
    invokeMethod(mv,
                 Type.getInternalName(Function.class),
                 "evaluate",
                 factorEvaluateMethodSignature,
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
    expression.context.variables.map.put(indexVariableFieldName, null);
    expression.require('=');
    parseLowerLimit();
    parseUpperLimit();
    return this;
  }

  protected void jumpToIfGreaterThan(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitJumpInsn(IFGT, label);
  }

  protected void jumpTo(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitJumpInsn(GOTO, label);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    resultType = assignTypes(resultType);

    assignFieldNamesIfNecessary(resultType);
    prepareIndexVariable();
    if (factor == null)
    {
      parseFactorExpression(resultType);
    }
    propagateInputToFactorClass(mv);
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
    if (!expression.thisOrAnyAscendentExpressionHasIndeterminateVariable())
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
    upperLimit.generate(mv, (Class<? extends R>) Integer.class);
    invokeSetMethod(mv, Integer.class, Integer.class);
    pop(mv);
  }

  protected void generateInnerLoop(MethodVisitor mv)
  {
    loadResultVariable(mv);
    loadFactor(mv);
    loadIndex(mv);
    loadBitsParameterOntoStack(mv);
    loadFactorValue(mv);
    evaluateFactor(mv);
    cast(mv, generatedType);
    loadBitsParameterOntoStack(mv);
    combine(mv);
    pop(mv);
    incrementIndex(mv);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    if (factor == null)
    {
      return List.of();
    }
    if (cachedFactorBranches == null)
    {
      var ast  = factor.syntaxTree();
      var list = ast.indexedBranches.get(ast.getRoot());
      cachedFactorBranches = list.stream().map(element -> element.spliceInto(expression)).toList();
    }
    return cachedFactorBranches;
  }

  IntermediateVariable<D, R, F> getExistingIndexVariable()
  {
    return expression.intermediateVariables.get(getIndexVariableFieldName());
  }

  void getField(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    if (Expression.trace)
    {
      out.format("NAryOperation.getField(functionClass=%s,\n%sfieldName=%s,\n%sfieldTypeSignature=%s\n\n",
                 functionClass,
                 indent(9),
                 fieldName,
                 indent(9),
                 fieldTypeSignature);
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
    loadIndexVariable(mv);
    invokeVirtualMethod(mv, Integer.class, "increment", Integer.class);
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

  protected MethodVisitor jumpToIfLessThanOrEquals(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitJumpInsn(IFLE, label);
    return methodVisitor;
  }

  protected void loadFactor(MethodVisitor mv)
  {
    getFieldFromThis(mv,
                     functionClass,
                     factorFunctionFieldName,
                     String.format("L%s;", factorFunctionFieldName));
  }

  protected void loadFactorValue(MethodVisitor mv)
  {
    if (Expression.trace)
    {
      System.err.format("%s.loadFactorValue(factorValueFieldName=%s, generatedType=%s) expression=%s\n",
                        getClass().getSimpleName(),
                        factorValueFieldName,
                        generatedType,
                        expression);
    }
    loadFieldFromThis(mv, factorValueFieldName, generatedType);
  }

  protected void loadIndex(MethodVisitor mv)
  {
    loadFieldFromThis(mv, indexVariableFieldName, Integer.class);
  }

  void loadIndexVariable(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, getIndexVariableFieldName(), Integer.class.descriptorString());
  }

  public void loadResultVariable(MethodVisitor methodVisitor)
  {
    if (Expression.trace)
    {

      System.err.format("%s.loadResultvariable( resultVariable= %s, generatedType=%s )\n",
                        getClass().getSimpleName(),
                        fieldName,
                        generatedType);

    }
    Compiler.getFieldFromThis(methodVisitor, expression.className, fieldName, generatedType);
  }


  private void parseUpperLimit()
  {
    upperLimit = expression.evaluate();
    expression.require('}');
  }

  protected String parseFactorExpression()
  {
    if (Expression.trace)
    {
      err.format("parseFactorExpression(%s)\n", expression);
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
    String factorExpression =
                            stringExpression.substring(startPos, rangeSpecificationPosition).trim();
    expression.character =
                         expression.expression.charAt(expression.position +=
                                                                          factorExpression.length());
    return factorExpression;

  }

  @SuppressWarnings("unchecked")
  protected void parseFactorExpression(Class<?> resultType)
  {
    assert factor == null : "factorExpression is already set and factorExpressionString is "
                            + factorExpressionString;

    String expr = factorExpressionString.toString();

    if (Expression.trace)
    {
      System.out.format("%s.parseFactorExpression( functionName=%s, expr=%s,resultType=%s)\n\n",
                        getClass().getSimpleName(),
                        expression.functionName,
                        expr,
                        resultType);
    }
    factor = Function.parse(factorFunctionFieldName,
                            expr,
                            expression.context,
                            Integer.class,
                            resultType,
                            Function.class,
                            factorFunctionFieldName,
                            expression);

    registerFactor(expr, factor);
  }

  private void parseLowerLimit()
  {
    lowerLimit = expression.resolve();
    expression.require('…');
  }

  protected void pop(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(POP);
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

  protected void propagateInputToFactorClass(MethodVisitor mv)
  {
    var independentVariableNode = expression.independentVariable;
    if (independentVariableNode != null && !independentVariableNode.type().equals(Object.class))
    {
      loadThisOntoStack(mv);
      expression.loadFieldOntoStack(mv,
                                    factorFunctionFieldName,
                                    "L" + factorFunctionFieldName + ";");
      loadInputParameter(mv);
      cast(mv, independentVariableNode.type());
      if (Expression.trace)
      {
        logInputPropagationToFactorClass(independentVariableNode);
      }

      Compiler.putField(mv,
                        factorFunctionFieldName,
                        independentVariableNode.reference.name,
                        independentVariableNode.type());
    }
  }

  protected void logInputPropagationToFactorClass(VariableNode<D, R, F> independentVariableNode)
  {
    System.out.format("%s.propagateInputToFactorClass( factorFunctionFieldName=%s,\n"
                      + "%sindependentVariableNode=%s,\n"
                      + "%sindependentVariableNode.type=%s)\n\n",
                      getClass().getSimpleName(),
                      factorFunctionFieldName,
                      indent(48),
                      independentVariableNode,
                      indent(48),
                      independentVariableNode.type());
  }

  void registerFactor(String expr, Expression<Integer, R, Sequence<R>> factorExpression)
  {

    factorMapping = registerFunctionMapping(factorExpression, expr);
    if (Expression.trace)
    {
      System.err.format("\nregisterFactor(factor=%s,\nfactorMapping=%s\n)\n\n",
                        factorExpression,
                        factorMapping);
    }

    expression.referencedFunctions.put(factorFunctionFieldName, factorMapping);
  }

  public FunctionMapping<Integer, R, Sequence<R>>
         registerFunctionMapping(Expression<Integer, R, Sequence<R>> factor, String expr)
  {
    if (Expression.trace)
    {
      System.err.format("registerFunctionMapping(factor=%s)\n", factor);
    }
    return expression.context.registerFunctionMapping(factorFunctionFieldName,
                                                      null,
                                                      Integer.class,
                                                      factor.coDomainType,
                                                      null,
                                                      true,
                                                      factor,
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
    pop(methodVisitor);
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
                                          factorExpressionString,
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
    expression.context.functions.map.remove(this.factorFunctionFieldName);
    expression.context.variables.map.remove(this.factorValueFieldName);
    factorFunctionFieldName = null;
    factorValueFieldName    = null;
    factor                  = null;
    assignFieldNamesIfNecessary(expression.coDomainType);
    parseFactorExpression(expression.coDomainType);

    factor                 = factor.substitute(variable, substitution.expression);
    lowerLimit             = lowerLimit.substitute(variable, substitution);
    upperLimit             = upperLimit.substitute(variable, substitution);
    factorExpressionString = factor.toString();
    return this;
  }

  @Override
  public String toString()
  {

    return String.format("%s%s{%s=%s…%s}",
                         symbol,
                         factor != null ? factor.toString() : factorExpressionString,
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
                         factor.typeset());
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

}