package arb.functions.complex.trigonometric;

import static java.lang.Math.max;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.EvenFunction;

/**
 * The ratio of the hypotenuse to the shorter side adjacent to an acute angle
 * (in a right-angled triangle); the reciprocal of a cosine.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SecantFunction implements
                            EvenFunction
{

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    order = max(0, order);
    assert order == 1 : "TODO: implement derivatives";
    return t.sec(prec, res);
  }

}
