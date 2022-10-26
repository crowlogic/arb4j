package arb.stochastic.processes;

import java.lang.ref.Cleaner.Cleanable;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Objects;

import arb.OrderedPair;
import arb.RandomState;
import arb.Real;
import arb.RealMatrix;
import arb.RealOrderedPair;
import arb.RealPartition;
import arb.stochastic.ProbabilityDistributionFunction;
import de.gsi.dataset.DataSet;
import de.gsi.dataset.DataSet2D;
import de.gsi.dataset.spi.AbstractDataSet;

/**
 * @see <a href=
 *      "../../functions/doc-files/IntegrationNotes.pdf">IntegrationNotes</a>
 */
public class EvaluationSequence extends
                                AbstractDataSet<EvaluationSequence> implements
                                Cleanable,
                                Iterable<RealOrderedPair>,
                                DataSet2D
{
  @Override
  public int hashCode()
  {
    final int prime  = 41;
    int       result = super.hashCode();
    result = prime * result + Arrays.hashCode(values);
    result = prime * result + Objects.hash(dim, partition);
    return result;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (!super.equals(obj))
      return false;
    if (getClass() != obj.getClass())
      return false;
    EvaluationSequence other = (EvaluationSequence) obj;
    return dim == other.dim && Objects.equals(partition, other.partition) && Arrays.equals(values, other.values);
  }

  private int dim;

  public EvaluationSequence(RealPartition partition, int dim)
  {
    super("EvaluationSequence",
          dim);
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
    for (Real dimension : values)
    {
      for (Real value : dimension)
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

  public Iterator<RealOrderedPair> iterator()
  {
    return new EvaluationSequenceIterator(this,
                                          dim);
  }

  @Override
  public double get(int dimIndex, int index)
  {
    if (dimIndex == 0)
    {
      dimIndex = 1;
    }
    else
    {
      dimIndex = 0;
    }
    return values[dimIndex].get(index).doubleValue();
  }

  @Override
  public int getDataCount()
  {
    return values[0].size();
  }

  @Override
  public DataSet set(DataSet other, boolean copy)
  {
    assert false : "todo";
    return null;
  }

}
