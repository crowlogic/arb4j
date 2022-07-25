package arb.functions;

import arb.OrderedPair;

public interface BivariateFunction<Ω, X> extends
                                  Function<OrderedPair<Ω, Ω>, X>
{

}
