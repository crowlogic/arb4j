package arb.viz;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Threading-agnostic progress sink. Long-running computations call
 * {@link #setFraction(double)} from worker threads to report progress and
 * check {@link #isCancelled()} in their outer loop to honor cancellation.
 *
 * <p>Implementations are responsible for marshaling cross-thread updates
 * onto whatever UI thread they target; callers may invoke from any thread.
 *
 * @see BusinessSourceLicenseVersionOnePointOne \u00a9 terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ProgressReporter
{
  /**
   * Report fractional progress in {@code [0, 1]}. Values outside the
   * range are clamped. Safe to call from any thread.
   */
  void setFraction(double fraction);

  /** Optional human-readable status string. Safe to call from any thread. */
  default void setMessage(String message) {}

  /**
   * True once the user has requested cancellation. Long-running loops
   * should check this between iterations and abort early when set.
   */
  boolean isCancelled();

  /** No-op reporter for non-interactive callers. */
  ProgressReporter NULL = new ProgressReporter()
  {
    @Override public void setFraction(double f) {}
    @Override public boolean isCancelled() { return false; }
  };
}
