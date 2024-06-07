package arb.domains;

import static arb.RealConstants.one;
import static arb.RealConstants.zero;

import arb.Float;
import arb.FloatConstants;
import arb.FloatInterval;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class UnitFloatInterval extends
                               FloatInterval
{
  /**
   * 
   * @param closed the closedness of the interval. if true then endpoints will be
   *               incluRealded, otherwise they won't be
   */
  public UnitFloatInterval(boolean closed)
  {
    this(closed,
         closed);
  }

  /**
   * 
   * @param leftClosed  if true the endpoint 0 is included, false if not
   * @param rightClosed if true the endpoiunt 1 is included, false if not
   */
  public UnitFloatInterval(boolean leftClosed, boolean rightClosed)
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
