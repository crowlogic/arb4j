package arb;

import arb.functions.Function;

public class GeneratedProductClass {
   public Function<Integer, Real> factor;
   public Integer startIndex = new Integer();
   public Integer endIndex = new Integer();
   public Integer index = new Integer();
   Real value = new Real();

   public Real evaluate(int var1, Real var2) {
      var2.one();
      index.set(startIndex);

      while(index.compareTo(endIndex) <= 0) {
         var2.mul(factor.evaluate(index, var1, value), var1, var2);
         index.increment();
      }

      return var2;
   }
}
