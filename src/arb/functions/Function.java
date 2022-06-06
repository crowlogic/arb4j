package arb.functions;

import arb.Real;
import arb.exceptions.NotDifferentiableException;
import arb.exceptions.NotIntegrableException;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.TaylorShift;

public interface Function<D, R>
{
  public R evaluate(D t, int order, int prec, R res);

  public default Function<D,R> differential() throws NotDifferentiableException
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

  public default int getInverseBranchCount()
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

  public default Function<D,R> integral() throws NotDifferentiableException
  {
    throw new UnsupportedOperationException("TODO: implement");
  }
}
