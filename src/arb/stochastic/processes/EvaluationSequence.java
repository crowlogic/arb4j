package arb.stochastic.processes;

import java.lang.ref.Cleaner.Cleanable;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Objects;

import arb.RandomState;
import arb.Real;
import arb.RealMatrix;
import arb.RealOrderedPair;
import arb.RealPartition;
import arb.RoundingMode;
import arb.stochastic.ProbabilityDistributionFunction;
import de.gsi.dataset.DataSet;
import de.gsi.dataset.spi.AbstractDataSet;

/**
 * @see <a href=
 *      "../../functions/doc-files/IntegrationNotes.pdf">IntegrationNotes</a>
 */
public class EvaluationSequence implements
                                Cleanable,
                                Iterable<RealOrderedPair>
{
  private final int          dim;

  private final int          length;

  public final RealPartition partition;

  public final Real[]        dimensions;

  public DataSet getPriceDataSet()
  {
    return new AbstractDataSet("Price",
                               2)
    {

      @Override
      public double get(int dimension, int index)
      {
        if (dimension == 0)
        {
          return partition.get(index).doubleValue(RoundingMode.Near);
        }
        else
        {
          return dimensions[0].get(index).doubleValue(RoundingMode.Near);
        }
      }

      @Override
      public int getDataCount()
      {
        return length;
      }

      @Override
      public DataSet set(DataSet other, boolean copy)
      {
        assert false : "ShitPissFuckCuntCockSuckerMotherFuckerTitsFartTurdAndTwat";
        return null;
      }
    };
  }

  public DataSet getVarianceDataSet()
  {
    return new AbstractDataSet("Instantaneous Variance",
                               2)
    {

      @Override
      public double get(int dimension, int index)
      {
        if (dimension == 0)
        {
          return partition.get(index).doubleValue(RoundingMode.Near);
        }
        else
        {
          return dimensions[1].get(index).doubleValue(RoundingMode.Near);
        }
      }

      @Override
      public int getDataCount()
      {
        return length;
      }

      @Override
      public DataSet set(DataSet other, boolean copy)
      {
        assert false : "ShitPissFuckCuntCockSuckerMotherFuckerTitsFartTurdAndTwat";
        return null;
      }
    };
  }

  public EvaluationSequence(RealPartition partition, int dim)
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
    for (int i = 0; i < dim; i++)
    {
      for (Real array : dimensions[i])
      {
        array.close();
      }
    }
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
    return dim == other.dim && Objects.equals(partition, other.partition)
                  && Arrays.equals(dimensions, other.dimensions);
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
                                                  RealMatrix correlationRootMatrix,
                                                  RandomVectorGenerator generator,
                                                  int prec)
  {
    for (Real dimension : dimensions)
    {
      for (Real value : dimension)
      {
        pdf.sample(generator, prec, value);
      }
    }

    return this;
  }

  @Override
  public int hashCode()
  {
    final int prime  = 41;
    int       result = super.hashCode();
    result = prime * result + Arrays.hashCode(dimensions);
    result = prime * result + Objects.hash(dim, partition);
    return result;
  }

  public Iterator<RealOrderedPair> iterator()
  {
    return new EvaluationSequenceIterator(this,
                                          dim);
  }


}
