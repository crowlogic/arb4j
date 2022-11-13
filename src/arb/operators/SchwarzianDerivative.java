package arb.operators;

import arb.Complex;
import arb.functions.complex.HolomorphicFunction;

/**
 * Among other things the Schwarzian derivative measures how much a function
 * deviates from being a Mobius transform at a particular point
 * 
 * @param <F>
 * 
 * @see <a href=
 *      "https://www.eff.org/deeplinks/2022/11/celebrating-life-aaron-swartz-nov-12-and-nov-13">In
 *      Loving Memory of Aaron Swartz, who, even if depressed, made the world a
 *      better place and was still muredered by the government for their
 *      draconian totalitarian heavy-handed approach to 'justice' which
 *      effectively left him no choice</a>
 * 
 * 
 */
public class SchwarzianDerivative<F extends HolomorphicFunction> implements
                                 HolomorphicFunction
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
