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
    startIndex.close();
    endIndex.close();
  }

  public Function<Integer, Real> factor;
  final Integer           startIndex = new Integer();
  final Integer           endIndex   = new Integer();

  final Integer           index      = new Integer();
  final Real              value      = new Real();

  @Override
  public Real evaluate(Void t, int order, int bits, Real product)
  {
    product.one();
    for (index.set(startIndex); index.compareTo(endIndex) <= 0;)
    {
      product.mul(factor.evaluate(index.increment(), bits, value), bits);
    }
    return product;
  }

}
