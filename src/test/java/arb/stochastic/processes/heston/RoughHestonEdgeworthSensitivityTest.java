package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * The Edgeworth correction coefficients c(n) are defined by the self-referential
 * Blinnikov–Moessner recurrence c(n) = (1/n)Σₖ k·S(k)·c(n−k). Its parameter
 * derivative dc = ∂c/∂param is the linearisation of that recurrence — itself a
 * self-referential sequence — written directly over the already-exact dS:
 *
 * <pre>
 *   dstdev = dκ(2)/(2·stdev)
 *   dS(k)  = dκ(k)/(stdev^k·Γ(k+1)) − S(k)·k·dstdev/stdev
 *   dc(n)  = (1/n)Σₖ k·( dS(k)·c(n−k) + S(k)·dc(n−k) )      n ≥ 3
 * </pre>
 *
 * validated against a central finite-difference oracle on {@code pricer.c}. No
 * symbolic self-referential differentiation is needed — the recurrence is the
 * derivative.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonEdgeworthSensitivityTest extends
                                                TestCase
{
  static final int bits = 256;

  public void testEdgeworthCoefficientDerivativeWrtNu()
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
      Context pc = pricer.pricingContext;

      RealNullaryFunction.express("dstdev", "dκ(2)/(2*stdev())", pc);
      RealSequence.express("dS", "k➔dκ(k)/(stdev()^k*Γ(k+1)) - S(k)*k*dstdev()/stdev()", pc);
      RealSequence dc =
        RealSequence.express("dc", "n➔when(n<3,0,else,(1/n)*Σk➔k*(dS(k)*c(n-k)+S(k)*dc(n-k)){k=3..n})", pc);

      Real        analytic = new Real();
      Real        fd       = new Real();
      Real        pp       = new Real();
      Real        pm       = new Real();
      Real        h        = new Real("1e-12", bits);
      Real        nu0      = new Real();
      Real        diff     = new Real();
      Real        tol      = new Real("1e-5", bits);
      arb.Integer nIdx     = new arb.Integer();

      for (int n = 3; n <= 5; n++)
      {
        nIdx.set(n);
        pricer.seedParameterDerivative("ν", bits);
        dc.evaluate(nIdx, 1, bits, analytic);

        nu0.set(ν);
        nu0.add(h, bits, ν); pricer.invalidate(); pricer.c.evaluate(nIdx, 1, bits, pp);
        nu0.sub(h, bits, ν); pricer.invalidate(); pricer.c.evaluate(nIdx, 1, bits, pm);
        ν.set(nu0); pricer.invalidate();
        pp.sub(pm, bits, fd); fd.div(2, bits); fd.div(h, bits);

        analytic.sub(fd, bits, diff); diff.abs();
        System.out.println("n=" + n + "  analytic ∂c/∂ν=" + analytic + "  fd=" + fd + "  |Δ|=" + diff);
        assertTrue("∂c(" + n + ")/∂ν analytic=" + analytic + " vs fd=" + fd + " |Δ|=" + diff, diff.compareTo(tol) < 0);
      }
      analytic.close(); fd.close(); pp.close(); pm.close(); h.close(); nu0.close(); diff.close(); tol.close(); nIdx.close();
    }
    finally
    {
      K.close(); λ.close(); θ.close(); ν.close(); V0.close(); ρ.close(); μ.close(); T.close(); S0.close(); rr.close();
    }
  }
}
