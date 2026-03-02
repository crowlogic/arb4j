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

  public static final Logger logger = LoggerFactory.getLogger(IntegralNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  public int                         bits      = 128;

  private Node<D, C, F>              definiteIntegralNode;

  String                             integrationVariableName;

  Expression<D, C, F>                indefiniteIntegralExpression;

  Node<D, C, F>                      indefiniteIntegralNode;

  Function<? extends D, ? extends C> integralFunction;

  public FunctionMapping<?, ?, ?>    integralMapping;

  Node<D, C, F>                      integrandNode;

  VariableNode<D, C, F>              integrationVariableNode;

  Node<D, C, F>                      lowerLimitNode;

  String                             SYNTAXMSG =
                                               "the format is  g(a,b)=∫x➔f(x)dx∈{a,b} for definite integrals and "
                                                 + "g(x)=∫x➔f(x)dx for indefinate integrals, the variable on the left "
                                                 + "side of the arrow must match the variable on the right side of the d and "
                                                 + "before the ( but the first var was %s and the 2nd was %s\n";

  Node<D, C, F>                      upperLimitNode;

  Expression<D, C, F>                integrandSubExpression;

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
      parseFunctionForm(expression);
    }
    else
    {
      parseIntegralForm(expression);
    }
  }

  public IntegralNode(Expression<D, C, F> expression,
                      Node<D, C, F> functionEvaluationNode,
                      VariableNode<D, C, F> variable)
  {
    super(expression);
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
   *
   * This method handles integrals of the form ∫f(x)*δ(x-a)dx or ∫δ(x-a)*f(x)dx
   * over the entire real line, evaluating to f(a).
   *
   * TODO: what about symmetry? ∫f(x)*δ(x+a)dx
   *
   * @return the result of applying the sifting property, which is f(a)
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
      var result = otherFactor.spliceInto(expression);
      result = result.substitute(integrationVariableNode.getName(), shiftValue);
      return result.simplify();
    }

    throw new UnsupportedOperationException("Unable to apply delta function sifting property to: "
                                            + this);
  }

  protected void compileIndefiniteIntegral()
  {
    indefiniteIntegralExpression           = expression.cloneExpression();
    indefiniteIntegralExpression.className = "∫" + indefiniteIntegralExpression.className;
    indefiniteIntegralExpression.rootNode  =
                                          indefiniteIntegralNode.spliceInto(indefiniteIntegralExpression);
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
    var rawIntegral = integrandNode.integral(integrationVariableNode.asVariable());
    if (Expression.trace && logger.isDebugEnabled())
    {
      logger.debug("computeIndefiniteIntegralNode(compileIfNecessary={}) rawIntegral={}",
                   compileIfNecessary,
                   rawIntegral);
    }

    indefiniteIntegralNode = rawIntegral;

    assert indefiniteIntegralNode != null : "indefiniteIntegralNode is null as returned from "
                                            + integrandNode
                                            + " of "
                                            + integrandNode.getClass();
    if (!isDefiniteIntegral() && compileIfNecessary)
    {
      compileIndefiniteIntegral();
    }
  }

  private Expression<D, C, F> createEvaluationExpression()
  {
    Expression<D, C, F> evaluationExpression = expression.cloneExpression();

    evaluationExpression.context = expression.context;

    evaluationExpression.clearIndeterminateVariables();
    for (var v : expression.getIndeterminateVariables())
    {
      evaluationExpression.pushIndeterminateVariable(v.spliceInto(evaluationExpression)
                                                      .asVariable());
    }

    return evaluationExpression;
  }

  @Override
  public boolean dependsOn(VariableNode<D, C, F> variable)
  {
    if (variable.getName().equals(integrationVariableName))
    {
      return false;
    }
    return integrandNode.dependsOn(variable)
                  || (lowerLimitNode != null && lowerLimitNode.dependsOn(variable))
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
    boolean               b     =
                            Objects.equals(integrationVariableNode, other.integrationVariableNode);
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

    return isDefiniteIntegral() ? generateDefiniteIntegral(mv, resultType)
                                : generateIndefiniteIntegral(mv, resultType);
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

    indefiniteIntegralNode.isRootNode = isRootNode;
    indefiniteIntegralNode.generate(mv, resultType);
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

    var    upperExpr           = createEvaluationExpression();
    var    lowerExpr           = createEvaluationExpression();

    var    upperEval           = indefiniteIntegralNode.spliceInto(upperExpr);
    var    lowerEval           = indefiniteIntegralNode.spliceInto(lowerExpr);

    String integrationVariable = integrationVariableNode.getName();

    var    upperResult         =
                       upperEval.substitute(integrationVariable, upperLimitNode).simplify();
    var    lowerResult         =
                       lowerEval.substitute(integrationVariable, lowerLimitNode).simplify();

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
  public boolean isLeaf()
  {
    return false;
  }

  /**
   * Parses the integrand by creating a properly-scoped sub-expression, following
   * the same pattern established by {@link Expression#parseLambda(String)}.
   * <p>
   * The integration variable is always determined by the sub-expression's parsing:
   * either pre-registered via arrow syntax or auto-assigned as the first
   * unresolved variable during normal parsing. After this method returns,
   * {@link #integrationVariableNode} and {@link #integrationVariableName} are set
   * from the sub-expression's independent variable.
   * </p>
   *
   * @param expression   the parent expression whose parser state drives
   *                     tokenization
   * @param arrowVar     the integration variable name from arrow syntax, or
   *                     {@code null} if the variable was not explicitly specified
   */
  protected void parseIntegrandViaSubExpression(Expression<D, C, F> expression,
                                                String arrowVar)
  {
    integrandSubExpression = expression.cloneExpression();

    integrandSubExpression.upstream = expression;

    integrandSubExpression.independentVariable = null;

    integrandSubExpression.clearIndeterminateVariables();

    integrandSubExpression.rootNode = null;

    if (arrowVar != null)
    {
      integrandSubExpression.newVariableNode(arrowVar);
    }

    integrandNode = integrandSubExpression.resolve();

    assert integrandSubExpression.independentVariable != null
      : "integrand sub-expression has no independent variable; "
        + "the integrand must contain at least one free variable to integrate over";

    integrationVariableNode = integrandSubExpression.independentVariable;
    integrationVariableName = integrationVariableNode.getName();

    expression.position          = integrandSubExpression.position;
    expression.character         = integrandSubExpression.character;
    expression.previousCharacter = integrandSubExpression.previousCharacter;
  }

  /**
   * Asserts that the variable name parsed from the {@code d<var>} or {@code ,<var>}
   * portion of the integral syntax matches the integration variable that was
   * determined during integrand parsing in the sub-expression.
   *
   * @param parsedVar the variable name parsed from {@code dx}, {@code ,x}, etc.
   */
  protected void assertIntegrationVariableConsistency(String parsedVar)
  {
    assert integrationVariableName.equals(parsedVar)
      : "integration variable from d/comma specification '"
        + parsedVar
        + "' does not match the integrand's independent variable '"
        + integrationVariableName
        + "'";
  }

  protected void parseFunctionForm(Expression<D, C, F> expression)
  {
    String arrowVar = null;
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

    parseIntegrandViaSubExpression(expression, arrowVar);

    var reference = expression.require(',').parseVariableReference();
    assertIntegrationVariableConsistency(reference.name);

    if (expression.nextCharacterIs('='))
    {
      lowerLimitNode = expression.resolve();
      upperLimitNode = expression.require('…').resolve();
    }
    expression.require(')');
  }

  protected void parseIntegralForm(Expression<D, C, F> expression)
  {
    String arrowVar = null;
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

    parseIntegrandViaSubExpression(expression, arrowVar);

    if (expression.nextCharacterIs(','))
    {
      if (expression.nextCharacterIs('d'))
      {
        parseLimitsOfIntegration(expression);
      }
      else
      {
        parseAndAssertIntegrationVariable(expression);
        if (expression.nextCharacterIs('='))
        {
          lowerLimitNode = expression.resolve();
          upperLimitNode = expression.require('…').resolve();
        }
      }
    }
    else if (expression.nextCharacterIs('d'))
    {
      parseLimitsOfIntegration(expression);
    }
    else
    {
      throw new CompilerException("Expected ',' or 'd' after integrand in " + expression);
    }
  }

  protected void parseAndAssertIntegrationVariable(Expression<D, C, F> expression)
  {
    String parsedVar = expression.parseName();
    assertIntegrationVariableConsistency(parsedVar);
  }

  protected void parseLimitsOfIntegration(Expression<D, C, F> expression)
  {
    parseAndAssertIntegrationVariable(expression);
    if (expression.nextCharacterIs('∈'))
    {
      lowerLimitNode = expression.require('(', '{').resolve();
      upperLimitNode = expression.require(',', '…').resolve();
      expression.require(')', '}');
    }
  }

  @Override
  public Node<D, C, F> simplify()
  {
    if (lowerLimitNode != null && upperLimitNode != null)
    {
      boolean integralOverTheRealLine = lowerLimitNode.isNegativeInfinity()
                    && upperLimitNode.isPositiveInfinity();
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
        throw new UnsupportedOperationException("todo: handle other cases for integral over real line: "
                                                + this);
      }
    }

    ensureIndefiniteIntegralNode();

    if (isDefiniteIntegral())
    {
      return getDefiniteIntegralEvaluationNode();
    }
    else
    {
      return indefiniteIntegralNode;
    }
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    var newIntegralNode            = integrandNode.spliceInto(newExpression);
    var newIntegrationVariableNode = integrationVariableNode.spliceInto(newExpression).asVariable();
    var integral                   = new IntegralNode<E, S, G>(newExpression,
                                                               newIntegralNode,
                                                               newIntegrationVariableNode);
    integral.integrandNode           = integrandNode.spliceInto(newExpression);
    integral.integrationVariableName = integrationVariableName;
    integral.upperLimitNode          =
                            upperLimitNode != null ? upperLimitNode.spliceInto(newExpression)
                                                   : null;
    integral.lowerLimitNode          =
                            lowerLimitNode != null ? lowerLimitNode.spliceInto(newExpression)
                                                   : null;
    return integral;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String variable, Node<E, S, G> arg)
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
    return isDefiniteIntegral() ? String.format("∫%sd%s∈(%s,%s)",
                                                integrandNode.toString(),
                                                integrationVariableNode.getName(),
                                                lowerLimitNode,
                                                upperLimitNode)
                                : String.format("∫%sd%s",
                                                integrandNode.toString(),
                                                integrationVariableNode.getName());
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
    return lowerLimitNode == null && upperLimitNode == null ? typesetIndefiniteIntegral()
                                                            : typesetDefiniteIntegral();
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
    return String.format("%sint %s %smathd %s",
                         "\\\\",
                         integrandNode.typeset(),
                         "\\\\",
                         integrationVariableNode.typeset());
  }
}
