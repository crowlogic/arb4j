import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class F implements Function<Integer, Real> {
   private boolean isInitialized;
   public Integer const1 = new Integer("1");
   public Real α;
   public Real β;
   public Real G;
   public Real r1 = new Real();
   public Integer i1 = new Integer();
   public Real r2 = new Real();
   public Real r3 = new Real();
   public Real r4 = new Real();
   public C C;
   public F F;

   public Real evaluate(Integer in, int order, int bits, Real result) {
      if (!this.isInitialized) {
         this.initializeContext();
      }

      return ((Real)this.C.evaluate(this.r1.set(in.sub(this.const1, bits, this.i1)), order, bits, this.r2))
         .mul((Real)this.C.evaluate(this.r3.set(in), order, bits, this.r4), bits, result);
   }

   public void initializeContext() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (this.α == null) {
         throw new AssertionError("α is null");
      } else if (this.β == null) {
         throw new AssertionError("β is null");
      } else if (this.G == null) {
         throw new AssertionError("G is null");
      } else {
         C var10001 = this.C = new C();
         this.C.α = this.α;
         this.C.β = this.β;
         this.C.G = this.G;
         this.C.initializeContext();
         this.C = var10001;
         this.isInitialized = true;
      }
   }

   public void close() {
      this.const1.close();
      this.r1.close();
      this.i1.close();
      this.r2.close();
      this.r3.close();
      this.r4.close();
   }
}
