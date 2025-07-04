package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.NotDifferentiableException;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealToComplexFunction extends
                                       Function<Real, Complex>
{

  public default Complex eval(double t, Complex res)
  {
    try ( var tmp = Real.valueOf(t))
    {
      return evaluate(tmp, 1, Double.PRECISION + 5, res);
    }
  }

  public default RealFunction realPart()
  {
    return new RealPart(this);
  }

  public default RealToComplexFunction differential() throws NotDifferentiableException
  {
    return (z, order, prec, res) ->
    {
      order = Math.max(1, order);
      assert res.size() >= order;
      try ( Complex x = Complex.newVector(order + 1))
      {
        RealToComplexFunction.this.evaluate(z, order + 1, prec, x);
        return res.slice(0, order).set(x.slice(1, order + 1));
      }
    };
  }

  public default RealFunction imagPart()
  {
    return new ImaginaryPart(this);
  }

}
