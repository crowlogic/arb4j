package arb.functions.real;

import arb.*;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.HolomorphicFunction;

/**
 * Represents the real part of a holomorphic function, i.e., a complex
 * differentiable function, when evaluated with a real input. This class extends
 * {@link ComplexHolomorphicPart} and allows the evaluation of the real part of
 * the function up to a specified order of derivative and with a specified level
 * of precision.
 *
 * @param <F> A generic type that extends {@link HolomorphicFunction}
 */
public class RealHolomorphicPart<F extends HolomorphicFunction> extends
                                ComplexHolomorphicPart<F>
{

  /**
   * A wrapper class for {@link RealToComplexFunction} that implements the
   * {@link HolomorphicFunction} interface. This class allows a
   * {@code RealToComplexFunction} to be used in contexts that require a
   * {@code HolomorphicFunction}.
   */
  public static class Wrapper implements
                              HolomorphicFunction
  {
    @Override
    public String toString()
    {
      return String.format("RealHolomorphicPart.Wrapper[%s]", f);
    }

    private final RealToComplexFunction f;

    /**
     * Constructs a {@link Wrapper} with the specified
     * {@link RealToComplexFunction}.
     *
     * @param f A {@link RealToComplexFunction} to be wrapped
     */
    public Wrapper(RealToComplexFunction f)
    {
      this.f = f;
    }

    /**
     * Evaluates the wrapped {@link RealToComplexFunction} with the real part of the
     * given complex input {@code
     * t
     * } (whose imaginary part is ignored and assumed to be 0 but this is not
     * asserted for), up to a specified order of derivative, and with a specified
     * level of precision. Returns a {@link Complex} object containing the evaluated
     * result.
     * 
     * @param t     The complex input value to evaluate the function with
     * @param order The order of derivative to evaluate up to
     * @param prec  The level of precision for the evaluation
     * @param res   A {@link Complex} object for storing the evaluated result
     * @return A {@link Complex} object containing the evaluated result
     */
    @Override
    public Complex evaluate(Complex t, int order, int prec, Complex res)
    {
      return f.evaluate(t.getReal(), order, prec, res);
    }
  }

  /**
   * Constructs a {@link RealHolomorphicPart} with the specified holomorphic
   * function.
   *
   * @param func A holomorphic function of type {@link F}
   */
  public RealHolomorphicPart(F func)
  {
    super(func);

  }

  /**
   * Constructs a {@link RealHolomorphicPart} with the specified real-to-complex
   * function, wrapping it with {@link Wrapper}.
   *
   * @param realToComplexFunction A {@link RealToComplexFunction} to be wrapped
   */
  @SuppressWarnings("unchecked")
  public RealHolomorphicPart(RealToComplexFunction realToComplexFunction)
  {
    super((F) new Wrapper(realToComplexFunction));
  }

  /**
   * Evaluates the real part of the holomorphic function with the given real input
   * {@code z}, up to a specified order of derivative, and with a specified level
   * of precision. Returns a {@link Real} vector containing the evaluated values.
   *
   * @param z     The real input value to evaluate the function with
   * @param order The order of derivative to evaluate up to
   * @param prec  The level of precision for the evaluation
   * @param res   A {@link Real} vector for storing the evaluated values
   * @return A {@link Real} vector containing the evaluated values
   */
  @Override
  public Real evaluate(Complex z, int order, int prec, Real res)
  {
    assert res.size() >= order;
    try ( Complex complexRes = Complex.newVector(res.size());)
    {
      f.evaluate(z, order, prec, complexRes);
      for (int i = 0; i < order; i++)
      {
        res.get(i).set(complexRes.get(i).getReal());
      }
    }
    return res;
  }

  public Complex integrate(Real a,
                           Real b,
                           int relativeAccuracyBitsGoal,
                           Magnitude absoluteErrorToleranceGoal,
                           IntegrationOptions options,
                           int precisionBits,
                           Complex res)
  {
    return Integrators.integrate(f,
                                 a,
                                 b,
                                 relativeAccuracyBitsGoal,
                                 absoluteErrorToleranceGoal,
                                 options,
                                 precisionBits,
                                 res);
  }

  @Override
  public String toString()
  {
    return "Re(" + f.toString() + ")";
  }

}
