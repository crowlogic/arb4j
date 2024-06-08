package arb;

import static arb.utensils.Utensils.throwOrWrap;

import arb.functions.Function;

public abstract class QuasiPolynomial<S, P extends Polynomial<S, ? extends P>, F extends Function<S, S>> implements
                                     Function<S, S>
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
    return f.evaluate(w, order, prec, w);
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

  public QuasiPolynomial<S, P, F>
         mul(Integer pow, int bits, RealQuasiPolynomial xℝ3, RealQuasiPolynomial realQuasiPolynomial)
  {
    assert false : "TODO";
    return this;
  }

}