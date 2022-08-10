package arb;

import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

import arb.stochastic.ProbabilityDistributionFunction;
import arb.stochastic.RealProbabilityDensityFunction;

public class EvaluationSequence implements
                                Cleanable,
                                Iterable<RealOrderedPair>
{
  public EvaluationSequence(RealPartition partition)
  {
    this.partition = partition;
    this.values    = Real.newVector(partition.count());
  }

  public final RealPartition partition;
  public final Real          values;

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
    values.forEach(value -> pdf.sample(prec, randomState, value));
    return this;
  }

  @Override
  public void clean()
  {
    values.close();
  }

  @Override
  public Iterator<RealOrderedPair> iterator()
  {
    return new EvaluationSequenceIterator(this);
  }

}
