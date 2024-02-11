package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class Product implements
                     AutoCloseable,
                     NullaryFunction<Real>
{
  public Function<Integer, Real> factor;
  public final Integer           startIndex  = new Integer();
  public final Integer           endIndex    = new Integer();
  public final Integer           index       = new Integer();
  public final Real              factorValue = new Real();
  public final Real              r1     = new Real();

  public void close()
  {
    index.close();
    factorValue.close();
    startIndex.close();
    endIndex.close();
  }

  @Override
  public Real evaluate(Void in, int order, int bits, Real result)
  {
    r1.one();
    index.set(startIndex);

    do
    {
      r1.mul(factor.evaluate(index, bits, factorValue), bits);
    }
    while (index.increment().compareTo(endIndex) <= 0);
    
    return result.set(r1);
  }
}
