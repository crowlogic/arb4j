package arb.expressions.nodes.unary;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class DeltaFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              FunctionNode<D, R, F>
{

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    // TODO Auto-generated method stub
    return super.integrate(variable);
  }

  public DeltaFunctionNode(Expression<D, R, F> expression)
  {
    super("δ",
          expression.resolve(),
          expression.require(')'));
  }

}
