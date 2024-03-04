import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class C implements RealFunction {
   private boolean isInitialized;
   Integer c1 = new Integer("2");
   public Real α;
   public Real β;
   public Real ℝ1 = new Real();
   public Real ℝ2 = new Real();

   public Real evaluate(Real in, int order, int bits, Real result) {
      if (!isInitialized) {
         initialize();
      }

      return c1.mul(in, bits, ℝ1).add(α, bits, ℝ2).add(β, bits, result);
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (α == null) {
         throw new AssertionError("α is null");
      } else if (β == null) {
         throw new AssertionError("β is null");
      } else {
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      ℝ1.close();
      ℝ2.close();
   }
}
