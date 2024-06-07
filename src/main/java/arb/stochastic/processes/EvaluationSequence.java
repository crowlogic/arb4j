package arb.stochastic.processes;

import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

import arb.RandomState;
import arb.Real;
import arb.RealMatrix;
import arb.RealOrderedPair;
import arb.RealPartition;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.ProbabilityDistributionFunction;
import io.fair_acc.dataset.DataSet;

/**
 * The {@code EvaluationSequence} class represents a sequence of evaluations for
 * a stochastic process. Each evaluation consists of a set of real numbers
 * organized in dimensions. The evaluations are generated from a
 * {@link ProbabilityDistributionFunction} and can be correlated or uncorrelated
 * depending on the provided correlation matrix. The class also supports
 * iterating through the evaluations as pairs of real numbers
 * ({@link RealOrderedPair}).
 * <p>
 * Key features of the {@code EvaluationSequence} class include:
 * </p>
 * <ul>
 * <li>Creating an evaluation sequence with specified partition and
 * dimensions.</li>
 * <li>Generating random samples for the evaluations using a probability
 * distribution function.</li>
 * <li>Specifying correlated or uncorrelated variables with a correlation
 * matrix.</li>
 * <li>Iterating through the evaluations as pairs of real numbers.</li>
 * <li>Releasing resources associated with the evaluation sequence.</li>
 * </ul>
 * <p>
 * Typical use cases for this class involve generating, storing, and analyzing
 * sequences of evaluations in stochastic processes, such as in financial or
 * scientific simulations.
 * </p>
 * 
 * @see RealOrderedPair
 * @see ProbabilityDistributionFunction
 * @see RealPartition
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class EvaluationSequence implements
                                Cleanable,
                                Iterable<RealOrderedPair>
{
  private final int          dim;

  final int                  length;

  public final RealPartition partition;

  public final Real[]        dimensions;

  public DataSet getDataSet(String name, int datasetDim)
  {
    return new EvaluationSequenceDataSet(this,
                                         name,
                                         datasetDim);
  }

  public EvaluationSequence(RealPartition partition,
                            int dim)
  {
    assert dim > 0;
    this.partition  = partition;
    this.length     = partition.count();
    this.dimensions = new Real[dim];
    this.dim        = dim;
    for (int i = 0; i < dim; i++)
    {
      dimensions[i] = Real.newVector(length);
    }
  }

  @Override
  public void clean()
  {
    for (var dimension : dimensions)
    {
      dimension.forEach(Real::close);
    }
  }

  /**
   * Populates the {@link #dimensions} of this {@link EvaluationSequence} with
   * random {@link Real} numbers sampled from some
   * {@link ProbabilityDistributionFunction}
   * 
   * @param pdf                   the {@link ProbabilityDistributionFunction} to
   *                              populate {@link #dimensions} with
   *                              {@link ProbabilityDistributionFunction#sample(RandomState, int, Real)}s
   *                              from
   * @param correlationRootMatrix the Cholesky factorization of the correlation
   *                              matrix or null to specify uncorrelated variables
   * @param generator             the {@link RandomState} to use for (pseudo)
   *                              random number sequence generation
   * @param prec
   * @return this
   */
  public EvaluationSequence generateRandomSamples(ProbabilityDistributionFunction pdf,
                                                  RealMatrix correlationMatrix,
                                                  RandomState randomState,
                                                  int prec)
  {
    try ( RandomVectorGenerator generator = correlationMatrix == null ? randomState : new CorrelatedRandomVectorGenerator(correlationMatrix,
                                                                                                                          prec,
                                                                                                                          randomState))
    {
      for (Real dimension : dimensions)
      {
        for (Real value : dimension)
        {
          pdf.sample(generator, prec, value);
        }
      }
    }

    return this;
  }

  @Override
  public Iterator<RealOrderedPair> iterator()
  {
    return new EvaluationSequenceIterator(this,
                                          dim);
  }

}
