package arb;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ComplexRealPartIterator extends
                                     ComplexPartIterator
{

  public ComplexRealPartIterator(Complex x)
  {
    this.x = x;
  }

  @Override
  public Real next()
  {
    return x.get(i++).getReal();
  }

}
