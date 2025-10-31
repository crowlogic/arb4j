package arb.expressions.nodes.unary;

import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class DeltaFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              FunctionNode<D, R, F>
{

  public DeltaFunctionNode(Expression<D, R, F> expression,
                           FunctionMapping<?, ?, ?> newIntegralFunctionMapping,
                           Node<D, R, F> arg)
  {
    super(expression,
          newIntegralFunctionMapping,
          arg);
  }

  public DeltaFunctionNode(String functionName,
                           Node<D, R, F> argument,
                           Expression<D, R, F> expression)
  {
    super(functionName,
          argument,
          expression);
  }

}
