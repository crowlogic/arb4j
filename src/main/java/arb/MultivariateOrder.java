package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public enum MultivariateOrder
{
  LEX(0),
  DEGLEX(1),
  DEGREVLEX(2);

  final int nativeValue;

  MultivariateOrder(int nativeValue)
  {
    this.nativeValue = nativeValue;
  }
}
