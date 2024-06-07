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
public class RealPartOfHolomorphicMapping implements
                                          RealToComplexFunction
{
  @Override
  public String toString()
  {
    return f.toString();
  }

  ComplexFunction f;

  public RealPartOfHolomorphicMapping(ComplexFunction c)
  {
    f = c;
  }

  @Override
  public Complex evaluate(Real x, int order, int prec, Complex res)
  {
    res.im().zero();
    res.re().set(x);
    return f.evaluate(res, order, prec, res);
  }

}