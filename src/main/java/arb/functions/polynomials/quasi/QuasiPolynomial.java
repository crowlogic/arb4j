package arb.functions.polynomials.quasi;

import static arb.utensils.Utensils.throwOrWrap;

import arb.Integer;
import arb.Polynomial;
import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class QuasiPolynomial<S, P extends Polynomial<S, ? extends P>, F extends Function<S, S>, R extends QuasiPolynomial<S, P, F, R>>
                                     implements
                                     Function<S, S>,
                                     Ring<R>

{

  public P p;

  @Override
  public String toString()
  {
    return String.format("%s(%s)", f, p);
  }

  public F f;

  @Override
  public S evaluate(S z, int order, int prec, S w)
  {
    p.evaluate(z, order, prec, w);
    f.evaluate(w, order, prec, w);
    return w;
  }

  public QuasiPolynomial(P p, F f)
  {
    assert p != null : "p should not be null";
    assert f != null : "f should not be null";

    try
    {
      this.p = p;
      this.f = f;
    }
    catch (Exception e)
    {
      throwOrWrap(e);
    }
  }

  public abstract R identity();

  public abstract R pow(Integer power, int bits, R result);

}