import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class F implements Function<Integer, Real> {
   private boolean isInitialized;
   Integer c1;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Real valueℝ1;
   public Integer k;
   public Real productℝ1;
   public Integer endIndexℤ1;
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public Real evaluate(Integer in, int order, int bits, Real result) {
      factorℝ1.n = in;
      productℝ1.multiplicativeIdentity();
      k.set(c1);
      endIndexℤ1.set(p);

      do {
         productℝ1.mul(factorℝ1.evaluate(k, bits, valueℝ1), bits);
      } while(k.increment().compareTo(endIndexℤ1) <= 0);

      return result.set(productℝ1);
   }

   public F() {
      c1 = new Integer("1");
      valueℝ1 = new Real();
      k = new Integer();
      productℝ1 = new Real();
      endIndexℤ1 = new Integer();
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (p == null) {
         throw new AssertionError("p is null");
      } else {
         factorℝ1.p = p;
         factorℝ1.q = q;
         factorℝ1.α = α;
         factorℝ1.β = β;
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      valueℝ1.close();
      k.close();
      productℝ1.close();
      endIndexℤ1.close();
   }
}
