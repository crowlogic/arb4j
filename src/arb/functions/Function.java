package arb.functions;

import arb.NumberField;
import arb.exceptions.NotDifferentiableException;

@FunctionalInterface
public interface Function<D extends NumberField, R extends NumberField>
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

  public default <F extends Function<D, R>> F integral() throws NotDifferentiableException
  {
    assert false : "TODO: implement in " + getClass();
    return null;
  }

  public default <F extends Function> F inverse(int branch)
  {
    assert false : "TODO: implement in " + getClass();
    return null;
  }

  public default R newRangeElement()
  {
    assert false : "TODO: implement in " + getClass();
    return null;
  }

}
