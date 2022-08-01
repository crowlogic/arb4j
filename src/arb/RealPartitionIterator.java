package arb;

import java.util.Iterator;

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
    return i < this.partition.x.dim;
  }

  @Override
  public Real next()
  {
    return this.partition.x.get(i++);
  }

}
