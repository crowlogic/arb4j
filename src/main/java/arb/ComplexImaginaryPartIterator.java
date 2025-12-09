package arb;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ComplexImaginaryPartIterator extends
                                          ComplexPartIterator
{

  public ComplexImaginaryPartIterator(Complex x)
  {
    this.x = x;
  }

  @Override
  public Real next()
  {
    return nextComplex().getImag();
  }

}
