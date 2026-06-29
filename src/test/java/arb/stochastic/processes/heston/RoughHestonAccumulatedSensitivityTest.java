package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * The analytic accumulated sensitivity {@link RoughHestonOptionPricer#callSensitivity}
 * = ∂(optimally-truncated accumulated price)/∂param, validated against a central finite
 * difference of the accumulated price {@link RoughHestonOptionPricer#call}. This is
 * the quantity the full-price calibrator's Jacobian must use instead of finite
 * differences.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonAccumulatedSensitivityTest extends
                                               TestCase
{
  static final int bits = 256;

  public void testAccumulatedSensitivityWrtNu()
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

    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx, new Real("1", bits), ComplexConstants.zero))
    {
      Real analytic = new Real(); Real fd = new Real(); Real pp = new Real(); Real pm = new Real();
      Real h = new Real("1e-6", bits); Real nu0 = new Real(); Real diff = new Real(); Real tol = new Real("1e-5", bits);

      for (String kStr : new String[] { "0.9", "1.0", "1.1" })
      {
        Real strike = new Real(kStr, bits);
        pricer.callSensitivity("ν", strike, bits, analytic);

        nu0.set(ν);
        nu0.add(h, bits, ν); pricer.invalidate(); pricer.call(strike, bits, pp);
        nu0.sub(h, bits, ν); pricer.invalidate(); pricer.call(strike, bits, pm);
        ν.set(nu0); pricer.invalidate();
        pp.sub(pm, bits, fd); fd.div(2, bits); fd.div(h, bits);

        analytic.sub(fd, bits, diff); diff.abs();
        System.out.println("K=" + kStr + "  ∂call/∂ν=" + analytic + "  fd=" + fd + "  |Δ|=" + diff);
        assertTrue("∂call/∂ν at K=" + kStr + " analytic=" + analytic + " vs fd=" + fd + " |Δ|=" + diff, diff.compareTo(tol) < 0);
        strike.close();
      }
    }
    finally
    {
      λ.close(); θ.close(); ν.close(); V0.close(); ρ.close(); μ.close(); T.close(); S0.close(); rr.close();
    }
  }
}
