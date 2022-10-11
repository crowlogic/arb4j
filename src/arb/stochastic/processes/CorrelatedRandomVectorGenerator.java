package arb.stochastic.processes;

import arb.RandomState;
import arb.Real;
import arb.RealMatrix;

public class CorrelatedRandomVectorGenerator implements
                                             RandomVectorGenerator,
                                             AutoCloseable
{
  /** Mean vector. */
  private final Real       mean;

  /** Storage for the normalized vector. */
  private final Real       normalized;
  /** Root of the covariance matrix. */
  private final RealMatrix root;
  private RandomState      randomState;

  /**
   * Builds a correlated random vector generator from its mean vector and
   * covariance matrix.
   *
   * @param mean        Expected mean values for all components.
   * @param covariance  Covariance matrix.
   * @param prec        bits of precision used to calculate the square-root of the
   *                    covariacne matrix
   * @param randomState {@link RandomState} used for sample generation
   */
  public CorrelatedRandomVectorGenerator(Real mean, RealMatrix covariance, int prec, RandomState randomState)
  {
    int order = covariance.getNumRows();
    assert mean.dim == order;
    this.mean = mean;
    covariance.chol(prec, root = RealMatrix.newMatrix(order, order));
    this.randomState = randomState;
    normalized       = Real.newVector(order);

  }

  public CorrelatedRandomVectorGenerator(RealMatrix covariance, int prec, RandomState randomState)
  {
    int order = covariance.getNumRows();
    mean = new Real(order);
    covariance.chol(prec, root = RealMatrix.newMatrix(order, order));
    this.randomState = randomState;
    normalized       = Real.newVector(order);

  }

  public RandomState getRandomState()
  {
    return randomState;
  }

  /**
   * Get the rank of the covariance matrix. The rank is the number of independent
   * rows in the covariance matrix, it is also the number of columns of the root
   * matrix.
   * 
   * @return rank of the square matrix.
   * @see #getRootMatrix()
   */
  public int getRank()
  {
    return normalized.dim;
  }

  /**
   * Get the root of the covariance matrix. The root is the rectangular matrix
   * <code>B</code> such that the covariance matrix is equal to
   * <code>B.B<sup>T</sup></code>
   * 
   * @return root of the square matrix
   * @see #getRank()
   */
  public RealMatrix getRootMatrix()
  {
    return root;
  }

  /**
   * 
   * @param prec   precision
   * @param result result
   * @return result
   */
  public Real nextElement(int prec, Real result)
  {
    assert result.dim == mean.dim : String.format("result.dim = %d != mean.dim = %d\n", result.dim, mean.dim);
    // generate uncorrelated vector
    for (int i = 0; i < normalized.dim; ++i)
    {
      normalized.get(i).random(randomState, prec);
    }

    // compute correlated vector
    Real correlated = result.zero();
    for (int i = 0; i < correlated.dim; ++i)
    {
      Real ci = correlated.get(i);
      ci.set(mean.get(i));
      for (int j = 0; j < root.getNumCols(); ++j)
      {
        root.get(i, j).addmul(normalized.get(j), prec, ci);
      }
    }

    return result;
  }

  @Override
  public void close()
  {
    mean.close();
    normalized.close();
    root.close();
  }

}
