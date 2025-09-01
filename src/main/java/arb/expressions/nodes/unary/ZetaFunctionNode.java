package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @author StΣνε
 * 
 * @see 
 * BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ZetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                   PolySeriesFunctionNode<D, C, F>
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
  protected PolySeriesFunctionNode<D, C, F> makeWithOrder(int o)
  {
    return new ZetaFunctionNode<>(expression,
                                  arg,
                                  o);
  }

  @Override
  protected void pushSeriesCallParamsAndInvoke(MethodVisitor mv,
                                               Class<?> S,
                                               boolean cx,
                                               int n,
                                               int oneSlot)
  {
    call(mv, S, cx, n, oneSlot, "acb_poly_zeta_series", "arb_poly_zeta_series");
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
