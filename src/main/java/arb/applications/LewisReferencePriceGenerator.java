package arb.applications;

import arb.ComplexConstants;
import arb.Real;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.heston.RoughHestonCharacteristicFunction;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

/**
 * Generates rough Heston reference call/put prices via Lewis (2001) Fourier
 * inversion using numerical integration of the characteristic function. This is
 * NOT for use in tests or production — it is a one-shot tool to produce
 * hardcoded reference values that are then copied into test assertions.
 *
 * <pre>
 *   C(K) = S0 − K · ( ½ + π⁻¹ · ∫₀^∞ Re[ φ(v−i/2) · e^{−iv·lnK} / (v²+¼) ] dv )
 *   P(K) = C(K) − S0 + K·e^{−rT}                                          (put-call parity, r=0 → P = C − S0 + K)
 * </pre>
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@Command(name = "lewis", description =
{
  "Generate reference call and put prices via Lewis (2001) Fourier inversion",
  "for the rough Heston model. Prints call, put (via parity), and residual.",
  "",
  "Lewis call formula:",
  "  C(K) = S0 − K · ( ½ + 1/π · ∫₀^∞ Re[ φ(v−i/2) · e^{−iv·lnK} / (v²+¼) ] dv )",
  "",
  "Put-call parity (r=0):",
  "  P(K) = C(K) − S0 + K",
  "",
  "Output format: one line per strike:  K C P residual",
  "  residual = C − P − S0 + K  (should be 0)",
  "",
  "These values are intended to be hardcoded into test assertions."
})
public class LewisReferencePriceGenerator implements
                                          Runnable
{

  @Option(names = "--lambda", description = "mean reversion speed λ (default: 0.1)", defaultValue = "0.1")
  private double λ;

  @Option(names = "--theta", description = "long-run variance θ (default: 0.3156)", defaultValue = "0.3156")
  private double θ;

  @Option(names = "--nu", description = "vol-of-vol ν (default: 0.331)", defaultValue = "0.331")
  private double ν;

  @Option(names = "--V0", description = "initial variance V0 (default: 0.0392)", defaultValue = "0.0392")
  private double V0;

  @Option(names = "--rho", description = "correlation ρ (default: -0.681)", defaultValue = "-0.681")
  private double ρ;

  @Option(names = "--mu", description = "fractional order μ (default: 0.62)", defaultValue = "0.62")
  private double μ;

  @Option(names = { "-T", "--maturity" }, description = "time to maturity in years (default: 1.0)", defaultValue = "1.0")
  private double T;

  @Option(names = "--S0", description = "spot price (default: 1)", defaultValue = "1")
  private double S0;

  @Option(names = "--rr", description = "risk-free rate r (default: 0)", defaultValue = "0")
  private double rr;

  @Option(names = "--bits", description = "working precision in bits (default: 256)", defaultValue = "256")
  private int bits;

  @Option(names = "--N", description = "number of trapezoid steps (default: 2000)", defaultValue = "2000")
  private int N;

  @Option(names = "--Vmax", description = "upper integration limit Vmax (default: 200)", defaultValue = "200")
  private double Vmax;

  @Option(names = "--strikes", description = "comma-separated list of strikes (default: 0.95,0.975,1.0,1.025,1.05)", defaultValue = "0.95,0.975,1.0,1.025,1.05")
  private String strikes;

  @Option(names = "--trace", description = "enable expression compiler trace/decompile output")
  private boolean trace;

  @Override
  public void run()
  {
    if (trace)
    {
      System.setProperty("arb4j.trace", "true");
      System.setProperty("arb4j.saveClasses", "true");
      System.setProperty("arb4j.decompileClasses", "true");
      System.setProperty("arb4j.traceNodes", "true");
    }

    Context ctx = new Context();
    ctx.registerVariable(new Real(Double.toString(λ), bits, "λ"));
    ctx.registerVariable(new Real(Double.toString(θ), bits, "θ"));
    ctx.registerVariable(new Real(Double.toString(ν), bits, "ν"));
    ctx.registerVariable(new Real(Double.toString(V0), bits, "V0"));
    ctx.registerVariable(new Real(Double.toString(ρ), bits, "ρ"));
    ctx.registerVariable(new Real(Double.toString(μ), bits, "μ"));
    ctx.registerVariable(new Real(Double.toString(T), bits, "T"));
    ctx.registerVariable(new Real(Double.toString(S0), bits, "S0"));
    ctx.registerVariable(new Real(Double.toString(rr), bits, "rr"));

    try ( RoughHestonCharacteristicFunction cf =
              new RoughHestonCharacteristicFunction(ctx, ComplexConstants.zero))
    {
      String lewis = String.format(
          "K➔S0-K*exp(-rr*T)*(0.5+1.0/π*nint(v➔re(φ(v-ⅈ/2)*exp(-ⅈ*v*ln(K/(S0*exp(rr*T))))/(v^2+0.25)), v=0…%s, N=%d))",
          Double.toString(Vmax), N);

      RealFunction callPrice = RealFunction.express(lewis, ctx);
      String[] parts = strikes.split(",");
      try ( Real K      = new Real();
            Real call   = new Real();
            Real put    = new Real();
            Real S0r    = new Real(Double.toString(S0), bits);
            Real negRT  = new Real(Double.toString(-rr * T), bits);
            Real eNegRT = new Real();
            Real discK  = new Real();
            Real residual = new Real())
      {
        negRT.exp(bits, eNegRT);

        for (String s : parts)
        {
          s = s.trim();
          K.set(s, bits);

          // C(K) via Lewis formula
          callPrice.evaluate(K, 1, bits, call);

          // P(K) = C(K) − S0 + K·e^{-rT}  (put-call parity)
          discK.set(K);
          discK.mul(eNegRT, bits, discK);
          call.sub(S0r, bits, put);
          put.add(discK, bits, put);

          // residual = C − P − S0 + K·e^{-rT}  (should be 0)
          residual.set(call);
          residual.sub(put, bits, residual);
          residual.sub(S0r, bits, residual);
          residual.add(discK, bits, residual);

          System.out.format("%s %s %s %s%n", s, call.toString(), put.toString(), residual.toString());
        }
      }
    }
    ctx.close();
  }

  public static void main(String[] args)
  {
    int exitCode = new CommandLine(new LewisReferencePriceGenerator()).execute(args);
    System.exit(exitCode);
  }
}
