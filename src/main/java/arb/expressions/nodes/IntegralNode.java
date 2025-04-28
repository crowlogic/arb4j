package arb.expressions.nodes;

import static arb.expressions.Compiler.cast;
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
import arb.expressions.Parser;
import arb.expressions.VariableReference;
import arb.functions.Function;

/**
 * The syntax to express a definite integral is<br>
 * <br>
 * 
 * <pre>
 * 
 * g(x)=∫x➔f(x)dx∈(a,b)
 * 
 * </pre>
 * 
 * and the syntax to express an indefinite integral is<br>
 * <br>
 * 
 * <pre>
 * 
 * g(x)=∫x➔f(x)dx
 *
 * which is just as the definite case but with the limits of the integration interval specification ∈(a,b) is omitted
 * </pre>
 * 
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
    return Objects.hash(integrandNode, integrationVariableNode, lowerLimitNode, upperLimitNode);
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
    return Objects.equals(integrandNode, other.integrandNode)
                  && Objects.equals(integrationVariableNode, other.integrationVariableNode)
                  && Objects.equals(lowerLimitNode, other.lowerLimitNode)
                  && Objects.equals(upperLimitNode, other.upperLimitNode);
  }

  @Override
  public Node<D, C, F> simplify()
  {
    if (integralNode == null)
    {
      computeIndefiniteIntegral();
    }
    integralNode = integralNode.simplify();
    return this;
  }

  @Override
  public String toString()
  {
    return integralNode != null ? integralNode.toString() : "null";
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String variable,
                                                                                       Node<E, S, G> arg)
  {
    integrandNode           = integrandNode.substitute(variable, arg);
    lowerLimitNode          = lowerLimitNode.substitute(variable, arg);
    upperLimitNode          = upperLimitNode.substitute(variable, arg);
    integrationVariableNode = integrationVariableNode.substitute(variable, arg).asVariable();
    return this;
  }

  public int                                 bits = 128;

  Node<D, C, F>                              integrandNode;

  Node<D, C, F>                              lowerLimitNode;

  Node<D, C, F>                              upperLimitNode;

  VariableNode<D, C, F>                      integrationVariableNode;

  Function<? extends D, ? extends C>         integralFunction;

  String                                     integralFunctionFieldName;

  String                                     lowerIntegralValueFieldName;

  String                                     dvar;

  Expression<Object, Object, Function<?, ?>> integralExpression;

  Node<Object, Object, Function<?, ?>>       integralNode;

  String                                     upperIntegralValueFieldName;

  public IntegralNode(Expression<D, C, F> expression)
  {
    this(expression,
         false);
  }

  String                          SYNTAXMSG = "the format is  g(x)=∫x➔f(x)dx∈(a,b) for definite integrals and "
                                              + "g(x)=∫x➔f(x)dx for indefinate integrals, the variable on the left "
                                              + "side of the arrow must match the variable on the right side of the d and "
                                              + "before the ( but the first var was %s and the 2nd was %s\n";

  public FunctionMapping<?, ?, ?> integralMapping;

  public IntegralNode(Expression<D, C, F> expression, boolean functionForm)
  {
    super(expression);
    if (!functionForm)
    {
      integrationVariableNode = new VariableNode<>(expression,
                                                   new VariableReference<>(expression.parseName()),
                                                   expression.position,
                                                   true);
      integrandNode           = expression.require('➔').resolve();
      dvar                    = expression.require('d').parseName();
      assert dvar.equals(integrationVariableNode.getName()) : String.format(SYNTAXMSG, integrationVariableNode, dvar);

      if (expression.nextCharacterIs('∈'))
      {
        lowerLimitNode = expression.require('(').resolve();
        upperLimitNode = expression.require(',','…').resolve();
        expression.require(')');
      }
    }
    else
    {
      integrandNode = expression.resolve();
      dvar = expression.require(',').parseName();
      var reference = new VariableReference<D, C, F>(dvar);
      integrationVariableNode = new VariableNode<>(expression,
                                                   reference,
                                                   expression.position,
                                                   true);
      if (expression.nextCharacterIs('='))
      {
        lowerLimitNode = expression.resolve();
        upperLimitNode = expression.require('…').resolve();
      }
      expression.require(')');
    }

    var type = type();
    assignFieldNames(type);
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
                              "L" + integralExpression.className + ";");
  }

  static String integralEvaluateMethodSignature = Compiler.getMethodDescriptor(Object.class,
                                                                               Object.class,
                                                                               int.class,
                                                                               Object.class);

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

    if (integralNode == null)
    {
      computeIndefiniteIntegral();
    }
    if (upperLimitNode == null && lowerLimitNode == null)
    {
      expression.initializers.addAll(integralNode.expression.initializers);
      expression.context.mergeFrom(integralNode.expression.context);
      integralNode.generate(mv, resultType);
    }
    else
    {
      evaluateIndefiniteIntegralAt(mv, upperLimitNode, resultType, lowerIntegralValueFieldName);
      evaluateIndefiniteIntegralAt(mv, lowerLimitNode, resultType, upperIntegralValueFieldName);
      loadBitsParameterOntoStack(mv);
      if (isResult)
      {
        Compiler.cast(Compiler.loadResultParameter(mv), resultType);
      }
      else
      {
        fieldName = expression.allocateIntermediateVariable(mv, "integralDifference", resultType);
      }
      Compiler.invokeBinaryOperationMethod(mv, "sub", resultType, resultType, resultType);
    }
    return mv;
  }

  /**
   * 
   */
  private void computeIndefiniteIntegral()
  {
    assert integralFunction == null;
    integralNode = (Node<Object, Object, Function<?, ?>>) integrandNode.integrate(integrationVariableNode.asVariable());

    integralExpression                      = integralNode.expression.cloneExpression();
    integralExpression.instructionByteCodes = null;
    integralExpression.compiledClass        = null;
    integralExpression.coDomainType         = integralNode.type();
    integralExpression.rootNode             = integralNode.spliceInto(integralExpression);
    integralExpression.className            = Parser.transformToJavaAcceptableCharacters(integralFunctionFieldName);
    integralExpression.updateStringRepresentation();
    integralExpression.compile();

    integralMapping =
                    expression.context.registerFunctionMapping(integralExpression.className,
                                                               integralExpression.instantiate(),
                                                               integralExpression.domainType
                                                                             != Object.class ? integralExpression.domainType
                                                                                             : integralExpression.coDomainType,
                                                               integralExpression.coDomainType,
                                                               Function.class,
                                                               false,
                                                               integralExpression,
                                                               null);
    expression.referencedFunctions.put(integralFunctionFieldName, integralMapping);
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
    cast(mv, resultType);
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(integrandNode);
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
    return lowerLimitNode == null && upperLimitNode == null
                                                            ? String.format("%sint %s %smathd %s",
                                                                            "\\",
                                                                            integrandNode.typeset(),
                                                                            "\\",
                                                                            integrationVariableNode.typeset())
                                                            : String.format("%sint_%s^%s %s %smathd %s",
                                                                            "\\",
                                                                            lowerLimitNode.typeset(),
                                                                            upperLimitNode.typeset(),
                                                                            integrandNode.typeset(),
                                                                            "\\",
                                                                            integrationVariableNode.typeset());
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
    integral.integrandNode               = integrandNode.spliceInto(newExpression);
    integral.upperLimitNode              = integral.upperLimitNode;
    integral.lowerLimitNode              = integral.lowerLimitNode;
    integral.integrationVariableNode     = integral.integrationVariableNode;
    return integral;
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    integrationVariableNode.accept(t);
    integrandNode.accept(t);
    lowerLimitNode.accept(t);
    upperLimitNode.accept(t);
    t.accept(this);
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    return integrandNode;
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
    return integrandNode.isLiteralConstant() && lowerLimitNode.isLiteralConstant()
                  && upperLimitNode.isLiteralConstant();
  }

}
