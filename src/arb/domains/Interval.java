package arb.domains;

import arb.MarkedPoint;
import arb.geometry.Point;
import arb.topological.Space;
import arb.topological.spaces.*;

/**
 * Two {@link MarkedPoint}s on a rigid body form an {@link Interval}
 *
 * @see The Meaning of Relativity, Einstein, 1923, p.4
 * 
 * @param <F>
 */
public interface Interval<F> extends
                         Space<F>
{
  public F left();

  public F right();
}
