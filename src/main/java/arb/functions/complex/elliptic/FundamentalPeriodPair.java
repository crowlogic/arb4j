package arb.functions.complex.elliptic;

import arb.Complex;
import arb.OrderedPair;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.ComplexPlane;

/**
 * A fundamental pair of periods is an {@link OrderedPair} of {@link Complex}
 * numbers that define a lattice in the {@link ComplexPlane}. This type of
 * lattice is the underlying object with which {@link EllipticFunction} and
 * modular forms are defined.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Fundamental_pair_of_periods">Wikipedia</a>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FundamentalPeriodPair extends
                                   OrderedPair<Complex, Complex>
{

  public FundamentalPeriodPair(Complex a, Complex b)
  {
    super(a,
          b);
  }

}
