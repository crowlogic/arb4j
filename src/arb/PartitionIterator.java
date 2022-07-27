package arb;

import java.util.*;

final class PartitionIterator implements
                              Iterator<Float>
{
  private final Partition partition;

  /**
   * @param partition
   */
  PartitionIterator(Partition partition)
  {
    this.partition = partition;
  }

  int i;

  @Override
  public boolean hasNext()
  {
    return i <= this.partition.n;
  }

  @Override
  public Float next()
  {
    return this.partition.get(i++);
  }
}