package arb.combinatorics;

import java.util.Arrays;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * An immutable integer partition: a weakly decreasing sequence of positive
 * integers {@code p_1 >= p_2 >= ... >= p_k >= 1} whose sum is {@link #n()}.
 *
 * <p>
 * Distinct from {@link arb.Partition} / {@link arb.RealPartition} /
 * {@link arb.FloatPartition}, which are quadrature meshes over an interval.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class IntegerPartition
{
  private final int[] parts;
  private final int   sum;

  /**
   * @param partsInDescendingOrder parts in weakly decreasing order, all
   *                               positive; empty array represents the
   *                               partition of 0
   */
  public IntegerPartition(int[] partsInDescendingOrder)
  {
    int s = 0;
    for (int i = 0; i < partsInDescendingOrder.length; i++)
    {
      int v = partsInDescendingOrder[i];
      if (v <= 0)
      {
        throw new IllegalArgumentException("parts must be positive at index "
                                           + i + ": " + v);
      }
      if (i > 0 && partsInDescendingOrder[i - 1] < v)
      {
        throw new IllegalArgumentException("parts must be weakly decreasing at index "
                                           + i + ": "
                                           + partsInDescendingOrder[i - 1]
                                           + " < " + v);
      }
      s += v;
    }
    this.parts = partsInDescendingOrder.clone();
    this.sum   = s;
  }

  /** The integer being partitioned. */
  public int n()
  {
    return sum;
  }

  /** Number of parts. */
  public int length()
  {
    return parts.length;
  }

  /** The i-th part, 0 &lt;= i &lt; {@link #length()}, in descending order. */
  public int get(int i)
  {
    return parts[i];
  }

  /** Defensive copy of the parts array. */
  public int[] toArray()
  {
    return parts.clone();
  }

  /**
   * Multiplicity vector: {@code m[v-1]} = number of parts equal to {@code v}
   * for {@code v = 1..n()}. Length equals {@link #n()}; the partition of 0
   * returns a zero-length array.
   */
  public int[] multiplicities()
  {
    int[] m = new int[sum];
    for (int v : parts)
    {
      m[v - 1]++;
    }
    return m;
  }

  /** The conjugate (transpose) partition. */
  public IntegerPartition conjugate()
  {
    if (parts.length == 0)
    {
      return this;
    }
    int   largest = parts[0];
    int[] c       = new int[largest];
    for (int v : parts)
    {
      for (int i = 0; i < v; i++)
      {
        c[i]++;
      }
    }
    return new IntegerPartition(c);
  }

  @Override
  public boolean equals(Object o)
  {
    return o instanceof IntegerPartition p && Arrays.equals(parts, p.parts);
  }

  @Override
  public int hashCode()
  {
    return Arrays.hashCode(parts);
  }

  @Override
  public String toString()
  {
    if (parts.length == 0)
    {
      return "()";
    }
    StringBuilder sb = new StringBuilder();
    sb.append('(');
    for (int i = 0; i < parts.length; i++)
    {
      if (i > 0)
      {
        sb.append('+');
      }
      sb.append(parts[i]);
    }
    sb.append(')');
    return sb.toString();
  }
}
