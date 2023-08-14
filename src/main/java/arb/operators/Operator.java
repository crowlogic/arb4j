package arb.operators;

import arb.space.topological.Space;

public interface Operator<IN extends Space<?>, OUT extends Space<?>>
{
  OUT apply(IN x, int bits, OUT result);
}
