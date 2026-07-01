package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.functions.ComplexFunctional;
import arb.functions.Jacobian;
import junit.framework.TestCase;

/**
 * Tests for the symbolic parameter derivative (Jacobian) of
 * {@link RiccatiMuntzPadeFunctional}.
 *
 * <h2>Mathematical setup</h2>
 *
 * The classical linear Riccati (μ = 1, R = 0):
 *
 * <pre>
 *   D¹ y(t; v) = v − y(t; v),   y(0; v) = 0
 * </pre>
 *
 * has the closed-form solution
 *
 * <pre>
 *   y(t; v) = v · (1 − e^{−t}).
 * </pre>
 *
 * Differentiating with respect to the perturbation parameter v:
 *
 * <pre>
 *   ∂y/∂v (t; v) = 1 − e^{−t},
 * </pre>
 *
 * which is the solution of the linearized equation
 *
 * <pre>
 *   D¹ w = 1 − w,   w(0) = 0
 * </pre>
 *
 * with unit initial driving instead of v. This is independent of v, so
 * evaluating the Jacobian at any v (e.g. v = 1) must agree with the reference 1
 * − e^{−t} to the working precision.
 *
 * <p>
 * A second test validates the Jacobian against a finite-difference
 * approximation to guard against sign errors or scaling defects in the
 * derivative recurrence.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class RiccatiMuntzPadeFunctionalJacobianTest extends
                                                    TestCase
{
  private static final int BITS = 128;

  /**
   * Build the linear Riccati μ=1, P(v)=v, Q(v)=-1, R(v)=0 (solution: y(t;v) =
   * v·(1−e^{−t})).
   */
  private static RiccatiMuntzPadeFunctional linearFunctional()
  {
    return new RiccatiMuntzPadeFunctional(new Real().set("1", BITS),
                                          "v",
                                          "-1",
                                          "0");
  }

  /**
   * {@link RiccatiMuntzPadeFunctional#jacobian(String[])} returns a non-null
   * Jacobian whose source is the functional itself and whose single partial
   * compiles without throwing.
   */
  public void testJacobianCompilesWithoutThrowing()
  {
    try ( RiccatiMuntzPadeFunctional eq = linearFunctional())
    {
      Jacobian<Complex, ComplexFunction, ComplexFunctional> J = eq.jacobian(new String[]
      { "v" });
      assertNotNull("jacobian must be non-null", J);
      assertEquals("one variable", 1, J.variables.length);
      assertEquals("variable name is 'v'", "v", J.variables[0]);
      assertNotNull("partial ∂y/∂v must be non-null", J.partials[0]);
    }
  }



  /**
   * Evaluate the symbolic ∂y/∂v and compare against the closed form 1−e^{−t} at t
   * = 1, v = 1.
   *
   * <p>
   * For the linear case P(v)=v, Q(v)=−1, R(v)=0 we have ∂y/∂v = 1−e^{−t}, which
   * at t=1 equals 1−1/e ≈ 0.6321205588285578.
   */
  public void testSymbolicDerivativeMatchesClosedFormAtTEqualsOne()
  {
    try ( RiccatiMuntzPadeFunctional eq = linearFunctional(); Complex v = new Complex(); Complex t = new Complex(); Complex w = new Complex())
    {
      v.set("1", BITS);
      t.set("1", BITS);

      Jacobian<Complex, ComplexFunction, ComplexFunctional> J    = eq.jacobian(new String[]
      { "v" });

      // Evaluate ∂y/∂v as a functional: J.partials[0] is a ComplexFunctional
      // (MuntzPadeFunctional); evaluate at v to obtain a ComplexFunction, then
      // evaluate that function at t.
      ComplexFunction                                       dwdv = J.partials[0].evaluate(v, 1, BITS, null);
      assertNotNull("partial evaluation at v must not return null", dwdv);
      dwdv.evaluate(t, 1, BITS, w);

      // Reference: 1 − e^{−1} ≈ 0.6321205588285578
      double ref = 1.0 - Math.exp(-1.0);
      assertEquals("Re(∂y/∂v)(t=1) must equal 1−e^{−1}", ref, w.re().doubleValue(), 1e-8);
      assertEquals("Im(∂y/∂v)(t=1) must be 0", 0.0, w.im().doubleValue(), 1e-8);
    }
  }

  /**
   * Validate the symbolic Jacobian against a finite-difference approximation at
   * (t = 0.5, v = 1.5) with step h = 1e-4.
   *
   * <p>
   * Finite difference: (y(t; v+h) − y(t; v−h)) / (2h).
   *
   * <p>
   * For μ=1, P(v)=v, Q(v)=−1, R(v)=0: y(t; v) = v·(1−e^{−t}), so the true ∂y/∂v =
   * 1−e^{−t}. At t=0.5: ref = 1−e^{−0.5} ≈ 0.3935.
   */
  public void testSymbolicDerivativeAgreesWithFiniteDifference()
  {
    try ( RiccatiMuntzPadeFunctional eq = linearFunctional(); Complex v = new Complex(); Complex vp = new Complex(); Complex vm = new Complex();
          Complex t = new Complex(); Complex yp = new Complex(); Complex ym = new Complex(); Complex w = new Complex())
    {
      double vd = 1.5, hd = 1e-4, td = 0.5;
      v.set(vd, 0);
      vp.set(vd + hd, 0);
      vm.set(vd - hd, 0);
      t.set(td, 0);

      // Forward and backward evaluations for finite difference
      eq.evaluate(vp, 1, BITS, null).evaluate(t, 1, BITS, yp);
      eq.evaluate(vm, 1, BITS, null).evaluate(t, 1, BITS, ym);
      double                                                fdDeriv = (yp.re().doubleValue() - ym.re().doubleValue()) / (2 * hd);

      // Symbolic derivative at (v, t)
      Jacobian<Complex, ComplexFunction, ComplexFunctional> J       = eq.jacobian(new String[]
      { "v" });
      J.partials[0].evaluate(v, 1, BITS, null).evaluate(t, 1, BITS, w);
      double symDeriv = w.re().doubleValue();

      assertEquals("symbolic ∂y/∂v must agree with finite difference to 1e-6", fdDeriv, symDeriv, 1e-6);
    }
  }
}
