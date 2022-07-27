package arb.domains;

import arb.Float;
import arb.topological.spaces.Space;

public interface Interval extends
                          Space<Float>
{
  public Float left();

  public Float right();
}
