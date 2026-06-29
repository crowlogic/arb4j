package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * Analytic ∂κ_j/∂ν exposed by the pricer's {@code dκ}: ∂a/∂ν = da is the linear
 * recurrence whose seeds are the coefficient-polynomial derivatives ∂P/∂ν,
 * ∂Q/∂ν, ∂R/∂ν (plain polynomial derivatives); dd = ∂d/∂ν and dκ = ∂κ/∂ν are
 * the identical d and κ definitions over those derivative inputs. Selecting the
 * parameter via {@link RoughHestonOptionPricer#seedParameterDerivative} and
 * reading {@code pricer.dκ} is validated against a central finite-difference
 * oracle on {@code pricer.κ}.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonCumulantSensitivityTest extends
                                                TestCase
{
  static final int bits = 256;

  public void testCumulantDerivativeWrtNu()
  {
    Real    λ   = new Real("0.1",
                           bits).setName("λ");
    Real    θ   = new Real("0.3",
                           bits).setName("θ");
    Real    ν   = new Real("0.4",
                           bits).setName("ν");
    Real    V0  = new Real("0.09",
                           bits).setName("V0");
    Real    ρ   = new Real("-0.6",
                           bits).setName("ρ");
    Real    μ   = new Real("0.6",
                           bits).setName("μ");
    Real    T   = new Real("1.0",
                           bits).setName("T");
    Real    S0  = new Real("1",
                           bits).setName("S0");
    Real    rr  = new Real("0",
                           bits).setName("rr");
    Context ctx = new Context(λ,
                              θ,
                              ν,
                              V0,
                              ρ,
                              μ,
                              T);
    ctx.registerVariable(S0);
    ctx.registerVariable(rr);
    Real K = new Real("1",
                      bits);

    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx,
                                                                       K,
                                                                       ComplexConstants.zero))
    {

      Real        analytic = new Real();
      Real        fd       = new Real();
      Real        pp       = new Real();
      Real        pm       = new Real();
      Real        h        = new Real("1e-12",
                                      bits);
      Real        nu0      = new Real();
      Real        diff     = new Real();
      Real        tol      = new Real("1e-6",
                                      bits);
      arb.Integer jIdx     = new arb.Integer();

      for (int j = 2; j <= 5; j++)
      {
        jIdx.set(j);
        pricer.seedParameterDerivative("ν", bits);
        pricer.dκ.evaluate(jIdx, 1, bits, analytic);

        nu0.set(ν);
        nu0.add(h, bits, ν);
        pricer.invalidate();
        pricer.κ.evaluate(jIdx, 1, bits, pp);
        nu0.sub(h, bits, ν);
        pricer.invalidate();
        pricer.κ.evaluate(jIdx, 1, bits, pm);
        ν.set(nu0);
        pricer.invalidate();
        pp.sub(pm, bits, fd);
        fd.div(2, bits);
        fd.div(h, bits);

        analytic.sub(fd, bits, diff);
        diff.abs();
        System.out.println("j=" + j + "  analytic ∂κ/∂ν=" + analytic + "  fd=" + fd + "  |Δ|=" + diff);
        assertTrue("∂κ(" + j + ")/∂ν analytic=" + analytic + " vs fd=" + fd + " |Δ|=" + diff,
                   diff.compareTo(tol) < 0);
      }
      analytic.close();
      fd.close();
      pp.close();
      pm.close();
      h.close();
      nu0.close();
      diff.close();
      tol.close();
      jIdx.close();
    }
    finally
    {
      K.close();
      λ.close();
      θ.close();
      ν.close();
      V0.close();
      ρ.close();
      μ.close();
      T.close();
      S0.close();
      rr.close();
    }
  }
}
