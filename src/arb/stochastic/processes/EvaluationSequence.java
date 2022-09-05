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
      int n = partition.count();
      System.out.println("n=" + n);
      values[i] = Real.newVector(n);
    }
  }

  public final RealPartition partition;
  public final Real[]        values;

  /**
   * Populates the this{@link #values} of this {@link EvaluationSequence} with
   * random {@link Real} numbers sampled from some density function
   * 
   * @param pdf                   the {@link RealProbabilityDensityFunction} to
   *                              populate this{@link #values} with
   *                              {@link ProbabilityDistributionFunction#sample(RandomState, int, Real)}s
   *                              from
   * @param correlationRootMatrix TODO
   * @param randomState           the {@link RandomState} to use for (pseudo)
   *                              random number sequence generation
   * @param prec
   * @return this
   */
  public EvaluationSequence generateRandomSamples(ProbabilityDistributionFunction pdf,
                                                  RealMatrix correlationRootMatrix,
                                                  RandomState randomState,
                                                  int prec)
  {
    assert false : "TODO: finish implementating correlation";
    try ( CorrelatedRandomVectorGenerator generator = new CorrelatedRandomVectorGenerator(correlationRootMatrix,
                                                                                          prec,
                                                                                          randomState))
    {
      for (Real valueSequence : values)
      {
        pdf.sample(generator, prec, valueSequence);
      }
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

  public Iterator<OrderedPair<Real, Real>> iterator()
  {
    return new EvaluationSequenceIterator(this,
                                          dim);
  }

}
