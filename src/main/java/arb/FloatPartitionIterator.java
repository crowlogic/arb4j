package arb;

import java.util.Iterator;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
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