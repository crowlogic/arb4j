package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexConstants;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexPolynomialSequence;
import junit.framework.TestCase;

/**
 * The analytic parameter partials {@code ∂aₖ/∂ν} produced by the framework's
 * differentiated Riccati recurrence ({@code riccati.parameterDerivative("ν")})
 * are validated against a central finite-difference oracle. This is the
 * foundation of the analytic parameter Jacobian.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RiccatiParameterDerivativeTest extends
                                            TestCase
{
  static final int bits = 192;

  public void testDaDNuMatchesFiniteDifference()
  {
    Real    λ   = new Real("0.1", bits).setName("λ");
    Real    θ   = new Real("0.3", bits).setName("θ");
    Real    ν   = new Real("0.4", bits).setName("ν");
    Real    V0  = new Real("0.09", bits).setName("V0");
    Real    ρ   = new Real("-0.6", bits).setName("ρ");
    Real    μ   = new Real("0.6", bits).setName("μ");
    Real    T   = new Real("1.0", bits).setName("T");
    Real    S0  = new Real("1", bits).setName("S0");
    Real    rr  = new Real("0", bits).setName("rr");
    Context ctx = new Context(λ, θ, ν, V0, ρ, μ, T);
    ctx.registerVariable(S0); ctx.registerVariable(rr);
    Real    K   = new Real("1", bits);

    final int K0 = 2, K1 = 6;

    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx, K, ComplexConstants.zero);
          Complex v = new Complex(); Complex analytic = Complex.newVector(K1 + 1);
          Complex ap = new Complex(); Complex am = new Complex(); Complex fd = new Complex();
          Complex diff = new Complex(); Real mag = new Real(); Real tol = new Real("1e-4", bits);
          Real h = new Real("1e-6", bits); Real nu0 = new Real(); Integer k = new Integer())
    {
      v.set(0.5, 0.3);

      // analytic ∂aₖ/∂ν at the base ν, stored before perturbing
      ComplexPolynomialSequence dadNu = pricer.φ.riccati.parameterDerivative("ν", bits);
      for (int kk = K0; kk <= K1; kk++)
      {
        k.set(kk);
        ComplexPolynomial dak = dadNu.evaluate(k, 1, bits, null);
        dak.evaluate(v, 1, bits, analytic.get(kk));
      }

      // central finite difference of aₖ(v) in ν
      nu0.set(ν);
      for (int kk = K0; kk <= K1; kk++)
      {
        k.set(kk);
        nu0.add(h, bits, ν); pricer.φ.riccati.invalidateCache();
        pricer.φ.a.evaluate(k, 1, bits, null).evaluate(v, 1, bits, ap);
        nu0.sub(h, bits, ν); pricer.φ.riccati.invalidateCache();
        pricer.φ.a.evaluate(k, 1, bits, null).evaluate(v, 1, bits, am);
        ap.sub(am, bits, fd); fd.div(2, bits); fd.div(h, bits);

        diff.set(analytic.get(kk)); diff.sub(fd, bits); diff.abs(bits, mag);
        System.out.println("∂a" + kk + "/∂ν  analytic=" + analytic.get(kk) + "  fd=" + fd + "  |Δ|=" + mag);
        assertTrue("∂a" + kk + "/∂ν analytic vs fd |Δ|=" + mag, mag.compareTo(tol) < 0);
      }
      ν.set(nu0); pricer.φ.riccati.invalidateCache();
    }
    finally
    {
      K.close(); λ.close(); θ.close(); ν.close(); V0.close(); ρ.close(); μ.close(); T.close(); S0.close(); rr.close();
    }
  }
}
