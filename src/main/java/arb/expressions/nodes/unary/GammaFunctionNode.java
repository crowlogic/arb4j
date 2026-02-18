package arb.expressions.nodes.unary;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Also see {@link GammaFunctionSeriesNode} for a version that computes
 * derivatives with the accelerated flint/arb methods
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class GammaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                              FunctionNode<D, C, F>
{

  public GammaFunctionNode(Expression<D, C, F> expression)
  {
    super("Γ",
          expression.resolve(),
          expression.require(')'));
  }

  public GammaFunctionNode(Expression<D, C, F> expression, Node<D, C, F> arg, int order)
  {
    super(expression,
          "Γ",
          arg,
          order);
  }

  @Override
  public String toString()
  {
    return String.format("Γ(%s)", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("\\Gamma(%s)", arg == null ? "" : arg.typeset());
  }
}