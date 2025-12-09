package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public final class HardyZFunctionNode<D, C, F extends Function<? extends D, ? extends C>>
                                     extends
                                     PolySeriesFunctionDerivativeNode<D, C, F>
{

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    return new HardyZFunctionNode<>(expression,
                                    arg,
                                    derivativeOrder - 1);
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    return new HardyZFunctionNode<>(expression,
                                    arg,
                                    derivativeOrder + 1);

  }

  public HardyZFunctionNode(Expression<D, C, F> e)
  {
    super("Z",
          e);
  }

  HardyZFunctionNode(Expression<D, C, F> e, Node<D, C, F> a, int o)
  {
    super("Z",
          e,
          a,
          o);
  }

  @Override
  protected void pushSeriesCallParamsAndInvoke(MethodVisitor mv, Class<?> S, boolean cx, int n, int oneSlot)
  {
    call(mv,
         cx,
         n,
         "arb_poly_riemann_siegel_z_series",
         "acb_poly_riemann_siegel_z_series");
  }

  @Override
  public String toString()
  {
    return "Z^(" + derivativeOrder + ")(" + arg + ')';
  }

  @Override
  public String typeset()
  {
    return "Z(" + (arg == null ? "" : arg.typeset()) + ')';
  }
}
