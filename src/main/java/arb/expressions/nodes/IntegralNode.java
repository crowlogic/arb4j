package arb.expressions.nodes;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.exceptions.CompilerException;
import arb.expressions.*;
import arb.expressions.nodes.binary.MultiplicationNode;
import arb.expressions.nodes.binary.SubtractionNode;
import arb.functions.Function;

/**
 * The syntax(es) to express a definite integral is<br>
 * <br>
 *
 * <pre>
 *
 * g(x)=∫x➔f(x)dx∈(a,b)
 * g(x)=∫x➔f(x)dx{a,b}
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
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class IntegralNode<D, C, F extends Function<? extends D, ? extends C>> extends
                         Node<D, C, F>
{
  @Override
  public boolean isZero()
  {
    return integrandNode == null || integrandNode.isZero();
  }

  public static final Logger         logger = LoggerFactory.getLogger(IntegralNode.class);

  public int                         bits   = 128;

  private Node<D, C, F>              definiteIntegralNode;

  String                             integrationVariableName;

  Expression<D, C, F>                indefiniteIntegralExpression;

  Node<D, C, F>                      indefiniteIntegralNode;

  Function<? extends D, ? extends C> integralFunction;

  public FunctionMapping<?, ?, ?>    integralMapping;

  Node<D, C, F>                      integrandNode;

  final VariableNode<D, C, F>        integrationVariableNode;

  Node<D, C, F>                      lowerLimitNode;

  Node<D, C, F>                      upperLimitNode;

  Expression<D, C, F>                integrandExpression;

  public IntegralNode(Expression<D, C, F> expression)
  {
    this(expression,
         false);
  }

  public IntegralNode(Expression<D, C, F> expression, boolean functionForm)
  {
    super(expression);
    if (functionForm)
    {
      integrationVariableNode = parseFunctionForm(expression);
      assert integrationVariableNode != null : "integrationVariableNode shan't be null";
    }
    else
    {
      integrationVariableNode = parseIntegralForm(expression);
      assert integrationVariableNode != null : "integrationVariableNode shan't be null";
    }
  }

  public IntegralNode(Expression<D, C, F> expression, Node<D, C, F> functionEvaluationNode, VariableNode<D, C, F> variable)
  {
    super(expression);
    assert variable != null : "variable shan't be null";
    integrandNode           = functionEvaluationNode;
    integrationVariableNode = variable;
    ensureIndefiniteIntegralNode();
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    integrationVariableNode.accept(t);
    integrandNode.accept(t);
    if (lowerLimitNode != null)
    {
      lowerLimitNode.accept(t);
    }
    if (upperLimitNode != null)
    {
      upperLimitNode.accept(t);
    }
    t.accept(this);
  }

  /**
   * Apply the sifting property of the Dirac delta function: ∫f(x)*δ(x-a)dx over
   * (-∞,∞) = f(a)
   */
  private Node<D, C, F> applyDeltaFunctionSifting()
  {
    Node<D, C, F> deltaFunction = null;
    Node<D, C, F> otherFactor   = null;
    Node<D, C, F> shiftValue    = null;

    if (integrandNode instanceof MultiplicationNode<D, C, F> multiplication)
    {
      var left  = multiplication.left;
      var right = multiplication.right;

      if (left.containsDeltaFunction())
      {
        deltaFunction = left;
        otherFactor   = right;
      }
      else if (right.containsDeltaFunction())
      {
        deltaFunction = right;
        otherFactor   = left;
      }

      if (deltaFunction != null && deltaFunction.isFunction())
      {
        var deltaFunc = deltaFunction.asFunction();
        if (deltaFunc.isDeltaFunction())
        {
          var deltaArg = deltaFunc.arg;

          if (deltaArg instanceof SubtractionNode<D, C, F> subtraction)
          {
            var left2  = subtraction.left;
            var right2 = subtraction.right;

            if (left2.isVariableNamed(integrationVariableNode.getName()))
            {
              shiftValue = right2;
            }
          }
          else if (deltaArg.isVariableNamed(integrationVariableNode.getName()))
          {
            shiftValue = zero();
          }
          else if (deltaArg instanceof SubtractionNode<D, C, F> subtraction)
          {
            var left2  = subtraction.left;
            var right2 = subtraction.right;

            if (right2.isVariableNamed(integrationVariableNode.getName()))
            {
              shiftValue = left2;
            }
          }
        }
      }
    }

    if (otherFactor != null && shiftValue != null)
    {
      var evalExpr = createEvaluationExpressionWithDeferredVariableResolution();
      var result   = otherFactor.spliceInto(evalExpr);
      result = result.substitute(integrationVariableNode.getName(), shiftValue);
      return result.spliceInto(expression).simplify();
    }

    throw new UnsupportedOperationException("Unable to apply delta function sifting property to: " + this);
  }

  protected void compileIndefiniteIntegral()
  {
    indefiniteIntegralExpression           = expression.cloneExpression();
    indefiniteIntegralExpression.className = "∫" + indefiniteIntegralExpression.className;
    indefiniteIntegralExpression.rootNode  = indefiniteIntegralNode.spliceInto(indefiniteIntegralExpression);
    indefiniteIntegralExpression.compile();
    expression.registerSubexpression(indefiniteIntegralExpression);
  }

  private void ensureIndefiniteIntegralNode()
  {
    if (indefiniteIntegralNode == null)
    {
      computeIndefiniteIntegralNode(false);
    }
  }

  private void computeIndefiniteIntegralNode(boolean compileIfNecessary)
  {
    assert integralFunction == null;
    var rawIntegral = integrandNode.integral(integrationVariableNode.asVariable()).simplify();
    if (Expression.trace && logger.isDebugEnabled())
    {
      logger.debug("computeIndefiniteIntegralNode(compileIfNecessary={}) rawIntegral={}", compileIfNecessary, rawIntegral);
    }

    indefiniteIntegralNode = rawIntegral;

    assert indefiniteIntegralNode != null : "indefiniteIntegralNode is null as returned from " + integrandNode + " of " + integrandNode.getClass();
    if (!isDefiniteIntegral() && compileIfNecessary)
    {
      compileIndefiniteIntegral();
    }
  }

  private Expression<D, C, F> createEvaluationExpressionWithDeferredVariableResolution()
  {
    Expression<D, C, F> evaluationExpression = expression.cloneExpression();
    evaluationExpression.context                 = expression.context;
    evaluationExpression.deferVariableResolution = true;

    return evaluationExpression;
  }

  @Override
  public boolean dependsOn(VariableNode<D, C, F> variable)
  {
    if (variable.getName().equals(integrationVariableName))
    {
      return false;
    }
    return integrandNode.dependsOn(variable) || (lowerLimitNode != null && lowerLimitNode.dependsOn(variable))
                  || (upperLimitNode != null && upperLimitNode.dependsOn(variable));
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    return integrandNode;
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
    boolean               a     = Objects.equals(integrandNode, other.integrandNode);
    boolean               b     = Objects.equals(integrationVariableNode, other.integrationVariableNode);
    boolean               c     = Objects.equals(lowerLimitNode, other.lowerLimitNode);
    boolean               d     = Objects.equals(upperLimitNode, other.upperLimitNode);
    return a && b && c && d;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert resultType != null : "resultType cannot be null";
    generatedType = resultType;

    ensureIndefiniteIntegralNode();

    return isDefiniteIntegral() ? generateDefiniteIntegral(mv, resultType) : generateIndefiniteIntegral(mv, resultType);
  }

  protected MethodVisitor generateDefiniteIntegral(MethodVisitor mv, Class<?> resultType)
  {
    Node<D, C, F> evaluationNode = getDefiniteIntegralEvaluationNode();
    evaluationNode.isRootNode = isRootNode;
    evaluationNode.generate(mv, resultType);
    if (!isRootNode)
    {
      fieldName = evaluationNode.fieldName;
    }
    return mv;
  }

  protected MethodVisitor generateIndefiniteIntegral(MethodVisitor mv, Class<?> resultType)
  {
    ensureIndefiniteIntegralNode();

    var splicedNode = indefiniteIntegralNode.spliceInto(expression);
    splicedNode.isRootNode = isRootNode;
    splicedNode.generate(mv, resultType);
    return mv;
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(integrandNode, indefiniteIntegralNode, integrationVariableNode);
  }

  public Node<D, C, F> getDefiniteIntegralEvaluationNode()
  {
    if (definiteIntegralNode != null)
    {
      return definiteIntegralNode;
    }

    ensureIndefiniteIntegralNode();

    var    upperExpr           = createEvaluationExpressionWithDeferredVariableResolution();
    var    lowerExpr           = createEvaluationExpressionWithDeferredVariableResolution();

    var    upperEval           = indefiniteIntegralNode.spliceInto(upperExpr);
    var    lowerEval           = indefiniteIntegralNode.spliceInto(lowerExpr);

    String integrationVariable = integrationVariableNode.getName();

    var    upperResult         = upperEval.substitute(integrationVariable, upperLimitNode).simplify();
    var    lowerResult         = lowerEval.substitute(integrationVariable, lowerLimitNode).simplify();

    var    tempResult          = upperResult.sub(lowerResult).simplify();

    definiteIntegralNode = tempResult.spliceInto(expression);
    return definiteIntegralNode.simplify();
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(integrandNode, integrationVariableNode, lowerLimitNode, upperLimitNode);
  }

  @Override
  public Node<D, C, F> integral(VariableNode<D, C, F> variable)
  {
    assert false : "TODO: implement integration of " + this + " integrandNode=" + integrandNode;
    return null;
  }

  public boolean isDefiniteIntegral()
  {
    return lowerLimitNode != null && upperLimitNode != null;
  }

  @Override
  public boolean isAtomic()
  {
    return false;
  }

  protected void parseIntegrandViaSubExpression(String arrowVar)
  {
    integrandExpression                         = expression.cloneExpression();
    integrandExpression.upstreamExpression      = expression;
    integrandExpression.functionName            = null;
    integrandExpression.independentVariable     = null;
    integrandExpression.rootNode                = null;
    integrandExpression.deferVariableResolution = true;

    if (arrowVar != null)
    {
      integrationVariableName = arrowVar;
      integrandExpression.assignInputVariable(integrandExpression.newVariableNode(arrowVar));
    }

    integrandExpression.rootNode = integrandNode = integrandExpression.resolve();

    expression.position          = integrandExpression.position;
    expression.character         = integrandExpression.character;
    expression.previousCharacter = integrandExpression.previousCharacter;
    integrandExpression.updateStringRepresentation();
  }

  protected VariableNode<D, C, F> parseFunctionForm(Expression<D, C, F> expression)
  {
    String arrowVar  = null;
    int    savedPos  = expression.position;
    char   savedChar = expression.character;

    if (expression.isIdentifierCharacter())
    {
      String maybeName = expression.parseName();
      expression.skipSpaces();
      if (expression.nextCharacterIs('➔'))
      {
        arrowVar = maybeName;
      }
      else
      {
        expression.position  = savedPos;
        expression.character = savedChar;
      }
    }

    parseIntegrandViaSubExpression(arrowVar);

    var reference = expression.require(',').parseVariableReference();
    integrationVariableName = reference.name;

    VariableNode<D, C, F> inputVariableNode = integrandExpression.newVariableNode(reference);
    var                   ivar              = integrandExpression.assignInputVariable(inputVariableNode);
    integrandNode.resolveVariables();

    if (expression.nextCharacterIs('='))
    {
      lowerLimitNode = expression.resolve();
      upperLimitNode = expression.require('…').resolve();
    }
    expression.require(')');

    return ivar;
  }

  protected VariableNode<D, C, F> parseIntegralForm(Expression<D, C, F> expression)
  {
    String arrowVar  = null;
    int    savedPos  = expression.position;
    char   savedChar = expression.character;

    if (expression.isIdentifierCharacter())
    {
      String maybeName = expression.parseName();
      expression.skipSpaces();
      if (expression.nextCharacterIs('➔'))
      {
        arrowVar = maybeName;
      }
      else
      {
        expression.position  = savedPos;
        expression.character = savedChar;
      }
    }

    parseIntegrandViaSubExpression(arrowVar);

    VariableNode<D, C, F> varNode;
    if (expression.nextCharacterIs(','))
    {
      if (expression.nextCharacterIs('d'))
      {
        varNode = parseLimitsOfIntegration(expression);
      }
      else
      {
        integrationVariableName = expression.parseName();

        integrandExpression.assignInputVariable(varNode = integrandExpression.newVariableNode(integrationVariableName));
        integrandNode.resolveVariables();

        if (expression.nextCharacterIs('='))
        {
          lowerLimitNode = expression.resolve();
          upperLimitNode = expression.require('…').resolve();
        }
      }
    }
    else if (expression.nextCharacterIs('d'))
    {
      varNode = parseLimitsOfIntegration(expression);
    }
    else
    {
      throw new CompilerException("Expected ',' or 'd' after integrand in " + expression);
    }

    return varNode;
  }

  protected VariableNode<D, C, F> parseLimitsOfIntegration(Expression<D, C, F> expression)
  {
    integrationVariableName = expression.parseName();

    var node = integrandExpression.assignInputVariable(integrandExpression.newVariableNode(integrationVariableName));
    integrandNode.resolveVariables();

    if (expression.nextCharacterIs('∈'))
    {
      lowerLimitNode = expression.require('(', '{').resolve();
      upperLimitNode = expression.require(',', '…').resolve();
      expression.require(')', '}');
    }

    return node;
  }

  @Override
  public Node<D, C, F> simplify()
  {
    if (lowerLimitNode != null && upperLimitNode != null)
    {
      boolean integralOverTheRealLine = lowerLimitNode.isNegativeInfinity() && upperLimitNode.isPositiveInfinity();
      if (integralOverTheRealLine)
      {
        if (integrandNode.isOne())
        {
          return zero().δ().mul(two().mul(π()));
        }
        if (integrandNode.containsDeltaFunction())
        {
          return applyDeltaFunctionSifting();
        }
        throw new UnsupportedOperationException("todo: handle other cases for integral over real line: " + this);
      }
    }

    if (integrationVariableNode == null)
    {
      return this;
    }

    ensureIndefiniteIntegralNode();

    if (isDefiniteIntegral())
    {
      return getDefiniteIntegralEvaluationNode();
    }
    else
    {
      return indefiniteIntegralNode.spliceInto(expression);
    }
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    var newIntegrandNode           = integrandNode.spliceInto(newExpression);
    var newIntegrationVariableNode = integrationVariableNode.spliceInto(newExpression).asVariable();
    var newIntegralNode            = new IntegralNode<E, S, G>(newExpression,
                                                               newIntegrandNode,
                                                               newIntegrationVariableNode);
    newIntegralNode.integrandNode           = newIntegrandNode;
    newIntegralNode.integrationVariableName = integrationVariableName;
    newIntegralNode.upperLimitNode          = upperLimitNode != null ? upperLimitNode.spliceInto(newExpression) : null;
    newIntegralNode.lowerLimitNode          = lowerLimitNode != null ? lowerLimitNode.spliceInto(newExpression) : null;
    return newIntegralNode;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String variable, Node<E, S, G> arg)
  {
    if (lowerLimitNode != null)
    {
      lowerLimitNode = lowerLimitNode.substitute(variable, arg);
    }
    if (upperLimitNode != null)
    {
      upperLimitNode = upperLimitNode.substitute(variable, arg);
    }

    if (!variable.equals(integrationVariableName))
    {
      integrandNode = integrandNode.substitute(variable, arg);
    }

    return this;
  }

  @Override
  public char symbol()
  {
    return '∫';
  }

  @Override
  public String toString()
  {
    return isDefiniteIntegral() ? String.format("∫%sd%s∈(%s,%s)", integrandNode.toString(), integrationVariableNode.getName(), lowerLimitNode, upperLimitNode)
                                : String.format("∫%sd%s", integrandNode.toString(), integrationVariableNode.getName());
  }

  @Override
  public Class<?> type()
  {
    if (isDefiniteIntegral())
    {
      return Compiler.scalarType(expression.coDomainType);
    }

    return expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    return lowerLimitNode == null && upperLimitNode == null ? typesetIndefiniteIntegral() : typesetDefiniteIntegral();
  }

  protected String typesetDefiniteIntegral()
  {
    return String.format("%sint_%s^%s %s %smathd %s",
                         "\\\\",
                         lowerLimitNode.typeset(),
                         upperLimitNode.typeset(),
                         integrandNode.typeset(),
                         "\\\\",
                         integrationVariableNode.typeset());
  }

  protected String typesetIndefiniteIntegral()
  {
    return String.format("%sint %s %smathd %s", "\\\\", integrandNode.typeset(), "\\\\", integrationVariableNode.typeset());
  }
}
