package arb;

import java.util.Iterator;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class FloatPartitionIterator implements
                                          Iterator<Float>
{
  private final FloatPartition partition;

  /**
   * @param partition
   */
  FloatPartitionIterator(FloatPartition partition)
  {
    this.partition = partition;
  }

  int i;

  @Override
  public boolean hasNext()
  {
    return i < partition.n;
  }

  @Override
  public Float next()
  {
    return partition.get(i++);
  }
}