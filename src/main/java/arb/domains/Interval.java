package arb.domains;

import java.time.Duration;

public interface Interval<F extends Comparable<F>> extends
                         Domain<F>
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
