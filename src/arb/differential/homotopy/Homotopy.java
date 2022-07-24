package arb.differential.homotopy;

import arb.Field;
import arb.domains.UnitInterval;
import arb.functions.Function;
import arb.spaces.ProductSpace;

public interface Homotopy<A extends Field, B extends Field> extends
                         Function<ProductSpace<A, UnitInterval>, B>
{

}
