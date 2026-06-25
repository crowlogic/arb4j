package arb.functions;

import arb.Real;

/**
 * Owns the convergence decision for a {@code Σ{a..∞}} accumulation whose loop
 * is emitted by {@link arb.expressions.nodes.nary.NAryOperationNode}. The
 * generated code does the term evaluation and combination into its own running
 * {@link Real} partial sum, then — once per iteration — consults
 * {@link #converged(Real, int)} to learn whether another term can still change
 * the result at the requested precision.
 *
 * <p>
 * The gap between two consecutive partial sums is exactly the term just added,
 * so {@code |sₙ − sₙ₋₁| ≤ |sₙ|·2⁻ᵇⁱᵗˢ} is the statement that the next term has
 * dropped below the working precision relative to the accumulated value; at
 * that point the series has been carried to the requested precision and the
 * loop terminates. All of the bookkeeping lives here, in plain Java, rather
 * than being unrolled into bytecode at generation time: the generator decides
 * <em>which</em> accumulation to emit, this class decides <em>when</em> it has
 * converged.
 *
 * <p>
 * A single instance is reused across every {@code evaluate(…)} call on the
 * owning function, so {@link #reset()} must be invoked before each fresh
 * accumulation to discard the previous run's partial-sum history. Like every
 * other arb-backed scratch field declared as a compiler intermediate variable,
 * it is {@link AutoCloseable} and is closed by the generated {@code close()}.
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public final class ConvergentSeriesAccumulator implements
                                               AutoCloseable
{
  private final Real previous  = new Real();

  private final Real gap       = new Real();

  private final Real tolerance = new Real();

  private boolean    havePrevious;

  /**
   * Discards the partial-sum history so the next {@link #converged(Real, int)}
   * sequence starts fresh. The generated loop calls this once, immediately
   * before accumulating its first term.
   */
  public void reset()
  {
    havePrevious = false;
  }

  /**
   * Reports whether the running partial {@code sum} has converged to the
   * requested {@code bits} of precision. The first call of a run merely records
   * the partial sum and returns {@code false} (no gap is available yet); every
   * subsequent call compares the gap {@code |sum − previous|} — i.e. the
   * magnitude of the most recently added term — against {@code |sum|·2⁻ᵇⁱᵗˢ},
   * returning {@code true} exactly when the term can no longer influence the
   * result at this precision.
   *
   * @param sum  the current partial sum, owned by the generated loop
   * @param bits the working precision in bits
   * @return {@code true} when the accumulation has reached the requested
   *         precision and the loop should stop
   */
  public boolean converged(Real sum, int bits)
  {
    if (!havePrevious)
    {
      previous.set(sum);
      havePrevious = true;
      return false;
    }
    sum.sub(previous, bits, gap).abs();
    sum.abs(bits, tolerance).mul2e(-bits, tolerance);
    previous.set(sum);
    return gap.compareTo(tolerance) <= 0;
  }

  @Override
  public void close()
  {
    previous.close();
    gap.close();
    tolerance.close();
  }
}
