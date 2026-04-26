package arb.functions.polynomials.orthogonal.real;

import arb.Domain;
import arb.RealConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * Probabilist's Hermite polynomials He_n, defined by the three-term recurrence
 *
 * <pre>
 *   He_{n+1}(x) = x·He_n(x) − n·He_{n−1}(x),    He_0(x) = 1,  He_1(x) = x.
 * </pre>
 *
 * Equivalently, for the orthogonal-polynomial framework
 * P_{n+1}(x) = (A_n·x + B_n)·P_n(x) − C_n·P_{n−1}(x):  A_n = 1, B_n = 0, C_n = n.
 *
 * <p>Orthogonal with respect to the standard Gaussian weight w(x) = exp(−x²/2)
 * on (−∞, ∞):
 *
 * <pre>
 *   ∫_ℝ He_m(x) He_n(x) e^{−x²/2} dx = √(2π) · n! · δ_{m,n}.
 * </pre>
 *
 * <p>Related to the physicist's {@link HermitePolynomials} H_n by
 * He_n(x) = 2^{−n/2}·H_n(x/√2) (different scaling convention, different weight).
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ProbabilistHermitePolynomials extends
                                           RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  public ProbabilistHermitePolynomials(int bits)
  {
    super(bits,
          "1",
          "0",
          "n");
    p1.set("x");
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return RealConstants.posInf;
  }

  public static final RealFunction w = RealFunction.express("exp(-x²/2)");

  @Override
  public RealFunction orthogonalityMeasure()
  {
    return w;
  }

}
