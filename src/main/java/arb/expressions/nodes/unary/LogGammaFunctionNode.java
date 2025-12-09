package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class LogGammaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                 PolySeriesFunctionDerivativeNode<D, C, F>
{

  public LogGammaFunctionNode(Expression<D, C, F> expression)
  {
    super("lnΓ",
          expression);
  }

  private LogGammaFunctionNode(Expression<D, C, F> expression, Node<D, C, F> arg, int order)
  {
    super("lnΓ",
          expression,
          arg,
          order);
  }


  @Override
  protected void pushSeriesCallParamsAndInvoke(MethodVisitor mv,
                                               Class<?> sType,
                                               boolean isComplex,
                                               int n,
                                               int oneSlot)
  {
    call(mv, isComplex, n, "arb_poly_lgamma_series", "acb_poly_lgamma_series");
  }

  @Override
  public String toString()
  {
    return String.format("lnΓ(%s)", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("\\\\lnGAMMA(%s)", arg == null ? "" : arg.typeset());
  }
}