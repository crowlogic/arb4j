package arb.stochastic.processes;

import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

import arb.OrderedPair;
import arb.RandomState;
import arb.Real;
import arb.RealMatrix;
import arb.RealPartition;
import arb.stochastic.ProbabilityDistributionFunction;
import arb.stochastic.RealProbabilityDensityFunction;

/**
 * @see <a href=
 *      "../../functions/doc-files/IntegrationNotes.pdf">IntegrationNotes</a>
 */
public class EvaluationSequence implements
                                Cleanable,
                                Iterable<OrderedPair<Real, Real>>
{
  private int dim;

  public EvaluationSequence(RealPartition partition, int dim)
  {
    assert dim > 0;
    this.partition = partition;
    this.values    = new Real[dim];
    this.dim       = dim;
    for (int i = 0; i < dim; i++)
    {
      values[i] = Real.newVector(partition.count());
    }
  }

  public final RealPartition partition;
  public final Real[]        values;

  /**
   * Populates the {@link #values} of this {@link EvaluationSequence} with random
   * {@link Real} numbers sampled from some
   * {@link ProbabilityDistributionFunction}
   * 
   * @param pdf                   the {@link ProbabilityDistributionFunction} to
   *                              populate {@link #values} with
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
                                                  RealMatrix correlationRootMatrix,
                                                  RandomVectorGenerator generator,
                                                  int prec)
  {
    for (int i = 0; i < dim; i++)
    {
      for (Real value : values[i])
      {
        pdf.sample(generator, prec, value);
      }
    }

    return this;
  }

  @Override
  public void clean()
  {
    for (int i = 0; i < dim; i++)
    {
      for (Real array : values[i])
      {
        array.close();
      }
    }
  }

  public Iterator<OrderedPair<Real, Real>> iterator()
  {
    return new EvaluationSequenceIterator(this,
                                          dim);
  }

}
