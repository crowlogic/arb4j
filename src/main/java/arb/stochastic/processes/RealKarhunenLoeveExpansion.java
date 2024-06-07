package arb.stochastic.processes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.stochastic.KarhunenLoeveExpansion;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealKarhunenLoeveExpansion<F extends RealFunction> implements
                                       KarhunenLoeveExpansion<Real, Real>
{

  private F f;

  public RealKarhunenLoeveExpansion(F f)
  {
    this.f = f;
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert false : "TODO: find out how many terms to use to get bits of preccision";
    return null;
  }

}
