package arb.functions;

import arb.Real;

public interface Function<D, R>
{
  public R evaluate(D t, int order, int prec, R res);

}
