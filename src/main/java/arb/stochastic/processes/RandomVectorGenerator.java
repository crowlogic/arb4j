package arb.stochastic.processes;

import java.io.Closeable;

import arb.RandomState;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * An interface for generating random vectors that defines methods for getting
 * the random state and generating the next random element.
 *
 * Classes implementing this interface are expected to provide a specific
 * algorithm or technique for generating random vectors in the context of
 * stochastic processes.
 *
 * @see AutoCloseable
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RandomVectorGenerator extends
                                       AutoCloseable,
                                       Closeable
{

  @Override
  public void close();

  /**
   * Retrieves the {@link RandomState} associated with this random vector
   * generator.
   * 
   * @return The {@code RandomState} object.
   */
  public RandomState getRandomState();

  /**
   * Generates the next random element in the vector with the specified precision.
   * 
   * @param prec   The precision to be used for generating the random element.
   * @param result The {@link Real} object where the result will be stored.
   * @return The result after a generated random element is stored in it
   */
  public Real nextElement(int prec, Real result);
}
