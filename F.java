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
   public Real sumℝ1;
   public Integer endIndexℤ1;
   public Real valueℝ2;
   public Real sumℝ2;
   public Integer endIndexℤ2;
   public Real ℝ1;
   public Real valueℝ3;
   public Real sumℝ3;
   public Integer endIndexℤ3;
   public Real ℝ2;
   public final factorℝ2 factorℝ2 = new factorℝ2();
   public final factorℝ3 factorℝ3 = new factorℝ3();
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public Real evaluate(Integer in, int order, int bits, Real result) {
      if (!isInitialized) {
         initialize();
      }

      factorℝ1.n = in;
      sumℝ1.additiveIdentity();
      k.set(c1);
      endIndexℤ1.set(p);

      do {
         sumℝ1.add(factorℝ1.evaluate(k, bits, valueℝ1), bits);
      } while(k.increment().compareTo(endIndexℤ1) <= 0);

      Real var10000 = sumℝ1;
      factorℝ2.n = in;
      sumℝ2.additiveIdentity();
      k.set(c1);
      endIndexℤ2.set(q);

      do {
         sumℝ2.add(factorℝ2.evaluate(k, bits, valueℝ2), bits);
      } while(k.increment().compareTo(endIndexℤ2) <= 0);

      var10000 = var10000.div(sumℝ2, bits, ℝ1);
      factorℝ3.n = in;
      sumℝ3.additiveIdentity();
      k.set(c1);
      endIndexℤ3.set(q);

      do {
         sumℝ3.add(factorℝ3.evaluate(k, bits, valueℝ3), bits);
      } while(k.increment().compareTo(endIndexℤ3) <= 0);

      return var10000.div(sumℝ3, bits, ℝ2).add(c1, bits, result);
   }

   public F() {
      c1 = new Integer("1");
      valueℝ1 = new Real();
      k = new Integer();
      sumℝ1 = new Real();
      endIndexℤ1 = new Integer();
      valueℝ2 = new Real();
      sumℝ2 = new Real();
      endIndexℤ2 = new Integer();
      ℝ1 = new Real();
      valueℝ3 = new Real();
      sumℝ3 = new Real();
      endIndexℤ3 = new Integer();
      ℝ2 = new Real();
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (p == null) {
         throw new AssertionError("p is null");
      } else if (q == null) {
         throw new AssertionError("q is null");
      } else {
         factorℝ2.p = p;
         factorℝ2.q = q;
         factorℝ2.α = α;
         factorℝ2.β = β;
         factorℝ3.p = p;
         factorℝ3.q = q;
         factorℝ3.α = α;
         factorℝ3.β = β;
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
      sumℝ1.close();
      endIndexℤ1.close();
      valueℝ2.close();
      sumℝ2.close();
      endIndexℤ2.close();
      ℝ1.close();
      valueℝ3.close();
      sumℝ3.close();
      endIndexℤ3.close();
      ℝ2.close();
   }

   public String toString() {
      return "F:n➔Σα[k]₍ₙ₋₁₎{k=1…p}/Σβ[k]₍ₙ₋₁₎{k=1…q}/Σβ[k]₍ₙ₋₁₎{k=1…q}+1";
   }
}
