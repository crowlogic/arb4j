package arb.expressions.nodes;

import static arb.expressions.Compiler.*;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.*;
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
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String variable, Node<E, S, G> arg)
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

  String                          SYNTAXMSG =
                                            "the format is  g(x)=∫x➔f(x)dx∈(a,b) for definite integrals and "
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
      assert dvar.equals(integrationVariableNode.getName()) : String.format(SYNTAXMSG,
                                                                            integrationVariableNode,
                                                                            dvar);

      if (expression.nextCharacterIs('∈'))
      {
        lowerLimitNode = expression.require('(').resolve();
        upperLimitNode = expression.require(',', '…').resolve();
        expression.require(')');
      }
    }
    else
    {
      integrandNode = expression.resolve();
      dvar          = expression.require(',').parseName();
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

    assignFieldNames(type());
  }

  public IntegralNode(Expression<D, C, F> expression,
                      Node<D, C, F> functionEvaluationNode,
                      VariableNode<D, C, F> variable)
  {
    super(expression);
    integrandNode           = functionEvaluationNode;
    integrationVariableNode = variable;
  }

  protected void assignFieldNames(Class<?> resultType)
  {
    integralFunctionFieldName   = expression.getNextIntermediateVariableFieldName("integral",
                                                                                  resultType);
    lowerIntegralValueFieldName = expression.newIntermediateVariable("lowerValue", resultType);
    upperIntegralValueFieldName = expression.newIntermediateVariable("upperValue", resultType);
  }

  void loadIntegral(MethodVisitor mv)
  {
    Compiler.getFieldFromThis(mv,
                              expression.className,
                              integralFunctionFieldName,
                              String.format("L%s;", integralExpression.className));

  }

  static String integralEvaluateMethodSignature = Compiler.getMethodDescriptor(Object.class,
                                                                               Object.class,
                                                                               int.class,
                                                                               Object.class);

  protected void evaluateIntegral(MethodVisitor mv)
  {
    invokeMethod(mv,
                 Type.getInternalName(Function.class),
                 "evaluate",
                 integralEvaluateMethodSignature,
                 true);
  }

  @Override
  public String toString()
  {
    if (integralNode == null)
    {
      return "null";
    }

    return isDefiniteIntegral() ? getDefiniteIntegralEvaluationNode().toString()
                                : integralNode.toString();
  }

  public boolean isDefiniteIntegral()
  {
    return lowerLimitNode != null && upperLimitNode != null;
  }

  boolean useNewMethod = "true".equals(System.getProperty("arb4j.useNewIntegralMethod", "false"));

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = resultType;

    if (integralNode == null)
    {
      computeIndefiniteIntegral();
    }
    if (!isDefiniteIntegral())
    {
      expression.merge(integralNode);
      integralNode.generate(mv, resultType);
    }
    else
    {
      if (useNewMethod)
      {
        var difference = getDefiniteIntegralEvaluationNode();
        difference.isResult = isResult;
        difference.generate(mv, resultType);
      }
      else
      {
        generateDefiniteIntegralTheOldWay(mv, resultType);
      }
    }
    return mv;
  }

  public void generateDefiniteIntegralTheOldWay(MethodVisitor mv, Class<?> resultType)
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

  public Node<D, C, F> getDefiniteIntegralEvaluationNode()
  {
    var integralExpression      = expression;
    var upperEval               = integralNode.spliceInto(integralExpression);
    var lowerEval               = integralNode.spliceInto(integralExpression);
    var independentVariableNode = expression.getIndependentVariable();
    if (independentVariableNode != null)
    {
      integrationVariableNode.renameTo(independentVariableNode.getName());
    }
    String        integrationVariable = integrationVariableNode.getName();

    var           upperResult         = upperEval.substitute(integrationVariable, upperLimitNode);
    var           lowerResult         = lowerEval.substitute(integrationVariable, lowerLimitNode);

    Node<D, C, F> difference          = upperResult.sub(lowerResult);

    return difference;
  }

  @SuppressWarnings("unchecked")
  private void computeIndefiniteIntegral()
  {
    assert integralFunction == null;
    integralNode                            = (Node<Object,
                  Object,
                  Function<?, ?>>) integrandNode.integrate(integrationVariableNode.asVariable());

    integralExpression                      = integralNode.expression.cloneExpression();
    integralExpression.instructionByteCodes = null;
    integralExpression.compiledClass        = null;
    integralExpression.domainType           = integralNode.type();
    integralExpression.coDomainType         = integralNode.type();
    integralExpression.rootNode             = integralNode.spliceInto(integralExpression);
    integralExpression.className            =
                                 Parser.transformToJavaAcceptableCharacters(integralFunctionFieldName);
    integralExpression.updateStringRepresentation();
    integralExpression.compile();

    integralMapping = expression.context.registerFunctionMapping(integralExpression.className,
                                                                 integralExpression.instantiate(),
                                                                 integralExpression.domainType,
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
    return lowerLimitNode == null
                  && upperLimitNode == null
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
    var integral = new IntegralNode<E, S, G>(newExpression,
                                             integrandNode.spliceInto(newExpression),
                                             integrationVariableNode.spliceInto(newExpression)
                                                                    .asVariable());
    integral.integralFunctionFieldName   = integralFunctionFieldName;
    integral.lowerIntegralValueFieldName = lowerIntegralValueFieldName;
    integral.upperIntegralValueFieldName = upperIntegralValueFieldName;
    integral.integrandNode               = spliceInto(newExpression);
    integral.upperLimitNode              = upperLimitNode.spliceInto(newExpression);
    integral.lowerLimitNode              = lowerLimitNode.spliceInto(newExpression);
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
    return type().equals(Real.class) || type().equals(Complex.class)
                  || type().equals(Quaternion.class);
  }

  @Override
  public char symbol()
  {
    return '∫';
  }

}
