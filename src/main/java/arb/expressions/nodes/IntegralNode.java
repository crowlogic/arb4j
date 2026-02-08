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
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class IntegralNode<D, C, F extends Function<? extends D, ? extends C>> extends
                         Node<D, C, F>
{
  public static final Logger logger = LoggerFactory.getLogger(IntegralNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  public int                                 bits           = 128;

  private Node<D, C, F>                      definiteIntegralNode;

  String                                     integrationVariableName;

  boolean                                    fullyEvaluated = false;

  Expression<Object, Object, Function<?, ?>> indefiniteIntegralExpression;

  Node<D, C, F>                              indefiniteIntegralNode;

  Function<? extends D, ? extends C>         integralFunction;

  public FunctionMapping<?, ?, ?>            integralMapping;

  Node<D, C, F>                              integrandNode;

  VariableNode<D, C, F>                      integrationVariableNode;

  Node<D, C, F>                              lowerLimitNode;

  String                                     SYNTAXMSG      =
                                                       "the format is  g(a,b)=∫x➔f(x)dx∈{a,b} for definite integrals and "
                                                              + "g(x)=∫x➔f(x)dx for indefinate integrals, the variable on the left "
                                                              + "side of the arrow must match the variable on the right side of the d and "
                                                              + "before the ( but the first var was %s and the 2nd was %s\n";

  Node<D, C, F>                              upperLimitNode;

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
   * @return the result of applying the sifting property, which is f(a)
   */
  private Node<D, C, F> applyDeltaFunctionSifting()
  {
    Node<D, C, F> deltaFunction = null;
    Node<D, C, F> otherFactor   = null;
    Node<D, C, F> shiftValue    = null;

    if (integrandNode instanceof MultiplicationNode<D, C, F> multiplicand)
    {
      var left  = multiplicand.left;
      var right = multiplicand.right;

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
        if (deltaFunc.is("δ"))
        {
          var deltaArg = deltaFunc.arg;

          if (deltaArg instanceof SubtractionNode<D, C, F> subtrahend)
          {
            var left2  = subtrahend.left;
            var right2 = subtrahend.right;

            if (left2.isVariableNamed(integrationVariableNode.getName()))
            {
              shiftValue = right2;
            }
          }
          else if (deltaArg.isVariableNamed(integrationVariableNode.getName()))
          {
            shiftValue = zero();
          }
          else if (deltaArg instanceof SubtractionNode<D, C, F> subNode)
          {
            var left2  = subNode.left;
            var right2 = subNode.right;

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

  protected void
            assignIntegrationVariableNodeAndVariableOfIntegration(Expression<D, C, F> expression,
                                                                  VariableReference<D,
                                                                                C,
                                                                                F> reference,
                                                                  boolean resolve)
  {
    integrationVariableName = reference.name;
    integrationVariableNode = new VariableNode<>(expression,
                                                 reference,
                                                 expression.position,
                                                 resolve);
  }

  protected void compileIndefiniteIntegral()
  {
    indefiniteIntegralExpression           = expression.cloneExpression();
    indefiniteIntegralExpression.className = "∫" + indefiniteIntegralExpression.className;
    indefiniteIntegralExpression.rootNode  =
                                          indefiniteIntegralNode.spliceInto(indefiniteIntegralExpression);
    // indefiniteIntegralExpression.updateStringRepresentation();
    indefiniteIntegralExpression.compile();
    expression.registerSubexpression(indefiniteIntegralExpression);
  }

  private void computeIndefiniteIntegralNode(boolean compileIfNecessary)
  {
    assert integralFunction == null;
    indefiniteIntegralNode =
                           integrandNode.integrate(integrationVariableNode.asVariable()).simplify();
    assert indefiniteIntegralNode != null : "indefiniteIntegralNode is null as returned from "
                                            + integrandNode
                                            + " of "
                                            + integrandNode.getClass();
    // Only compile indefinite integral for indefinite integrals
    // Definite integrals use symbolic substitution only
    if (!isDefiniteIntegral() && compileIfNecessary)
    {
      compileIndefiniteIntegral();
    }
  }

  private Expression<D, C, F> createEvaluationExpression()
  {
    Expression<D, C, F> evaluationExpression = expression.cloneExpression();

    evaluationExpression.context                = expression.context;

    // Deep copy indeterminate stack by splicing each variable
    evaluationExpression.indeterminateVariables = new java.util.Stack<>();
    for (var v : expression.indeterminateVariables)
    {
      evaluationExpression.indeterminateVariables.push(v.spliceInto(evaluationExpression)
                                                        .asVariable());
    }

    return evaluationExpression;
  }

  @Override
  public boolean dependsOn(VariableNode<D, C, F> variable)
  {
    assert false : "TODO";
    return false;
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

    return isDefiniteIntegral() ? generateDefiniteIntegral(mv, resultType)
                                : generateIndefiniteIntegral(mv, resultType);

  }

  protected MethodVisitor generateDefiniteIntegral(MethodVisitor mv, Class<?> resultType)
  {
    // Use symbolic AST node for definite integral
    Node<D, C, F> evaluationNode = getDefiniteIntegralEvaluationNode();
    evaluationNode.isResult = isResult;
    evaluationNode.generate(mv, resultType);
    if (!isResult)
    {
      fieldName = evaluationNode.fieldName;
    }
    return mv;
  }

  protected MethodVisitor generateIndefiniteIntegral(MethodVisitor mv, Class<?> resultType)
  {
    indefiniteIntegralNode.isResult = isResult;
    indefiniteIntegralNode.generate(mv, resultType);
    return mv;
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(integrandNode, indefiniteIntegralNode, integrationVariableNode);
  }

  // IntegralNode.java - replace getDefiniteIntegralEvaluationNode()
  public Node<D, C, F> getDefiniteIntegralEvaluationNode()
  {
    if (definiteIntegralNode != null)
    {
      return definiteIntegralNode;
    }

    // Create TWO independent contexts with deep-copied variable stacks
    var upperExpr = createEvaluationExpression();
    var lowerExpr = createEvaluationExpression();
    if (indefiniteIntegralNode == null)
    {
      computeIndefiniteIntegralNode(false);
      compileIndefiniteIntegral();
    }
    var    upperEval           = indefiniteIntegralNode.spliceInto(upperExpr);
    var    lowerEval           = indefiniteIntegralNode.spliceInto(lowerExpr);

    String integrationVariable = integrationVariableNode.getName();

    var    upperResult         =
                       upperEval.substitute(integrationVariable, upperLimitNode).simplify();
    var    lowerResult         =
                       lowerEval.substitute(integrationVariable, lowerLimitNode).simplify();

    var    tempResult          = upperResult.sub(lowerResult).simplify();

    // Splice final result back to original expression
    definiteIntegralNode = tempResult.spliceInto(expression);
    return definiteIntegralNode.simplify();
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(integrandNode, integrationVariableNode, lowerLimitNode, upperLimitNode);
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
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

  protected void parseFunctionForm(Expression<D, C, F> expression)
  {
    // functionForm: int(f(x), x=a..b) OR int(t➔f(t), t=a..b)
    String lambdaVar = null;
    int    savedPos  = expression.position;
    char   savedChar = expression.character;

    if (expression.isIdentifierCharacter())
    {
      String maybeName = expression.parseName();
      expression.skipSpaces();
      if (expression.nextCharacterIs('➔'))
      {
        lambdaVar = maybeName;
        // Create the integration variable BEFORE parsing the body
        // This mirrors Expression.parseLambda() behavior - the variable must be
        // registered so that references in the body can find it
        parseLambda(expression, lambdaVar);
      }
      else
      {
        expression.position  = savedPos;
        expression.character = savedChar;
      }
    }

    integrandNode = expression.resolve();
    var reference = expression.require(',').parseVariableReference();

    // Only create integrationVariableNode if not already created from lambda
    if (integrationVariableNode == null)
    {
      assignIntegrationVariableNodeAndVariableOfIntegration(expression, reference, true);
    }
    else
    {
      // Validate lambda var matches the variable after comma
      if (!integrationVariableName.equals(reference.name))
      {
        throw new CompilerException(String.format(SYNTAXMSG,
                                                  integrationVariableName,
                                                  reference.name));
      }
    }

    if (expression.nextCharacterIs('='))
    {
      lowerLimitNode = expression.resolve();
      upperLimitNode = expression.require('…').resolve();
    }
    expression.require(')');

    // Final validation: if lambdaVar was set, it must match dvar
    if (lambdaVar != null && !lambdaVar.equals(integrationVariableName))
    {
      throw new CompilerException(String.format(SYNTAXMSG, lambdaVar, integrationVariableName));
    }
  }

  protected void parseIntegralForm(Expression<D, C, F> expression)
  {
    // Parse optional lambda: λ➔ or just start with integrand
    String lambdaVar = null;
    int    savedPos  = expression.position;
    char   savedChar = expression.character;

    if (expression.isIdentifierCharacter())
    {
      String maybeName = expression.parseName();
      expression.skipSpaces();
      if (expression.nextCharacterIs('➔'))
      {
        lambdaVar = maybeName;
        parseLambda(expression, lambdaVar);
      }
      else
      {
        expression.position  = savedPos;
        expression.character = savedChar;
      }
    }

    integrandNode = expression.resolve();

    // After integrand, either ',' (new syntax) or 'd' (old syntax)
    if (expression.nextCharacterIs(','))
    {
      // New syntax: int(t➔..., t=-1..1)
      // nextCharacterIs already consumed ','

      if (expression.nextCharacterIs('d'))
      {
        parseLimitsOfIntegration(expression);
      }
      else
      {
        parseIntegrationVariable(expression);
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

    // Final validation: if lambdaVar was set, it must match dvar
    if (lambdaVar != null && !lambdaVar.equals(integrationVariableName))
    {
      throw new CompilerException(String.format(SYNTAXMSG, lambdaVar, integrationVariableName));
    }
  }

  protected void parseIntegrationVariable(Expression<D, C, F> expression)
  {
    String parsedVar = expression.parseName();
    var    ref       = new VariableReference<D, C, F>(parsedVar);
    // Only create integrationVariableNode if not already created from lambda
    if (integrationVariableNode == null)
    {
      assignIntegrationVariableNodeAndVariableOfIntegration(expression, ref, false);
    }
    else
    {
      // Validate lambda var matches the variable after comma
      if (!integrationVariableName.equals(parsedVar))
      {
        throw new CompilerException(String.format(SYNTAXMSG, integrationVariableName, parsedVar));
      }
    }
  }

  protected void parseLambda(Expression<D, C, F> expression, String lambdaVar)
  {
    integrationVariableNode = new VariableNode<>(expression,
                                                 new VariableReference<>(lambdaVar,
                                                                         null,
                                                                         expression.coDomainType),
                                                 expression.position,
                                                 true);
    integrationVariableName = lambdaVar;
  }

  protected void parseLimitsOfIntegration(Expression<D, C, F> expression)
  {
    parseIntegrationVariable(expression);
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

    if (indefiniteIntegralNode == null)
    {
      computeIndefiniteIntegralNode(false);
    }

    if (indefiniteIntegralNode instanceof IntegralNode)
    {
      return this;
    }

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
    integral.integrandNode  = integrandNode.spliceInto(newExpression);
    integral.upperLimitNode = upperLimitNode != null ? upperLimitNode.spliceInto(newExpression)
                                                     : null;
    integral.lowerLimitNode = lowerLimitNode != null ? lowerLimitNode.spliceInto(newExpression)
                                                     : null;
    return integral;
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

  @Override
  public char symbol()
  {
    return '∫';
  }

  @Override
  public String toString()
  {

    if (indefiniteIntegralNode == null)
    {
      return isDefiniteIntegral() ? String.format("∫%sd%s over %s..%s",
                                                  integrandNode.toString(),
                                                  integrationVariableNode.getName(),
                                                  upperLimitNode,
                                                  lowerLimitNode)
                                  : String.format("∫%sd%s",
                                                  integrandNode.toString(),
                                                  integrationVariableNode.getName());
    }

    return isDefiniteIntegral() ? getDefiniteIntegralEvaluationNode().toString()
                                : indefiniteIntegralNode.toString();
  }

  @Override
  public Class<?> type()
  {
    // Definite integral evaluates to scalar: ∫_{a}^{b} f(x)dx → scalar value
    if (isDefiniteIntegral())
    {
      return Compiler.scalarType(expression.coDomainType);
    }

    // Indefinite integral returns function: ∫ f(x)dx → function
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
                         "\\",
                         lowerLimitNode.typeset(),
                         upperLimitNode.typeset(),
                         integrandNode.typeset(),
                         "\\",
                         integrationVariableNode.typeset());
  }

  protected String typesetIndefiniteIntegral()
  {
    return String.format("%sint %s %smathd %s",
                         "\\",
                         integrandNode.typeset(),
                         "\\",
                         integrationVariableNode.typeset());
  }

}
