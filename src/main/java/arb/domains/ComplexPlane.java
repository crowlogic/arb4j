package arb.domains;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * The complex plane is the plane formed by the {@link Complex} numbers, with a
 * Cartesian coordinate system such that the x-axis, called real axis, is formed
 * by the {@link Real} numbers, and the y-axis, called imaginary axis, is formed
 * by the imaginary numbers.
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexPlane implements
                          Domain<Complex>
{

  @Override
  public boolean contains(Complex point)
  {
    return point.isFinite();
  }

}
