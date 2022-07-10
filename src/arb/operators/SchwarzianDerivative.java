package arb.operators;

import arb.*;
import arb.functions.complex.*;

/**
 * Among other things the Schwarzian derivative measures how much a function
 * deviates from being a Mobius transform at a particular point
 * 
 * @param <F>
 */
public class SchwarzianDerivative<F extends ComplexFunction> implements
                                 ComplexFunction
{
  public SchwarzianDerivative(F f)
  {
    super();
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    throw new UnsupportedOperationException("TODO");
  }

}
