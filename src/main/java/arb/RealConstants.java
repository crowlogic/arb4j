package arb;

public class RealConstants
{
  static
  {
    System.loadLibrary("arblib");
  }

  public static final int  prec          = 256;

  public static final Real constants     = Real.newAlignedVector(14);

  public static Real       half          = constants.get(0).one().div(2, prec);
  public static Real       one           = constants.get(1).one();
  public static Real       zero          = constants.get(2).zero();
  public static Real       posInf        = constants.get(3).posInf();
  public static Real       π             = constants.get(4).π(prec);
  public static Real       πsquared      = constants.get(5).π(prec).pow(2, prec);
  public static Real       sqrtπ         = constants.get(6).π(prec).sqrt(prec);
  public static Real       sqrt2π        = constants.get(7).π(prec).mul(2, prec).sqrt(prec);
  public static Real       sqrt2         = constants.get(8).set(2).sqrt(prec);
  public static Real       negOne        = constants.get(9).one().neg();
  public static Real       twoπ          = constants.get(10).π(prec).mul(2, prec);
  public static Real       indeterminant = constants.get(11).indeterminate();
  public static Real       two           = constants.get(12).set(2);
  public static Real       negInf        = constants.get(13).negInf();

  static
  {
    constants.lock();
  }

}
