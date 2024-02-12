import arb.Integer;
import arb.Real;
import arb.functions.real.RealNullaryFunction;

public class ∏k{k=1…3} implements RealNullaryFunction {
   Integer startIndex = new Integer("1");
   Integer endIndex = new Integer("3");
   public Integer k;
   public Real ℝ1 = new Real();

   public Real evaluate(Void in, int order, int bits, Real result) {
      ℝ1.multiplicativeIdentity();
      k.set(startIndex);

      do {
         ℝ1.mul(factor.evaluate(k, bits, factorValue), bits);
      } while(k.increment().compareTo(endIndex) <= 0);

      return result.set(ℝ1);
   }

   public void close() {
      startIndex.close();
      endIndex.close();
      ℝ1.close();
   }
}
