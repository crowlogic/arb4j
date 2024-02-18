import arb.Integer;
import arb.Real;
import arb.functions.real.RealNullaryFunction;

public class ∏k{k=1…4} implements RealNullaryFunction {
   Integer startIndex;
   Integer endIndex;
   public Real factorValueℝ1;
   public Integer k;
   public Real productℝ1;
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public Real evaluate(Void in, int order, int bits, Real result) {
      productℝ1.multiplicativeIdentity();
      k.set(startIndex);

      do {
         productℝ1.mul(factorℝ1.evaluate(k, bits, factorValueℝ1), bits);
      } while(k.increment().compareTo(endIndex) <= 0);

      return result.set(productℝ1);
   }

   public _k_k_1_4_/* $VF was: ∏k{k=1…4}*/() {
      startIndex = new Integer("1");
      endIndex = new Integer("4");
      factorValueℝ1 = new Real();
      k = new Integer();
      productℝ1 = new Real();
   }

   public void close() {
      startIndex.close();
      endIndex.close();
      factorValueℝ1.close();
      k.close();
      productℝ1.close();
   }
}
