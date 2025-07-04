package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.RealToComplexFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RealComplexPart implements
                                   RealToComplexFunction
{
  @Override
  public String toString()
  {
    return String.format("RealComplexPart[f=%s]", f);
  }

  final ComplexFunction f;

  public RealComplexPart(ComplexFunction complexFunction)
  {
    this.f = complexFunction;
  }

  @Override
  public Complex evaluate(Real t, int order, int bits, Complex res)
  {
    try ( var tmp = new Complex())
    {
      tmp.getReal().set(t);
      return f.evaluate(tmp, order, bits, res);
    }
  }
}