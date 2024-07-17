package arb.functions.polynomials;

import java.util.stream.Stream;

import arb.Initializable;
import arb.Rational;
import arb.Real;
import arb.RealConstants;
import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;
import arb.documentation.references.Reference;
import arb.domains.Domain;
import arb.domains.ExtendedRealLine;
import arb.functions.polynomials.orthogonal.real.RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence;
import arb.functions.real.RealFunction;

/**
 * The modified Lommel polynomials R_{v,n}(z) of order v are the expansion of
 * the reciprocal 1/z. The "Lommel Polynomials" are technically not polynomials
 * but actually {@link Rational} functions
 * 
 * <pre>
 * R_{v,n}(z) = pochhammer(v,m)*2^m*(1/z)^(-m)*hypergeom([-1/2*m, 1/2-1/2*m],[v, -m, 1-v-m],-1/z^2)
 * </pre>
 * 
 * @see Bibliography#besselFunctionTreatise A Treatise on the Theory of Bessel
 *      Functions p.294
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ModifiedLommelPolynomials
                                        extends
                                        RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence implements
                                        Concept,
                                        Initializable
{

  @Override
  public void initialize()
  {
    super.initialize();
    p1.set(2).mul(v, bits).shiftLeft(1);
  }

  @SuppressWarnings("resource")
  public Real v = new Real().setName("v").set(RealConstants.half);

  public ModifiedLommelPolynomials(int bits)
  {
    super(bits,
          "n➔2*(n + v )",
          "0",
          "1");
    context.registerVariable(v);

  }

  public ModifiedLommelPolynomials()
  {
    this(128);
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return ExtendedRealLine.instance;
  }

  @Override
  public Stream<? extends Reference> getReferences()
  {
    return Stream.of(Bibliography.besselFunctionTreatise.referToChapters("9.60 p.294"),
                     Bibliography.specialFunctionsOfMathematicalPhysics.referToChapters("3.11.1 p.120"));
  }

  /**
   * <pre>
   * The discrete orthogonality measure for the Lommel polynomials R_{n,v}(z) is
   * related to the zeros of the Bessel function J_v(z). Let z_{v,k} denote the
   * kth positive zero of J_v(z), arranged in ascending order.
   * 
   * The Lommel polynomials satisfy the following discrete orthogonality relation:
   * 
   * \sum_{k=1}^{\infty} \frac{R_{m,v}(1/z_{v,k}) R_{n,v}(1/z_{v,k})}{z_{v,k}^2
   * [J_{v+1}(z_{v,k})]^2} = \frac{\delta_{m,n}}{2(n+v)}
   * 
   * where \delta_{m,n} is the Kronecker delta, defined as:
   * 
   * \delta_{m,n} = 1 if m = n \delta_{m,n} = 0 if m ≠ n
   * 
   * In other words, the Lommel polynomials are orthogonal with respect to the
   * discrete measure defined by the reciprocals of the squares of the zeros of
   * the Bessel function J_v(z), weighted by the square of the Bessel function
   * J_{v+1}(z) evaluated at those zeros.
   * 
   * This discrete orthogonality relation is a consequence of the fact that the
   * Lommel polynomials appear in the series expansion of the ratio of two Bessel
   * functions, as mentioned earlier:
   * 
   * J_{v-1}(z) / J_v(z) = 1/z \sum_{n=0}^{\infty} (-1)^n R_{n,v}(1/z)
   * 
   * The modified Lommel polynomials h_n^{(v)}(z), on the other hand, are
   * orthogonal with respect to a continuous measure on the real line, but the
   * specific form of this measure is more complex and less well-known compared to
   * the discrete orthogonality measure for the Lommel polynomials.
   * 
   * ∑k->(R_{m,v}(1/z_{v,k}) R_{n,v}(1/z_{v,k}) / (z_{v,k}² [J_{v+1}(z_{v,k})]²)){k=1..∞} = δ_{m,n} / (2(n+v))
   * </pre>
   */
  @Override
  public RealFunction orthogonalityMeasure()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
