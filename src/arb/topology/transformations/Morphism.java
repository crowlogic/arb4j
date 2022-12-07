package arb.topology.transformations;

import java.util.function.BiFunction;
import java.util.function.BinaryOperator;

public interface Morphism<X,Y,Z> extends
                         BiFunction<X,Y,Z>
{

}
