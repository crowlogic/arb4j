package arb.functions;

import arb.functions.integer.Sequence;

public interface FunctionalSequence<C, D, F extends Function<? extends C, ? extends D>> extends
                                   Sequence<Functional<C, D, F>>
{

}
