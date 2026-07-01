package arb.functions.complex;

import arb.ComplexPolynomial;
import arb.Real;
import junit.framework.TestCase;

/**
 * Tests for {@link RiccatiMuntzPadeFunctional#discriminant(int, ComplexPolynomial)}.
 *
 * <p>
 * The discriminant of the quadratic Riccati right-hand side p(v) + q(v)·y +
 * r(v)·y² is the polynomial in v
 *
 * <pre>
 *   D(v) = q(v)² − 4·p(v)·r(v).
 * </pre>
 *
 * Its sign classifies the local behaviour of the equation (two real fixed
 * points, a double one, or a complex-conjugate pair). These oracles pin the
 * discriminant against hand-computed values for both constant and genuinely
 * v-dependent coefficients.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class RiccatiDiscriminantTest extends
                                     TestCase
{
  private static final int BITS = 128;

  /**
   * The tangent equation y′ = 1 + y² (P=1, Q=0, R=+1): discriminant
   * D = 0² − 4·1·1 = −4 (a constant polynomial), reflecting the complex fixed
   * points ±i.
   */
  public void testDiscriminantOfTangentEquation()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "1", "0", "1");
          ComplexPolynomial d = new ComplexPolynomial())
    {
      eq.discriminant(BITS, d);
      assertEquals("D = q² − 4pr must be the constant −4", 0, d.degree());
      assertEquals("D(v) = −4", -4.0, d.get(0).getReal().doubleValue(), 1e-30);
      assertEquals("D imaginary part must be 0", 0.0, d.get(0).getImag().doubleValue(), 1e-30);
    }
  }

  /**
   * The hyperbolic-tangent equation y′ = 1 − y² (P=1, Q=0, R=−1): discriminant
   * D = 0² − 4·1·(−1) = +4 (a constant polynomial), reflecting the real fixed
   * points ±1.
   */
  public void testDiscriminantOfHyperbolicTangentEquation()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "1", "0", "-1");
          ComplexPolynomial d = new ComplexPolynomial())
    {
      eq.discriminant(BITS, d);
      assertEquals("D = q² − 4pr must be the constant +4", 0, d.degree());
      assertEquals("D(v) = +4", 4.0, d.get(0).getReal().doubleValue(), 1e-30);
      assertEquals("D imaginary part must be 0", 0.0, d.get(0).getImag().doubleValue(), 1e-30);
    }
  }

  /**
   * A genuinely v-dependent coefficient set P(v)=1, Q(v)=2v, R(v)=1: the
   * discriminant is the quadratic polynomial
   *
   * <pre>
   *   D(v) = (2v)² − 4·1·1 = 4v² − 4.
   * </pre>
   *
   * This exercises the full P(v)·Q(v)·R(v) polynomial-in-v machinery, not just
   * scalar constants.
   */
  public void testDiscriminantWithVDependentCoefficients()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "1", "2*v", "1");
          ComplexPolynomial d = new ComplexPolynomial())
    {
      eq.discriminant(BITS, d);
      assertEquals("D(v) = 4v² − 4 has degree 2", 2, d.degree());
      assertEquals("constant term −4", -4.0, d.get(0).getReal().doubleValue(), 1e-30);
      assertEquals("linear term 0", 0.0, d.get(1).getReal().doubleValue(), 1e-30);
      assertEquals("quadratic term 4", 4.0, d.get(2).getReal().doubleValue(), 1e-30);
    }
  }
}
