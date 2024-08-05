package arb.stochastic.processes.operators;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.stochastic.KarhunenLoeveExpansion;
import arb.domains.RealLine;
import arb.functions.FourierTransform;
import arb.functions.Function;
import arb.functions.RealSquareIntegrableFunction;
import arb.functions.polynomials.ModifiedLommelPolynomials;
import arb.functions.polynomials.orthogonal.real.RealChebyshevPolynomialsOfTheFirstKind;
import arb.functions.polynomials.orthogonal.real.RealLegendrePolynomials;
import arb.functions.polynomials.orthogonal.real.RealType1ChebyshevPolynomials;
import arb.functions.real.RealBesselFunctionOfTheFirstKind;
import arb.functions.sequences.RealPolynomialSequence;
import arb.functions.sequences.RealSequence;
import arb.measure.Measure;
import arb.measure.ProbabilityMeasure;
import arb.operators.Operator;

/**
 * The {@link J0IntegralCovarianceOperator} represents the
 * {@link IntegralCovarianceOperator} with the
 * {@link RealBesselFunctionOfTheFirstKind} of order 0, J₀, as its
 * {@link TranslationInvariantKernel}. This {@link Operator} has a special
 * relationship with the orthogonal complement of the Fourier transforms of the
 * {@link RealChebyshevPolynomialsOfTheFirstKind} by virtue of the fact that
 * they comprise its eigenfunctions.
 *
 * 
 * <p>
 * Key properties:
 * <ul>
 * <li>The eigenvalues λₖ are the projections of the orthogonal complement of
 * the orthonormalized Fourier transforms of the
 * {@link RealType1ChebyshevPolynomials} onto the J₀ function. They quantify the
 * contribution of each eigenfunction to the kernel's spectral
 * representation.</li>
 * <li>The eigenfunctions associated with zero eigenvalues lie in the null space
 * of the operator and do not contribute to the kernel's expansion. This null
 * space is also referred to as the "kernel" in linear algebra.</li>
 * <li>The {@link KarhunenLoeveExpansion} reconstructs the kernel as a
 * <b>uniformly convergent</b> sum of eigenfunctions scaled by their
 * corresponding eigenvalues: <br>
 * K(x, y) = ∑ₙ₌₁∞ λₙ φₙ(x-y).</li>
 * <li>The L2 norm (Hilbert-Schmidt norm) of the operator is infinite, as the
 * sum of the eigenvalues diverges. However, the operator is still compact due
 * to the convergence of the eigenvalues to zero.</li>
 * 
 * <p>
 * Tf = ∫J₀(x-y)*f(x)dx = ∑a*ₖλₖ*Ψₖ(x-y){k=0..∞} where aₖ= λₖ*∫Ψₖ(x)*f(x)dx
 * </p>
 * while the kernel itself defines a {@link ProbabilityMeasure} on the
 * {@link RealLine}.
 * </p>
 * 
 * TODO: ultimately this will be linked to <br>
 * <br>
 *
 * N(t) = (-((lnΓ(1/4 + t𝑖/2) - lnΓ(1/4 - t𝑖/2))𝑖)/2 - ln(π)t/2)/π + 1 -
 * 𝑖((ln(ζ(1/2 + 𝑖t)) - ln(ζ(1/2 - 𝑖t))))/(2π)<br>
 * <br>
 * 
 * 
 * @author Stephen A. Crowley
 * 
 * @since 0.96 - May 13th, 2024
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class J0IntegralCovarianceOperator implements
                                          IntegralCovarianceOperator<Real, RealBesselFunctionOfTheFirstKind, RealSquareIntegrableFunction>
{
  RealBesselFunctionOfTheFirstKind     kernel = new RealBesselFunctionOfTheFirstKind(0);

  /**
   * The eigenvalues λₖ of the integral equation:
   * <p>
   * Ψₖ(x)=λₖ∫J₀(x-y)*Ψₖ(x)dx
   * </p>
   * where {@link #Ψₖ} are the orthonormalized {@link FourierTransform}s of the
   * k-th {@link RealChebyshevPolynomialsOfTheFirstKind} which happen to be the
   * {@link FourierTransform}s of the {@link RealLegendrePolynomials} which are
   * expressible equivalently in terms of the
   * {@link RealBesselFunctionOfTheFirstKind} at half-integer orders via
   * {@link RealSphericalBesselFunctionOfTheFirstKind} and thus
   * {@link ModifiedLommelPolynomials}
   * <p>
   * The eigenvalues are the projections of this{@link #Ψₖ} onto the
   * {@link RealBesselFunctionOfTheFirstKind} function, which is the
   * {@link FourierTransform} of the measure 1/√(1-x²) to which is the the
   * orthogonality {@link Measure} of the
   * {@link RealChebyshevPolynomialsOfTheFirstKind} .
   * </p>
   */
  public static RealSequence           λₖ     = RealSequence.express("λₖ:k➔√((4*k+1)/π)*((k+1)⋰-½)²");

  // TODO: finish quasipolynomial class and uncomment this:
  public static RealPolynomialSequence Ψₖ     = RealPolynomialSequence.express("Ψₖ:n➔√((4*n+1)/π)*(-1)ⁿ*j(2*n,x)");

  @Override
  public RealBesselFunctionOfTheFirstKind kernel()
  {
    return kernel;
  }

  /**
   * Applies
   * 
   * ∫J₀(x-y)*Ψₖ(x)dx
   * 
   * to the given {@link Function} x
   * <p>
   * The eigenfunction expansion of the operator is given by:
   * <p>
   * K(x,y)=∑ₖλₖΨₖ(x-y)∀ₖ∈₀⸴₁⸴₂…∞
   * </p>
   * where Ψₖ are the eigenfunctions and {@link #λₖ} are the eigenvalues
   * {@link FourierTransform} of the {@link RealLegendrePolynomials} with odd k
   *
   * @param f      The input {@link Function}.
   * @param bits   The number of bits of precision for the computation.
   * @param result The object to store the result in.
   * @return The result of applying the {@link IntegralCovarianceOperator} to x.
   */
  @Override
  public RealSquareIntegrableFunction
         apply(RealSquareIntegrableFunction f, int bits, RealSquareIntegrableFunction result)
  {
    assert false : "TODO: return the eigenfunction expansion √((4k-3)/2π)*P^(2(k-½),x-y) where P^ is the Fourier transform of the (2(k-½)-th Legendre polynomial";
    return null;
  }

  /**
   * Returns the norm of the integral covariance operator.
   * <p>
   * For this operator, the L2 norm (Hilbert-Schmidt norm) is infinite, as the sum
   * of the eigenvalues diverges. However, the operator is still compact due to
   * the convergence of the eigenvalues to zero.
   * </p>
   *
   * @param result The object to store the result in.
   * @return The L2 norm of the integral covariance operator, which is positive
   *         infinity.
   */
  @Override
  public Real norm(Real result)
  {
    return result.posInf();
  }
}