package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import junit.framework.TestCase;

/**
 * {@link RoughHestonCumulantSequence} (cumulants as point-derivatives of the
 * CGF polynomial, no coefficient access) reproduces the existing κ to full
 * working precision.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonCumulantSequenceTest extends
                                             TestCase
{
  static final int bits = 256;

  public void testCumulantsFromCgfDerivatives()
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
      // CGF as a polynomial: Σ_k T^{kμ+1}·d(k), a single ring-level sum of the d_k.
      ComplexPolynomialNullaryFunction Φ      = ComplexPolynomialNullaryFunction.express("Φ",
                                                                                         "Σk➔T^(k*μ+1)*d(k){k=0..∞}",
                                                                                         pricer.pricingContext);
      RoughHestonCumulantSequence      κ      = new RoughHestonCumulantSequence(Φ);

      Real                             viaD   = new Real();
      Real                             direct = new Real();
      Real                             diff   = new Real();
      Real                             tol    = new Real("1e-30",
                                                         bits);
      Integer                          m      = new Integer();

      for (int j = 1; j <= 6; j++)
      {
        m.set(j);
        κ.evaluate(m, 1, bits, viaD);
        pricer.κ.evaluate(m, 1, bits, direct);
        viaD.sub(direct, bits, diff).abs();
        System.out.println("m=" + j + "  κ via Φ^(m)(0)=" + viaD + "  κ existing=" + direct + "  |Δ|=" + diff);
        assertTrue("κ(" + j + ") via CGF derivative=" + viaD + " vs existing=" + direct + " |Δ|=" + diff,
                   diff.compareTo(tol) < 0);
      }
      viaD.close();
      direct.close();
      diff.close();
      tol.close();
      m.close();
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
