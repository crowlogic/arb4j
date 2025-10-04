package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class SineIntegralNode<D, C, F extends Function<? extends D, ? extends C>> extends
                             PolySeriesFunctionNode<D, C, F>
{

  public SineIntegralNode(Expression<D, C, F> expression)
  {
    super("si",
          expression);
  }

  public SineIntegralNode(Expression<D, C, F> expression, Node<D, C, F> arg, int order)
  {
    super("si",
          expression,
          arg,
          order);
  }

  @Override
  protected PolySeriesFunctionNode<D, C, F> makeWithOrder(int order)
  {
    return new SineIntegralNode<>(expression,
                                  arg,
                                  order);
  }

  @Override
  protected void pushSeriesCallParamsAndInvoke(MethodVisitor mv,
                                               Class<?> sType,
                                               boolean complex,
                                               int n,
                                               int oneSlot)
  {
    call(mv, complex, n, "arb_hypgeom_si_series", "acb_hypgeom_si_series");
  }

  @Override
  public String toString()
  {
    return String.format("si(%s)", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("\\\\si(%s)", arg == null ? "" : arg.typeset());
  }
}