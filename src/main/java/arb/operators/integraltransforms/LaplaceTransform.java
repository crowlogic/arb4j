package arb.operators.integraltransforms;

import arb.*;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.operators.IntegralTransform;
import arb.space.topological.VectorSpace;

/**
 * the Laplace transform is the integral transform ∫f(t)*e^(-t*s)dt=0..∞)
 * 
 * @param <F>
 */
public class LaplaceTransform<F extends RealToComplexFunction> implements
                             IntegralTransform<Complex,Complex>
{
  private static final int       relativeAccuracyBitsGoal     = 128;
  private static final Magnitude absoluteUncertaintyTolerance = new Magnitude().set(Math.pow(10, -20));
  private static final Real      right                        = new Real().set("1000", 1024);
  private static final Real      left                         = ComplexConstants.ZERO.getReal();

  public LaplaceTransform(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Complex ξ, int order, int prec, Complex res)
  {
    order = Math.max(1, order);
    assert order < 2;
    assert ξ.getImag().isZero();

    /**
     * f(x)e^(-i2πξx)
     */
    RealToComplexFunction integrand = (x, integrandOrder, integrandPrec, result) ->
                                    {
                                      try ( Complex a = Complex.newVector(2))
                                      {
                                        Real expr = a.getReal().one();
                                        expr.neg(expr)
                                            .mul(ξ.getReal(), integrandPrec, expr)
                                            .mul(x, integrandPrec, expr)
                                            .exp(integrandPrec, expr);
                                        a.mul(f.evaluate(x, integrandOrder, integrandPrec, result),
                                              integrandPrec,
                                              result);
                                        return result;
                                      }
                                    };

    IntegrationOptions    opts      = new IntegrationOptions();
    return integrand.integrate(left, right, relativeAccuracyBitsGoal, absoluteUncertaintyTolerance, opts, prec, res);
  }

  @Override
  public Function<Complex, Complex> getKernel()
  {
    return (s, order, prec, result) ->
    {
      return result.set(s).neg().mul(s, prec).exp(prec);
    };
  }

  @Override
  public VectorSpace<Complex, Complex>
         apply(VectorSpace<Complex, Complex> x, int bits, VectorSpace<Complex, Complex> result)
  {
    evaluate( x.field(), 1, bits, result.field() );
    return result;
  }


}
