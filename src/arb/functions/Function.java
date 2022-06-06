package arb.functions;

import static java.lang.Math.*;

import arb.*;
import arb.exceptions.*;
import arb.functions.complex.*;

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

  public default ComplexFunction inverse(int branch)
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

  /**
   * @return function which returns the absolute value of this function
   */
  public default Function<D, Real> abs()
  {
    Function<D, Real> function = (z, order, prec, w) ->
    {
      order = max(1, order);
      assert order < 2 : "TODO: implement derivative which returns NaN at 0 and -1 when negative and +1 when positive";
      try ( R x = newRangeElement())
      {
        Function.this.evaluate(z, order, prec, x);
        if (w.isFinite())
        {
          x.abs(prec, w);
        }
      }
      return w;
    };
    return function;
  }

  public default R newRangeElement()
  {
    throw new UnsupportedOperationException("TODO: implement");
  }

  public default void
         integrate(Real a, Real b, int i, Magnitude absErr, IntegrationOptions opts, int prec, Real integral)
  {
    throw new UnsupportedOperationException("TODO: implement");
  }
}
