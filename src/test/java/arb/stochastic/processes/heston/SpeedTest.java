package arb.stochastic.processes.heston;

import arb.*;
import arb.expressions.Context;
import junit.framework.TestCase;

public class SpeedTest extends TestCase {
  public void testActualCallTiming() throws Exception {
    int bits = 512;
    Context ctx = new Context();
    try (
      Real λ = new Real("0.1", bits, "λ");
      Real θ = new Real("0.3156", bits, "θ");
      Real ν = new Real("0.331", bits, "ν");
      Real V0 = new Real("0.0392", bits, "V0");
      Real ρ = new Real("-0.681", bits, "ρ");
      Real μ = new Real("0.62", bits, "μ");
      Real T = new Real("0", bits, "T")
    ) {
      T.set(1).div(252, bits, T);
      ctx.registerVariable(λ); ctx.registerVariable(θ); ctx.registerVariable(ν);
      ctx.registerVariable(V0); ctx.registerVariable(ρ); ctx.registerVariable(μ);
      ctx.registerVariable(T);
    }
    Real S0 = new Real("1", bits, "S0");
    Real rate = new Real("0", bits, "rr");
    ctx.registerVariable(S0); ctx.registerVariable(rate);
    Real strike = new Real("1", bits);

    try (RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx, strike, ComplexConstants.zero);
         Real price = new Real(); Real K = new Real()) {
      // Time call() for K=0.95 (first Table 1 strike)
      K.set("0.95", bits);
      System.out.println("Calling pricer.call() for K=0.95...");
      long t0 = System.nanoTime();
      pricer.call(K, bits, price);
      System.out.printf("call() done: price=%.10e  time=%.2fs%n", price.doubleValue(), (System.nanoTime()-t0)/1e9);

      // Also time K=1.0 (ATM)
      K.set("1.0", bits);
      System.out.println("Calling pricer.call() for K=1.0...");
      t0 = System.nanoTime();
      pricer.call(K, bits, price);
      System.out.printf("call() done: price=%.10e  time=%.2fs%n", price.doubleValue(), (System.nanoTime()-t0)/1e9);
    }
  }
}
