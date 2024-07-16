package arb;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealPolynomialConstants
{

  public static final RealPolynomial empty = new RealPolynomial();
  
  public static final RealPolynomial zero = new RealPolynomial();

  public static final RealPolynomial one  = new RealPolynomial();

  static
  {
    empty.setLength(0);
    zero.set(0);
    one.set(1);
  }
}
