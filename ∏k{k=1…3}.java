import arb.Integer;
import arb.Real;
import arb.functions.real.RealNullaryFunction;

public class ∏k{k=1…3} implements RealNullaryFunction {
   Integer c1 = new Integer("1");
   Integer c2 = new Integer("3");
   public Integer index;
   public Real ℝ1 = new Real();

   public Real evaluate(Void in, int order, int bits, Real result) {
      ℝ1.multiplicativeIdentity();
      index.set(startIndex);

      do {
         ℝ1.mul(factor.evaluate(index, bits, factorValue), bits);
      } while(index.increment().compareTo(endIndex) <= 0);

      return result.set(ℝ1);
   }

   public void close() {
      c1.close();
      c2.close();
      ℝ1.close();
   }
}
