package arb;

public class RealConstants
{
  static
  {
    System.loadLibrary("arblib");
    // radiansPerDegree = new Real().set("180",128).div(RealConstants.π, 128); =
    // 57.something
  }

  public static final int  prec     = 256;

  public static final Real half     = new Real();
  public static final Real one      = new Real();
  public static final Real zero     = new Real();
  public static final Real posInf   = new Real();
  public static final Real π        = new Real();
  public static final Real πsquared = new Real();
  public static final Real sqrtπ    = new Real();
  public static final Real sqrt2π   = new Real();
  public static final Real sqrt2    = new Real();
  public static final Real negOne   = new Real().one().neg();

  static
  {
    one.one();
    zero.zero();
    half.one().div(2, prec);
    posInf.posInf();
    sqrt2.set(2).sqrt(prec);
    π.π(prec);
    π.pow(2, prec, πsquared);
    π.sqrt(prec, sqrtπ);
    π.mul(2, prec, sqrt2π).sqrt(prec);
  }

}
