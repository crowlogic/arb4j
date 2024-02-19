import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class n∏k₍ₙ₋₁₎{k=1…3} implements Function<Integer, Integer> {
   Integer startIndex;
   Integer endIndex;
   public Integer valueℤ1;
   public Integer k;
   public Integer productℤ1;
   public final factorℤ1 factorℤ1 = new factorℤ1();

   public Integer evaluate(Integer in, int order, int bits, Integer result) {
      productℤ1.multiplicativeIdentity();
      k.set(startIndex);

      do {
         productℤ1.mul(factorℤ1.evaluate(k, bits, valueℤ1), bits);
      } while(k.increment().compareTo(endIndex) <= 0);

      return (result).set(productℤ1);
   }

   public n_k_ₙ____k_1_3_/* $VF was: n∏k₍ₙ₋₁₎{k=1…3}*/() {
      startIndex = new Integer("1");
      endIndex = new Integer("3");
      valueℤ1 = new Integer();
      k = new Integer();
      productℤ1 = new Integer();
   }

   public void close() {
      startIndex.close();
      endIndex.close();
      valueℤ1.close();
      k.close();
      productℤ1.close();
   }
}
