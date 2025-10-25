package arb;

import java.util.Iterator;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public abstract class ComplexPartIterator implements
                                          Iterator<Real>
{

  protected Complex x;
  protected int     i = 0;

  public ComplexPartIterator()
  {
    super();
  }

  @Override
  public boolean hasNext()
  {
    return i < x.dim;
  }

}