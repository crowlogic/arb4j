package arb.algebra.arithmetic;

import arb.Field;
import arb.OrderedPair;
import arb.functions.BivariateFunction;

public class Division<Ω extends Field<Ω>> implements
                        BivariateFunction<Ω, Ω>
{

  @Override
  public Ω evaluate(OrderedPair<Ω, Ω> t, int order, int prec, Ω res)
  {
    return t.a.div(t.b, prec, res);
  }

}
