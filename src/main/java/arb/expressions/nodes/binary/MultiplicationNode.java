package arb.expressions.nodes.binary;

import static arb.expressions.nodes.binary.Integration.*;
import static java.lang.String.format;

import java.util.ArrayList;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.expressions.nodes.unary.FunctionNode;
import arb.expressions.nodes.unary.FunctionalEvaluationNode;
import arb.functions.Function;
import arb.utensils.Utensils;

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
  @Override
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    if (result == null)
    {
      result = Utensils.newInstance(resultType);
    }
    T leftValue = left.evaluate(resultType, bits, Utensils.newInstance(resultType));
    T rightValue = right.evaluate(resultType, bits, Utensils.newInstance(resultType));
    return (T) leftValue.mul(rightValue, bits, Utensils.newInstance(resultType));
  }

  
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
    // Simplify first -- catches e.g. (x-a)*δ(x-a) = 0
    Node<D, R, F> simplified = this.simplify();
    if (simplified.isZero())
    {
      return simplified;
    }
    if (!simplified.equals(this))
    {
      return simplified.integral(variable);
    }

    // Flatten the product tree into individual factors
    var factors = new ArrayList<Node<D, R, F>>();
    collectFactors(this, factors);

    // constant factors are ones that don't depend on integration variable and
    // can thus be pulled out of the integrand , resulting in a more efficient
    // equivalent computation
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

    // Pull out constant factors: ∫ c·f(t) dt = c · ∫ f(t) dt
    if (!constantFactors.isEmpty() && !variableFactors.isEmpty())
    {
      var constantProduct = buildProduct(constantFactors);
      var variableProduct = buildProduct(variableFactors);
      return constantProduct.mul(variableProduct.integral(variable)).simplify();
    }

    // If any factor is a Polynomial-typed function application at the integration
    // variable, multiply the polynomial by the remaining cofactor at the polynomial
    // level and integrate the product analytically via PolynomialIntegralNode.
    FunctionalEvaluationNode<D, R, F> polyFactor   = null;
    var                               cofactorList = new ArrayList<Node<D, R, F>>();
    for (var f : variableFactors)
    {
      // FIXME: handle the case when the argument to the FunctionalEvaluationNode is
      // some function of the variable rather than strictly equal to the variable
      // itself
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

    // Try step function integration: ∫ f(x)·θ(x) dx = θ(x) · ∫ f(x) dx (#841)
    var stepResult = integrateStepFunction(variableFactors, variable);
    if (stepResult != null)
    {
      return stepResult.simplify();
    }

    // All factors depend on the variable -- try IBP on all 2-partitions
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
    var folded = super.simplify();
    if (folded != this)
    {
      return folded;
    }

    if (left.isZero() || right.isZero())
    {
      return zero();
    }

    if (left.isOne())
    {
      return right;
    }

    if (right.isOne())
    {
      return left;
    }

    if (left.isNegOne())
    {
      return right.neg();
    }

    if (right.isNegOne())
    {
      return left.neg();
    }

    var deltaSimplification = simplifyDeltaMultiplication();
    if (deltaSimplification != null)
    {
      return deltaSimplification;
    }

    return this;
  }


  /**
   * Applies the sifting property of the Dirac delta function: f(x) * δ(x-a) =
   * f(a) * δ(x-a)
   *
   * Substitutes the delta function's root into the multiplier to obtain the
   * constant f(a). Returns f(a)*δ(x-a), or zero when f(a)=0.
   *
   * @return the simplified node, or null if no delta function is present or the
   *         argument pattern is unrecognized
   */
  private Node<D, R, F> simplifyDeltaMultiplication()
  {
    // Check if either operand is a delta function
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

    // Find the variable involved
    VariableNode<D, R, F> variable   = multiplier.expression.getIndependentVariable();

    // Extract shift from delta argument: δ(x) → shift=0, δ(x-a) → shift=a
    Node<D, R, F>         deltaShift = Integration.extractShiftFromDeltaArg(deltaArg, variable);
    if (deltaShift == null)
    {
      return null;
    }

    // Apply the sifting property: f(x) * δ(x-a) = f(a) * δ(x-a)
    // Substitute x = deltaShift into the multiplier to evaluate f(a)
    var evaluated = multiplier.substitute(variable.getName(), deltaShift).simplify();

    if (evaluated.isZero())
    {
      return zero();
    }

    // Return f(a) * δ(x-a)
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