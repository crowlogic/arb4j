package arb.expressions.nodes.binary;

import static arb.expressions.nodes.binary.Integration.*;
import static java.lang.String.format;

import java.util.ArrayList;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Polynomial;
import arb.Quaternion;
import arb.exceptions.CompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.expressions.nodes.unary.FunctionNode;
import arb.expressions.nodes.unary.FunctionalEvaluationNode;
import arb.functions.Function;

/**
 * Represents a multiplication operation node in the expression tree. Implements
 * integration by parts for polynomial × exp/trig products.
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MultiplicationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{
  public static final Logger logger = LoggerFactory.getLogger(MultiplicationNode.class);

  /**
   * Đ^(α)(c*f) = c * Đ^(α)(f) when c is constant w.r.t. the differentiation
   * variable. Đ^(α)(f*c) = c * Đ^(α)(f) when c is constant w.r.t. the
   * differentiation variable.
   * 
   * Otherwise falls back to the default integral form.
   */
  @Override
  public Node<D, R, F> fractionalDerivative(VariableNode<D, R, F> variable, Node<D, R, F> α)
  {
    VariableNode<D, R, F> diffVar = variable;

    if (diffVar != null)
    {
      if (!left.dependsOn(diffVar))
      {
        return left.mul(right.fractionalDerivative(null, α));
      }
      if (!right.dependsOn(diffVar))
      {
        return right.mul(left.fractionalDerivative(null, α));
      }
    }
    return super.fractionalDerivative(variable, α);
  }

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  @Override
  public boolean isZero()
  {
    return left.isZero() || right.isZero();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    return super.generate(mv, resultType);
  }

  public MultiplicationNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "mul",
          right,
          "*");
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    var a   = left.differentiate(variable).mul(right);
    var b   = right.differentiate(variable).mul(left);
    var sum = a.add(b);
    return sum;
  }

  /**
   * Integrates a product. Handles the following cases in order:
   * <ol>
   * <li>Product simplifies to zero — return zero.</li>
   * <li>Constant factors — pull out: ∫ c·f(t) dt = c · ∫ f(t) dt</li>
   * <li>One factor is a {@link Polynomial}-typed function application f(t) — wrap
   * the remaining factors as the cofactor in a {@link PolynomialIntegralNode},
   * which multiplies f(t) by the cofactor at the polynomial level and integrates
   * the resulting polynomial analytically.</li>
   * <li>Step function θ(x) — ∫ f(x)·θ(x) dx = θ(x)·∫ f(x) dx</li>
   * <li>Integration by parts (tabular for polynomial×transcendental, single-step
   * for LIATE log cases).</li>
   * </ol>
   *
   * @param variable The variable of integration
   * @return The integrated expression
   */
  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    Node<D, R, F> simplified = this.simplify();
    if (simplified.isZero())
    {
      return simplified;
    }
    if (!simplified.equals(this))
    {
      return simplified.integral(variable);
    }

    var factors = new ArrayList<Node<D, R, F>>();
    collectFactors(this, factors);

    var constantFactors = new ArrayList<Node<D, R, F>>();
    var variableFactors = new ArrayList<Node<D, R, F>>();
    for (var factor : factors)
    {
      if (factor.isScalar() && !factor.dependsOn(variable))
      {
        constantFactors.add(factor);
      }
      else
      {
        variableFactors.add(factor);
      }
    }

    if (!constantFactors.isEmpty() && !variableFactors.isEmpty())
    {
      var constantProduct = buildProduct(constantFactors);
      var variableProduct = buildProduct(variableFactors);
      return constantProduct.mul(variableProduct.integral(variable)).simplify();
    }

    FunctionalEvaluationNode<D, R, F> polyFactor   = null;
    var                               cofactorList = new ArrayList<Node<D, R, F>>();
    for (var f : variableFactors)
    {
      if (polyFactor == null && f instanceof FunctionalEvaluationNode<D, R, F> fe
                    && Polynomial.class.isAssignableFrom(fe.getFunctionNode().type())
                    && fe.arg.equals(variable))
      {
        polyFactor = fe;
      }
      else
      {
        cofactorList.add(f);
      }
    }
    if (polyFactor != null)
    {
      var cofactor = cofactorList.isEmpty() ? null : buildProduct(cofactorList);
      return new PolynomialIntegralNode<>(expression,
                                          polyFactor.getFunctionNode(),
                                          cofactor,
                                          variable);
    }

    var stepResult = integrateStepFunction(variableFactors, variable);
    if (stepResult != null)
    {
      return stepResult.simplify();
    }

    var ibpResult = integrateByParts(variableFactors, variable);
    if (ibpResult != null)
    {
      Node<D, R, F> simplifiedIbpResult = ibpResult.simplify();
      assert simplifiedIbpResult != null : "simplifiedIbpResult is null for " + this;
      return simplifiedIbpResult;
    }

    throw new CompilerException(String.format("TODO: support for integration of %s where %s is a %s-valued %s and %s is a %s-valued %s in %s",
                                              this,
                                              left,
                                              left.type().getSimpleName(),
                                              left.getClass().getSimpleName(),
                                              right,
                                              right.type().getSimpleName(),
                                              right.getClass().getSimpleName(),
                                              expression));
  }

  /**
   * @return true if {@link Expression#coDomainType} is not a {@link Quaternion}
   */
  @Override
  public boolean isCommutative()
  {
    return !expression.coDomainType.equals(Quaternion.class);
  }

  @Override
  public Node<D, R, F> simplify()
  {
    simplifyDepth++;
    if (traceSimplify)
    {
      System.err.printf("%s[%d] ENTER MultiplicationNode.simplify() this=%s left=%s right=%s%n",
                        depthIndent(),
                        simplifyDepth,
                        System.identityHashCode(this),
                        left,
                        right);
    }

    if (left != null)
    {
      var oldLeft = left;
      left = left.simplify();
      if (traceSimplify && left != oldLeft)
      {
        System.err.printf("%s[%d]   left changed: %s -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          oldLeft,
                          left);
      }
    }
    if (right != null)
    {
      var oldRight = right;
      right = right.simplify();
      if (traceSimplify && right != oldRight)
      {
        System.err.printf("%s[%d]   right changed: %s -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          oldRight,
                          right);
      }
    }

    var folded = foldConstants();
    if (folded != null)
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   constant fold -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          folded);
      }
      simplifyDepth--;
      return folded;
    }

    if (left.isZero() || right.isZero())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   -> returning zero()%n", depthIndent(), simplifyDepth);
      }
      simplifyDepth--;
      return zero();
    }

    if (left.isOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   left.isOne() -> returning right=%s%n",
                          depthIndent(),
                          simplifyDepth,
                          right);
      }
      simplifyDepth--;
      return right;
    }
    if (right.isOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   right.isOne() -> returning left=%s%n",
                          depthIndent(),
                          simplifyDepth,
                          left);
      }
      simplifyDepth--;
      return left;
    }
    if (left.isNegOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   left.isNegOne() -> returning right.neg()%n",
                          depthIndent(),
                          simplifyDepth);
      }
      simplifyDepth--;
      return right.neg();
    }
    if (right.isNegOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   right.isNegOne() -> returning left.neg()%n",
                          depthIndent(),
                          simplifyDepth);
      }
      simplifyDepth--;
      return left.neg();
    }

    var deltaSimplification = simplifyDeltaMultiplication();
    if (deltaSimplification != null)
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   delta simplification -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          deltaSimplification);
      }
      simplifyDepth--;
      return deltaSimplification;
    }

    if (left instanceof ExponentiationNode<D, R, F> leftExp
                  && right instanceof ExponentiationNode<D, R, F> rightExp)
    {
      var leftBase  = leftExp.left;
      var rightBase = rightExp.left;
      if (leftBase.equals(rightBase))
      {
        var rightPower = rightExp.right;
        var leftPower  = leftExp.right;
        var power      = leftPower.add(rightPower).simplify();
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   exponent addition: base^(%s+%s)%n",
                            depthIndent(),
                            simplifyDepth,
                            leftPower,
                            rightPower);
        }
        simplifyDepth--;
        return leftBase.pow(power).simplify();
      }
    }

    if (left instanceof FunctionNode<D, R, F> leftFunction
                  && right instanceof FunctionNode<D, R, F> rightFunction)
    {
      var leftIsExponentialFunction  = leftFunction.is("exp");
      var rightIsExponentialFunction = rightFunction.is("exp");

      if (leftIsExponentialFunction && rightIsExponentialFunction)
      {
        var exponentSum = leftFunction.arg.add(rightFunction.arg).simplify();
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   exp multiplication: exp(%s+%s)%n",
                            depthIndent(),
                            simplifyDepth,
                            leftFunction.arg,
                            rightFunction.arg);
        }
        simplifyDepth--;
        return exponentSum.exp().simplify();
      }
    }

    if (left instanceof FunctionNode<D, R, F> leftFunction2
                  && right instanceof FunctionNode<D, R, F> rightFunction2)
    {
      var leftIsSquareRootFunction = leftFunction2.is("sqrt");
      var functionsAreEqual        = leftFunction2.equals(rightFunction2);

      if (leftIsSquareRootFunction && functionsAreEqual)
      {
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   sqrt*sqrt -> arg%n", depthIndent(), simplifyDepth);
        }
        simplifyDepth--;
        return leftFunction2.arg;
      }
    }

    if (left instanceof DivisionNode<D, R, F> leftDiv
                  && right instanceof DivisionNode<D, R, F> rightDiv)
    {
      var numerator   = leftDiv.left.mul(rightDiv.left).simplify();
      var denominator = leftDiv.right.mul(rightDiv.right).simplify();
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   fraction combine: (%s/%s)*(%s/%s) → %s/%s%n",
                          depthIndent(),
                          simplifyDepth,
                          leftDiv.left,
                          leftDiv.right,
                          rightDiv.left,
                          rightDiv.right,
                          numerator,
                          denominator);
      }
      simplifyDepth--;
      return numerator.div(denominator).simplify();
    }

    if (right instanceof DivisionNode<D, R, F> rightDiv)
    {
      var numerator = left.mul(rightDiv.left).simplify();
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   pull fraction right: %s*(%s/%s) → %s/%s%n",
                          depthIndent(),
                          simplifyDepth,
                          left,
                          rightDiv.left,
                          rightDiv.right,
                          numerator,
                          rightDiv.right);
      }
      simplifyDepth--;
      return numerator.div(rightDiv.right).simplify();
    }

    if (left instanceof DivisionNode<D, R, F> leftDiv)
    {
      var numerator = leftDiv.left.mul(right).simplify();
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   pull fraction left: (%s/%s)*%s → %s/%s%n",
                          depthIndent(),
                          simplifyDepth,
                          leftDiv.left,
                          leftDiv.right,
                          right,
                          numerator,
                          leftDiv.right);
      }
      simplifyDepth--;
      return numerator.div(leftDiv.right).simplify();
    }

    if (traceSimplify)
    {
      System.err.printf("%s[%d] EXIT MultiplicationNode.simplify() returning this=%s%n",
                        depthIndent(),
                        simplifyDepth,
                        this);
    }
    simplifyDepth--;
    return this;
  }

  /**
   * Applies the sifting property of the Dirac delta function: f(x) * δ(x-a) =
   * f(a) * δ(x-a)
   */
  private Node<D, R, F> simplifyDeltaMultiplication()
  {
    FunctionNode<D, R, F> delta      = null;
    Node<D, R, F>         multiplier = null;

    if (left.isFunction() && left.asFunction().isDeltaFunction())
    {
      delta      = left.asFunction();
      multiplier = right;
    }
    else if (right.isFunction() && right.asFunction().isDeltaFunction())
    {
      delta      = right.asFunction();
      multiplier = left;
    }
    else
    {
      return null;
    }

    var                   deltaArg   = delta.arg;

    VariableNode<D, R, F> variable   = multiplier.expression.getIndependentVariable();

    Node<D, R, F>         deltaShift = Integration.extractShiftFromDeltaArg(deltaArg, variable);
    if (deltaShift == null)
    {
      return null;
    }

    var evaluated = multiplier.substitute(variable.getName(), deltaShift).simplify();

    if (evaluated.isZero())
    {
      return zero();
    }

    return evaluated.mul(delta);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert left != null : this + ".left is null";
    assert right != null : this + ".right is null";
    return left.spliceInto(newExpression).mul(right.spliceInto(newExpression));
  }

  @Override
  public String typeset()
  {
    return format("\\left(%s \\cdot %s\\right)", left.typeset(), right.typeset());
  }
}
