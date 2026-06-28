package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.RealConstants;
import arb.expressions.Context;
import arb.stochastic.processes.heston.RoughHestonOptionPricer;

/**
 * Speed benchmark that reproduces the exact workload of
 * roughheston_edgeworth_reference.py so we can compare Java vs Python (FLINT/Arb)
 * wall-clock times on identical arithmetic.
 *
 * Workload:
 *   1) 6 call prices at calibrator truth params (lambda=0.1 theta=0.3 nu=0.4
 *      V0=0.09 rho=-0.6 mu=0.6, S0=1, r=0)
 *   2) nu=0 -> Black-Scholes reduction (default params, K=1, T=1)
 *   3) Edgeworth divergence probe (ATM, T=10, nu=1.5, mu=0.55) - raw partial
 *      sums, optimally truncated
 *
 * Run: java -cp <classpath> arb.stochastic.processes.heston.RoughHestonSpeedBenchmark
 */
public class RoughHestonSpeedBenchmark
{
  static final int bits = 128;

  public static void main(String[] args)
  {
    System.out.println("==============================================================================");
    System.out.println("Rough-Heston speed benchmark (Java arb4j)");
    System.out.println("==============================================================================");

    // ---- 6 calibrator market prices ---------------------------------------
    long t0 = System.nanoTime();

    Real lam  = new Real("0.1", bits);
    Real theta = new Real("0.3", bits);
    Real nu   = new Real("0.4", bits);
    Real V0   = new Real("0.09", bits);
    Real rho  = new Real("-0.6", bits);
    Real mu   = new Real("0.6", bits);

    String[][] cases = {
        { "0.5", "0.9", "C" },
        { "0.5", "1.0", "C" },
        { "0.5", "1.1", "P" },
        { "1.0", "0.9", "C" },
        { "1.0", "1.0", "C" },
        { "1.0", "1.1", "P" }
    };

    System.out.println("\n6 calibrator market prices (lambda=0.1 theta=0.3 nu=0.4 V0=0.09 rho=-0.6 mu=0.6):");
    for (String[] c : cases)
    {
      Real T = new Real(c[0], bits);
      Real K = new Real(c[1], bits);
      try ( RoughHestonOptionPricer pricer = buildPricer(T, lam, theta, nu, V0, rho, mu) )
      {
        Real price = new Real();
        Real model = new Real();
        pricer.call(K, bits, price);
        if (c[2].equals("P"))
          putFromCall(price, K, model);
        else
          model.set(price);
        System.out.printf("  T=%s K=%s %s  price=%s%n", c[0], c[1], c[2], model);
        model.close();
        price.close();
      }
      T.close();
      K.close();
    }

    long t1 = System.nanoTime();
    double calibMs = (t1 - t0) / 1e6;
    System.out.printf("%n6 prices: %.3f ms%n", calibMs);

    // ---- nu=0 -> Black-Scholes --------------------------------------------
    long t2 = System.nanoTime();

    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ComplexConstants.zero) )
    {
      pricer.φ.ν.set(0);
      pricer.φ.riccati.invalidateCache();
      pricer.φ.cgf.d.invalidateCache();
      Real price = new Real();
      pricer.call(bits, price);
      System.out.printf("%nnu=0 -> GBS: price=%s%n", price);
      price.close();
    }

    long t3 = System.nanoTime();
    double nu0Ms = (t3 - t2) / 1e6;
    System.out.printf("nu=0 check: %.3f ms%n", nu0Ms);

    // ---- divergence probe -------------------------------------------------
    long t4 = System.nanoTime();

    Real lam2 = new Real("0.1", 256);
    Real theta2 = new Real("0.3", 256);
    Real nu2 = new Real("1.5", 256);
    Real V02 = new Real("0.09", 256);
    Real rho2 = new Real("-0.7", 256);
    Real mu2 = new Real("0.55", 256);
    Real T2 = new Real("10.0", 256);
    Context ctx = new Context(lam2, theta2, nu2, V02, rho2, mu2, T2);
    Real K2 = new Real("1", 256);
    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx, K2, ComplexConstants.zero) )
    {
      pricer.J.set(44);
      Real accumulated = new Real();
      pricer.call(K2, 256, accumulated);
      System.out.printf("%nDivergence probe (ATM, T=10, nu=1.5, mu=0.55):%n");
      System.out.printf("  ACCUMULATED call = %s%n", accumulated);
      accumulated.close();
    }

    long t5 = System.nanoTime();
    double probeMs = (t5 - t4) / 1e6;
    System.out.printf("Divergence probe: %.3f ms%n", probeMs);

    System.out.println("\n==============================================================================");
    System.out.printf("TOTAL: %.3f ms%n", calibMs + nu0Ms + probeMs);
    System.out.println("==============================================================================");

    lam.close(); theta.close(); nu.close(); V0.close(); rho.close(); mu.close();
    lam2.close(); theta2.close(); nu2.close(); V02.close(); rho2.close(); mu2.close(); T2.close(); K2.close();
  }

  private static RoughHestonOptionPricer buildPricer(Real T, Real lam, Real theta, Real nu, Real V0, Real rho, Real mu)
  {
    Real lamC  = new Real(bits); lamC.set(lam);
    Real thetaC = new Real(bits); thetaC.set(theta);
    Real nuC   = new Real(bits); nuC.set(nu);
    Real V0C   = new Real(bits); V0C.set(V0);
    Real rhoC  = new Real(bits); rhoC.set(rho);
    Real muC   = new Real(bits); muC.set(mu);
    Real TC    = new Real(bits); TC.set(T);
    Real S0    = new Real("1", bits);
    Real rr    = new Real("0", bits);
    Context ctx = new Context(lamC, thetaC, nuC, V0C, rhoC, muC, TC);
    ctx.registerVariable(S0);
    ctx.registerVariable(rr);
    Real strike0 = new Real("1", bits);
    return new RoughHestonOptionPricer(ctx, strike0, ComplexConstants.zero);
  }

  private static Real putFromCall(Real callPrice, Real K, Real dst)
  {
    callPrice.sub(RealConstants.one, bits, dst);
    dst.add(K, bits, dst);
    return dst;
  }
}
