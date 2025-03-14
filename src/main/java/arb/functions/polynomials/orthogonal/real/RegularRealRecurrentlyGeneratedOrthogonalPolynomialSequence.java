package arb.functions.polynomials.orthogonal.real;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.RealSequence;

/**
*
* @see BusinessSourceLicenseVersionOnePointOne © terms of the
*      {@link TheArb4jLibrary}
*/
public abstract class RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence extends
                                                                                  RealRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  private String a;
  private String b;
  private String c;

  public RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence(int bits,
                                                                     String a,
                                                                     String b,
                                                                     String c)
  {
    super(bits);
    this.a = a;
    this.b = b;
    this.c = c;
  }

  @Override
  public RealSequence
         A()
  {
    return RealSequence.express("A", a, context);
  }

  @Override
  public RealSequence
         B()
  {
    return RealSequence.express("B", b, context);
  }

  @Override
  public RealSequence
         C()
  {
    return RealSequence.express("C", c, context);
  }

}