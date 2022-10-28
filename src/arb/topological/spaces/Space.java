package arb.topological.spaces;

import arb.Field;
import arb.geometry.Manifold;

public interface Space<X extends Field> extends
                      HilbertSpace<X>,
                      Manifold<X>
{

}
