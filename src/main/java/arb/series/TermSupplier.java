package arb.series;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Supplier of the {@code n}-th partial sum of a series over a field element type
 * {@code X}, consumed by {@link EpsilonAlgorithm#drive}. Writes {@code S(n)} into
 * {@code result} and returns it, so the partial sums may be produced lazily
 * (e.g.\ by re-evaluating a compiled expression at successive truncation orders)
 * without ever being materialized as an array.
 *
 * @param <X> the field element type ({@link arb.Real}, {@link arb.Complex}, …)
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@FunctionalInterface
public interface TermSupplier<X>
{
  /** Write the {@code n}-th partial sum into {@code result} and return it. */
  X term(int n, int bits, X result);
}
