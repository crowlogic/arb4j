package arb.topology.transformations;

import arb.groups.AutomorphismGroup;

public interface Transformation<A extends AutomorphismGroup>
{
  public A getAutomorphismGroup();
}
