import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class C implements RealFunction {
   Integer const1 = new Integer("2");
   public Real α;
   public Real β;
   public Real ℝ1 = new Real();
   public Real ℝ2 = new Real();

   public Real evaluate(Real in, int order, int bits, Real result) {
      if (α == null) {
         throw new AssertionError("α is null");
      } else if (β == null) {
         throw new AssertionError("β is null");
      } else {
         return const1.mul(in, bits, ℝ1).add(α, bits, ℝ2).add(β, bits, result);
      }
   }

   public void close() {
      const1.close();
      ℝ1.close();
      ℝ2.close();
   }
}
