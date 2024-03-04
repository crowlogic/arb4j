import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class E implements RealFunction {
   private boolean isInitialized;
   Integer c1;
   Integer c2;
   public Real α;
   public Real β;
   public Real ℝ1;
   public Real ℝ2;
   public Real ℝ3;
   public Real ℝ4;
   public Real ℝ5;
   public final C C = new C();

   public Real evaluate(Real in, int order, int bits, Real result) {
      if (!isInitialized) {
         initialize();
      }

      return in.mul(C.evaluate(in.div(c1, bits, ℝ1), order, bits, ℝ2), bits, ℝ3)
         .mul(C.evaluate(in.sub(c2, bits, ℝ4), order, bits, ℝ5), bits, result);
   }

   public E() {
      c1 = new Integer("2");
      c2 = new Integer("1");
      ℝ1 = new Real();
      ℝ2 = new Real();
      ℝ3 = new Real();
      ℝ4 = new Real();
      ℝ5 = new Real();
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         C.α = α;
         C.β = β;
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      c2.close();
      ℝ1.close();
      ℝ2.close();
      ℝ3.close();
      ℝ4.close();
      ℝ5.close();
   }
}
