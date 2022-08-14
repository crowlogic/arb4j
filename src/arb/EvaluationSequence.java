package arb;

import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

import arb.stochastic.ProbabilityDistributionFunction;
import arb.stochastic.RealProbabilityDensityFunction;
import arb.stochastic.processes.CorrelatedWienerProcess;

/**
 * TODO: how to implement {@link CorrelatedWienerProcess}
 * 
 *
 */
public class EvaluationSequence implements
                                Cleanable,
                                Iterable<RealOrderedPair>
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
   * Populates the this{@link #values} of this {@link EvaluationSequence} with
   * random {@link Real} numbers sampled from some density function
   * 
   * TODO: find a way to parallelize this while keeping determinism
   * 
   * @param pdf         the {@link RealProbabilityDensityFunction} to populate
   *                    this{@link #values} with
   *                    {@link ProbabilityDistributionFunction#sample(int, RandomState, Real)}s
   *                    from
   * @param randomState the {@link RandomState} to use for (pseudo) random number
   *                    sequence generation
   * @param prec
   * @return this
   */
  public EvaluationSequence
         generateRandomSamples(ProbabilityDistributionFunction pdf, RandomState randomState, int prec)
  {
    for (Real valueSequence : values)
    {
      pdf.sample(valueSequence, randomState, prec);
    }
    return this;
  }

  @Override
  public void clean()
  {
    for (Real array : values)
    {
      array.close();
    }
  }

  public Iterator<RealOrderedPair> iterator()
  {
    return iterator(0);
  }

  public Iterator<RealOrderedPair> iterator(int i)
  {
    return new EvaluationSequenceIterator(this,
                                          i);
  }

}
