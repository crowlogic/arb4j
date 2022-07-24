package arb.domains;

import static arb.RealConstants.*;

import arb.Real;
import arb.spaces.Space;

public class UnitInterval implements
                          Interval
{
  /**
   * 
   * @param closed the closedness of the interval. if true then endpoints will be
   *               included, otherwise they won't be
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

  final boolean leftClosed, rightClosed;

  @Override
  public boolean contains(Real element)
  {
    boolean left  = leftClosed ? element.compareTo(zero) >= 0 : element.compareTo(zero) > 0;
    boolean right = rightClosed ? element.compareTo(one) <= 0 : element.compareTo(one) < 0;
    return left && right;
  }

}
