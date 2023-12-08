package arb;

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

  public static Real half          = next().one().div(2, prec);
  public static Real one           = next().one();
  public static Real zero          = next().zero();
  public static Real posInf        = next().posInf();
  public static Real π             = next().π(prec);
  public static Real πsquared      = next().π(prec).pow(2, prec);
  public static Real sqrtπ         = next().π(prec).sqrt(prec);
  public static Real sqrt2π        = next().π(prec).mul(2, prec).sqrt(prec);
  public static Real sqrt2         = next().set(2).sqrt(prec);
  public static Real negOne        = next().set(-1);
  public static Real twoπ          = next().set(2).mul(π, prec);
  public static Real indeterminant = next().indeterminate();
  public static Real two           = next().set(2);
  public static Real negInf        = next().negInf();
  public static Real negHalf       = next().one().div(2, prec).neg();
  public static Real oneQuarter    = next().one().div(4, prec);
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
