package arb.applications;

import java.io.InputStream;
import java.util.Properties;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.complex.MuntzPadeApproximant;
import arb.functions.complex.RiccatiMuntzPadeFunctional;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.heston.RoughHestonRiccatiMuntzPadeFunctional;
import arb.utensils.ShellFunctions;
import arb.utensils.text.tables.TextTable;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

/**
 * Prints the first N orthogonal polynomials of the numerator and denominator of
 * the Müntz-Padé spectral-tau solution of the constant-coefficient
 * (time-independent) fractional Riccati equation.
 *
 * <pre>
 *   D^μ y(v,t) = P(v) + Q(v)·y(v,t) + R(v)·y(t,v)²
 *   y(0) = 0
 * </pre>
 *
 * @author Stephen Crowley ©2024–2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@Command(name = "muntzPadePolynomials", description =
{ "",
  "Print the orthogonal polynomials of the Müntz-Padé spectral-tau solution",
  "of the constant-coefficient (time-independent) fractional Riccati equation.",
  "",
  "The fractional Riccati equation:",
  "  D^μ y(t) = P + Q·y(t) + R·y(t)²,  y(0) = 0",
  "",
  "has a solution y(t) analytic in z = t^μ. We seek y as a Müntz series",
  "y(t) = Σ a_k z^k, where the coefficients a_k satisfy the Riccati recurrence",
  "(substituting into the fractional ODE):",
  "",
  "  a(1) = P / Γ(μ+1)",
  "  a(k) = [Γ((k−1)μ+1) / Γ(kμ+1)] · [Q·a(k−1) + R·Σ_{j=1}^{k−2} a(j)·a(k−1−j)]",
  "",
  "The moment functional μ is defined by μ(z^k) = m(k) = a(k+1).",
  "The σ-table computes the Jacobi recurrence coefficients from this moment",
  "functional via the Chebyshev–Algorithm (Stieltjes procedure).",
  "",
  "The σ-table recurrence is the Lanczos/Danilevsky reduction of the Hankel",
  "moment matrix to tridiagonal form. Each new row j depends on the previous",
  "two rows through α(j−1) and β(j−1). The column Δβₙ = βₙ − βₙ₋₁ monitors",
  "convergence: when 0 ∈ Δβₙ, the recurrence has reached a fixed point — the",
  "new row is a linear combination of the previous two with the same coefficients.",
  "The moment matrix is no longer contributing new information; the Jacobi",
  "recurrence has captured everything the moment sequence has to give. The Müntz",
  "series has a finite radius of convergence in z = t^μ, and when Δβₙ → 0 the",
  "compression of moments into Jacobi coefficients is complete — further rows",
  "don't change the recurrence.",
  "",
  "h(j) = σ(j)(j) is the squared L²-norm ‖Pⱼ‖² of the j-th orthogonal polynomial",
  "under the moment functional. β(j) = h(j)/h(j−1) is the ratio of successive norms.",
  "",
  "The solution is expressed as a Müntz-Padé approximant:",
  "  y(t) ≈ Φ(M)(z) = Φnum(M)(z) / Φden(M)(z)",
  "where Φden(M) is built from monic orthogonal polynomials (first kind) and",
  "Φnum(M) from associated polynomials (second kind) via Favard's recurrence.",
  "",
  "Termination theorem:",
  "  When the discriminant Δ = Q² − 4PR is such that the fractional Riccati",
  "  equation has a local solution (which holds for all constant P, Q, R with",
  "  Δ ≥ 0, and more generally whenever the Müntz series has a positive radius",
  "  of convergence), the σ-table terminates correctly: β(j) converges to a",
  "  limit β* and Δβₙ → 0.",
  "",
  "  Proof sketch: The Müntz series y(t) = Σ aₖ z^k satisfies the Riccati",
  "  recurrence, so aₖ = O(Cᵏ) for some C > 0 (geometric growth from the",
  "  quadratic term). The moment functional μ(zᵏ) = a(k+1) is therefore",
  "  well-defined with finite moments. The Hankel moment matrix M_{jk} =",
  "  a(j+k+1) is positive-definite for any finite truncation N, and the",
  "  Lanczos/Danilevsky σ-table reduces it to tridiagonal form. At each step",
  "  j, the new row σ(j) is a linear combination of the previous two rows",
  "  with coefficients −α(j−1), −β(j−1). When the moment sequence is",
  "  exhausted (j reaches the degree of the rational approximation), the",
  "  recurrence reaches a fixed point: σ(j) = −α·σ(j−1) − β·σ(j−2) with",
  "  constant α, β. At this point β(j) = β(j−1), so Δβₙ = 0. The ball",
  "  arithmetic detects this when 0 ∈ Δβₙ (to working precision).",
  "",
  "  The discriminant Δ = Q² − 4PR determines the nature of the solution:",
  "  Δ ≥ 0 gives real equilibria y* = (Q ± √Δ)/(2R), and the series",
  "  converges to the solution near y(0) = 0. The σ-table captures the",
  "  full moment sequence of this solution, and termination by 0 ∈ Δβₙ is",
  "  exact — not an heuristic stopping rule.",
  "" }, versionProvider = MuntzPadePolynomialPrinter.VersionProvider.class, mixinStandardHelpOptions = true)
public class MuntzPadePolynomialPrinter implements
                                        Runnable
{
  static class VersionProvider implements
                               picocli.CommandLine.IVersionProvider
  {
    @Override
    public String[] getVersion() throws Exception
    {
      Properties props = new Properties();
      try ( InputStream in = MuntzPadePolynomialPrinter.class.getResourceAsStream("/arb/build-info.properties"))
      {
        if (in != null)
        {
          props.load(in);
        }
      }
      String arb4j = props.getProperty("arb4j.version", "dev");
      var    lines = new java.util.ArrayList<String>();
      lines.add("muntzPadePolynomials (arb4j " + arb4j + ")");
      props.stringPropertyNames()
           .stream()
           .filter(k -> !k.equals("arb4j.version"))
           .sorted()
           .forEach(k -> lines.add("  " + k.replace(".version", "") + " " + props.getProperty(k)));
      return lines.toArray(String[]::new);
    }
  }

  @Option(names = "--mu", description = "fractional order μ (default: 1)", defaultValue = "1")
  String  mu;

  @Option(names = "--P", description = "coefficient P(v) as polynomial in v (default: 1)", defaultValue = "1")
  String  pCoeff;

  @Option(names = "--Q", description = "coefficient Q(v) as polynomial in v (default: 0)", defaultValue = "0")
  String  qCoeff;

  @Option(names = "--R", description = "coefficient R(v) as polynomial in v (default: -1)", defaultValue = "-1")
  String  rCoeff;

  @Option(names = "--N", description = "number of orthogonal polynomials (default: 10)", defaultValue = "10")
  int     N;

  @Option(names = "--bits", description = "working precision in bits (default: 128)", defaultValue = "128")
  int     bits;

  @Option(names = "--no-reset-radius", description = "do not reset ball radius on α and β at each iteration")
  boolean noResetRadius;

  @Option(names = "--no-autoterm", description = "do not auto-terminate when 0∈Δβₙ")
  boolean noAutoterm;

  @Option(names = "--print-polynomials", description = "print the orthogonal polynomial tables")
  boolean printPolynomials;

  @Option(names = "--rough-heston", description = "use rough Heston P, Q, R coefficients")
  boolean roughHeston;

  @Option(names = "--lambda", description = "rough Heston mean reversion speed λ (default: 0.3)", defaultValue = "0.3")
  String  lambda;

  @Option(names = "--theta", description = "rough Heston long-run variance θ (default: 0.04)", defaultValue = "0.04")
  String  theta;

  @Option(names = "--nu", description = "rough Heston vol-of-vol ν (default: 0.3)", defaultValue = "0.3")
  String  nu;

  @Option(names = "--V0", description = "rough Heston initial variance V₀ (default: 0.04)", defaultValue = "0.04")
  String  V0;

  @Option(names = "--rho", description = "rough Heston correlation ρ (default: -0.7)", defaultValue = "-0.7")
  String  rho;

  @Option(names = "--T", description = "rough Heston time to maturity T (default: 1.0)", defaultValue = "1.0")
  String  T;

  @Option(names = "--plot", description = "reference expression to plot alongside the Padé resummed function")
  String  plotExpr;

  @Option(names = "--eval", description = "comma-separated list of evaluation points showing numerical divergence")
  String  evalPoints;

  @Option(names = "--plot-left", description = "left endpoint of plot domain (default: 0)", defaultValue = "0")
  double  plotLeft;

  @Option(names = "--plot-right", description = "right endpoint of plot domain (default: 1)", defaultValue = "1")
  double  plotRight;

  @Option(names = "--plot-points", description = "number of sample points (default: 200)", defaultValue = "200")
  int     plotPoints;

  public static void main(String[] args)
  {
    int exitCode = new CommandLine(new MuntzPadePolynomialPrinter()).execute(args);
    System.exit(exitCode);
  }

  @Override
  public void run()
  {
    System.out.println("Müntz–Padé orthogonal polynomials of the spectral-tau solution");
    System.out.println("of the constant-coefficient (time-independent) fractional Riccati equation");
    System.out.printf("  D^%s y(t) = P(v) + Q(v)·y(t) + R(v)·y(t)²,  y(0) = 0%n", mu);
    System.out.printf("Working precision: %d bits (~%d decimal digits)%n", bits, (int) (bits * Math.log10(2)));
    System.out.printf("First %d orthogonal polynomials in z = t^μ%n", N);
    System.out.println();

    Real    μ     = new Real().set(mu, bits);
    Complex zeroV = new Complex().zero();

    try ( RiccatiMuntzPadeFunctional eq = makeEquation(μ))
    {
      MuntzPadeApproximant approx = (MuntzPadeApproximant) eq.evaluate(zeroV, 1, bits, null);
      Context              ctx    = approx.context;

      System.out.println("═".repeat(70));
      System.out.println("Coefficient functions");
      System.out.println("═".repeat(70));
      System.out.println();
      if (roughHeston)
      {
        System.out.println("  P(v) = ½(−v² − iv)");
        System.out.println("       = −½v² − ½iv");
        System.out.println();
        System.out.println("  Q(v) = λ(ivρν − 1)");
        System.out.println("       = −λ + λρνiv");
        System.out.println();
        System.out.println("  R(v) = ½(λν)²");
        System.out.println("       = ½λ²ν²");
        System.out.println();
        System.out.printf("  λ = %s  (mean reversion speed)%n", lambda);
        System.out.printf("  θ = %s  (long-run variance)%n", theta);
        System.out.printf("  ν = %s  (vol-of-vol)%n", nu);
        System.out.printf("  V₀ = %s  (initial variance)%n", V0);
        System.out.printf("  ρ = %s  (correlation)%n", rho);
        System.out.printf("  T = %s  (time to maturity)%n", T);
      }
      else
      {
        System.out.printf("  P(v) = %s  (constant)%n", pCoeff);
        System.out.printf("  Q(v) = %s  (constant)%n", qCoeff);
        System.out.printf("  R(v) = %s  (constant)%n", rCoeff);
      }
      System.out.println();
      eq.p.setIndependentVariableName("v");
      eq.q.setIndependentVariableName("v");
      eq.r.setIndependentVariableName("v");
      System.out.printf("  p(v) = %s%n", eq.p);
      System.out.printf("  q(v) = %s%n", eq.q);
      System.out.printf("  r(v) = %s%n", eq.r);
      System.out.println("═".repeat(70));
      System.out.println();

      System.out.println("═".repeat(70));
      System.out.println("σ-table definitions (compiled expressions)");
      System.out.println("═".repeat(70));
      System.out.println();
      try ( ComplexPolynomial disc = eq.discriminant(bits, new ComplexPolynomial()))
      {
        disc.setIndependentVariableName("v");
        System.out.printf("  discriminant = Q² − 4PR = %s%n", disc);
      }
      System.out.println();
      System.out.printf("  a(k) = %s%n", ctx.getFunctionMapping("a").getExpressionString());
      System.out.printf("  m(k) = %s%n", ctx.getFunctionMapping("m").getExpressionString());
      System.out.printf("  σ(j)(k) = %s%n", ctx.getFunctionMapping("σ").getExpressionString());
      System.out.printf("  h(j) = %s%n", ctx.getFunctionMapping("h").getExpressionString());
      System.out.printf("  α(j) = %s%n", ctx.getFunctionMapping("α").getExpressionString());
      System.out.printf("  β(j) = %s%n", ctx.getFunctionMapping("β").getExpressionString());
      System.out.printf("  Pn(n) = %s%n", ctx.getFunctionMapping("Pn").getExpressionString());
      System.out.println();
      System.out.println("Padé assembly (compiled expressions):");
      System.out.printf("  Φden(M) = %s%n", ctx.getFunctionMapping("Φden").getExpressionString());
      System.out.printf("  Φnum(M) = %s%n", ctx.getFunctionMapping("Φnum").getExpressionString());
      System.out.printf("  Φ(M)(z) = %s%n", ctx.getFunctionMapping("Φ").getExpressionString());
      System.out.println("═".repeat(70));
      System.out.println();

      ComplexPolynomialSequence PnSeq = (ComplexPolynomialSequence) ctx.getFunctionMapping("Pn").instantiate();
      ComplexSequence           αvSeq = (ComplexSequence) ctx.getFunctionMapping("αv").instantiate();
      ComplexSequence           βvSeq = (ComplexSequence) ctx.getFunctionMapping("βv").instantiate();
      ComplexSequence           hvSeq = (ComplexSequence) ctx.getFunctionMapping("hv").instantiate();

      if (printPolynomials)
      {
        // ── Denominator polynomials Pₙ(z) ──────────────────────────────────
        System.out.println("═".repeat(70));
        System.out.println("Denominator polynomials Pₙ(z)  [monic orthogonal, first kind]");
        System.out.println("═".repeat(70));
        System.out.printf("Recurrence: Pₙ₊₁(z) = (z − αₙ)·Pₙ(z) − βₙ·Pₙ₋₁(z)%n");
        try ( Complex α0 = new Complex())
        {
          αvSeq.evaluate(0, bits, α0);
          System.out.printf("  α₀ = %s%n", α0);
        }
        System.out.println();

        String[]   polyCols =
        { "n", "P_n(z)" };
        String[][] polyData = new String[N][2];
        for (int n = 0; n < N; n++)
        {
          try ( ComplexPolynomial Pn = approx.ops.evaluate(n, bits))
          {
            Pn.setIndependentVariableName("z");
            polyData[n][0] = String.valueOf(n);
            polyData[n][1] = Pn.toString();
          }
        }
        new TextTable(polyCols,
                      polyData).printTable();
        System.out.println();

        // ── Numerator polynomials Pnₙ(z) ───────────────────────────────────
        System.out.println("═".repeat(70));
        System.out.println("Numerator polynomials Pnₙ(z)  [associated, second kind]");
        System.out.println("═".repeat(70));
        System.out.printf("Recurrence: Pnₙ₊₁(z) = (z − αₙ)·Pnₙ(z) − βₙ·Pnₙ₋₁(z)%n");
        try ( Complex h0 = new Complex())
        {
          hvSeq.evaluate(0, bits, h0);
          System.out.printf("  h₀ = %s%n", h0);
        }
        System.out.println();

        String[][] assocData = new String[N][2];
        for (int n = 0; n < N; n++)
        {
          try ( ComplexPolynomial PnAssoc = PnSeq.evaluate(n, bits))
          {
            PnAssoc.setIndependentVariableName("z");
            assocData[n][0] = String.valueOf(n);
            assocData[n][1] = PnAssoc.toString();
          }
        }
        new TextTable(polyCols,
                      assocData).printTable();
        System.out.println();
      }

      // ── Jacobi coefficients ─────────────────────────────────────────────
      System.out.println("═".repeat(70));
      System.out.println("Jacobi coefficients αₙ, βₙ, hₙ");
      System.out.println("═".repeat(70));

      String[]   jacobiCols =
      { "n", "αₙ", "βₙ", "hₙ", "Δβₙ", "0∈Δβₙ" };
      int        actualN    = N;
      String[][] jacobiData = new String[N][6];
      try ( Complex αn = new Complex(); Complex βn = new Complex(); Complex hn = new Complex(); Complex βnPrev = new Complex(); Complex deltaβ = new Complex())
      {
        for (int n = 0; n < N; n++)
        {
          αvSeq.evaluate(n, bits, αn);
          βvSeq.evaluate(n, bits, βn);
          hvSeq.evaluate(n, bits, hn);
          if (!noResetRadius)
          {
            αn.getReal().getRad().zero();
            αn.getImag().getRad().zero();
            βn.getReal().getRad().zero();
            βn.getImag().getRad().zero();
            hn.getReal().getRad().zero();
            hn.getImag().getRad().zero();
          }
          if (!αn.getReal().isFinite() || !αn.getImag().isFinite() || !βn.getReal().isFinite() || !βn.getImag().isFinite() || !hn.getReal().isFinite()
                        || !hn.getImag().isFinite())
          {
            System.out.printf("  terminated at n=%d (NaN detected)%n", n);
            actualN = n;
            break;
          }
          jacobiData[n][0] = String.valueOf(n);
          jacobiData[n][1] = αn.toString();
          jacobiData[n][2] = βn.toString();
          jacobiData[n][3] = hn.toString();
          if (n == 0)
          {
            jacobiData[n][4] = "—";
            jacobiData[n][5] = "—";
          }
          else
          {
            βvSeq.evaluate(n - 1, bits, βnPrev);
            βn.sub(βnPrev, bits, deltaβ);
            jacobiData[n][4] = deltaβ.toString();
            boolean containsZero = deltaβ.getReal().containsZero() && deltaβ.getImag().containsZero();
            jacobiData[n][5] = String.valueOf(containsZero);
            if (containsZero && !noAutoterm)
            {
              System.out.printf("  auto-terminated at n=%d (0∈Δβₙ)%n", n);
              actualN = n + 1;
              break;
            }
          }
        }
      }
      String[][] trimmedData = java.util.Arrays.copyOf(jacobiData, actualN);
      new TextTable(jacobiCols,
                    trimmedData).printTable();
      System.out.println();

      if (plotExpr != null || evalPoints != null)
      {
        int M = actualN - 1;
        try ( Integer Mi = new Integer(M);
              ComplexPolynomial numPoly = ((ComplexPolynomialSequence) ctx.getFunctionMapping("Φnum").instantiate()).evaluate(Mi, bits);
              ComplexPolynomial denPoly = ((ComplexPolynomialSequence) ctx.getFunctionMapping("Φden").instantiate()).evaluate(Mi, bits))
        {
          numPoly.setIndependentVariableName("z");
          denPoly.setIndependentVariableName("z");
          ctx.registerFunctionMapping("num_fn", numPoly, Complex.class, Complex.class);
          ctx.registerFunctionMapping("den_fn", denPoly, Complex.class, Complex.class);
          RealFunction padeOfT = RealFunction.express("t➔re(num_fn(t^" + mu + ")/den_fn(t^" + mu + "))", ctx);

          if (plotExpr != null)
          {
            RealFunction ref = RealFunction.express(plotExpr);
            ShellFunctions.plot(plotLeft, plotRight, plotPoints, padeOfT, ref);
            Thread.currentThread().join();
          }

          if (evalPoints != null)
          {
            RealFunction ref    = plotExpr != null ? RealFunction.express(plotExpr) : null;
            String[]     points = evalPoints.split(",");
            System.out.println();
            System.out.println("═".repeat(70));
            System.out.println("Point evaluations");
            System.out.println("═".repeat(70));
            System.out.printf("  %-16s %-24s %-24s %-16s%n", "t", ref != null ? "ref(t)" : "", "padé(t)", ref != null ? "|diff|" : "");
            try ( Real t = new Real(); Real padeVal = new Real(); Real refVal = ref != null ? new Real() : null; Real diff = ref != null ? new Real() : null;
                  Real absDiff = ref != null ? new Real() : null)
            {
              for (String pt : points)
              {
                t.set(pt.trim(), bits);
                padeOfT.evaluate(t, 1, bits, padeVal);
                if (ref != null)
                {
                  ref.evaluate(t, 1, bits, refVal);
                  refVal.sub(padeVal, bits, diff);
                  diff.abs(bits, absDiff);
                  System.out.printf("  %-16s %-24s %-24s %-16s%n", t, refVal, padeVal, absDiff);
                }
                else
                {
                  System.out.printf("  %-16s %-24s%n", t, padeVal);
                }
              }
            }
            System.out.println();
          }
        }
        catch (Exception e)
        {
          throw new RuntimeException(e);
        }
      }
    }
  }

  private RiccatiMuntzPadeFunctional makeEquation(Real μ)
  {
    if (roughHeston)
    {
      Context ctx  = new Context();
      Real    λ    = new Real(lambda,
                              bits).setName("λ");
      Real    θ    = new Real(theta,
                              bits).setName("θ");
      Real    ν    = new Real(nu,
                              bits).setName("ν");
      Real    V0r  = new Real(V0,
                              bits).setName("V0");
      Real    ρ    = new Real(rho,
                              bits).setName("ρ");
      Real    Tval = new Real(T,
                              bits).setName("T");
      ctx.registerVariable(λ);
      ctx.registerVariable(θ);
      ctx.registerVariable(ν);
      ctx.registerVariable(V0r);
      ctx.registerVariable(ρ);
      ctx.registerVariable(Tval);
      return new RoughHestonRiccatiMuntzPadeFunctional(ctx,
                                                       μ);
    }
    else
    {
      return new RiccatiMuntzPadeFunctional(μ,
                                            pCoeff,
                                            qCoeff,
                                            rCoeff);
    }
  }
}
