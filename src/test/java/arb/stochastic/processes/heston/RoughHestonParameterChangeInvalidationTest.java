package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * After a model-parameter change, {@link RoughHestonOptionPricer#invalidate()}
 * must drop the cache of EVERY function compiled in the pricing context, not a
 * hand-picked subset. The put value U reads mean()=κ(1) and variance()=κ(2)
 * directly, so a pricer that evaluated U at one ν and then moved to another ν
 * must return the same U as one freshly built at the second ν — otherwise U
 * carries a stale mean()/variance() and the value moves (it was off by 7.9e-5,
 * which made the Levenberg-Marquardt calibrator stall).
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonParameterChangeInvalidationTest extends
                                                       TestCase
{
  static final int bits = 256;

  RoughHestonOptionPricer fresh(String nu)
  {
    Real    λ   = new Real("0.1", bits).setName("λ");
    Real    θ   = new Real("0.3", bits).setName("θ");
    Real    ν   = new Real(nu, bits).setName("ν");
    Real    V0  = new Real("0.09", bits).setName("V0");
    Real    ρ   = new Real("-0.6", bits).setName("ρ");
    Real    μ   = new Real("0.6", bits).setName("μ");
    Real    T   = new Real("0.5", bits).setName("T");
    Real    S0  = new Real("1", bits).setName("S0");
    Real    rr  = new Real("0", bits).setName("rr");
    Context ctx = new Context(λ, θ, ν, V0, ρ, μ, T);
    ctx.registerVariable(S0); ctx.registerVariable(rr);
    RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx, new Real("1", bits), ComplexConstants.zero);
    return pricer;
  }

  public void testPutInvariantUnderParameterChange()
  {
    Real k         = new Real("0.08", bits);
    Real reference = new Real();
    Real moved     = new Real();

    try ( RoughHestonOptionPricer pricer = fresh("0.4"))
    {
      pricer.blackScholesPut.evaluate(k, 1, bits, reference); // U at ν=0.4, freshly built
    }
    try ( RoughHestonOptionPricer pricer = fresh("0.28"))
    {
      pricer.blackScholesPut.evaluate(k, 1, bits, new Real()); // touch U at ν=0.28 first
      pricer.φ.ν.set(new Real("0.4", bits));
      pricer.invalidate();
      pricer.blackScholesPut.evaluate(k, 1, bits, moved);      // then U at ν=0.4
    }

    try ( Real diff = new Real(); Real tol = new Real("1e-30", bits))
    {
      reference.sub(moved, bits, diff).abs();
      System.out.println("U(0.4) fresh=" + reference + "  U(0.4) after 0.28=" + moved + "  |Δ|=" + diff);
      assertTrue("put U must be invariant under a parameter change: |Δ|=" + diff, diff.compareTo(tol) < 0);
    }
    finally
    {
      k.close(); reference.close(); moved.close();
    }
  }
}
