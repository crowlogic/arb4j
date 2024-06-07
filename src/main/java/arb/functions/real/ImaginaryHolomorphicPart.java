package arb.functions.real;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;

/**
 * Represents the imaginary part of a holomorphic function (i.e., complex
 * differentiable function), when evaluated with a real input. This class
 * extends {@link ComplexHolomorphicPart} and allows the evaluation of the
 * imaginary part of the function up to a specified order of derivative and with
 * a specified level of precision.
 *
 * @param <F> A generic type that extends {@link ComplexFunction}
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ImaginaryHolomorphicPart<F extends ComplexFunction> extends
                                     ComplexHolomorphicPart<F>
{

  public ImaginaryHolomorphicPart(F func)
  {
    super(
          func);

  }

  @Override
  public Real evaluate(Complex z, int order, int prec, Real res)
  {
    try ( Complex complexRes = new Complex();)
    {
      f.evaluate(z, order, prec, complexRes);
      for (int i = 0; i < order; i++)
      {
        res.get(i).set(complexRes.get(i).getImag());
      }
    }
    return res;
  }

  @Override
  public String toString()
  {
    return "Im(" + f.toString() + ")";
  }

}
