package arb.functions;

import arb.Field;
import arb.exceptions.NotDifferentiableException;
import arb.functions.complex.ComplexFunction;

@FunctionalInterface
public interface Function<D extends Field, R extends Field>
{

  public R evaluate(D t, int order, int prec, R res);

  public default Function<D, R> differential() throws NotDifferentiableException
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

  public default int getInverseBranchCount()
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

  public default Function<D, R> integral() throws NotDifferentiableException
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

  public default  <F extends Function> F inverse(int branch)
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

  public default R newRangeElement()
  {
    throw new UnsupportedOperationException("TODO: implement");
  }


  

}
