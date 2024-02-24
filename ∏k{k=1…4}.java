import arb.Integer;
import arb.Real;
import arb.functions.real.RealNullaryFunction;

public class ∏k{k=1…4} implements RealNullaryFunction {
   Integer c1;
   Integer c2;
   public Real valueℝ1;
   public Integer k;
   public Real productℝ1;
   public Integer endIndexℤ1;
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public Real evaluate(Void in, int order, int bits, Real result) {
      productℝ1.multiplicativeIdentity();
      k.set(c1);
      endIndexℤ1.set(c2);

      do {
         productℝ1.mul(factorℝ1.evaluate(k, bits, valueℝ1), bits);
      } while(k.increment().compareTo(endIndexℤ1) <= 0);

      return result.set(productℝ1);
   }

   public _k_k_1_4_/* $VF was: ∏k{k=1…4}*/() {
      c1 = new Integer("1");
      c2 = new Integer("4");
      valueℝ1 = new Real();
      k = new Integer();
      productℝ1 = new Real();
      endIndexℤ1 = new Integer();
   }

   public void close() {
      c1.close();
      c2.close();
      valueℝ1.close();
      k.close();
      productℝ1.close();
      endIndexℤ1.close();
   }
}
