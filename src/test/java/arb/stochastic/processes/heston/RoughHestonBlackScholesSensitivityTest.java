package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * The pricer's analytic leading-term sensitivity Ċ = ∂C/∂ν (built into the
 * pricer by the chain rule through mean=κ(1), variance=κ(2), σ=√κ(2) with the
 * exact dκ) validated against a central finite-difference oracle on C.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonBlackScholesSensitivityTest extends
                                                   TestCase
{
  static final int bits = 256;

  public void testCallSensitivityWrtNu()
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

    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx, K, ComplexConstants.zero))
    {

      Real analytic = new Real();
      Real fd       = new Real();
      Real pp       = new Real();
      Real pm       = new Real();
      Real h        = new Real("1e-11", bits);
      Real nu0      = new Real();
      Real diff     = new Real();
      Real tol      = new Real("1e-5", bits);

      for (String kStr : new String[] { "-0.1", "0", "0.08" })
      {
        Real kLog = new Real(kStr, bits);
        pricer.seedParameterDerivative("ν", bits);
        pricer.blackScholesSensitivity.evaluate(kLog, 1, bits, analytic);

        nu0.set(ν);
        nu0.add(h, bits, ν); pricer.invalidate(); pricer.blackScholes.evaluate(kLog, 1, bits, pp);
        nu0.sub(h, bits, ν); pricer.invalidate(); pricer.blackScholes.evaluate(kLog, 1, bits, pm);
        ν.set(nu0); pricer.invalidate();
        pp.sub(pm, bits, fd); fd.div(2, bits); fd.div(h, bits);

        analytic.sub(fd, bits, diff); diff.abs();
        System.out.println("k=" + kStr + "  analytic ∂C/∂ν=" + analytic + "  fd=" + fd + "  |Δ|=" + diff);
        assertTrue("∂C/∂ν at k=" + kStr + " analytic=" + analytic + " vs fd=" + fd, diff.compareTo(tol) < 0);
        kLog.close();
      }
      analytic.close(); fd.close(); pp.close(); pm.close(); h.close(); nu0.close(); diff.close(); tol.close();
    }
    finally
    {
      K.close(); λ.close(); θ.close(); ν.close(); V0.close(); ρ.close(); μ.close(); T.close(); S0.close(); rr.close();
    }
  }
}
