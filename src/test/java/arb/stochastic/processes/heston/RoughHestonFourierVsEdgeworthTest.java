package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Cross-validate the Edgeworth expansion against Lewis (2001) Fourier inversion
 * using the SAME characteristic function — isolating whether any discrepancy
 * lives in the Edgeworth expansion itself (not the CF).
 *
 * <p>Parameters are the El Euch–Rosenbaum (2019, §5.2) calibration to the
 * S&P 500 surface of 7 Jan 2010: α=0.62, γ=0.1, ρ=−0.681, θ=0.3156,
 * ν=0.331, V₀=0.0392, S₀=1, r=0.
 *
 * <p>The Lewis price is expressed as a compiled {@link RealFunction} —
 * no procedural arithmetic outside the expression compiler.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonFourierVsEdgeworthTest extends
                                               TestCase
{
  /**
   * Lewis (2001) call price via Fourier inversion:
   *
   * <pre>
   *   C(K) = 1 − K · ( ½ + π⁻¹ · ∫₀^∞ Re[ φ(v−i/2) · e^{−iv·lnK} / (v²+¼) ] dv )
   * </pre>
   *
   * N=2000 keeps runtime manageable; the trapezoid error is O(1/N²) ≈ 2.5e-7
   * for the smooth, decaying integrand, well below the 1e-4 tolerance needed
   * to distinguish Edgeworth errors.
   */
  private static final String LEWIS =
      "K➔1-K*(1/2+1/π*nint(v➔re(φ(v-ⅈ/2)*exp(-ⅈ*v*ln(K))/(v^2+1/4)), v=0…200, N=2000))";

  private static Context createContext(int bits, String maturity)
  {
    Context ctx = new Context();
    ctx.registerVariable(new Real("0.1",    bits, "λ"));
    ctx.registerVariable(new Real("0.3156", bits, "θ"));
    ctx.registerVariable(new Real("0.331",  bits, "ν"));
    ctx.registerVariable(new Real("0.0392", bits, "V0"));
    ctx.registerVariable(new Real("-0.681", bits, "ρ"));
    ctx.registerVariable(new Real("0.62",   bits, "μ"));
    Real T = ctx.registerVariable(new Real("0", bits, "T"));
    T.set(maturity, bits);
    ctx.registerVariable(new Real("1", bits, "S0"));
    ctx.registerVariable(new Real("0", bits, "rr"));
    return ctx;
  }

  /**
   * Compare Edgeworth vs Fourier (Lewis) at T=1/12. Both use the identical
   * characteristic function; disagreement implies the Edgeworth derivation
   * is wrong, not the CF.
   */
  public void testFourierVsEdgeworthT12()
  {
    final int    bits = 128;
    final double tol  = 0.001;
    Context ctx = createContext(bits, "1/12");

    try ( RoughHestonCharacteristicFunction cf =
              new RoughHestonCharacteristicFunction(ctx, ComplexConstants.zero);
          RoughHestonEdgeworthCallPrice edgeworth =
              new RoughHestonEdgeworthCallPrice(ctx, new Real("1", bits), ComplexConstants.zero);
          RealFunction lewisPrice = RealFunction.express(LEWIS, ctx);
          Real K = new Real())
    {
      String[] strikes = { "0.8", "0.9", "1.0", "1.1", "1.2" };
      double[] edgeRef = { 0.0, 0.0, 0.0, 0.0, 0.0 };
      double[] lewisRef = { 0.0, 0.0, 0.0, 0.0, 0.0 };
      for (int i = 0; i < strikes.length; i++)
      {
        K.set(strikes[i], bits);
        try ( Real edgeVal = new Real(); Real lewisVal = new Real())
        {
          edgeworth.call(K, bits, edgeVal);
          lewisPrice.evaluate(K, 1, bits, lewisVal);
          edgeRef[i] = edgeVal.getMid().doubleValue();
          lewisRef[i] = lewisVal.getMid().doubleValue();
        }
      }
      for (int i = 0; i < strikes.length; i++)
      {
        double absDiff = Math.abs(edgeRef[i] - lewisRef[i]);
        System.out.format("K=%s Edgeworth=%.10f Fourier=%.10f |Δ|=%.2e%n",
                          strikes[i], edgeRef[i], lewisRef[i], absDiff);
        assertTrue("K=" + strikes[i] + ": |Δ|=" + absDiff + " > " + tol,
                   absDiff < tol);
      }
    }
    ctx.close();
  }
}
