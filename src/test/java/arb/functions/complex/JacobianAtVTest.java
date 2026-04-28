package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.functions.Function;
import arb.functions.Jacobian;
import arb.functions.complex.MuntzPadeFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Tests for the v-partial of {@link RiccatiMittagLefflerFunction}.
 *
 * <p>
 * The Jacobian {@code eq.jacobian(new String[]{"v"})} carries a single partial
 * — itself a {@link MuntzPadeFunction} whose Müntz coefficients w_k are the
 * solution of the linear fractional Volterra equation obtained by
 * differentiating the Riccati equation in v. The defining identity at the
 * coefficient level is unconditional:
 *
 * <pre>
 *   w_k(v) = ∂a_k(v)/∂v   for every k ≥ 1
 * </pre>
 *
 * because differentiation in v commutes with the formal-series construction
 * y(t) = Σ a_k(v)·t^{kμ}.
 *
 * <p>
 * The test specializes to the linear case r ≡ 0, p(v) = v, q(v) = α + v with
 * α = −1/2 and μ = 0.6, where a_k(v) is closed-form
 *
 * <pre>
 *   a_1(v) = v / Γ(μ+1)
 *   a_2(v) = (α+v)·v / Γ(2μ+1)
 *   a_3(v) = (α+v)²·v / Γ(3μ+1)
 * </pre>
 *
 * so the v-derivatives are
 *
 * <pre>
 *   w_1 = 1 / Γ(μ+1)
 *   w_2 = (α + 2v) / Γ(2μ+1)
 *   w_3 = (α + v)·(α + 3v) / Γ(3μ+1).
 * </pre>
 *
 * These three are pinned to working precision; the Γ values themselves are
 * evaluated by arb4j so the assertion is exact to {@code 1e-30}.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class JacobianAtVTest extends
                             TestCase
{

  public static void testPartialAtVMatchesClosedFormCoefficients()
  {
    int  bits = 192;

    // Linear case: r ≡ 0, p(v) = v, q(v) = α + v with α = -1/2.
    String pSrc = "v";
    String qSrc = "-1/2 + v";
    String rSrc = "0";

    Real μ = new Real();
    μ.set("0.6", bits);
    μ.setBounds(0, false, 1, true);

    try ( RiccatiMittagLefflerFunction eq = new RiccatiMittagLefflerFunction(μ, pSrc, qSrc, rSrc))
    {
      // Set v = 1.
      eq.v.set(1, 0);
      eq.invalidateCache();

      Jacobian<Complex, Complex, ? extends Function<Complex, Complex>> J =
        eq.jacobian(new String[] { "v" });
      assertEquals("variable count", 1,    J.variables.length);
      assertEquals("variable name",  "v",  J.variables[0]);
      assertEquals("partial count",  1,    J.partials.length);
      assertTrue  ("partial type",    J.partials[0] instanceof MuntzPadeFunction);

      MuntzPadeFunction w = (MuntzPadeFunction) J.partials[0];

      // w_1, w_2, w_3 closed-form against the partial's first three Müntz coefficients.
      try ( Complex coeffs   = Complex.newVector(3);
            Real    expected = new Real();
            Real    actualRe = new Real();
            Real    actualIm = new Real())
      {
        w.coefficientsAt(3, bits, coeffs);

        // w_1 = 1 / Γ(0.6+1) = 1/Γ(1.6)
        expected.set(RealNullaryFunction.express("1/Γ(1.6)").evaluate());
        assertEquals("Re w_1", expected.doubleValue(), coeffs.get(0).re().doubleValue(), 1e-30);
        assertEquals("Im w_1", 0.0,                    coeffs.get(0).im().doubleValue(), 1e-30);

        // w_2 = (α + 2v) / Γ(2μ+1) = ((-1/2)+2) / Γ(2.2) = 1.5 / Γ(2.2)
        expected.set(RealNullaryFunction.express("(3/2) / Γ(2.2)").evaluate());
        assertEquals("Re w_2", expected.doubleValue(), coeffs.get(1).re().doubleValue(), 1e-30);
        assertEquals("Im w_2", 0.0,                    coeffs.get(1).im().doubleValue(), 1e-30);

        // w_3 = (α+v)(α+3v) / Γ(3μ+1) = (1/2)·(5/2) / Γ(2.8) = (5/4) / Γ(2.8)
        expected.set(RealNullaryFunction.express("(5/4) / Γ(2.8)").evaluate());
        assertEquals("Re w_3", expected.doubleValue(), coeffs.get(2).re().doubleValue(), 1e-30);
        assertEquals("Im w_3", 0.0,                    coeffs.get(2).im().doubleValue(), 1e-30);
      }
    }
    finally
    {
      μ.close();
    }
  }
}
