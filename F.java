import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class F implements Function<Integer, Real> {
   private boolean isInitialized;
   Integer c1;
   public Real α;
   public Real β;
   public Real ℝ3;
   public Integer ℤ1;
   public Real ℝ4;
   public Real ℝ5;
   public Real ℝ6;
   public final C C = new C();

   public Real evaluate(Integer in, int order, int bits, Real result) {
      if (!isInitialized) {
         initialize();
      }

      return (C.evaluate(ℝ3.set(in.sub(c1, bits, ℤ1)), order, bits, ℝ4))
         .mul(C.evaluate(ℝ5.set(in), order, bits, ℝ6), bits, result);
   }

   public F() {
      c1 = new Integer("1");
      ℝ3 = new Real();
      ℤ1 = new Integer();
      ℝ4 = new Real();
      ℝ5 = new Real();
      ℝ6 = new Real();
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
      ℝ3.close();
      ℤ1.close();
      ℝ4.close();
      ℝ5.close();
      ℝ6.close();
   }

   public String toString() {
      return "F:n➔C(n-1)*C(n)";
   }
}
