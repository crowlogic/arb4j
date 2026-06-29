package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * The analytic sensitivity dΠ = ∂Π_J/∂param of the Edgeworth–Hermite price
 * partial sum (leading Ψ plus the hand-written ε-derivatives of c and ΔCseq)
 * validated against a central finite difference of priceExpr at a FIXED Hermite
 * order J — i.e. each raw partial sum, term by term.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonPriceSensitivityTest extends
                                            TestCase
{
  static final int bits = 256;

  public void testPricePartialSumSensitivityWrtNu()
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
      pricer.J.set(8); // fixed Hermite order: validate the partial sum's sensitivity

      Real analytic = new Real(); Real fd = new Real(); Real pp = new Real(); Real pm = new Real();
      Real h = new Real("1e-12", bits); Real nu0 = new Real(); Real diff = new Real(); Real tol = new Real("1e-6", bits);

      for (String kStr : new String[] { "-0.1", "0", "0.08" })
      {
        Real kLog = new Real(kStr, bits);
        pricer.seedParameterDerivative("ν", bits);
        pricer.priceSensitivity.evaluate(kLog, 1, bits, analytic);

        nu0.set(ν);
        nu0.add(h, bits, ν); pricer.invalidate(); pricer.priceExpr.evaluate(kLog, 1, bits, pp);
        nu0.sub(h, bits, ν); pricer.invalidate(); pricer.priceExpr.evaluate(kLog, 1, bits, pm);
        ν.set(nu0); pricer.invalidate();
        pp.sub(pm, bits, fd); fd.div(2, bits); fd.div(h, bits);

        analytic.sub(fd, bits, diff); diff.abs();
        System.out.println("k=" + kStr + "  dΠ=" + analytic + "  fd=" + fd + "  |Δ|=" + diff);
        assertTrue("∂Π_8/∂ν at k=" + kStr + " analytic=" + analytic + " vs fd=" + fd + " |Δ|=" + diff, diff.compareTo(tol) < 0);
        kLog.close();
      }
    }
    finally
    {
      K.close(); λ.close(); θ.close(); ν.close(); V0.close(); ρ.close(); μ.close(); T.close(); S0.close(); rr.close();
    }
  }
}
