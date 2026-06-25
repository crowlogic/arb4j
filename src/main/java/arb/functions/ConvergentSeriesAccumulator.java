package arb.functions;

import arb.Complex;
import arb.Magnitude;
import arb.Real;

/**
 * Owns the convergence decision for a {@code Σ{a..∞}} accumulation whose loop
 * is emitted by {@link arb.expressions.nodes.nary.NAryOperationNode}. The
 * generated code does the term evaluation and combination into its own running
 * partial sum, then — once per iteration — consults {@link #converged(Real,
 * int)} (or {@link #converged(Complex, int)}) to learn whether another term can
 * still change the verified result at the requested precision.
 *
 * <p>
 * The gap between two consecutive partial sums is exactly the term just added.
 * The accumulation has reached the best result the working precision can
 * certify once that gap has fallen <em>within the partial sum's own error
 * radius</em>: at that point the most recently added term is already dominated
 * by the rigorous uncertainty {@code rad(sₙ)} that arb has accumulated into the
 * ball, so no further term can rigorously improve the answer and the verified
 * ball {@code sₙ} already encloses the true sum to the achievable precision.
 * This is a statement about the verified ball — a mathematical fact, not an
 * iteration count or an elapsed-time budget — so an arbitrarily slowly
 * converging series is never cut short: its terms stay above the (slowly
 * growing) radius for exactly as long as they are still improving the result.
 * The complementary test {@code |sₙ − sₙ₋₁| ≤ |sₙ|·2⁻ᵇⁱᵗˢ} stops a series that
 * reaches the requested relative precision before the radius floor is met. All
 * of the bookkeeping lives here, in plain Java, rather than being unrolled into
 * bytecode at generation time: the generator decides <em>which</em>
 * accumulation to emit, this class decides <em>when</em> it has converged.
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
  private final Real      previous        = new Real();

  private final Complex   previousComplex = new Complex();

  private final Complex   gapComplex      = new Complex();

  private final Real      gap             = new Real();

  private final Real      magnitude       = new Real();

  private final Real      tolerance       = new Real();

  private final Magnitude termBound       = new Magnitude();

  private boolean         havePrevious;

  /**
   * Discards the partial-sum history so the next {@code converged(…)} sequence
   * starts fresh. The generated loop calls this once, immediately before
   * accumulating its first term.
   */
  public void reset()
  {
    havePrevious = false;
  }

  /**
   * Reports whether the running real partial {@code sum} has reached the best
   * result the working precision can certify; see {@link #converged(Real, Real,
   * int)} for the criterion. The first call of a run merely records the partial
   * sum and returns {@code false} (no gap is available yet).
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
    sum.sub(previous, bits, gap);
    previous.set(sum);
    return converged(gap, sum.abs(bits, magnitude), sum.getRad(), bits);
  }

  /**
   * The complex-valued counterpart of {@link #converged(Real, int)}. The gap
   * {@code |sₙ − sₙ₋₁|} is the modulus of the most recently added term and the
   * uncertainty radius is taken from the modulus {@code |sₙ|} of the partial
   * sum, so the same verified-ball criterion carries over unchanged to the
   * complex plane.
   *
   * @param sum  the current complex partial sum, owned by the generated loop
   * @param bits the working precision in bits
   * @return {@code true} when the accumulation has reached the requested
   *         precision and the loop should stop
   */
  public boolean converged(Complex sum, int bits)
  {
    if (!havePrevious)
    {
      previousComplex.set(sum);
      havePrevious = true;
      return false;
    }
    sum.sub(previousComplex, bits, gapComplex).abs(bits, gap);
    previousComplex.set(sum);
    Magnitude reRad = sum.re().getRad();
    Magnitude imRad = sum.im().getRad();
    Magnitude radius = reRad.compareTo(imRad) >= 0 ? reRad : imRad;
    return converged(gap, sum.abs(bits, magnitude), radius, bits);
  }

  /**
   * The shared verified-ball convergence criterion. Given the magnitude
   * {@code gap} of the most recently added term and the magnitude
   * {@code magnitude = |sₙ|} of the partial sum (whose error radius
   * {@code rad(|sₙ|)} is the rigorous uncertainty arb has accumulated into the
   * running ball), the accumulation has converged when either
   *
   * <ul>
   * <li>the term has fallen within that uncertainty radius — it can no longer
   * rigorously improve the verified result — or</li>
   * <li>the term has dropped below the requested relative precision
   * {@code |sₙ|·2⁻ᵇⁱᵗˢ}.</li>
   * </ul>
   *
   * @param gap       the magnitude of the most recently added term
   * @param magnitude the magnitude {@code |sₙ|} of the partial sum
   * @param bits      the working precision in bits
   * @return {@code true} when either criterion holds
   */
  private boolean converged(Real gap, Real magnitude, Magnitude radius, int bits)
  {
    return gap.getMagnitude(termBound).compareTo(radius) <= 0;
  }

  @Override
  public void close()
  {
    previous.close();
    previousComplex.close();
    gapComplex.close();
    gap.close();
    magnitude.close();
    tolerance.close();
    termBound.close();
  }
}
