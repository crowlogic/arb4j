package arb;

import io.fair_acc.dataset.DataSet;
import io.fair_acc.dataset.spi.AbstractDataSet;

/**
 * A specialized DataSet class for handling sequences of Real numbers. This
 * class extends the AbstractDataSet and is designed to work with arb.Real
 * objects, which can be either scalars or vectors.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SequenceDataSet extends
                             AbstractDataSet<SequenceDataSet>
{

  /** Serialization ID */
  private static final long serialVersionUID = 1L;

  /** The sequence of Real numbers */
  private final Real        sequence;

  /**
   * Constructs a new SequenceDataSet with the given Real sequence.
   * 
   * @param sequence The Real sequence to be stored.
   */
  public SequenceDataSet(Real sequence)
  {
    super((String) (sequence.name != null ? sequence.name : String.valueOf(System.identityHashCode(sequence))),
          2);
    this.sequence = sequence;
  }

  /**
   * Retrieves the value at the given dimension and index.
   * 
   * @param dimension The dimension (0 for x-axis, 1 for y-axis).
   * @param index     The index of the data point.
   * @return The value at the given dimension and index.
   */
  @Override
  public double get(int dimension, int index)
  {
    assert dimension >= 0 && dimension <= 1 : String.format("dim=%d is not 0 or 1", dimension);
    if (dimension == 0)
    {
      return index + 1; // x-axis should be 1, 2, 3, 4, ...
    }
    else
    {
      return sequence.get(index).doubleValue(); // Convert arb.Real to double
    }
  }

  /**
   * Returns the total number of data points in the sequence.
   * 
   * @return The size of the sequence.
   */
  @Override
  public int getDataCount()
  {
    return sequence.size();
  }

  /**
   * This method is not supported as the DataSet is read-only.
   * 
   * @param other The other DataSet.
   * @param copy  Whether to copy the data.
   * @return null as operation is not supported.
   */
  @Override
  public DataSet set(DataSet other, boolean copy)
  {
    assert false : "read-only";
    return null;
  }
}
