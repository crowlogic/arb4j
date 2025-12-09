package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 *  
 */
public class RiemannSiegelThetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>>
                                           extends
                                           PolySeriesFunctionDerivativeNode<D, C, F>
{
  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new RiemannSiegelThetaFunctionNode<E, S, G>(newExpression,
                                                       arg.spliceInto(newExpression),
                                                       derivativeOrder);
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    return new RiemannSiegelThetaFunctionNode<>(expression,
                                                arg,
                                                derivativeOrder - 1);
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    return new RiemannSiegelThetaFunctionNode<>(expression,
                                                arg,
                                                derivativeOrder + 1);

  }

  public RiemannSiegelThetaFunctionNode(Expression<D, C, F> expression)
  {
    super("ϑ",
          expression);
  }

  private RiemannSiegelThetaFunctionNode(Expression<D, C, F> expression, Node<D, C, F> arg, int order)
  {
    super("ϑ",
          expression,
          arg,
          order);
  }

  @Override
  protected void pushSeriesCallParamsAndInvoke(MethodVisitor mv, Class<?> sType, boolean isComplex, int n, int oneSlot)
  {
    call(mv,
         isComplex,
         n,
         "arb_poly_riemann_siegel_theta_series",
         "acb_poly_riemann_siegel_theta_series");
  }

  @Override
  public String toString()
  {
    return derivativeOrder == 0 ? "ϑ(" + arg + ")" : "ϑ^(" + derivativeOrder + ")(" + arg + ')';
  }

  @Override
  public String typeset()
  {
    return String.format("\\\\vartheta(%s)",
                         arg == null ? "" : arg.typeset());
  }
}
