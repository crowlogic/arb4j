package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexConstants
{
  public static final Complex constants     = Complex.newAlignedVector(9);

  public static final Complex π             = constants.get(0);
  public static final Complex iπ            = constants.get(1);
  public static final Complex zero          = constants.get(2);
  public static final Complex negOne        = constants.get(3);
  public static final Complex one           = constants.get(4);
  public static final Complex complexHalf   = constants.get(5);
  public static final Complex imaginaryUnit = constants.get(6);
  public static final Complex posInf        = constants.get(7);
  public static final Complex negInf        = constants.get(8);
  public static final Complex ⅈ             = imaginaryUnit;
  public static final int     prec          = RealConstants.prec;


  static
  {
    π.getReal().π(prec);
    iπ.getImag().π(prec);
    zero.init().zero();
    negOne.identity().neg();
    imaginaryUnit.init();
    iπ.init();
    complexHalf.getReal().set(RealConstants.half);
    one.getReal().identity();
    imaginaryUnit.getImag().identity();
    iπ.getImag().π(prec);
    posInf.set(RealConstants.posInf, RealConstants.zero);
    posInf.neg(negInf);
    constants.lock();
  }

}
