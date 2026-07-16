package arb.applications;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;
import arb.functions.real.RealNullaryFunction;
import arb.stochastic.processes.RealWhiteNoiseProcess;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "rough-heston-mc")
public class RoughHestonMonteCarloSimulator implements Runnable
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

  @Override
  public void run()
  {
    Context ctx = new Context();

    RealNullaryFunction S0fn = RealNullaryFunction.express(S0s);
    RealNullaryFunction rFn  = RealNullaryFunction.express(rs);
    RealNullaryFunction qFn  = RealNullaryFunction.express(qs);
    RealNullaryFunction Tfn  = RealNullaryFunction.express(Ts);
    RealNullaryFunction κfn  = RealNullaryFunction.express(κs);
    RealNullaryFunction θfn  = RealNullaryFunction.express(θs);
    RealNullaryFunction σfn  = RealNullaryFunction.express(σs);
    RealNullaryFunction V0fn = RealNullaryFunction.express(V0s);
    RealNullaryFunction ρfn  = RealNullaryFunction.express(ρs);
    RealNullaryFunction Kfn  = RealNullaryFunction.express(Ks);

    try ( Real S0 = S0fn.evaluate(bits); Real r = rFn.evaluate(bits);
          Real q  = qFn.evaluate(bits);  Real T = Tfn.evaluate(bits);
          Real κ  = κfn.evaluate(bits);  Real θ = θfn.evaluate(bits);
          Real σ  = σfn.evaluate(bits);  Real V0 = V0fn.evaluate(bits);
          Real ρ  = ρfn.evaluate(bits);  Real K = Kfn.evaluate(bits);
          Real dt      = T.div(numSteps, bits);
          Real sqrtDt  = dt.sqrt(bits);
          Real rMinusQ = r.sub(q, bits);
          Real sqrtOmRsq = new Real(); )
    {
      RealConstants.one.sub(ρ.mul(ρ, bits), bits, sqrtOmRsq);
      sqrtOmRsq.sqrt(bits, sqrtOmRsq);
      Real steps = Real.valueOf(numSteps);

      S0.setName("S0");  ctx.registerVariable(S0);
      r.setName("r");    ctx.registerVariable(r);
      q.setName("q");    ctx.registerVariable(q);
      T.setName("T");    ctx.registerVariable(T);
      κ.setName("κ");    ctx.registerVariable(κ);
      θ.setName("θ");    ctx.registerVariable(θ);
      σ.setName("σ");    ctx.registerVariable(σ);
      V0.setName("V0");  ctx.registerVariable(V0);
      ρ.setName("ρ");    ctx.registerVariable(ρ);
      K.setName("K");    ctx.registerVariable(K);
      dt.setName("dt");      ctx.registerVariable(dt);
      sqrtDt.setName("√dt");    ctx.registerVariable(sqrtDt);
      rMinusQ.setName("rMinusQ"); ctx.registerVariable(rMinusQ);
      sqrtOmRsq.setName("√1mρ²"); ctx.registerVariable(sqrtOmRsq);
      steps.setName("steps"); ctx.registerVariable(steps);

      Real dWS    = Real.newVector(numSteps);
      Real dWperp = Real.newVector(numSteps);
      dWS.setName("dWS");       ctx.registerVariable(dWS);
      dWperp.setName("dWperp"); ctx.registerVariable(dWperp);

      ctx.declare("V", Integer.class, Real.class, RealSequence.class);

      RealSequence.express("V",
        "V:n➔when(n=0, V0, else, "
      + "V(n-1) + κ*(θ - V(n-1))*dt + σ*√(V(n-1))*(ρ*dWS[n-1] + √1mρ²*dWperp[n-1]))",
        ctx);

      RealNullaryFunction payoffCall = RealNullaryFunction.express(
        "max(S0*exp(rMinusQ*T + Σ_{n=0}^{steps-1}( -V(n)/2*dt + √(V(n))*dWS[n] )) - K, 0)",
        ctx);

      RealNullaryFunction payoffPut = RealNullaryFunction.express(
        "max(K - S0*exp(rMinusQ*T + Σ_{n=0}^{steps-1}( -V(n)/2*dt + √(V(n))*dWS[n] )), 0)",
        ctx);

      for (int nPaths = minPaths; nPaths <= maxPaths; nPaths *= 2)
      {
        System.err.printf("[convergence] %d paths%n", nPaths);
        boolean converged;

        try ( SimResult r1 = simulate(nPaths, seed1, dWS, dWperp, payoffCall, payoffPut, K, S0);
              SimResult r2 = simulate(nPaths, seed2, dWS, dWperp, payoffCall, payoffPut, K, S0); )
        {
          converged = r1.callBall.contains(r2.callBall)
                   && r2.callBall.contains(r1.callBall);

          System.out.printf("# paths=%d steps=%d bits=%d K=%s%n", nPaths, numSteps, bits, K);
          System.out.printf("call1=%s%n", r1.callBall);
          System.out.printf("call2=%s%n", r2.callBall);
          System.out.printf("put1=%s%n", r1.putBall);
          System.out.printf("put2=%s%n", r2.putBall);
          System.out.printf("parity1=%s%n", r1.parityResidual);
          System.out.printf("parity2=%s%n", r2.parityResidual);
          System.out.printf("converged=%s%n", converged);
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
                              Real dWS, Real dWperp,
                              RealNullaryFunction payoffCall,
                              RealNullaryFunction payoffPut,
                              Real K, Real S0)
  {
    SimResult result = new SimResult(bits);

    Real callPayoffs = Real.newVector(nPaths);
    Real putPayoffs  = Real.newVector(nPaths);

    RealWhiteNoiseProcess noise1 = new RealWhiteNoiseProcess();
    noise1.initializeWithSeed(seed);
    RealWhiteNoiseProcess noise2 = new RealWhiteNoiseProcess();
    noise2.initializeWithSeed(seed + 1000);

    Real payoffVal = new Real();
    Integer pathIdx = new Integer();

    long t0 = System.nanoTime();

    for (int path = 0; path < nPaths; path++)
    {
      noise1.sample(bits, dWS);
      noise2.sample(bits, dWperp);

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
    result.parityResidual.sub(S0, bits, result.parityResidual);
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
    new CommandLine(new RoughHestonMonteCarloSimulator()).execute(args);
  }
}
