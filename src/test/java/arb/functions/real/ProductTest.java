package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;
import junit.framework.TestCase;

public class ProductTest extends
                         TestCase
{
  public static void testProduct()
  {
    try ( Product product = new Product())
    {
      product.factor     = Function.express(Integer.class, Real.class, "n");
      product.startIndex = new Integer(1);
      product.endIndex   = new Integer(3);
      Real prod = product.evaluate(128, new Real());
      assertEquals(6.0, prod.doubleValue());
      assertTrue(prod.isExact());
    }
  }
}
