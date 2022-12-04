package arb.domains;

import java.time.Duration;

import arb.MarkedPoint;
import arb.topological.TopologicalSpace;

/**
 * Two {@link MarkedPoint}s on a rigid body form an {@link Interval}
 *
 * @see The Meaning of Relativity, Einstein, 1923, p.4
 * 
 * @param <F>
 */
public interface Interval<F extends Comparable<F>> extends
                         TopologicalSpace<F>
{
  @Override
  default boolean contains(F element)
  {
    return left().compareTo(element) <= 0 && right().compareTo(element) >= 0;
  }

  public F left();

  public F right();
  
  default Duration length()
  {
    assert false : "TODO: implement";
    return null;
  }
}
