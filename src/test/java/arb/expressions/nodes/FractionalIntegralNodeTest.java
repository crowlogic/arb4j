package arb.expressions.nodes;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests for the Riemann–Liouville fractional integral I^(μ) applied via
 * {@link Node#fractionalIntegral(VariableNode, Node)}.
 *
 * Reference formulas:
 *
 *   I^(μ)(c)      = c · t^μ / Γ(μ+1)
 *   I^(μ)(t)      = Γ(2)/Γ(μ+2)   · t^(μ+1)
 *   I^(μ)(t^β)    = Γ(β+1)/Γ(β+μ+1) · t^(β+μ)            (β > −1)
 *   I^(μ)(f + g)  = I^(μ)(f) + I^(μ)(g)
 *   I^(μ)(c · f)  = c · I^(μ)(f)
 *   I^(μ) ∘ I^(ν) = I^(μ+ν)
 *   D^(μ)(I^(μ) f) = f                                   (left inverse, Caputo)
 *
 * Expected values are computed in closed form from the monomial rule.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class FractionalIntegralNodeTest extends
                                       TestCase
{
  private static final int    BITS = 256;

  /**
   * The operator parses string-literal exponents, while the oracle
   * (exactIofTPow) routes them through Double.toString. Both representations
   * of, e.g., 0.6 + 0.6 round identically into 256-bit Real, but composite
   * exponents like 5·0.6 + 0.6 = 3.6 differ from the parsed-string version by
   * IEEE-754 rounding noise of order 2⁻⁵³ ≈ 1.1e-16. So 1e-14 is the honest
   * structural tolerance, not a precision claim.
   */
  private static final double TOL  = 1e-14;

  /**
   * Closed-form Riemann–Liouville integral of t^p of order μ at point t,
   * computed via the same Γ-ratio identity. Used purely as the oracle for
   * test assertions.
   */
  private static Real exactIofTPow(double p, double mu, double t)
  {
    var numerator   = new Real(Double.toString(p + 1), BITS).Γ(BITS, new Real());
    var denominator = new Real(Double.toString(p + mu + 1), BITS).Γ(BITS, new Real());
    var tBase       = new Real(Double.toString(t), BITS);
    var pPlusMu     = new Real(Double.toString(p + mu), BITS);
    var tPow        = tBase.pow(pPlusMu, BITS, new Real());
    return numerator.div(denominator, BITS, new Real()).mul(tPow, BITS, new Real());
  }

  /**
   * Monomial rule: I^(μ)(t^(kμ)) = Γ(kμ+1)/Γ((k+1)μ+1) · t^((k+1)μ)
   * for μ ∈ {0.6, 0.7, 0.8} and k ∈ {1, 2, 3, 4, 5}. Evaluated at t=1.7
   * with bits=256.
   */
  public void testMonomialRuleAtMuTimesK()
  {
    double[] mus = { 0.6, 0.7, 0.8 };
    int[]    ks  = { 1, 2, 3, 4, 5 };
    double   t   = 1.7;
    var      tR  = new Real(Double.toString(t), BITS);

    for (double mu : mus)
    {
      for (int k : ks)
      {
        double p           = k * mu;
        String muStr       = Double.toString(mu);
        String pStr        = Double.toString(p);
        String src         = "fracint(t^(" + pStr + "), t^(" + muStr + "))";
        var    expr        = RealFunction.express(src);
        var    actual      = expr.evaluate(tR, 1, BITS, new Real());
        var    expected    = exactIofTPow(p, mu, t);
        var    diff        = actual.sub(expected, BITS, new Real()).abs();
        assertTrue("μ=" + mu + " k=" + k + " expected=" + expected + " actual=" + actual + " |diff|=" + diff,
                   diff.doubleValue() < TOL);
      }
    }
  }

  /**
   * Constant rule: I^(μ)(c) = c · t^μ / Γ(μ+1) at μ ∈ {0.6, 0.7, 0.8}, c=2,
   * t=1.7. Verified against the monomial-rule oracle with p=0.
   */
  public void testConstantRule()
  {
    double[] mus = { 0.6, 0.7, 0.8 };
    double   t   = 1.7;
    double   c   = 2.0;
    var      tR  = new Real(Double.toString(t), BITS);
    var      cR  = new Real(Double.toString(c), BITS);

    for (double mu : mus)
    {
      String muStr   = Double.toString(mu);
      var    expr    = RealFunction.express("fracint(2, t^(" + muStr + "))");
      var    actual  = expr.evaluate(tR, 1, BITS, new Real());
      var    expectedNoC = exactIofTPow(0.0, mu, t);
      var    expected    = cR.mul(expectedNoC, BITS, new Real());
      var    diff        = actual.sub(expected, BITS, new Real()).abs();
      assertTrue("μ=" + mu + " expected=" + expected + " actual=" + actual + " |diff|=" + diff,
                 diff.doubleValue() < TOL);
    }
  }

  /**
   * Linearity: I^(μ)(t + t²) = I^(μ)(t) + I^(μ)(t²). Compares the operator
   * applied to the sum against the sum of the operator's results computed
   * from the monomial rule.
   */
  public void testLinearity()
  {
    double mu = 0.7;
    double t  = 1.7;
    var    tR = new Real(Double.toString(t), BITS);

    var expr     = RealFunction.express("fracint(t + t^2, t^(0.7))");
    var actual   = expr.evaluate(tR, 1, BITS, new Real());
    var part1    = exactIofTPow(1.0, mu, t);
    var part2    = exactIofTPow(2.0, mu, t);
    var expected = part1.add(part2, BITS, new Real());
    var diff     = actual.sub(expected, BITS, new Real()).abs();
    assertTrue("expected=" + expected + " actual=" + actual + " |diff|=" + diff, diff.doubleValue() < TOL);
  }

  /**
   * Scalar-multiple rule: I^(μ)(3 · t²) = 3 · I^(μ)(t²).
   */
  public void testScalarMultiple()
  {
    double mu = 0.6;
    double t  = 1.7;
    var    tR = new Real(Double.toString(t), BITS);

    var expr     = RealFunction.express("fracint(3 * t^2, t^(0.6))");
    var actual   = expr.evaluate(tR, 1, BITS, new Real());
    var inner    = exactIofTPow(2.0, mu, t);
    var three    = new Real("3", BITS);
    var expected = three.mul(inner, BITS, new Real());
    var diff     = actual.sub(expected, BITS, new Real()).abs();
    assertTrue("expected=" + expected + " actual=" + actual + " |diff|=" + diff, diff.doubleValue() < TOL);
  }

  /**
   * Inverse identity: D^(μ)[I^(μ) f](t) = f(t) for several test functions at
   * non-integer μ ∈ {0.5, 0.7}, bits = 256, t = 1.7.
   *
   * The Caputo derivative D^(μ) is left-inverse to I^(μ) when f(0) is finite,
   * which is the regime exercised here: f ∈ { t, t², 1, 3 + t, 2·t³ }. Each
   * pair (D^μ ∘ I^μ) is composed symbolically by parsing
   * fracdiff(fracint(f, t^μ), t^μ) and evaluating at t.
   */
  public void testInverseIdentity()
  {
    double[] mus = { 0.5, 0.7 };
    String[] fs  = { "t", "t^2", "1", "3 + t", "2*t^3" };
    double   t   = 1.7;
    var      tR  = new Real(Double.toString(t), BITS);

    for (double mu : mus)
    {
      String muStr = Double.toString(mu);
      for (String f : fs)
      {
        String composed = "fracdiff(fracint(" + f + ", t^(" + muStr + ")), t^(" + muStr + "))";
        var    expr     = RealFunction.express(composed);
        var    actual   = expr.evaluate(tR, 1, BITS, new Real());

        var    direct   = RealFunction.express("t ➜ " + f);
        var    expected = direct.evaluate(tR, 1, BITS, new Real());

        var    diff     = actual.sub(expected, BITS, new Real()).abs();
        assertTrue("μ=" + mu + " f=" + f + " expected=" + expected + " actual=" + actual + " |diff|=" + diff,
                   diff.doubleValue() < TOL);
      }
    }
  }
}
