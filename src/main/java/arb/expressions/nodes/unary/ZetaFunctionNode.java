package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public final class ZetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                   PolySeriesFunctionDerivativeNode<D, C, F>
{
  public ZetaFunctionNode(Expression<D, C, F> e)
  {
    super("ζ",
          e);
  }

  ZetaFunctionNode(Expression<D, C, F> e, Node<D, C, F> a, int o)
  {
    super("ζ",
          e,
          a,
          o);
  }

  @Override
  protected void pushSeriesCallParamsAndInvoke(MethodVisitor mv,
                                               Class<?> S,
                                               boolean cx,
                                               int n,
                                               int oneSlot)
  {
    call(mv, S, cx, n, oneSlot, "arb_poly_zeta_series", "acb_poly_zeta_series");
  }

  @Override
  public String toString()
  {
    return "ζ(" + arg + ')';
  }

  @Override
  public String typeset()
  {
    return "ζ(" + (arg == null ? "" : arg.typeset()) + ')';
  }
}
