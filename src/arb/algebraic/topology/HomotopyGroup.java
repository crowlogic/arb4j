package arb.algebraic.topology;

import arb.Field;
import arb.differential.homotopy.Homotopy;
import arb.groups.Group;

public interface HomotopyGroup<X extends Field> extends
                              Group,
                              Homotopy<X, X>
{

}
