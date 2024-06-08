package arb;

import static arb.utensils.Utensils.throwOrWrap;

import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.utensils.Utensils;

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
    S a = p.newCoDomainInstance();
    p.evaluate(z, order, prec, a);
    f.evaluate(a, order, prec, w);
    Utensils.closeIfAutoCloseable(a);
    return w;
  }

  public QuasiPolynomial(P p, F f)
  {
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

}