package arb.functions.real;

import arb.Real;
import arb.functions.Function;

public interface NullaryFunction<R> extends  Function<Void, R>
{

  public default R evaluate(Void t, int order, int bits, R result)
  {
    return evaluate(bits,result);
  }

  public R evaluate(int bits, R result);

}