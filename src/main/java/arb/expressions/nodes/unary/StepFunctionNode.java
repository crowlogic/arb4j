package arb.expressions.nodes.unary;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

public class StepFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                             FunctionNode<D, R, F>
{
  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    // TODO Auto-generated method stub
    return super.integrate(variable);
  }

  public StepFunctionNode(Expression<D, R, F> expression)
  {
    super("θ",
          expression.resolve(),
          expression.require(')'));
  }
}
