package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;

import org.objectweb.asm.MethodVisitor;

import arb.Complex;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 **/
public class LogGammaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                 PolySeriesFunctionNode<D, C, F>
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
  protected PolySeriesFunctionNode<D, C, F> makeWithOrder(int order)
  {
    return new LogGammaFunctionNode<>(expression,
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
    call(mv, sType, isComplex, n, oneSlot, "acb_poly_lgamma_series", "arb_poly_lgamma_series");
  }

  @Override
  public String toString()
  {
    return String.format("lnΓ(%s)", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("\\\\ln\\\\Gamma(%s)", arg == null ? "" : arg.typeset());
  }
}