package arb;

public class ComplexConstants
{
  public static final Complex π             = new Complex();
  public static final Complex iπ            = new Complex();
  public static final Complex ZERO          = new Complex();
  public static final Complex negOne        = new Complex();
  public static final Complex complexOne    = new Complex();
  public static final Complex complexHalf   = new Complex();
  public static final Complex imaginaryUnit = new Complex();
  public static final Complex posInf        = new Complex();
  public static final Complex negInf        = new Complex();
  public static final Complex i             = imaginaryUnit;
  public static final int     prec          = RealConstants.prec;

  static
  {
    π.getReal().pi(prec);
    iπ.getImag().pi(prec);
    ZERO.init().zero();
    negOne.one().neg();
    imaginaryUnit.init();
    iπ.init();
    complexHalf.getReal().set(RealConstants.half);
    complexOne.getReal().one();
    imaginaryUnit.getImag().one();
    iπ.getImag().pi(prec);
    posInf.set(RealConstants.posInf, RealConstants.zero);
    posInf.neg(negInf);
  }

}
