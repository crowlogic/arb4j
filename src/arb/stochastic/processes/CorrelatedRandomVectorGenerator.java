package arb.stochastic.processes;

import arb.RandomState;
import arb.Real;
import arb.RealMatrix;

/**
 * A {@link RandomVectorGenerator} that generates vectors with with correlated
 * components.
 * <p>
 * Random vectors with correlated components are built by combining the
 * uncorrelated components of another random vector in such a way that the
 * resulting correlations are the ones specified by a positive definite
 * covariance matrix.
 * </p>
 * <p>
 * The main use for correlated random vector generation is for Monte-Carlo
 * simulation of physical problems with several variables, for example to
 * generate error vectors to be added to a nominal vector. A particularly
 * interesting case is when the generated vector should be drawn from a
 * <a href="http://en.wikipedia.org/wiki/Multivariate_normal_distribution">
 * Multivariate Normal Distribution</a>. The approach using a Cholesky
 * decomposition is quite usual in this case. However, it can be extended to
 * other cases as long as the underlying random generator provides
 * {@link NormalizedRandomGenerator normalized values} like
 * {@link GaussianRandomGenerator} or {@link UniformRandomGenerator}.
 * </p>
 * <p>
 * Sometimes, the covariance matrix for a given simulation is not strictly
 * positive definite. This means that the correlations are not all independent
 * from each other. In this case, however, the non strictly positive elements
 * found during the Cholesky decomposition of the covariance matrix should not
 * be negative either, they should be null. Another non-conventional extension
 * handling this case is used here. Rather than computing
 * <code>C = U<sup>T</sup>.U</code> where <code>C</code> is the covariance
 * matrix and <code>U</code> is an upper-triangular matrix, we compute
 * <code>C = B.B<sup>T</sup></code> where <code>B</code> is a rectangular matrix
 * having more rows than columns. The number of columns of <code>B</code> is the
 * rank of the covariance matrix, and it is the dimension of the uncorrelated
 * random vector that is needed to compute the component of the correlated
 * vector. This class handles this situation automatically.
 * </p>
 *
 * @since 1.2
 */

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
   * @param mean       Expected mean values for all components.
   * @param covariance Covariance matrix.
   * @param small      Diagonal elements threshold under which column are
   *                   considered to be dependent on previous ones and are
   *                   discarded
   * @param generator  underlying generator for uncorrelated normalized
   *                   components. @
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

  /**
   * Builds a null mean random correlated vector generator from its covariance
   * matrix.
   *
   * @param covariance Covariance matrix.
   * @param small      Diagonal elements threshold under which column are
   *                   considered to be dependent on previous ones and are
   *                   discarded.
   * @param generator  Underlying generator for uncorrelated normalized
   *                   components.
   * @throws org.apache.commons.math3.linear.NonPositiveDefiniteMatrixException if
   *                                                                            the
   *                                                                            covariance
   *                                                                            matrix
   *                                                                            is
   *                                                                            not
   *                                                                            strictly
   *                                                                            positive
   *                                                                            definite.
   */
  public CorrelatedRandomVectorGenerator(RealMatrix covariance, int prec, RandomState randomState)
  {
    int order = covariance.getNumRows();
    mean = new Real(order);
    covariance.chol(prec, root = RealMatrix.newMatrix(order, order));
    this.randomState = randomState;
    normalized       = Real.newVector(order);

  }

  /**
   * Get the underlying normalized components generator.
   * 
   * @return underlying uncorrelated components generator
   */
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

    // generate uncorrelated vector
    for (int i = 0; i < normalized.dim; ++i)
    {
      normalized.get(i).random(randomState, prec);
    }

    // compute correlated vector
    Real correlated = result.zero();
    try ( Real t = new Real();)
    {
      for (int i = 0; i < correlated.dim; ++i)
      {
        Real ci = correlated.get(i);
        ci.set(mean.get(i));
        for (int j = 0; j < root.getNumCols(); ++j)
        {
          ci.add(root.get(i, j).mul(normalized.get(j), prec, t), prec);
        }
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
