package arb.groups;

import arb.Field;

public interface LieGroup<X extends Field<X>> extends
                         Group<X>,
                         ParallelizableManifold<X>
{

}
