package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.*;
import static arb.utensils.Utensils.indent;
import static java.lang.System.err;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.GOTO;
import static org.objectweb.asm.Opcodes.IFGT;
import static org.objectweb.asm.Opcodes.IFLE;
import static org.objectweb.asm.Opcodes.POP;
import static org.objectweb.asm.Opcodes.PUTFIELD;

import java.util.List;
import java.util.function.Consumer;
import java.util.stream.Collectors;

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
import arb.expressions.nodes.Variable;
import arb.functions.Function;
import arb.functions.sequences.Sequence;
import arb.utensils.Utensils;

/**
 * Represents a generic n-ary operation on {@link Node}s within
 * {@link Expression}s. This abstract base class provides the common structure
 * and behavior for operations that involve multiple operands, such as
 * {@link Sum}, {@link Product}, or other customized functions that combine
 * elements of a class over a coDomain of values.
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
public class NAryOperation<D, R, F extends Function<? extends D, ? extends R>>
                          extends
                          Node<D, R, F>
{

  protected static String                  factorEvaluateMethodSignature = Type.getMethodDescriptor(Type.getType(Object.class),
                                                                                                    Type.getType(Object.class),
                                                                                                    Type.getType(int.class),
                                                                                                    Type.getType(Object.class));

  protected Label                          beginningOfTheLoop            = new Label();

  protected Label                          endOfTheLoop                  = new Label();

  public Node<D, R, F>                     endIndex;

  public String                            endIndexFieldName;

  Expression<Integer, R, Sequence<R>>      factor;

  public String                            factorExpressionString;

  public String                            factorFunctionFieldName;

  FunctionMapping<Integer, R, Sequence<R>> factorMapping;

  public String                            factorValueFieldName;

  public String                            functionClass;

  public final String                      identity;

  public String                            indexVariableFieldName;

  public final String                      operation;

  boolean                                  parsed                        = false;

  public final String                      prefix;

  public String                            resultVariable;

  public Node<D, R, F>                     startIndex;

  public final String                      symbol;

  public NAryOperation(Expression<D, R, F> expression,
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

    evaluateCoDomainSpecification();
  }

  public NAryOperation(Expression<D, R, F> expression,
                       String identity,
                       String prefix,
                       String operation,
                       String symbol,
                       String factorExpression,
                       Node<D, R, F> startIndex,
                       Node<D, R, F> endIndex)
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
    this.startIndex = startIndex;
    this.endIndex   = endIndex;
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    startIndex.accept(t);
    endIndex.accept(t);
    t.accept(this);
  }

  protected void assignFieldNamesIfNecessary(Class<?> resultType)
  {
    if (factorFunctionFieldName == null && factorValueFieldName == null)
    {
      factorFunctionFieldName = expression.getNextIntermediateVariableFieldName("factor", resultType);
      factorValueFieldName    = expression.newIntermediateVariable("value", resultType);
      if (Expression.trace)
      {
        int indentation = 18 + getClass().getSimpleName().length();
        System.out.format("%s.assignFieldNames(this=%s,resultType=%s,\n%sfactorFunctionFieldName=%s,\n%sfactorValueFieldName=%s)\n\n",
                          getClass().getSimpleName(),
                          expression.functionName,
                          resultType,
                          indent(indentation),
                          factorFunctionFieldName,
                          indent(indentation),
                          factorValueFieldName);
      }
    }
  }

  protected void assignResult(MethodVisitor mv, Class<?> resultType)
  {
    if (isResult)
    {
      Compiler.loadResultParameter(mv);
      Class<?> type = type();
      Compiler.checkClassCast(mv, type);
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

  protected void compareIndexToEndIndex(MethodVisitor mv)
  {
    loadFieldFromThis(mv, endIndexFieldName, Integer.class);
    invokeMethod(mv, Integer.class, "compareTo", Compiler.getMethodDescriptor(int.class, Integer.class), false);
  }

  protected void designateLabel(MethodVisitor mv, Label label)
  {
    if (Expression.trace)
    {
      System.out.format("%s.designateLabel( label=%s)\n\n", getClass().getSimpleName(), label, Utensils.indent(35));
    }
    mv.visitLabel(label);

  }

  protected void evaluateFactor(MethodVisitor mv)
  {
    invokeMethod(mv, Type.getInternalName(Function.class), "evaluate", factorEvaluateMethodSignature, true);
  }

  public Node<D, R, F> evaluateCoDomainSpecification()
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

    parseStartIndex();
    parseEndIndex();
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
  public MethodVisitor generate(Class<?> resultType, MethodVisitor mv)
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
    setIndexToTheStartIndex(mv);
    loadIndex(mv);
    generateEndingIndex(mv);

    designateLabel(mv, beginningOfTheLoop);

    compareIndexToEndIndex(mv);
    jumpToIfGreaterThan(mv, endOfTheLoop);

    generateInnerLoop(mv);

    jumpTo(mv, beginningOfTheLoop);

    designateLabel(mv, endOfTheLoop);
    assignResult(mv, resultType);

    return mv;
  }

  public Class<?> assignTypes(Class<?> resultType)
  {
    if (!expression.thisOrAnyAscendentExpressionHasPolynomialOrRationalFunctionCoDomain())
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
  protected void generateEndingIndex(MethodVisitor mv)
  {
    endIndexFieldName = expression.newIntermediateVariable("endIndex", Integer.class);
    loadFieldFromThis(mv, endIndexFieldName, Integer.class);
    endIndex.generate((Class<? extends R>) Integer.class, mv);
    invokeSetMethod(mv, Integer.class, Integer.class);
    pop(mv);
  }

  public void generateInnerLoop(MethodVisitor mv)
  {
    loadResultVariable(mv);
    loadFactor(mv);
    loadIndex(mv);
    loadBitsParameterOntoSTack(mv);
    loadFactorValue(mv);
    evaluateFactor(mv);
    checkClassCast(mv, generatedType);
    loadBitsParameterOntoSTack(mv);
    combine(mv);
    pop(mv);
    incrementIndex(mv);
  }

  public void generateWhileDoInnerLoop(MethodVisitor mv)
  {
    loadResultVariable(mv);
    loadFactor(mv);
    loadIndex(mv);
    loadBitsParameterOntoSTack(mv);
    loadFactorValue(mv);
    evaluateFactor(mv);
    checkClassCast(mv, generatedType);
    loadBitsParameterOntoSTack(mv);
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
    var ast  = factor.syntaxTree();
    var list = ast.indexedBranches.get(ast.getRoot());
    return list.stream().map(element -> element.spliceInto(expression)).collect(Collectors.toList());
  }

  IntermediateVariable<D, R, F> getExistingIndexVariable()
  {
    String indexFieldName        = getIndexVariableFieldName();

    var    existingIndexVariable = expression.intermediateVariables.get(indexFieldName);

    return existingIndexVariable;
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

  @Override
  public boolean hasSingleLeaf()
  {
    return false;
  }

  protected void incrementIndex(MethodVisitor mv)
  {
    loadIndexVariable(mv);
    invokeMethod(mv, Type.getInternalName(Integer.class), "increment", Compiler.getMethodDescriptor(Integer.class));
  }

  public void initializeResult(MethodVisitor mv, Class<?> resultType, String identityFunction, String prefix)
  {
    resultVariable = expression.allocateIntermediateVariable(mv, prefix, resultType);
    pop(invokeMethod(mv, resultType, identityFunction, getMethodDescriptor(resultType), false));
  }

  public void initializeResultVariable(MethodVisitor mv, Class<?> resultType)
  {
    initializeResult(mv, resultType, identity, prefix);
  }

  @Override
  public Node<D, R, F> integral(Variable<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public boolean isLeaf()
  {
    return true;
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  protected MethodVisitor jumpToIfLessThanOrEquals(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitJumpInsn(IFLE, label);
    return methodVisitor;
  }

  protected void loadFactor(MethodVisitor mv)
  {
    getFieldFromThis(mv, functionClass, factorFunctionFieldName, "L" + factorFunctionFieldName + ";");
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

  public MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return Compiler.getFieldFromThis(mv, functionClass, fieldName, type);
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
                        resultVariable,
                        generatedType);

      // expression.addToTypeStack(generatedType, "result");
    }
    Compiler.getFieldFromThis(methodVisitor, expression.className, resultVariable, generatedType);
  }

  void loadVariableThatHoldsTheEvaluatedFactor(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, factorValueFieldName, type());
  }

  private void parseEndIndex()
  {
    endIndex = expression.evaluate();
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

    // assert arrowIndex != -1 : "index variable must always be specified for
    // NaryOperations";

    if (arrowIndex != -1)
    {
      indexVariableFieldName = stringExpression.substring(startPos, arrowIndex);
      // expression.position = arrowIndex + 1;
    }

    int    coDomainSpecificationPosition = stringExpression.indexOf(indexVariableFieldName != null ? String.format("{%s=",
                                                                                                                   indexVariableFieldName) : "{",
                                                                    expression.position);

    String factorExpression              = stringExpression.substring(startPos, coDomainSpecificationPosition)
                                                           .trim();
    expression.character = expression.expression.charAt(expression.position += factorExpression.length());
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

  private void parseStartIndex()
  {
    startIndex = expression.resolve();
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

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "not recycleable";
    return mv;
  }

  protected void propagateInputToFactorClass(MethodVisitor mv)
  {
    var independentVariableNode = expression.independentVariable;
    if (independentVariableNode != null && !independentVariableNode.type().equals(Object.class))
    {
      loadThisOntoStack(mv);
      expression.loadFieldOntoStack(mv, factorFunctionFieldName, "L" + factorFunctionFieldName + ";");
      loadInputParameter(mv);
      checkClassCast(mv, independentVariableNode.type());
      if (Expression.trace)
      {
        System.out.format("%s.propagateInputToFactorClass( factorFunctionFieldName=%s,\n"
                      + "%sindependentVariableNode=%s,\n" + "%sindependentVariableNode.type=%s)\n\n",
                          getClass().getSimpleName(),
                          factorFunctionFieldName,
                          indent(48),
                          independentVariableNode,
                          indent(48),
                          independentVariableNode.type());
      }

      mv.visitFieldInsn(PUTFIELD,
                        factorFunctionFieldName,
                        independentVariableNode.reference.name,
                        independentVariableNode.type().descriptorString());
    }
  }

  void registerFactor(String expr, Expression<Integer, R, Sequence<R>> factorExpression)
  {

    factorMapping = registerFunctionMapping(factorExpression, expr);
    if (Expression.trace)
    {
      System.err.format("\nregisterFactor(factor=%s,\nfactorMapping=%s\n)\n\n", factorExpression, factorMapping);
    }

    expression.referencedFunctions.put(factorFunctionFieldName, factorMapping);
  }

  public FunctionMapping<Integer, R, Sequence<R>> registerFunctionMapping(Expression<Integer, R, Sequence<R>> factor,
                                                                          String expr)
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
    return resultType = generatedType = (RealPolynomial.class.equals(resultType) ? Real.class : resultType);
  }

  protected void setIndexToTheStartIndex(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    startIndex.generate(Integer.class, methodVisitor);
    invokeSetMethod(methodVisitor, Integer.class, Integer.class);
    pop(methodVisitor);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new NAryOperation<E, S, G>(newExpression,
                                      identity,
                                      prefix,
                                      operation,
                                      symbol,
                                      factorExpressionString,
                                      startIndex.spliceInto(newExpression),
                                      endIndex.spliceInto(newExpression));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable,
                                                                                       Node<E, S, G> substitution)
  {
    if (substitution.toString().equals(variable))
    {
      return this;
    }
    expression.instance             = null;
    expression.instructionByteCodes = null;
    expression.context.functions.map.remove(this.factorFunctionFieldName);
    expression.variables.map.remove(this.factorValueFieldName);
    factorFunctionFieldName = null;
    factorValueFieldName    = null;
    factor                  = null;
    assignFieldNamesIfNecessary(expression.coDomainType);
    parseFactorExpression(expression.coDomainType);

    if (Expression.trace)
    {
      System.err.format("%s of Expression(#%s) Substituting %s for %s in %s\n\n",
                        getClass().getSimpleName(),
                        System.identityHashCode(this),
                        substitution,
                        variable,
                        expression);
      err.format("%s(#%s).substitute(variable=%s, substitution=%s)\n",
                 factor,
                 System.identityHashCode(this),
                 variable,
                 substitution.expression);

    }
    factor                 = factor.substitute(variable, substitution.expression);
    startIndex             = startIndex.substitute(variable, substitution);
    endIndex               = endIndex.substitute(variable, substitution);
    factorExpressionString = factor.toString();
    return this;
  }

  @Override
  public String toString()
  {
    if (factorExpressionString != null && factorExpressionString.contains(indexVariableFieldName + "➔"))
    {
      return String.format("%s%s{%s=%s…%s}",
                           symbol,
                           factor != null ? factor.toString() : factorExpressionString,
                           indexVariableFieldName,
                           startIndex,
                           endIndex);
    }
    else
    {
      return String.format("%s%s➔%s{%s=%s…%s}",
                           symbol,
                           indexVariableFieldName,
                           factor != null ? factor.toString() : factorExpressionString,
                           indexVariableFieldName,
                           startIndex,
                           endIndex);
    }
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
                         operation.replace("mul", "prod"),
                         indexVariableFieldName,
                         startIndex.typeset(),
                         endIndex.typeset(),
                         factor.typeset());
  }

  @Override
  public Node<D, R, F> derivative(Variable<D, R, F> variable)
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
  public boolean isConstant()
  {
    return this.endIndex.isConstant() && startIndex.isConstant()
                  && getBranches().stream().allMatch(Node::isConstant);

  }

  @Override
  public String getIntermediateValueFieldName()
  {
    return resultVariable;
  }

}