package arb;

import static arb.arb.*;

public class Constants
{
  static
  {
    System.loadLibrary("arblib");
   // radiansPerDegree = new Real().set("180",128).div(Constants.π, 128);
  }
  
  static int prec = 256;
  
  public static final int MAG_BITS = 30;
  
  public static final int ARF_RND_DOWN = 0;
  public static final int ARF_RND_UP = 1;
  public static final int ARF_RND_FLOOR = 2;
  public static final int ARF_RND_CEIL = 3;
  public static final int ARF_RND_NEAR = 4;

  public static final int FMPR_RND_DOWN = 0;
  public static final int FMPR_RND_UP = 1;
  public static final int FMPR_RND_FLOOR = 2;
  public static final int FMPR_RND_CEIL = 3;
  public static final int FMPR_RND_NEAR = 4;
  public static final Real HALF = new Real();
  public static final Real ONE = new Real();
  public static final Complex COMPLEX_ONE = new Complex();
  public static final Complex COMPLEX_HALF = new Complex();

  public static final Complex IMAGINARY_UNIT = new Complex();

  public static final Complex COMPLEX_ONE_POINT_OH_FIVE = new Complex();
  public static final Complex ZERO = new Complex().init();
  public static final Real realPositiveInfinity = new Real();
  public static final Complex posInf = new Complex();
  public static final Complex negInf = new Complex();

  public static final Magnitude log10mag = new Magnitude();
  
  public static final Magnitude zeroMag = new Magnitude();
  
  public static Complex i = Constants.IMAGINARY_UNIT;

  public static Complex iπ = new Complex();

  public static final Real π = new Real().pi(prec);

  public static final int ARB_RND = ARF_RND_DOWN;

  static
  {
    arb.mag_zero(zeroMag);
    arb_init(Constants.HALF);
    arb_init(Constants.ONE);
    acb_init(Constants.IMAGINARY_UNIT);
    acb_init(Constants.iπ);
    acb_init(Constants.COMPLEX_ONE_POINT_OH_FIVE);
    arb_set_d(Constants.HALF, 0.5);
    COMPLEX_HALF.getReal().set(HALF);
    arb_set_d(Constants.ONE, 1);
    Constants.COMPLEX_ONE.getReal().one();
    Constants.IMAGINARY_UNIT.getImag().one();
    iπ.getImag().pi(prec);
    realPositiveInfinity.posInf();
    posInf.set(realPositiveInfinity, ZERO.getReal());
    posInf.neg(negInf);
    log10mag.set(10).log(log10mag);
  }

  public static final Real     sqrt2 = new Real().set(2);

}
