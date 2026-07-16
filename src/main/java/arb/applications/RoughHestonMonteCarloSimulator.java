package arb.applications;

import arb.Real;
import arb.RealConstants;
import arb.arblib;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;
import arb.functions.real.RealNullaryFunction;
import arb.stochastic.processes.RealWhiteNoiseProcess;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "rough-heston-mc")
public class RoughHestonMonteCarloSimulator implements Runnable, AutoCloseable
{
  @Option(names = "--S0",     defaultValue = "1")      private String S0s;
  @Option(names = "--r",      defaultValue = "0")      private String rs;
  @Option(names = "--q",      defaultValue = "0")      private String qs;
  @Option(names = "--T",      defaultValue = "1")      private String Ts;
  @Option(names = "--kappa",  defaultValue = "0.3")    private String κs;
  @Option(names = "--theta",  defaultValue = "0.02")   private String θs;
  @Option(names = "--nu",     defaultValue = "0.3")    private String σs;
  @Option(names = "--V0",     defaultValue = "0.02")   private String V0s;
  @Option(names = "--rho",    defaultValue = "-0.7")   private String ρs;
  @Option(names = "--steps",  defaultValue = "200")    private int    numSteps;
  @Option(names = "--bits",   defaultValue = "128")    private int    bits;
  @Option(names = "--K",      defaultValue = "1.0")    private String Ks;
  @Option(names = "--seed1",  defaultValue = "42")     private long   seed1;
  @Option(names = "--seed2",  defaultValue = "137")    private long   seed2;
  @Option(names = "--minPaths", defaultValue = "1000") private int    minPaths;
  @Option(names = "--maxPaths", defaultValue = "1000000") private int maxPaths;

  private RealNullaryFunction S0fn;
  private RealNullaryFunction rFn;
  private RealNullaryFunction qFn;
  private RealNullaryFunction Tfn;
  private RealNullaryFunction κfn;
  private RealNullaryFunction θfn;
  private RealNullaryFunction σfn;
  private RealNullaryFunction V0fn;
  private RealNullaryFunction ρfn;
  private RealNullaryFunction Kfn;

  @Override
  public void close()
  {
    if (S0fn != null) S0fn.close();
    if (rFn  != null) rFn.close();
    if (qFn  != null) qFn.close();
    if (Tfn  != null) Tfn.close();
    if (κfn  != null) κfn.close();
    if (θfn  != null) θfn.close();
    if (σfn  != null) σfn.close();
    if (V0fn != null) V0fn.close();
    if (ρfn  != null) ρfn.close();
    if (Kfn  != null) Kfn.close();
  }

  @Override
  public void run()
  {
    S0fn = RealNullaryFunction.express(S0s);
    rFn  = RealNullaryFunction.express(rs);
    qFn  = RealNullaryFunction.express(qs);
    Tfn  = RealNullaryFunction.express(Ts);
    κfn  = RealNullaryFunction.express(κs);
    θfn  = RealNullaryFunction.express(θs);
    σfn  = RealNullaryFunction.express(σs);
    V0fn = RealNullaryFunction.express(V0s);
    ρfn  = RealNullaryFunction.express(ρs);
    Kfn  = RealNullaryFunction.express(Ks);

    try ( Context ctx = new Context();
          Real s = S0fn.evaluate(bits); Real r = rFn.evaluate(bits);
          Real q  = qFn.evaluate(bits);  Real T = Tfn.evaluate(bits);
          Real κ  = κfn.evaluate(bits);  Real θ = θfn.evaluate(bits);
          Real σ  = σfn.evaluate(bits);  Real v = V0fn.evaluate(bits);
          Real ρ  = ρfn.evaluate(bits);  Real K = Kfn.evaluate(bits);
          Real h   = T.div(numSteps, bits);
          Real d   = r.sub(q, bits); )
    {
      Real N = Real.valueOf(numSteps);

      s.setName("s");  ctx.registerVariable(s);
      r.setName("r");  ctx.registerVariable(r);
      q.setName("q");  ctx.registerVariable(q);
      T.setName("T");  ctx.registerVariable(T);
      κ.setName("κ");  ctx.registerVariable(κ);
      θ.setName("θ");  ctx.registerVariable(θ);
      σ.setName("σ");  ctx.registerVariable(σ);
      v.setName("v");  ctx.registerVariable(v);
      ρ.setName("ρ");  ctx.registerVariable(ρ);
      K.setName("K");  ctx.registerVariable(K);
      h.setName("h");  ctx.registerVariable(h);
      d.setName("d");  ctx.registerVariable(d);
      N.setName("N");  ctx.registerVariable(N);

      Real W = Real.newVector(numSteps);
      Real Z = Real.newVector(numSteps);
      W.setName("W");  ctx.registerVariable(W);
      Z.setName("Z");  ctx.registerVariable(Z);

      ctx.declare("V", Integer.class, Real.class, RealSequence.class);

       RealSequence.express("V",
         "V:n➔when(n=0, v, else, "
       + "V(n-1) + κ*(θ - max(V(n-1), 0))*h + σ*√(max(V(n-1), 0))*(ρ*W[n-1] + √(1-ρ²)*Z[n-1]))",
         ctx);

      RealNullaryFunction payoffCall = RealNullaryFunction.express(
        "max(s*exp(d*T + Σn➔( -max(V(n), 0)/2*h + √(max(V(n), 0))*W[n] ){n=0…N-1}) - K, 0)",
        ctx);

      RealNullaryFunction payoffPut = RealNullaryFunction.express(
        "max(K - s*exp(d*T + Σn➔( -max(V(n), 0)/2*h + √(max(V(n), 0))*W[n] ){n=0…N-1}), 0)",
        ctx);

      for (int nPaths = minPaths; nPaths <= maxPaths; nPaths *= 2)
      {
        System.err.printf("[convergence] %d paths%n", nPaths);
        boolean converged;

        try ( SimResult r1 = simulate(nPaths, seed1, W, Z, payoffCall, payoffPut, K, s);
              SimResult r2 = simulate(nPaths, seed2, W, Z, payoffCall, payoffPut, K, s); )
        {
          converged = r1.callBall.contains(r2.callBall)
                   && r2.callBall.contains(r1.callBall);

          System.out.printf("%s %s %s %s %s %s %s 1.0%n",
            K, T,
            r1.callBall.getMid(), r1.callBall.getRad(),
            r1.putBall.getMid(), r1.putBall.getRad(),
            r1.parityResidual);
        }

        if (converged)
        {
          System.err.printf("[convergence] CONVERGED%n");
          return;
        }
        System.err.printf("[convergence] not converged, doubling%n");
      }
      System.err.printf("[convergence] WARNING: did not converge within %d paths%n", maxPaths);
    }
  }

