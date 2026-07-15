package arb.stochastic.processes.heston;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.ComplexConstants;
import arb.Real;
import arb.expressions.Context;

/**
 * Port of bonanzai's {@code RoughHestonEdgeworthReferenceTest} — validates the
 * arb4j Edgeworth pricer against the published reference values in
 * Boyarchenko, De Innocentis, Levendorskiĭ, <em>Fast reliable pricing and
 * calibration of the rough Heston model</em>, arxiv:2508.15080.
 *
 * <p>
 * Parameter set (1.3) from the paper, calibrated to the S&amp;P IV surface as
 * of 7 January 2010 (El Euch–Rosenbaum 2019 §5.2):
 *
 * <pre>
 *   α = 0.62,  γ = 0.1,   ρ = −0.681,
 *   θ = 0.3156, ν = 0.331, v₀ = 0.0392,
 *   S₀ = 1,    r = 0
 * </pre>
 */
public class RoughHestonEdgeworthReferenceTest
{
  private static final Logger log = LoggerFactory.getLogger(RoughHestonEdgeworthReferenceTest.class);

  private static final String[] STRIKES_T1 =
  { "0.95", "0.975", "1.0", "1.025", "1.05" };

  private static final String[] REF_T1 =
  { "0.00000024557955", "0.000129117047", "0.0050111443104", "0.0000916277402", "0.000000033118" };

  @Test
  public void testTable1()
  {
    final int bits = 512;
    Context ctx = createContext(bits, "1/252");
    run(ctx, bits, STRIKES_T1, REF_T1);
  }

  private static final String[] STRIKES_T2 =
  { "0.8", "0.85", "0.9", "0.95", "1.0", "1.05", "1.1", "1.15" };

  private static final String[] REF_T2 =
  { "0.0000178", "0.000189042", "0.001390943", "0.006975898",
    "0.023896768", "0.006556374", "0.000978149", "0.0000673" };

  @Test
  public void testTable2()
  {
    final int bits = 512;
    Context ctx = createContext(bits, "1/52");
    run(ctx, bits, STRIKES_T2, REF_T2);
  }

  private static Context createContext(int bits, String maturity)
  {
    Context ctx = new Context();
    ctx.registerVariable(new Real("0.1", bits, "λ"));
    ctx.registerVariable(new Real("0.3156", bits, "θ"));
    ctx.registerVariable(new Real("0.331", bits, "ν"));
    ctx.registerVariable(new Real("0.0392", bits, "V0"));
    ctx.registerVariable(new Real("-0.681", bits, "ρ"));
    ctx.registerVariable(new Real("0.62", bits, "μ"));
    Real T = ctx.registerVariable(new Real("0", bits, "T"));
    T.set(maturity, bits);
    ctx.registerVariable(new Real("1", bits, "S0"));
    ctx.registerVariable(new Real("0", bits, "rr"));
    return ctx;
  }

  private static void run(Context ctx, int bits, String[] strikes, String[] ref)
  {
    Real strike = new Real("1", bits);
    Real one    = new Real("1", bits);

    try ( RoughHestonEdgeworthCallPrice price = new RoughHestonEdgeworthCallPrice(ctx,
                                                                                   strike,
                                                                                   ComplexConstants.zero);
          Real value = new Real(); Real K = new Real(); Real otm = new Real();
          Real refV = new Real())
    {
      for (int i = 0; i < strikes.length; i++)
      {
        K.set(strikes[i], bits);
        price.call(K, bits, value);

        if (K.compareTo(one) < 0)
        {
          value.sub(1, bits, otm);
          otm.add(K, bits, otm);
        }
        else
          otm.set(value);

        refV.set(ref[i], bits);
        log.debug("K={}: otm={} ref={}", strikes[i], otm, refV);
        assertTrue("K=" + strikes[i] + ": arb4j ball " + otm + " does not contain reference point " + refV,
                    otm.contains(refV));
      }
    }
  }
}
