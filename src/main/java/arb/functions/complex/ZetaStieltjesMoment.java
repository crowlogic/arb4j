package arb.functions.complex;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexSequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaStieltjesMoment implements
                                 ComplexSequence
{
  Real           C = Real.named("C").set(3);
  Real           ε = Real.named("ε").set("0.1", 128);

  public Context context = new Context(C, ε);

  public final ComplexFunctionSequence Θ =
      ComplexFunctionSequence.express("Θ",
                                      "j➔t➔diff(ϑ(t)+C·t,t^j)",
                                      context);

  public final ComplexFunctionSequence Ζ =
      ComplexFunctionSequence.express("Ζ",
                                      "a➔s➔diff(ζ(1/2+ⅈ·s),s^a)",
                                      context);

  /**
   * Truncated moment kernel over the primary weight index ℓ.
   *
   * <pre>
   * M(b) ≈ Σ_{ℓ=0…b} (Θ^(2ℓ+1)(0) / (2ℓ+1)!)
   * </pre>
   *
   * <p>
   * The full closed form is a sum over weighted compositions m∶{0…b}→ℕ of weight
   * b (Σ ℓ·m(ℓ) = b), each contributing the multinomial term b!/∏m(ℓ)! times a
   * product of weight-indexed factors. Both the composition enumerator
   * ({@link arb.expressions.nodes.WeightedPartitionEnumeratorNode}) and the
   * family-function binding syntax {@code {m∶ℓ=0…b, …}} were added on this WIP
   * branch but relied on forward references inside the body: {@code m(ℓ)} and
   * {@code ℓ} appeared in the body before their declarations in the trailing
   * {@code {…}} block, which the left-to-right expression parser cannot support
   * without brittle defer-variable-resolution trickery. The arrow-first rewrite
   * below declares every index before it is referenced, keeping the parse
   * strictly left-to-right with no forward references at all.
   */
  public final ComplexSequence M =
      ComplexSequence.express("M",
                              "b→Σ ℓ→1/(2·ℓ+1)!{ℓ=0…b}",
                              context);

  /** Double-argument analogue: N(c) ≈ M(2·c). */
  public final ComplexSequence N =
      ComplexSequence.express("N",
                              "c→Σ ℓ→1/(2·ℓ+1)!{ℓ=0…2·c}",
                              context);

  /**
   * The moment sequence μ(n).
   *
   * <p>
   * Uses the same arrow-first prefix-declaration discipline as {@link #M} and
   * {@link #N}: every index appears on the left of a {@code ➔} before any body
   * expression can reference it. The single inner Σ's index {@code a} is
   * declared via {@code a➔…{a=0…n}}, and the body only references names that
   * are already in scope (the ambient {@code n} from {@code n➔}, and {@code a}
   * from the nested arrow).
   */
  public final ComplexSequence μ =
      ComplexSequence.express("μ",
                              "n→(-ⅈ)^n·n!·Σ a→ⅈ^a·M(n-a){a=0…n}",
                              context);

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
