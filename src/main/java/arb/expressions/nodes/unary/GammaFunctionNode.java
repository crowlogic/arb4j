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
public class GammaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                              PolySeriesFunctionNode<D, C, F>
{

  public GammaFunctionNode(Expression<D, C, F> expression)
  {
    super("Γ",
          expression);
  }

  GammaFunctionNode(Expression<D, C, F> expression, Node<D, C, F> arg, int order)
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
                                               boolean isComplex,
                                               int n,
                                               int oneSlot)
  {
    // n
    pushInt(mv, n);
    // prec
    loadBitsParameterOntoStack(mv);

    if (isComplex)
    {
      // (resPoly, fPoly, n, prec)
      invokeStaticMethod(mv,
                         arblib.class,
                         "acb_poly_gamma_series",
                         Void.class,
                         Complex.class,
                         Complex.class,
                         int.class,
                         int.class);
    }
    else
    {
      invokeStaticMethod(mv,
                         arblib.class,
                         "arb_poly_gamma_series",
                         Void.class,
                         Real.class,
                         Real.class,
                         int.class,
                         int.class);
    }
  }

  @Override
  public String toString()
  {
    return String.format("Γ(%s)", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("\\\\Gamma(%s)", arg == null ? "" : arg.typeset());
  }
}