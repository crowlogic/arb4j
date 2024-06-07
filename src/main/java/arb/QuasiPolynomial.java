package arb;

import arb.functions.Function;

public abstract class QuasiPolynomial<S, P extends Polynomial<S, ? extends P>, V extends Function<S, S>> implements
                                     Function<S, S>
{

  public P p;

  @Override
  public String
         toString()
  {
    return String.format("%s(%s)",
                         f,
                         p);
  }

  public V f;

  @Override
  public S
         evaluate(S z,
                  int order,
                  int prec,
                  S w)
  {
    p.evaluate(z,
               order,
               prec,
               w);
    return f.evaluate(w,
                      order,
                      prec,
                      w);
  }

  public QuasiPolynomial()
  {
    super();
  }

  public QuasiPolynomial<S, P, V>
         mul(Integer pow,
             int bits,
             RealQuasiPolynomial xℝ3,
             RealQuasiPolynomial realQuasiPolynomial)
  {
    assert false : "TODO";
    return this;
  }

}