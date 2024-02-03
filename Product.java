package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class Product implements AutoCloseable, NullaryFunction<Real> {
   public Function<Integer, Real> factor;
   Integer startIndex = new Integer();
   Integer endIndex = new Integer();
   Integer index = new Integer();
   Real value = new Real();

   public void close() {
      index.close();
      value.close();
      startIndex.close();
      endIndex.close();
   }

   public Real evaluate(int bits, Real product) {
      product.one();
      index.set(startIndex);

      while(index.compareTo(endIndex) <= 0) {
         product.mul(factor.evaluate(index, bits, value), bits);
         index.increment();
      }

      return product;
   }
}
