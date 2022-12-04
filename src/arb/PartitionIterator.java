package arb;

import java.util.Iterator;

final class PartitionIterator implements
                              Iterator<Float>
{
  private final FloatPartition partition;

  /**
   * @param partition
   */
  PartitionIterator(FloatPartition partition)
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