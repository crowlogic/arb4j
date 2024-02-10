package arb.functions.real;

import static java.lang.System.out;

import org.junit.Test;

import arb.Real;

public class ProductTest
{

  @Test
  public void test()
  {
    try ( Product product = new Product())
    {
      product.startIndex.set(1);
      product.endIndex.set(4);
      product.factor = (k, order, bits, result) -> result.set(k);
      Real prod = product.evaluate(128, new Real() );
      out.println( "prod=" + prod );
    }
  }
}
