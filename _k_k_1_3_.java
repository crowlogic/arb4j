import arb.Integer;
import arb.Real;
import arb.functions.real.RealNullaryFunction;

public class _k_k_1_3_ implements RealNullaryFunction {
   Integer startIndex;
   Integer endIndex;
   public Integer k;
   public Real ℝ1;
   public final factor factor = new factor();

   public Real evaluate(Void in, int order, int bits, Real result) {
      ℝ1.multiplicativeIdentity();
      k.set(startIndex);

      do {
         ℝ1.mul(factor.evaluate(k, bits, factorValue), bits);
      } while(k.increment().compareTo(endIndex) <= 0);

      return result.set(ℝ1);
   }

   public _k_k_1_3_() {
      startIndex = new Integer("1");
      endIndex = new Integer("3");
      ℝ1 = new Real();
   }

   public void close() {
      startIndex.close();
      endIndex.close();
      ℝ1.close();
   }
}
