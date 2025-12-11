package arb.expressions.nodes;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.unary.FunctionNode;
import arb.functions.Function;

/**
 * Represents the nth derivative of the Dirac delta function δ(x).
 * 
 * The delta function and its derivatives are distributions, not regular
 * functions. This node handles symbolic representation and differentiation of
 * δ^(n)(x).
 * 
 * Mathematical properties: - δ(x) has the sifting property: ∫f(x)δ(x-a)dx =
 * f(a) - x*δ(x) = 0 (vanishes when multiplied by its argument) - d/dx[δ(x)] =
 * δ'(x) (first derivative) - d^n/dx^n[δ(x)] = δ^(n)(x) (nth derivative)
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 * 
 * @param <D> Domain type
 * @param <R> Range type
 * @param <F> Function type
 */
public class DeltaFunctionDerivativeNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                        FunctionNode<D, R, F>
{
  /**
   * The order of the derivative: 1 for δ'(x), 2 for δ''(x), etc.
   */
  protected final int derivativeOrder;

  /**
   * Constructs a delta function derivative node with the specified order.
   * 
   * @param expression The parent expression
   * @param arg        The argument to the delta function (e.g., x or x-a)
   * @param order      The derivative order (must be positive)
   */
  public DeltaFunctionDerivativeNode(Expression<D, R, F> expression, Node<D, R, F> arg, int order)
  {
    super("δ" + getSuperscript(order),
          arg,
          expression);
    if (order < 1)
    {
      throw new IllegalArgumentException("Derivative order must be positive, got: " + order);
    }
    this.derivativeOrder = order;
  }

  /**
   * Returns the appropriate superscript notation for the derivative order.
   */
  private static String getSuperscript(int order)
  {
    if (order == 1)
    {
      return "′"; // prime symbol
    }
    else if (order == 2)
    {
      return "″"; // double prime
    }
    else if (order == 3)
    {
      return "‴"; // triple prime
    }
    else
    {
      return "^(" + order + ")"; // general nth derivative notation
    }
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    // d/dx[δ^(n)(x)] = δ^(n+1)(x)
    // Apply chain rule for the argument
    var argDerivative  = arg.differentiate(variable);
    var nextDerivative = new DeltaFunctionDerivativeNode<>(expression,
                                                           arg,
                                                           derivativeOrder + 1);
    return nextDerivative.mul(argDerivative).simplify();
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    if (derivativeOrder == 1)
    {
      // ∫δ'(x)dx = δ(x) + C
      // The constant of integration is dropped in symbolic computation
      var argDerivative = arg.differentiate(variable);
      return arg.δ().div(argDerivative);
    }
    else
    {
      // ∫δ^(n)(x)dx = δ^(n-1)(x) + C
      var argDerivative = arg.differentiate(variable);
      return new DeltaFunctionDerivativeNode<>(expression,
                                               arg,
                                               derivativeOrder - 1).div(argDerivative);
    }
  }

  @Override
  public Node<D, R, F> simplify()
  {
    // Simplify the argument
    if (arg != null)
    {
      arg = arg.simplify();
    }
    return this;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    // Delta function derivatives are distributions and cannot be directly evaluated
    // at a point. They can only be evaluated through their action on test
    // functions.
    // For code generation purposes, we throw an exception.
    throw new UnsupportedOperationException("Cannot generate code for delta function derivative δ^("
                                            + derivativeOrder
                                            + "). Delta function derivatives are distributions that can only be evaluated "
                                            + "through integration against test functions.");
  }

  @Override
  public String toString()
  {
    String suffix = derivativeOrder == 1 ? "′" : derivativeOrder == 2 ? "″"
                                    : derivativeOrder == 3 ? "‴" : "^(" + derivativeOrder + ")";
    return "δ"
           + suffix
           + "("
           + (arg == null ? "" : arg.toStringWithoutIndependentVariableSpecified())
           + ")";
  }

  @Override
  public String typeset()
  {
    String suffix;
    if (derivativeOrder == 1)
    {
      suffix = "'";
    }
    else if (derivativeOrder <= 3)
    {
      suffix = "'" + "'".repeat(derivativeOrder - 1);
    }
    else
    {
      suffix = "^{(" + derivativeOrder + ")}";
    }
    return "\\delta" + suffix + "(" + (arg == null ? "" : arg.typeset()) + ")";
  }

  /**
   * Returns the order of this delta function derivative.
   */
  public int getDerivativeOrder()
  {
    return derivativeOrder;
  }
}
