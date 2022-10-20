package arb.domains;

import static arb.RealConstants.*;

import arb.Real;
import arb.topological.TopologicalSpace;
import arb.Float;
import arb.FloatConstants;

public class UnitInterval implements
                          FloatInterval
{
  /**
   * 
   * @param closed the closedness of the interval. if true then endpoints will be
   *               incluRealded, otherwise they won't be
   */
  public UnitInterval(boolean closed)
  {
    this(closed,
         closed);
  }

  /**
   * 
   * @param leftClosed  if true the endpoint 0 is included, false if not
   * @param rightClosed if true the endpoiunt 1 is included, false if not
   */
  public UnitInterval(boolean leftClosed, boolean rightClosed)
  {
    this.leftClosed  = leftClosed;
    this.rightClosed = rightClosed;
  }

  boolean leftClosed, rightClosed;

  @Override
  public boolean contains(Float element)
  {
    boolean left  = leftClosed ? element.compareTo(zero.getMid()) >= 0 : element.compareTo(zero.getMid()) > 0;
    boolean right = rightClosed ? element.compareTo(one.getMid()) <= 0 : element.compareTo(one.getMid()) < 0;
    return left && right;
  }

  @Override
  public Float left()
  {
    return FloatConstants.zero;

  }

  @Override
  public Float right()
  {
    return FloatConstants.one;

  }

}
