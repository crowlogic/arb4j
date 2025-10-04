package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class GammaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                              PolySeriesFunctionNode<D, C, F>
{

  public GammaFunctionNode(Expression<D, C, F> expression)
  {
    super("Γ",
          expression);
  }

  public GammaFunctionNode(Expression<D, C, F> expression, Node<D, C, F> arg, int order)
  {
    super("Γ",
          expression,
          arg,
          order);
  }

  @Override
  protected PolySeriesFunctionNode<D, C, F> makeWithOrder(int order)
  {
    return new GammaFunctionNode<>(expression,
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
    call(mv, complex, n, "arb_poly_gamma_series", "acb_poly_gamma_series");
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