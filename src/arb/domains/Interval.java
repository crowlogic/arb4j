package arb.domains;

import arb.topological.spaces.*;

public interface Interval<F> extends
                         Space<F>
{
  public F left();

  public F right();
}
