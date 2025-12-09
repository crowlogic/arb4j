package arb;

import java.util.Iterator;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ComplexIterator implements
                             Iterator<Complex>
{
  int     i = 0;
  Complex x = null;

  public ComplexIterator(Complex x)
  {
    this.x = x;
  }

  @Override
  public boolean hasNext()
  {
    return i < x.dim;
  }

  @Override
  public Complex next()
  {
    return x.get(i++);
  }

}
