package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealConstants
{
  static
  {
    System.loadLibrary("arblib");
  }

  public static final int           prec       = 256;

  public static final Real          constants  = Real.newAlignedVector(17);

  private static final RealIterator enumerator = constants.iterator();

  private static Real next()
  {
    return enumerator.next();
  }

  public static Real half          = next().identity().div(2, prec);
  public static Real one           = next().identity();
  public static Real zero          = next().zero();
  public static Real posInf        = next().posInf();
  public static Real π             = next().π(prec);
  public static Real πsquared      = next().set(π).pow(2, prec);
  public static Real sqrtπ         = next().set(π).sqrt(prec);
  public static Real sqrt2π        = next().set(π).mul(2, prec).sqrt(prec);
  public static Real sqrt2         = next().set(2).sqrt(prec);
  public static Real negOne        = next().set(-1);
  public static Real twoπ          = next().set(2).mul(π, prec);
  public static Real indeterminant = next().indeterminate();
  public static Real two           = next().set(2);
  public static Real negInf        = next().negInf();
  public static Real negHalf       = next().identity().div(-2, prec);
  public static Real oneQuarter    = next().identity().div(4, prec);
  public static Real threeQuarters = next().set(3).div(4, prec);

  static
  {
    constants.lock();
  }

  public static void main(String args[])
  {
    System.out.println(constants);
  }

}
