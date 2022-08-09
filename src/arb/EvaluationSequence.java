package arb;

import java.lang.ref.Cleaner.Cleanable;
import java.util.Iterator;

import arb.stochastic.RealProbabilityDensityFunction;
import arb.stochastic.ProbabilityDistributionFunction;

public class EvaluationSequence implements
                                Cleanable,
                                Iterable<RealOrderedPair>
{
  public EvaluationSequence(RealPartition partition, Real values)
  {
    this.partition = partition;
    this.values    = values;
  }

  public RealPartition partition;
  public Real          values;

  /**
   * Populates the this{@link #values} of this {@link EvaluationSequence} with
   * random {@link Real} numbers sampled from some density function
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
