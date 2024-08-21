package arb.expressions.nodes;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.getFieldFromThis;
import static arb.expressions.Compiler.invokeMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.expressions.VariableReference;
import arb.functions.Function;

/**
 * 
 * The syntax for integration is g(x)=∫x➔f(x)dx∈(a,b) where a is the lower and b
 * is the upper limit of integration of the integrand f(x) over x=(a..b)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegralNode<D, R, F extends Function<? extends D, ? extends R>>
                     extends
                     Node<D, R, F>
{

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable,
                                                                                       Node<E, S, G> arg)
  {
    integrand           = integrand.substitute(variable, arg);
    lowerLimit          = lowerLimit.substitute(variable, arg);
    upperLimit          = upperLimit.substitute(variable, arg);
    integrationVariable = integrationVariable.substitute(variable, arg).asVariable();
    return this;
  }

  public int                                                   bits = 128;

  Node<D, R, F>                                                integrand;

  Node<D, R, F>                                                lowerLimit;

  Node<D, R, F>                                                upperLimit;

  VariableNode<D, R, F>                                            integrationVariable;

  Function<? extends R, ? extends R>                           integralFunction;

  String                                                       integralFunctionFieldName;

  String                                                       lowerIntegralValueFieldName;

  String                                                       dvar;

  private Expression<R, R, Function<? extends R, ? extends R>> integralExpression;

  private Node<D, R, F>                                        integralNode;

  private String                                               upperIntegralValueFieldName;

  /**
   * The syntax to express an integral is<br>
   * <br>
   * 
   * <pre>
   * 
   * g(x)=∫x➔f(x)dx∈(a,b)
   * 
   * </pre>
   * 
   * 
   * @param expression
   */
  public IntegralNode(Expression<D, R, F> expression)
  {
    super(expression);
    integrationVariable = new VariableNode<>(expression,
                                         new VariableReference<>(expression.parseName()),
                                         expression.position,
                                         true);
    expression.require('➔');
    integrand = expression.resolve();
    expression.require('d');
    dvar = expression.parseName();
    assert dvar.equals(integrationVariable.getName()) : String.format("the format is  g(x)=∫x➔f(x)dx∈(a,b) for integrals, the variable on the left "
                  + "side of the arrow must match the variable on the right side of the d and "
                  + "before the ( but the first var was %s and the 2nd was %s\n", integrationVariable, dvar);
    expression.require('∈');
    expression.require('(');
    lowerLimit = expression.resolve();
    expression.require(',');
    upperLimit = expression.resolve();
    expression.require(')');
  }

  protected void assignFieldNames(Class<?> resultType)
  {
    integralFunctionFieldName   = expression.getNextIntermediateVariableFieldName("integral", resultType);

    lowerIntegralValueFieldName = expression.newIntermediateVariable("lowerValue", resultType);
    upperIntegralValueFieldName = expression.newIntermediateVariable("upperValue", resultType);
  }

  void loadIntegral(MethodVisitor mv)
  {
    Compiler.getFieldFromThis(mv,
                              expression.className,
                              integralFunctionFieldName,
                              "L" + integralFunctionFieldName + ";");
  }

  static String                                             integralEvaluateMethodSignature = Compiler.getMethodDescriptor(Object.class,
                                                                                                                           Object.class,
                                                                                                                           int.class,
                                                                                                                           Object.class);

  FunctionMapping<R, R, Function<? extends R, ? extends R>> integralMapping;

  private String                                            intermediateValueFieldName;

  protected void evaluateIntegral(MethodVisitor mv)
  {
    invokeMethod(mv, Type.getInternalName(Function.class), "evaluate", integralEvaluateMethodSignature, true);
  }

  public MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getFieldFromThis(mv, expression.className, fieldName, type);
  }

  @SuppressWarnings("unchecked")
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assignFieldNames(resultType);
    generatedType = resultType;

    computeIndefiniteIntegral((Class<? extends R>) resultType);

    evaluateIndefiniteIntegralAt(mv, upperLimit, resultType, lowerIntegralValueFieldName);
    evaluateIndefiniteIntegralAt(mv, lowerLimit, resultType, upperIntegralValueFieldName);
    loadBitsParameterOntoStack(mv);
    if (isResult)
    {
      Compiler.checkClassCast(Compiler.loadResultParameter(mv), resultType);
    }
    else
    {
      intermediateValueFieldName = expression.allocateIntermediateVariable(mv, "integralDifference", resultType);
    }

    Compiler.invokeBinaryOperationMethod(mv, "sub", resultType, resultType, resultType);

    return mv;
  }

  private void computeIndefiniteIntegral(Class<? extends R> resultType)
  {

    integralNode = integrand.integral(integrationVariable.asVariable());
    String expr = integralNode.toString();

    integralExpression = Function.parse(integralFunctionFieldName,
                                        expr,
                                        expression.context,
                                        expression.coDomainType,
                                        expression.coDomainType,
                                        Function.class,
                                        integralFunctionFieldName,
                                        expression);

    integralFunction   = integralExpression.instantiate();

    integralMapping    = expression.context.registerFunctionMapping(integralFunctionFieldName,
                                                                    integralExpression.instantiate(),
                                                                    expression.coDomainType,
                                                                    expression.coDomainType,
                                                                    Function.class,
                                                                    false,
                                                                    integralExpression,
                                                                    expr);

    expression.referencedFunctions.put(integralFunctionFieldName, integralMapping);
  }

  private void evaluateIndefiniteIntegralAt(MethodVisitor mv,
                                            Node<D, R, F> limit,
                                            Class<?> resultType,
                                            String integralValueFieldName)
  {
    loadIntegral(mv);
    limit.generate(mv, Real.class);
//    assert limit.getGeneratedType()
//                .equals(Real.class) : String.format("limit.generatedType=%s != Real",
//                                                    limit.getGeneratedType());
    loadBitsParameterOntoStack(mv);
    loadFieldFromThis(mv, integralValueFieldName, generatedType);
    evaluateIntegral(mv);
    checkClassCast(mv, resultType);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(integrand);
  }

  @Override
  public boolean hasSingleLeaf()
  {
    assert false : "TODO: Auto-generated method stub";
    return isResult;
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "TODO: Auto-generated method stub";
    return mv;
  }

  @Override
  public <C> Class<? extends C> type()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String typeset()
  {
    return String.format("%sint_%s^%s %s %smathd %s",
                         "\\",
                         lowerLimit.typeset(),
                         upperLimit.typeset(),
                         integrand.typeset(),
                         "\\",
                         integrationVariable.typeset());
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    IntegralNode<E, S, G> integral = new IntegralNode<E, S, G>(newExpression);
    integral.integralFunctionFieldName   = integralFunctionFieldName;
    integral.lowerIntegralValueFieldName = integral.lowerIntegralValueFieldName;
    integral.upperIntegralValueFieldName = integral.upperIntegralValueFieldName;
    integral.integrand                   = integrand.spliceInto(newExpression);
    integral.upperLimit                  = integral.upperLimit;
    integral.lowerLimit                  = integral.lowerLimit;
    integral.integrationVariable         = integral.integrationVariable;
    return integral;
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    integrationVariable.accept(t);
    integrand.accept(t);
    lowerLimit.accept(t);
    upperLimit.accept(t);
    t.accept(this);
  }

  @Override
  public Node<D, R, F> derivative(VariableNode<D, R, F> variable)
  {
    return integrand;
  }

  @Override
  public boolean isScalar()
  {
    return type().equals(Real.class) || type().equals(Complex.class);
  }

  @Override
  public char symbol()
  {
    return '∫';
  }

  @Override
  public boolean isConstant()
  {
    return integrand.isConstant() && lowerLimit.isConstant() && upperLimit.isConstant();
  }

  @Override
  public String getIntermediateValueFieldName()
  {
    return intermediateValueFieldName;
  }

}
