package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class Product implements
                     Function<Void, Real>,
                     AutoCloseable
{
  @Override
  public void close()
  {
    index.close();
    value.close();
  }

  Function<Integer, Real> factor;
  int                     startIndex;
  int                     endIndex;

  Integer                 index       = new Integer();
  Real                    value = new Real();

  @Override
  public Real evaluate(Void t, int order, int bits, Real product)
  {
    product.one();
    for (int k = startIndex; k <= endIndex; k++)
    {
      product.mul(factor.evaluate(index.set(k), bits, value), bits);
    }
    return product;
  }

}
