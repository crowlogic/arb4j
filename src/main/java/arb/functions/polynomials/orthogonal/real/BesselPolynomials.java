package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.real.RealFunction;

/**
 * <pre>
 * The coefficients Aₙ, Bₙ, and Cₙ for the Bessel polynomials in the general form of the recurrence
 * relation for orthogonal polynomials,
 * 
 * Pₙ₊₁(x) = (Aₙ x + Bₙ)Pₙ(x) - Cₙ Pₙ₋₁(x)
 * 
 * are
 * 
 * Aₙ = 2n+1
 * 
 * Bₙ = 0
 * 
 * Cₙ = -1
 * </pre>
 * 
 * @see Bibliography#lommelAndBesselPolynomials
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BesselPolynomials extends
                               RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{
  public BesselPolynomials(int bits)
  {
    super(bits,
          "2*n+1",
          "0",
          "-1");
    p1.set("1+x");
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    assert false : "TODO: orthogonality measures on the real line are quite complicated";
    return null;
  }

  /**
   * 
   */
  @Override
  public RealFunction orthogonalityMeasure()
  {
    assert false : "TODO: orthogonality measures on the real line are quite complicated";
    return null;
  }

}
