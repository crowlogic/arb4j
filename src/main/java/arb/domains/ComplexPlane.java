package arb.domains;

import arb.Complex;
import arb.Real;

/**
 * The complex plane is the plane formed by the {@link Complex} numbers, with a
 * Cartesian coordinate system such that the x-axis, called real axis, is formed
 * by the {@link Real} numbers, and the y-axis, called imaginary axis, is formed
 * by the imaginary numbers.
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
