package arb.expressions.nodes.unary;

import arb.expressions.Expression;
import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class DeltaFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              FunctionNode<D, R, F>
{

  public DeltaFunctionNode(Expression<D, R, F> expression)
  {
    super("δ",
          expression.resolve(),
          expression.require(')'));
  }

}
