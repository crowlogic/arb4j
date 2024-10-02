package arb.expressions.viz;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class EquationTypeInfo
{
  public Class<?> domainType;
  public Class<?> codomainType;
  public Class<?> functionType;

  public EquationTypeInfo(Class<?> domainType, Class<?> codomainType, Class<?> functionType)
  {
    this.domainType   = domainType;
    this.codomainType = codomainType;
    this.functionType = functionType;
  }
}