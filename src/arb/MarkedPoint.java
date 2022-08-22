package arb;

import arb.geometry.Point;

/**
 * A {@link MarkedPoint} is a {@link Point} with associated event marks which
 * may include information about the event types or marks (discrete), location
 * (continuous) or other event attributes. In
 * 
 * @param <X>
 */
public interface MarkedPoint<X> extends
                            Point
{
  X eventMarks();
}
