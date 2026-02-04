package arb.expressions.nodes;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.*;
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

  public int                                 bits           = 128;

  private Node<D, C, F>                      definiteIntegralNode;

  String                                     dvar;

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
    if (!functionForm)
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
          // nextCharacterIs already consumed '➔'
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
          // nextCharacterIs already consumed 'd'
          dvar                    = expression.parseName();
          integrationVariableNode = new VariableNode<>(expression,
                                                       new VariableReference<>(dvar),
                                                       expression.position,
                                                       false);
          if (expression.nextCharacterIs('∈'))
          {
            lowerLimitNode = expression.require('(', '{').resolve();
            upperLimitNode = expression.require(',', '…').resolve();
            expression.require(')', '}');
          }
        }
        else
        {
          dvar                    = expression.parseName();
          integrationVariableNode = new VariableNode<>(expression,
                                                       new VariableReference<>(dvar),
                                                       expression.position,
                                                       false);
          if (expression.nextCharacterIs('='))
          {
            lowerLimitNode = expression.resolve();
            upperLimitNode = expression.require('…').resolve();
          }
        }
      }
      else if (expression.nextCharacterIs('d'))
      {
        // Old syntax: ∫λ➔...dλ or ∫λ➔...dλ∈(a,b)
        // nextCharacterIs already consumed 'd'
        dvar                    = expression.parseName();
        integrationVariableNode = new VariableNode<>(expression,
                                                     new VariableReference<>(dvar),
                                                     expression.position,
                                                     false);

        if (expression.nextCharacterIs('∈'))
        {
          lowerLimitNode = expression.require('(', '{').resolve();
          upperLimitNode = expression.require(',', '…').resolve();
          expression.require(')', '}');
        }
      }
      else
      {
        throw new CompilerException("Expected ',' or 'd' after integrand in " + expression);
      }

      // Validate arrow var matches d-var
      if (lambdaVar != null && !lambdaVar.equals(dvar))
      {
        throw new CompilerException(String.format(SYNTAXMSG, lambdaVar, dvar));
      }
    }
    else
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
          // nextCharacterIs already consumed '➔'
        }
        else
        {
          expression.position  = savedPos;
          expression.character = savedChar;
        }
      }

      integrandNode = expression.resolve();
      var reference = expression.require(',').parseVariableReference();
      dvar                    = reference.name;
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

      // Validate arrow var matches d-var
      if (lambdaVar != null && !lambdaVar.equals(dvar))
      {
        throw new CompilerException(String.format(SYNTAXMSG, lambdaVar, dvar));
      }
    }
  }

  public IntegralNode(Expression<D, C, F> expression,
                      Node<D, C, F> functionEvaluationNode,
                      VariableNode<D, C, F> variable)
  {
    super(expression);
    integrandNode           = functionEvaluationNode;
    integrationVariableNode = variable;
    computeIndefiniteIntegral(true);
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    integrationVariableNode.accept(t);
    integrandNode.accept(t);
    if (lowerLimitNode != null)
      lowerLimitNode.accept(t);
    if (upperLimitNode != null)
      upperLimitNode.accept(t);
    t.accept(this);
  }

  protected void compileIndefiniteIntegral()
  {
    indefiniteIntegralExpression           = expression.cloneExpression();
    indefiniteIntegralExpression.className = "integrated_" + indefiniteIntegralExpression.className;
    indefiniteIntegralExpression.rootNode  =
                                          indefiniteIntegralNode.spliceInto(indefiniteIntegralExpression);
    indefiniteIntegralExpression.updateStringRepresentation();
    indefiniteIntegralExpression.compile();
    expression.registerSubexpression(indefiniteIntegralExpression);
  }

  private void computeIndefiniteIntegral(boolean compileIfNecessary)
  {
    assert integralFunction == null;
    indefiniteIntegralNode = integrandNode.integrate(integrationVariableNode.asVariable());

    // Only compile indefinite integral for indefinite integrals
    // Definite integrals use symbolic substitution only
    if (!isDefiniteIntegral() && compileIfNecessary)
    {
      compileIndefiniteIntegral();
    }
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

// IntegralNode.java  
// Replace ENTIRE getDefiniteIntegralEvaluationNode()
  public Node<D, C, F> getDefiniteIntegralEvaluationNode()
  {
    if (definiteIntegralNode != null)
    {
      return definiteIntegralNode;
    }

    // Temp clone isolates intermediates/clones from outer expression
    Expression<D, C, F> evalExpr = expression.cloneExpression();
    evalExpr.rootNode = indefiniteIntegralNode.spliceInto(evalExpr);
    evalExpr.updateStringRepresentation();

    var    upperEval           = indefiniteIntegralNode.spliceInto(evalExpr);
    var    lowerEval           = indefiniteIntegralNode.spliceInto(evalExpr);
    String integrationVariable = integrationVariableNode.getName();

    var    upperResult         =
                       upperEval.substitute(integrationVariable, upperLimitNode).simplify();
    var    lowerResult         =
                       lowerEval.substitute(integrationVariable, lowerLimitNode).simplify();

    var    tempResult          = upperResult.sub(lowerResult).simplify();

    // Splice ONLY final AST (no intermediates) back to outer
    definiteIntegralNode = tempResult.spliceInto(expression);
    return definiteIntegralNode;
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

  @Override
  public boolean isScalar()
  {
    return type().equals(Real.class) || type().equals(Complex.class)
                  || type().equals(Quaternion.class);
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
      computeIndefiniteIntegral(false);
    }
    indefiniteIntegralNode = indefiniteIntegralNode.simplify();

    if (isDefiniteIntegral())
    {
      return getDefiniteIntegralEvaluationNode();
    }
    else
    {
      return indefiniteIntegralNode;
    }

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

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    var integral = new IntegralNode<E, S, G>(newExpression,
                                             integrandNode.spliceInto(newExpression),
                                             integrationVariableNode.spliceInto(newExpression)
                                                                    .asVariable());
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

}
