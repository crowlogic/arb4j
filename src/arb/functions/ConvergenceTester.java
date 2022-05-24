package arb.functions;

public interface ConvergenceTester<V>
{
  /**
   * Check if the optimization algorithm has converged.
   *
   * @param iteration Current iteration.
   * @param previous  Best point in the previous iteration.
   * @param current   Best point in the current iteration.
   * @return {@code true} if the algorithm is considered to have converged.
   */
  boolean converged(int iteration, V previous, V current);

}
