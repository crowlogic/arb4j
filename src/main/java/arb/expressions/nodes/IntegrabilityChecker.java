package arb.expressions.nodes;

import arb.expressions.nodes.binary.ExponentiationNode;
import arb.expressions.nodes.binary.MultiplicationNode;
import arb.expressions.nodes.nary.NAryOperationNode;
import arb.expressions.nodes.unary.AbsoluteValueNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.functions.Function;
import arb.functions.annotations.FubiniApplicable;

/**
 * Conservative heuristic checks for the analytic validity of exchanging the
 * order of integration/summation (Fubini's theorem, Tonelli's theorem, or the
 * Dominated Convergence Theorem).
 *
 * <p>The checker returns {@code true} only when it can <em>prove</em>
 * exchangeability is valid. When it cannot determine validity, it defaults to
 * {@code false} unless the expression is annotated with
 * {@link FubiniApplicable}.</p>
 *
 * <h2>Sufficient conditions checked</h2>
 * <ul>
 *   <li><b>Finite constant bounds:</b> When all integration/summation limits
 *       are finite constants, the integrand is a composition of elementary
 *       functions, and no singularity is apparent — continuous functions on
 *       compact domains are absolutely integrable (Fubini applies).</li>
 *   <li><b>Non-negative integrand (Tonelli):</b> If the integrand is
 *       provably non-negative (a square, absolute value, exponential, or
 *       product of non-negative factors), Tonelli's theorem applies without
 *       requiring absolute integrability.</li>
 *   <li><b>User annotation:</b> Falls back to checking for
 *       {@link FubiniApplicable} on the expression's context.</li>
 * </ul>
 *
 * @see <a href="https://github.com/crowlogic/arb4j/issues/549">#549</a>
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class IntegrabilityChecker
{

  /**
   * Determines whether exchanging the order of two nested accumulation
   * operators is analytically valid.
   *
   * @param outer the outer operator node
   * @param inner the inner operator node
   * @return true if the exchange is provably valid or user-asserted
   */
  public static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         isAnalyticallyValid(Node<D, C, F> outer, Node<D, C, F> inner)
  {
    // Shortcut: finite constant bounds on both operators — continuous
    // functions on compact rectangular domain are absolutely integrable
    if (hasFiniteConstantBounds(outer) && hasFiniteConstantBounds(inner))
    {
      return true;
    }

    // Tonelli's theorem: non-negative integrand
    Node<D, C, F> integrand = ExchangeabilityChecker.getOperandRoot(inner);
    if (isProvablyNonNegative(integrand))
    {
      return true;
    }

    // Fall back to user annotation
    return hasUserAssertion(outer);
  }

  /**
   * Returns true if the accumulation operator has finite constant bounds
   * (not ±∞ and not dependent on any variable).
   */
  static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         hasFiniteConstantBounds(Node<D, C, F> node)
  {
    if (node instanceof IntegralNode<D, C, F> integral)
    {
      return integral.isDefiniteIntegral()
             && isFiniteConstant(integral.lowerLimitNode)
             && isFiniteConstant(integral.upperLimitNode);
    }
    if (node instanceof NAryOperationNode<D, C, F> nary)
    {
      return isFiniteConstant(nary.lowerLimit) && isFiniteConstant(nary.upperLimit);
    }
    return false;
  }

  /**
   * Returns true if a node represents a finite constant (not ±∞ and not
   * dependent on any variables).
   */
  static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         isFiniteConstant(Node<D, C, F> node)
  {
    if (node == null)
    {
      return false;
    }
    if (node.isPositiveInfinity() || node.isNegativeInfinity())
    {
      return false;
    }
    return node.isLiteralConstant() || node.isConstant();
  }

  /**
   * Checks whether a node is provably non-negative. Conservative — returns
   * true only for patterns that are guaranteed non-negative:
   * <ul>
   *   <li>Squares: f(x)^2 or f(x)^(2n) for even integer n</li>
   *   <li>Absolute values: |f(x)|</li>
   *   <li>Exponentials: exp(f(x))</li>
   *   <li>Products of provably non-negative factors</li>
   *   <li>Non-negative literal constants (0, 1, 2, ...)</li>
   * </ul>
   */
  public static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         isProvablyNonNegative(Node<D, C, F> node)
  {
    // Literal non-negative constants
    if (node.isLiteralConstant())
    {
      LiteralConstantNode<D, C, F> lit = node.asLiteralConstant();
      return !lit.toString().startsWith("-");
    }

    // f^2 is non-negative
    if (node instanceof ExponentiationNode<D, C, F> pow)
    {
      if (pow.right.isLiteralConstant())
      {
        String expStr = pow.right.toString();
        try
        {
          int expVal = java.lang.Integer.parseInt(expStr);
          if (expVal % 2 == 0 && expVal >= 0)
          {
            return true;
          }
        }
        catch (NumberFormatException e)
        {
          // not an integer exponent
        }
      }
    }

    // |f(x)| is non-negative
    if (node instanceof AbsoluteValueNode)
    {
      return true;
    }

    // exp(f(x)) is non-negative
    if (node instanceof FunctionNode<D, C, F> func)
    {
      if (func.is("exp"))
      {
        return true;
      }
    }

    // Product of non-negative factors
    if (node instanceof MultiplicationNode<D, C, F> mul)
    {
      return isProvablyNonNegative(mul.left) && isProvablyNonNegative(mul.right);
    }

    return false;
  }

  /**
   * Checks whether the expression has a {@link FubiniApplicable} user
   * annotation.
   */
  static <D, C, F extends Function<? extends D, ? extends C>>
         boolean
         hasUserAssertion(Node<D, C, F> node)
  {
    if (node.expression != null && node.expression.compiledClass != null)
    {
      return node.expression.compiledClass.isAnnotationPresent(FubiniApplicable.class);
    }
    return false;
  }
}
