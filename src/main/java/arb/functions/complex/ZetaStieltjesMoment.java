package arb.functions.complex;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;
import arb.functions.real.RealFunction;

/**
 * The n-th moment of the Θ-warped Stieltjes measure Φ_G associated with
 * ζ(½+it), defined by
 *
 * <pre>
 * μₙ = ∫ Θ(t)ⁿ·ζ(½+ⅈt)·√(Θ'(t))·(1+Θ(t)²)^(-ε)·e^(ⅈ·Θ(t)) dt
 * </pre>
 *
 * where Θ(t) = ϑ(t) + C·t is a strict monotonization of the Riemann–Siegel
 * theta function (C chosen so Θ'(t)>0 for all t≥0) and ε>0 is the decay
 * regularization exponent that makes the integrand integrable on ℝ.
 *
 * This class hands the integral expression directly to the arb4j expression
 * compiler: either it compiles into a working moment evaluator, or the
 * compiler throws an exception that identifies exactly which node support
 * is missing.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class ZetaStieltjesMoment implements
                                 ComplexSequence
{
  Real           C       = Real.named("C").set(3);
  Real           ε       = Real.named("ε").set("0.1", 128);

  public Context context = new Context(C, ε);

  /** Θ(t) = ϑ(t) + C·t, the monotonic Riemann–Siegel theta. */
  public final RealFunction Θ = RealFunction.express("Θ:t→ϑ(t)+C·t", context);

  /**
   * The moment integrand:
   *
   * <pre>
   * h(t) = ζ(½+ⅈt)·√(Θ'(t))·(1+Θ(t)²)^(-ε)·e^(ⅈ·Θ(t))
   * </pre>
   */
  public final ComplexFunction h =
      ComplexFunction.express("h:t→ζ(½+ⅈ·t)·√(diff(Θ(t),t))·(1+Θ(t)²)^(-ε)·exp(ⅈ·Θ(t))",
                              context);

  /**
   * The moment map n ↦ μₙ as a compiled expression:
   *
   * <pre>
   * μ:n → ∫t → Θ(t)ⁿ·h(t) dt ∈ (-∞,∞)
   * </pre>
   */
  public final ComplexSequence μ =
      ComplexSequence.express("μ", "n→∫t→Θ(t)^n·h(t)dt∈(-∞,∞)", context);

  @Override
  public Complex evaluate(Integer n, int order, int bits, Complex res)
  {
    return μ.evaluate(n, order, bits, res);
  }

  @Override
  public String toString()
  {
    return μ.toString();
  }
}
