
package arb.stochastic.processes.integrators;

/**
 * <pre>
 * Represents a multivariate state for a dynamical system. A multivariate state
 * is a collection of states, where each state corresponds to a dimension of the
 * system. The class is designed to be used with stochastic processes that have
 * multiple dimensions and require each dimension to be tracked separately.
 * 
 * This interface extends the {@link State} interface and introduces additional
 * methods specific to multivariate states, such as getting a state for a
 * specific dimension.
 * </pre>
 * 
 * @param <S> The type of {@link State} that the multivariate state contains for
 *            each dimension.
 */
public interface MultivariateState<S extends State> extends
                                  State
{
  /**
   * 
   * Returns the number of dimensions in the multivariate state.
   * 
   * @return The number of dimensions.
   */
  int dim();

  /**
   * 
   * Retrieves the state for the specified dimension.
   * 
   * @param i The index of the dimension for which to retrieve the state.
   * @return The state corresponding to the specified dimension.
   */
  public S getState(int i);
}