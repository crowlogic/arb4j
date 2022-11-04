package arb.topological.spaces;

import arb.topological.TopologicalSpace;

public interface TangentSpace<X> extends
                             TopologicalSpace<X>
{
  public int getDimension();
}
