package arb.applications;

import arb.ComplexConstants;
import arb.Real;
import arb.expressions.Context;
import arb.stochastic.processes.heston.RoughHestonEdgeworthCallPrice;
import junit.framework.TestCase;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Validates arb4j rough Heston pricing against MATLAB reference prices from
 * rough_heston_matlab × rough_heston_upstream (2-implementation consensus).
 *
 * Reference prices (12 decimals):
 *   Row 1: S0=100, K=100, T=1,   H=0.3, λ=2,   θ=0.04, ν=0.3,  ρ=-0.7, r=0.1
 *          call=13.449698613933  put=3.933440417529
 *   Row 3: S0=100, K=110, T=2,   H=0.4, λ=3,   θ=0.02, ν=0.2,  ρ=-0.8, r=0.03
 *          call=6.089309268494   put=9.683407962761
 */
public class ReferencePriceAgreementTest extends TestCase
{
  private static final Logger log = LoggerFactory.getLogger(ReferencePriceAgreementTest.class);

  static final int BITS = 256;

  static Context createContext(int bits, double lambda, double theta, double nu,
                               double V0, double rho, double mu,
                               double T, double S0, double rr)
  {
    Context ctx = new Context();
    ctx.registerVariable(new Real(Double.toString(lambda), bits, "λ"));
    ctx.registerVariable(new Real(Double.toString(theta),  bits, "θ"));
    ctx.registerVariable(new Real(Double.toString(nu),     bits, "ν"));
    ctx.registerVariable(new Real(Double.toString(V0),     bits, "V0"));
    ctx.registerVariable(new Real(Double.toString(rho),    bits, "ρ"));
    ctx.registerVariable(new Real(Double.toString(mu),     bits, "μ"));
    ctx.registerVariable(new Real(Double.toString(T),      bits, "T"));
    ctx.registerVariable(new Real(Double.toString(S0),     bits, "S0"));
    ctx.registerVariable(new Real(Double.toString(rr),     bits, "rr"));
    return ctx;
  }

  /** Row 1: short maturity, moderate vol */
  public void testRow1Call() throws Exception
  {
    int bits = BITS;
    try ( Context ctx = createContext(bits,
                                      2.0,      /* λ */
                                      0.04,     /* θ */
                                      0.3,      /* ν */
                                      0.04,     /* V0 */
                                      -0.7,     /* ρ */
                                      0.8,      /* μ = H + 0.5 */
                                      1.0,      /* T */
                                      100.0,    /* S0 */
                                      0.1);     /* rr */
          Real K     = new Real("100", bits);
          Real value = new Real();
          RoughHestonEdgeworthCallPrice price =
            new RoughHestonEdgeworthCallPrice(ctx, K, ComplexConstants.zero) )
    {
      price.call(K, bits, value);
      log.debug("Row1 call = {}", value);
      /* Reference: 13.449698613933 */
      try ( Real ref = new Real("13.449698613933", bits);
            Real diff = new Real())
      {
        value.sub(ref, bits, diff);
        diff.abs();
        double err = diff.doubleValue();
        log.debug("Row1 |Δ| = {}", err);
        assertTrue("Row1 call error too large: " + err, err < 1e-9);
      }
    }
  }

  /** Row 3: longer maturity, OTM call */
  public void testRow3Call() throws Exception
  {
    int bits = BITS;
    try ( Context ctx = createContext(bits,
                                      3.0,      /* λ */
                                      0.02,     /* θ */
                                      0.2,      /* ν */
                                      0.02,     /* V0 */
                                      -0.8,     /* ρ */
                                      0.9,      /* μ = H + 0.5 */
                                      2.0,      /* T */
                                      100.0,    /* S0 */
                                      0.03);    /* rr */
          Real K     = new Real("110", bits);
          Real value = new Real();
          RoughHestonEdgeworthCallPrice price =
            new RoughHestonEdgeworthCallPrice(ctx, K, ComplexConstants.zero) )
    {
      price.call(K, bits, value);
      log.debug("Row3 call = {}", value);
      /* Reference: 6.089309268494 */
      try ( Real ref = new Real("6.089309268494", bits);
            Real diff = new Real())
      {
        value.sub(ref, bits, diff);
        diff.abs();
        double err = diff.doubleValue();
        log.debug("Row3 |Δ| = {}", err);
        assertTrue("Row3 call error too large: " + err, err < 1e-9);
      }
    }
  }
}
