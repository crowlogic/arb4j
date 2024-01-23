import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class F implements Function<Integer, Real> {
   private boolean isInitialized;
   Integer const1;
   public Real α;
   public Real β;
   public Real ℝ1;
   public Integer ℤ1;
   public Real ℝ2;
   public Real ℝ3;
   public Real ℝ4;
   public final C C = new C();

   public Real evaluate(Integer in, int order, int bits, Real result) {
      if (!this.isInitialized) {
         this.initializeVariableReferences();
      }

      return ((Real)this.C.evaluate(this.ℝ1.set(in.sub(this.const1, bits, this.ℤ1)), order, bits, this.ℝ2))
         .mul((Real)this.C.evaluate(this.ℝ3.set(in), order, bits, this.ℝ4), bits, result);
   }

   public F() {
      this.const1 = new Integer("1");
      this.ℝ1 = new Real();
      this.ℤ1 = new Integer();
      this.ℝ2 = new Real();
      this.ℝ3 = new Real();
      this.ℝ4 = new Real();
   }

   public void initializeVariableReferences() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (this.α == null) {
         throw new AssertionError("α is null");
      } else if (this.β == null) {
         throw new AssertionError("β is null");
      } else {
         this.C.α = this.α;
         this.C.β = this.β;
         this.isInitialized = true;
      }
   }

   public void close() {
      this.const1.close();
      this.ℝ1.close();
      this.ℤ1.close();
      this.ℝ2.close();
      this.ℝ3.close();
      this.ℝ4.close();
   }
}
