package arb;

import static arb.arb.*;

public class Constants
{
  static
  {
    System.loadLibrary("arblib");
    // radiansPerDegree = new Real().set("180",128).div(Constants.π, 128); =
    // 57.something
  }

  static int                    prec           = 256;

  public static final int       MAG_BITS       = 30;

  public static final int       ARF_RND_DOWN   = 0;
  public static final int       ARF_RND_UP     = 1;
  public static final int       ARF_RND_FLOOR  = 2;
  public static final int       ARF_RND_CEIL   = 3;
  public static final int       ARF_RND_NEAR   = 4;

  public static final int       FMPR_RND_DOWN  = 0;
  public static final int       FMPR_RND_UP    = 1;
  public static final int       FMPR_RND_FLOOR = 2;
  public static final int       FMPR_RND_CEIL  = 3;
  public static final int       FMPR_RND_NEAR  = 4;
  public static final Real      half           = new Real();
  public static final Real      ONE            = new Real();
  public static final Complex   complexOne     = new Complex();
  public static final Complex   complexHalf    = new Complex();

  public static final Complex   imaginaryUnit  = new Complex();

  public static final Complex   ZERO           = new Complex();
  public static final Real      realPosInf     = new Real();
  public static final Complex   posInf         = new Complex();
  public static final Complex   negInf         = new Complex();

  public static final Magnitude log10mag       = new Magnitude();

  public static final Magnitude zeroMag        = new Magnitude();

  public static Complex         i              = Constants.imaginaryUnit;

  public static Complex         iπ             = new Complex();

  public static final Real      π              = new Real().pi(prec);
  public static Real            πsquared       = new Real();
  public static Real            sqrtπ          = new Real();
  public static Real            sqrt2π         = new Real();

  public static final int       ARB_RND        = ARF_RND_DOWN;

  static
  {
    zeroMag.zero();
    half.init();
    ONE.init();
    imaginaryUnit.init();
    iπ.init();
    half.one().div(2, prec);
    complexHalf.getReal().set(half);
    ONE.one();
    complexOne.getReal().one();
    imaginaryUnit.getImag().one();
    iπ.getImag().pi(prec);
    realPosInf.posInf();
    posInf.set(realPosInf, ZERO.getReal());
    posInf.neg(negInf);
    log10mag.set(10).log(log10mag);
    π.pow(2, prec, πsquared);
    π.sqrt(prec, sqrtπ);
    π.mul(2, prec, sqrt2π).sqrt(prec, sqrt2π);
  }

  public static final Real sqrt2 = new Real().set(2);

  public static final Complex negOne = new Complex().one().neg();

}
