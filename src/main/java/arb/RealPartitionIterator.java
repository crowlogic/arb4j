package arb;

import java.util.Iterator;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealPartitionIterator implements
                                   Iterator<Real>
{
  private final RealPartition partition;

  /**
   * @param partition
   */
  public RealPartitionIterator(RealPartition partition)
  {
    this.partition = partition;
  }

  int i;

  @Override
  public boolean hasNext()
  {
    return i < partition.T.dim;
  }

  @Override
  public Real next()
  {
    return partition.T.get(i++);
  }

}