  private SimResult simulate(int nPaths, long seed,
                               Real W, Real Z,
                               RealNullaryFunction payoffCall,
                               RealNullaryFunction payoffPut,
                               Real K, Real s)
  {
    SimResult result = new SimResult(bits);

    Real callPayoffs = Real.newVector(nPaths);
    Real putPayoffs  = Real.newVector(nPaths);

    RealWhiteNoiseProcess noise1 = new RealWhiteNoiseProcess();
    noise1.initializeWithSeed(seed);
    RealWhiteNoiseProcess noise2 = new RealWhiteNoiseProcess();
    noise2.initializeWithSeed(seed + 1000);

    Real payoffVal = new Real();

    long t0 = System.nanoTime();

    for (int path = 0; path < nPaths; path++)
    {
      noise1.sample(bits, W);
      noise2.sample(bits, Z);

      payoffCall.evaluate(bits, payoffVal);
      callPayoffs.get(path).set(payoffVal);

      payoffPut.evaluate(bits, payoffVal);
      putPayoffs.get(path).set(payoffVal);

      long now = System.nanoTime();
      double pct = 100.0 * (path + 1) / nPaths;
      double rate = (now - t0) > 0 ? (path + 1) * 1e9 / (now - t0) : 0;
      System.err.printf("[seed=%d] %d/%d (%.1f%%) rate=%.0f/sec%n",
                        seed, path + 1, nPaths, pct, rate);
    }

    System.err.printf("[seed=%d] %d paths completed%n", seed, nPaths);

    try ( Real nR = Real.valueOf(nPaths);
          Real sum = new Real(); Real sumSq = new Real();
          Real mean = new Real(); Real variance = new Real(); Real sem = new Real(); )
    {
      computeMeanVarianceSem(callPayoffs, nPaths, nR, sum, sumSq, mean, variance, sem);
      result.callBall.set(mean);
      arblib.arb_add_error(result.callBall, sem);

      computeMeanVarianceSem(putPayoffs, nPaths, nR, sum, sumSq, mean, variance, sem);
      result.putBall.set(mean);
      arblib.arb_add_error(result.putBall, sem);
    }

    result.callBall.sub(result.putBall, bits, result.parityResidual);
    result.parityResidual.sub(s, bits, result.parityResidual);
    result.parityResidual.add(K, bits, result.parityResidual);

    noise1.close();
    noise2.close();
    callPayoffs.close();
    putPayoffs.close();

    return result;
  }

  private void computeMeanVarianceSem(Real payoffs, int n,
                                       Real nR,
                                       Real sum, Real sumSq,
                                       Real mean, Real variance,
                                       Real sem)
  {
    sum.zero();
    sumSq.zero();
    for (int p = 0; p < n; p++)
    {
      sum.add(payoffs.get(p), bits, sum);
      payoffs.get(p).pow(2, bits, sem);
      sumSq.add(sem, bits, sumSq);
    }
    sum.div(nR, bits, mean);
    mean.mul(sum, bits, sem);
    sem.neg(sem);
    sumSq.add(sem, bits, sumSq);

    Real nMinus1 = nR.sub(RealConstants.one, bits);
    sumSq.div(nMinus1, bits, variance);
    variance.div(nR, bits, sem);
    sem.sqrt(bits, sem);
  }

  static class SimResult implements AutoCloseable
  {
    final Real callBall;
    final Real putBall;
    final Real parityResidual;

    SimResult(int bits)
    {
      callBall       = new Real();
      putBall        = new Real();
      parityResidual = new Real();
    }

    @Override
    public void close()
    {
      callBall.close();
      putBall.close();
      parityResidual.close();
    }
  }

  public static void main(String[] args)
  {
    try ( RoughHestonMonteCarloSimulator simulator = new RoughHestonMonteCarloSimulator() )
    {
      new CommandLine(simulator).execute(args);
    }
  }
}
