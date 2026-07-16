package arb.stochastic.processes.heston;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Lewis (2001) Fourier inversion pricer for the rough Heston model. Produces
 * reference call prices independently of the Edgeworth expansion — the
 * characteristic function is the only shared component.
 *
 * <p>Parameters are the El Euch–Rosenbaum (2019, §5.2) calibration to the
 * S&P 500 surface of 7 Jan 2010: α=0.62, γ=0.1, ρ=−0.681, θ=0.3156,
 * ν=0.331, V₀=0.0392, S₀=1, r=0.
 *
 * <p>The Lewis formula (Lewis 2001, "A Simple Option Formula for General
 * Jump-Diffusion and Other Exponential Levy Processes"):
 *
 * <pre>
 *   C(K) = 1 − K · ( ½ + π⁻¹ · ∫₀^∞ Re[ φ(v−i/2) · e^{−iv·lnK} / (v²+¼) ] dv )
 * </pre>
 *
 * The computed values serve as the reference benchmark for the Edgeworth
 * expansion in {@link RoughHestonEdgeworthCallPriceTest}.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonFourierPricerTest extends
                                           TestCase
{
  public static final Logger log = LoggerFactory.getLogger(RoughHestonFourierPricerTest.class);
  private static final String LEWIS =
      "K➔1.0-K*(0.5+1.0/π*nint(v➔re(φ(v-ⅈ/2)*exp(-ⅈ*v*ln(K))/(v^2+0.25)), v=0…200, N=2000))";

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
   * Print call prices at T=1/252 (one trading day) for the reference strike
   * grid. The printed values become the reference for the Edgeworth test.
   */
  public void testPrintLewisPricesT1()
  {
    final int bits = 256;
    Context ctx = createContext(bits, "1/252");
    try ( RoughHestonCharacteristicFunction cf =
              new RoughHestonCharacteristicFunction(ctx, ComplexConstants.zero);
          RealFunction lewis = RealFunction.express(LEWIS, ctx);
          Real K = new Real())
    {
      String[] strikes = { "0.95", "0.975", "1.0", "1.025", "1.05" };
      for (int i = 0; i < strikes.length; i++)
      {
        K.set(strikes[i], bits);
        try ( Real price = new Real())
        {
          lewis.evaluate(K, 1, bits, price);
          log.debug("T=1/252 K={} C={}", strikes[i], String.format("%.15g", price.getMid().doubleValue()));
        }
      }
    }
    ctx.close();
  }

  /**
   * Print call prices at T=1/12 (one month).
   */
  public void testPrintLewisPricesT12()
  {
    final int bits = 256;
    Context ctx = createContext(bits, "1/12");
    try ( RoughHestonCharacteristicFunction cf =
              new RoughHestonCharacteristicFunction(ctx, ComplexConstants.zero);
          RealFunction lewis = RealFunction.express(LEWIS, ctx);
          Real K = new Real())
    {
      String[] strikes = { "0.8", "0.85", "0.9", "0.95", "1.0", "1.05", "1.1", "1.15" };
      for (int i = 0; i < strikes.length; i++)
      {
        K.set(strikes[i], bits);
        try ( Real price = new Real())
        {
          lewis.evaluate(K, 1, bits, price);
          log.debug("T=1/12 K={} C={}", strikes[i], String.format("%.15g", price.getMid().doubleValue()));
        }
      }
    }
    ctx.close();
  }

  /**
   * Print call prices at T=1/52 (one week).
   */
  public void testPrintLewisPricesT52()
  {
    final int bits = 256;
    Context ctx = createContext(bits, "1/52");
    try ( RoughHestonCharacteristicFunction cf =
              new RoughHestonCharacteristicFunction(ctx, ComplexConstants.zero);
          RealFunction lewis = RealFunction.express(LEWIS, ctx);
          Real K = new Real())
    {
      String[] strikes = { "0.8", "0.85", "0.9", "0.95", "1.0", "1.05", "1.1", "1.15", "1.2" };
      for (int i = 0; i < strikes.length; i++)
      {
        K.set(strikes[i], bits);
        try ( Real price = new Real())
        {
          lewis.evaluate(K, 1, bits, price);
          log.debug("T=1/52 K={} C={}", strikes[i], String.format("%.15g", price.getMid().doubleValue()));
        }
      }
    }
    ctx.close();
  }
}
