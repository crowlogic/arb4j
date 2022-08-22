package arb.functions;

import arb.Field;
import arb.Real;
import arb.exceptions.NotDifferentiableException;

public interface Function<D, R>
{

  public R evaluate(D t, int order, int prec, R res);

  public default Function<D, R> differential() throws NotDifferentiableException
  {
    assert false : "TODO: implement in " + getClass();
    return null;
  }

  public default int getInverseBranchCount()
  {
    assert false : "TODO: implement in " + getClass();
    return 0;
  }

  public default <F extends Function> F inverse(int branch)
  {
    assert false : "TODO: implement in " + getClass();
    return null;
  }

}
