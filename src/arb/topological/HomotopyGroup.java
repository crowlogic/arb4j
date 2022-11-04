package arb.topological;

import arb.Field;
import arb.geometry.differential.homotopy.Homotopy;
import arb.groups.Group;

public interface HomotopyGroup<X extends Field> extends
                              Group,
                              Homotopy<X, X>
{

}
