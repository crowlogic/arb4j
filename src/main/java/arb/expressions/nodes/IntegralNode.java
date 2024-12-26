package arb.expressions.nodes;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.getFieldFromThis;
import static arb.expressions.Compiler.invokeMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.Complex;
import arb.Quaternion;
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
public class IntegralNode<D, C, F extends Function<? extends D, ? extends C>> extends
                         Node<D, C, F>
{

  @Override
  public int hashCode()
  {
    return Objects.hash(integrand, integrationVariable, lowerLimit, upperLimit);
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
    IntegralNode<?, ?, ?> other = (IntegralNode<?, ?, ?>) obj;
    return Objects.equals(integrand, other.integrand) && Objects.equals(integrationVariable, other.integrationVariable)
                  && Objects.equals(lowerLimit, other.lowerLimit) && Objects.equals(upperLimit, other.upperLimit);
  }

  @Override
  public Node<D, C, F> simplify()
  {
    integral = integral.simplify();
    return this;
  }

  @Override
  public String toString()
  {
    return integral.toString();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String variable,
                                                                                       Node<E, S, G> arg)
  {
    integrand           = integrand.substitute(variable, arg);
    lowerLimit          = lowerLimit.substitute(variable, arg);
    upperLimit          = upperLimit.substitute(variable, arg);
    integrationVariable = integrationVariable.substitute(variable, arg).asVariable();
    return this;
  }

  public int                                                   bits = 128;

  Node<D, C, F>                                                integrand;

  Node<D, C, F>                                                lowerLimit;

  Node<D, C, F>                                                upperLimit;

  VariableNode<D, C, F>                                        integrationVariable;

  Function<? extends C, ? extends C>                           integralFunction;

  String                                                       integralFunctionFieldName;

  String                                                       lowerIntegralValueFieldName;

  String                                                       dvar;

  private Expression<C, C, Function<? extends C, ? extends C>> integralExpression;

  private Node<D, C, F>                                        integral;

  private String                                               upperIntegralValueFieldName;

  public IntegralNode(Expression<D, C, F> expression)
  {
    this(expression,
         false);
  }

  /**
   * The syntax to express a definate integral is<br>
   * <br>
   * 
   * <pre>
   * 
   * g(x)=∫x➔f(x)dx∈(a,b)
   * 
   * </pre>
   * 
   * The syntax to express an indefinate integral is<br>
   * <br>
   * 
   * <pre>
   * 
   * g(x)=∫x➔f(x)dx
   *
   * (just leave off the range specification ∈(a,b)
   * </pre>
   * 
   * 
   * @param expression
   * @param functionForm
   */
  public IntegralNode(Expression<D, C, F> expression, boolean functionForm)
  {
    super(expression);
    if (!functionForm)
    {
      integrationVariable = new VariableNode<>(expression,
                                               new VariableReference<>(expression.parseName()),
                                               expression.position,
                                               true);
      integrand           = expression.require('➔').resolve();
      dvar                = expression.require('d').parseName();
      assert dvar.equals(integrationVariable.getName()) : String.format("the format is  g(x)=∫x➔f(x)dx∈(a,b) for definite integrals and g(x)=∫x➔f(x)dx for indefinate integrals, the variable on the left "
                                                                        + "side of the arrow must match the variable on the right side of the d and "
                                                                        + "before the ( but the first var was %s and the 2nd was %s\n",
                                                                        integrationVariable,
                                                                        dvar);

      if (expression.nextCharacterIs('∈'))
      {
        lowerLimit = expression.require('(').resolve();
        upperLimit = expression.require(',').resolve();
        expression.require(')');
      }
    }
    else
    {
      integrand           = expression.resolve();
      integrationVariable = new VariableNode<>(expression,
                                               new VariableReference<>(dvar = expression.require(',').parseName()),
                                               expression.position,
                                               true);
      expression.require(')');
    }

    var type = type();
    assignFieldNames(type);
    computeIndefiniteIntegral(type);
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

  static String                                             integralEvaluateMethodSignature =
                                                                                            Compiler.getMethodDescriptor(Object.class,
                                                                                                                         Object.class,
                                                                                                                         int.class,
                                                                                                                         Object.class);

  FunctionMapping<C, C, Function<? extends C, ? extends C>> integralMapping;

  private String                                            intermediateValueFieldName;

  protected void evaluateIntegral(MethodVisitor mv)
  {
    invokeMethod(mv, Type.getInternalName(Function.class), "evaluate", integralEvaluateMethodSignature, true);
  }

  public MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getFieldFromThis(mv, expression.className, fieldName, type);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = resultType;
    ;
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

  private void computeIndefiniteIntegral(Class<? extends C> resultType)
  {
    integral = integrand.integrate(integrationVariable.asVariable());
    var expr = integral.toString();
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
    expression.referencedFunctionMappings.put(integralFunctionFieldName, integralMapping);
  }

  private void evaluateIndefiniteIntegralAt(MethodVisitor mv,
                                            Node<D, C, F> limit,
                                            Class<?> resultType,
                                            String integralValueFieldName)
  {
    loadIntegral(mv);
    limit.generate(mv, Real.class);
    loadBitsParameterOntoStack(mv);
    loadFieldFromThis(mv, integralValueFieldName, generatedType);
    evaluateIntegral(mv);
    checkClassCast(mv, resultType);
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(integrand);
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public Class<? extends C> type()
  {
    return expression.coDomainType;
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
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    var integral = new IntegralNode<E, S, G>(newExpression);
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
  public void accept(Consumer<Node<D, C, F>> t)
  {
    integrationVariable.accept(t);
    integrand.accept(t);
    lowerLimit.accept(t);
    upperLimit.accept(t);
    t.accept(this);
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    return integrand;
  }

  @Override
  public boolean isScalar()
  {
    return type().equals(Real.class) || type().equals(Complex.class) || type().equals(Quaternion.class);
  }

  @Override
  public char symbol()
  {
    return '∫';
  }

  @Override
  public boolean isLiteralConstant()
  {
    return integrand.isLiteralConstant() && lowerLimit.isLiteralConstant() && upperLimit.isLiteralConstant();
  }



}
