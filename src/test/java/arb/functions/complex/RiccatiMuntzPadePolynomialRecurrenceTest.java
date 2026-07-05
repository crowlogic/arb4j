package arb.functions.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.functions.integer.ComplexPolynomialSequence;
import junit.framework.TestCase;

/**
 * Tests for the polynomial ring recurrence in {@link RiccatiMuntzPadeFunctional}.
 *
 * <p>
 * The central invariant: {@code a(k)} is a {@link ComplexPolynomial} in {@code v},
 * built by polynomial ring arithmetic — not a curried scalar function. These tests
 * verify the polynomial degree structure of the Müntz coefficient sequence and the
 * full-pipeline evaluation at multiple parameter values from a single compiled
 * instance.
 *
 * <h2>Test cases</h2>
 * <ol>
 *   <li><b>Linear P, zero Q/R</b>: P=v, Q=0, R=0, μ=1. a(1)(v)=v (degree 1),
 *       a(k)=0 for k≥2 (zero polynomial).</li>
 *   <li><b>Linear P, linear Q</b>: P=v, Q=−1, R=0, μ=1. Every a(k) is degree 1;
 *       evaluating at v=2 matches v·(−1)^(k−1)/k!. Full-pipeline y(t;v)=v(1−e^{-t})
 *       at multiple v values.</li>
 *   <li><b>Degree growth with R≠0</b>: P=1, Q=0, R=v, μ=1. a(3) has degree 1,
 *       a(5) has degree 2 from polynomial convolution products.</li>
 *   <li><b>Zero-parameter symmetry</b>: P=v, Q=−1, R=0, μ=1, v=0. Every a(k)(0)=0,
 *       so the Padé gives y(t;0)=0 for all t.</li>
 *   <li><b>da polynomial structure</b>: For P=v, Q=−1, R=0, μ=1 the derivative
 *       da(1)=1/Γ(2)=1 (degree-0 polynomial).</li>
 * </ol>
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class RiccatiMuntzPadePolynomialRecurrenceTest extends
                                                      TestCase
{
  private static final int BITS = 128;

  // ────────────────────────────────────────────────────────────────────
  // helpers
  // ────────────────────────────────────────────────────────────────────

  /** Evaluate a(index) as a polynomial and return the ComplexPolynomial. */
  private static ComplexPolynomial basisPoly(ComplexPolynomialSequence a, int index)
  {
    try ( arb.Integer k = new arb.Integer())
    {
      k.set(index);
      return a.evaluate(k, 1, BITS, new ComplexPolynomial());
    }
  }

  /** Evaluate a polynomial at a real value v and return the real part. */
  private static double evalAt(ComplexPolynomial poly, double vd)
  {
    try ( Complex v = new Complex(); Complex result = new Complex())
    {
      v.set(vd, 0);
      poly.evaluate(v, 1, BITS, result);
      return result.getReal().doubleValue();
    }
  }

  // ────────────────────────────────────────────────────────────────────
  // Test 1 — P=v, Q=0, R=0: only a(1) is nonzero, degree 1
  // ────────────────────────────────────────────────────────────────────

  /**
   * For P(v)=v, Q=0, R=0, μ=1 the recurrence gives a₁(v)=v and aₖ=0 for k≥2.
   * The polynomial a₁ must have degree 1 and evaluate to v at every v.
   */
  public void testFirstCoefficientIsLinearMonomialForPEqualsV()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "v", "0", "0"))
    {
      ComplexPolynomialSequence a = eq.muntzBasis();

      try ( ComplexPolynomial a1 = basisPoly(a, 1))
      {
        assertEquals("a(1) must be degree 1 for P=v", 1, a1.degree());
        assertEquals("a(1)(2) = 2",  2.0, evalAt(a1, 2.0),  1e-30);
        assertEquals("a(1)(5) = 5",  5.0, evalAt(a1, 5.0),  1e-30);
        assertEquals("a(1)(−3) = −3", -3.0, evalAt(a1, -3.0), 1e-30);
      }
    }
  }

  /**
   * For P(v)=v, Q=0, R=0, μ=1 the second and third Müntz coefficients are the
   * zero polynomial (both Q and R are zero, so only a₁ is driven).
   */
  public void testHigherCoefficientsAreZeroForPureLinearDriving()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "v", "0", "0"))
    {
      ComplexPolynomialSequence a = eq.muntzBasis();
      for (int idx = 2; idx <= 4; idx++)
      {
        try ( ComplexPolynomial ak = basisPoly(a, idx))
        {
          assertEquals("a(" + idx + ")(3) = 0 when Q=R=0", 0.0, evalAt(ak, 3.0), 1e-30);
          assertEquals("a(" + idx + ")(1) = 0 when Q=R=0", 0.0, evalAt(ak, 1.0), 1e-30);
        }
      }
    }
  }

  // ────────────────────────────────────────────────────────────────────
  // Test 2 — P=v, Q=−1, R=0: all a(k) degree 1; full-pipeline check
  // ────────────────────────────────────────────────────────────────────

  /**
   * For P(v)=v, Q(v)=−1, R(v)=0, μ=1 the closed-form recurrence gives
   * aₖ(v) = v·(−1)^(k−1)/k!, so every aₖ is degree 1. Verify for k=1..5.
   */
  public void testAllCoefficientsAreDegreeOneForLinearQCase()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "v", "-1", "0"))
    {
      ComplexPolynomialSequence a = eq.muntzBasis();
      for (int k = 1; k <= 5; k++)
      {
        try ( ComplexPolynomial ak = basisPoly(a, k))
        {
          assertEquals("a(" + k + ") must be degree 1 for P=v, Q=-1, R=0", 1, ak.degree());
        }
      }
    }
  }

  /**
   * Verify a₁(v)=v/Γ(2)=v and a₂(v)=−v/2 numerically at v=4.
   *
   * <p>
   * For μ=1: γ₂=1/2, so a₂ = γ₂·q·a₁ = (1/2)·(−1)·v = −v/2.
   */
  public void testFirstTwoCoefficientsNumerically()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "v", "-1", "0"))
    {
      ComplexPolynomialSequence a = eq.muntzBasis();
      double                    v = 4.0;

      try ( ComplexPolynomial a1 = basisPoly(a, 1); ComplexPolynomial a2 = basisPoly(a, 2))
      {
        assertEquals("a(1)(4) = 4",    4.0,  evalAt(a1, v), 1e-30);
        assertEquals("a(2)(4) = −2",  -2.0,  evalAt(a2, v), 1e-30);  // −v/2 = −2
      }
    }
  }

  /**
   * Full-pipeline test: P(v)=v, Q(v)=−1, R(v)=0, μ=1.
   *
   * <p>
   * The Riccati ODE y′=v−y, y(0)=0 has exact solution y(t;v)=v·(1−e^{−t}).
   * A single compiled instance is evaluated at two distinct parameter values
   * v=2 and v=5, verifying that polynomial ring recursion preserves correctness
   * across parameter variation without recompilation.
   */
  public void testFullPipelineLinearRiccatiAtTwoParameterValues()
  {
    int bits = 192;
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", bits), "v", "-1", "0");
          Complex vParam = new Complex(); Complex t = new Complex(); Complex y = new Complex())
    {
      t.set("1", bits);

      // v=2: y(1;2) = 2·(1−e^{−1})
      vParam.set(2.0, 0);
      ComplexFunction approx2 = eq.evaluate(vParam, 1, bits, null);
      approx2.evaluate(t, 1, bits, y);
      double ref2 = 2.0 * (1.0 - Math.exp(-1.0));
      assertEquals("y(1;2) = 2·(1−e^{−1})", ref2, y.getReal().doubleValue(), 1e-12);
      assertEquals("Im y(1;2) = 0", 0.0, y.getImag().doubleValue(), 1e-25);

      // v=5: y(1;5) = 5·(1−e^{−1}) — same instance, different parameter
      vParam.set(5.0, 0);
      ComplexFunction approx5 = eq.evaluate(vParam, 1, bits, null);
      approx5.evaluate(t, 1, bits, y);
      double ref5 = 5.0 * (1.0 - Math.exp(-1.0));
      assertEquals("y(1;5) = 5·(1−e^{−1})", ref5, y.getReal().doubleValue(), 1e-12);
      assertEquals("Im y(1;5) = 0", 0.0, y.getImag().doubleValue(), 1e-25);
    }
  }

  // ────────────────────────────────────────────────────────────────────
  // Test 3 — P=1, Q=0, R=v: polynomial degree grows via convolution
  // ────────────────────────────────────────────────────────────────────

  /**
   * For P(v)=1, Q(v)=0, R(v)=v, μ=1:
   *
   * <pre>
   *   a(1) = 1/Γ(2) = 1          (degree 0)
   *   a(2) = 0                   (empty convolution sum, k−2=0 terms)
   *   a(3) = γ₃·r·a(1)·a(1) = (1/3)·v·1·1 = v/3   (degree 1)
   * </pre>
   *
   * This exercises the polynomial product step in the ring recursion.
   */
  public void testConvolutionProductIncreasesPolynomialDegree()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "1", "0", "v"))
    {
      ComplexPolynomialSequence a = eq.muntzBasis();

      try ( ComplexPolynomial a1 = basisPoly(a, 1))
      {
        assertEquals("a(1) degree 0 for P=1", 0, a1.degree());
        assertEquals("a(1)(v) = 1 for all v", 1.0, evalAt(a1, 7.0), 1e-30);
      }

      try ( ComplexPolynomial a3 = basisPoly(a, 3))
      {
        // a(3)(v) = v/3: degree 1, value at v=6 is 2
        assertEquals("a(3) must be degree 1 (from r·a(1)·a(1))", 1, a3.degree());
        assertEquals("a(3)(6) = 6/3 = 2", 2.0, evalAt(a3, 6.0), 1e-25);
        assertEquals("a(3)(3) = 3/3 = 1", 1.0, evalAt(a3, 3.0), 1e-25);
      }
    }
  }

  // ────────────────────────────────────────────────────────────────────
  // Test 4 — zero-parameter symmetry: v=0 ⟹ y=0
  // ────────────────────────────────────────────────────────────────────

  /**
   * For P(v)=v, Q=−1, R=0 every aₖ(v) is proportional to v, so aₖ(0)=0 for all
   * k. The Müntz–Padé approximant at v=0 must return 0 for all t.
   */
  public void testZeroParameterGivesZeroSolution()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "v", "-1", "0");
          Complex zeroV = new Complex(); Complex t = new Complex(); Complex y = new Complex())
    {
      zeroV.zero();
      ComplexFunction approx = eq.evaluate(zeroV, 1, BITS, null);
      for (String tStr : new String[]
      { "0.5", "1", "2" })
      {
        t.set(tStr, BITS);
        approx.evaluate(t, 1, BITS, y);
        assertEquals("y(t;0) = 0 at t=" + tStr, 0.0, y.getReal().doubleValue(), 1e-25);
      }
    }
  }

  // ────────────────────────────────────────────────────────────────────
  // Test 5 — da polynomial structure
  // ────────────────────────────────────────────────────────────────────

  /**
   * For P(v)=v, Q(v)=−1, R(v)=0, μ=1 the parameter derivative sequence is
   *
   * <pre>
   *   da(1) = ṗ/Γ(2) = 1   (derivative of P=v w.r.t. v is 1; Γ(2)=1)
   * </pre>
   *
   * So da(1) is the constant polynomial 1.  Verify degree=0 and value=1.
   */
  public void testDaFirstCoefficientIsConstantOne()
  {
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS), "v", "-1", "0"))
    {
      ComplexPolynomialSequence da    = eq.parameterDerivative("v", BITS);
      try ( ComplexPolynomial   da1   = basisPoly(da, 1))
      {
        assertEquals("da(1) must be degree 0 (constant 1)", 0, da1.degree());
        assertEquals("da(1)(v) = 1 for all v", 1.0, evalAt(da1, 2.0),  1e-25);
        assertEquals("da(1)(v) = 1 for all v", 1.0, evalAt(da1, 10.0), 1e-25);
      }
    }
  }

  /**
   * Verify the symbolic ∂y/∂v from the da polynomial sequence agrees with the
   * closed-form derivative 1−e^{−t} (independent of v) at t=0.5, v=3.
   *
   * <p>
   * For P=v, Q=−1, R=0, μ=1: y(t;v)=v(1−e^{−t}), ∂y/∂v = 1−e^{−t}.
   */
  public void testDaFullPipelineMatchesClosedFormDerivative()
  {
    int bits = 192;
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", bits), "v", "-1", "0");
          Complex vParam = new Complex(); Complex t = new Complex(); Complex w = new Complex())
    {
      vParam.set(3.0, 0);
      t.set("0.5", bits);

      ComplexFunction dwdv = eq.jacobian(new String[]
      { "v" }).partials[0].evaluate(vParam, 1, bits, null);
      dwdv.evaluate(t, 1, bits, w);

      double ref = 1.0 - Math.exp(-0.5);
      assertEquals("∂y/∂v (0.5; 3) = 1−e^{−0.5}", ref, w.getReal().doubleValue(), 1e-10);
      assertEquals("Im ∂y/∂v = 0", 0.0, w.getImag().doubleValue(), 1e-25);
    }
  }
}
