import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class B implements RealFunction {
   private boolean isInitialized;
   public Integer const1 = new Integer("1");
   public Real α;
   public Real β;
   public Real ℝ1 = new Real();
   public Real ℝ2 = new Real();
   public Real ℝ3 = new Real();
   public Real ℝ4 = new Real();
   public Real ℝ5 = new Real();
   public Real ℝ6 = new Real();
   public A A;
   public B B;
   public C C;
   public E E;
   public F F;
   public G G;

   public Real evaluate(Real in, int order, int bits, Real result) {
      if (!this.isInitialized) {
         this.initializeContext();
      }

      if (this.α == null) {
         throw new AssertionError("α is null");
      } else if (this.β == null) {
         throw new AssertionError("β is null");
      } else {
         return in.add(this.α, bits, this.ℝ1)
            .sub(this.const1, bits, this.ℝ2)
            .mul(in.add(this.β, bits, this.ℝ3).sub(this.const1, bits, this.ℝ4), bits, this.ℝ5)
            .mul((Real)this.C.evaluate(in, order, bits, this.ℝ6), bits, result);
      }
   }

   public void initializeContext() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (this.α == null) {
         throw new AssertionError("α is null");
      } else if (this.β == null) {
         throw new AssertionError("β is null");
      } else {
         C var10001 = this.C = new C();
         this.C.α = this.α;
         this.C.β = this.β;
         this.C = var10001;
         this.isInitialized = true;
      }
   }

   public void close() {
      this.const1.close();
      this.ℝ1.close();
      this.ℝ2.close();
      this.ℝ3.close();
      this.ℝ4.close();
      this.ℝ5.close();
      this.ℝ6.close();
   }
}
