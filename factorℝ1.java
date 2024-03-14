import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class factorℝ1 implements Function<Integer, Real> {
   private boolean isInitialized;
   Integer c1;
   public Real z;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Integer N;
   public Integer ℤ1;
   public Real valueℝ2;
   public Integer k;
   public Real prodℝ1;
   public Integer endIndexℤ1;
   public Real ℝ1;
   public Integer ℤ2;
   public Real valueℝ3;
   public Real prodℝ2;
   public Integer endIndexℤ2;
   public Real ℝ2;
   public final factorℝ2 factorℝ2 = new factorℝ2();
   public final factorℝ3 factorℝ3 = new factorℝ3();

   public Real evaluate(Integer in, int order, int bits, Real result) {
      if (!isInitialized) {
         initialize();
      }

      Integer var10000 = z.pow(in, bits, ℤ1);
      factorℝ2.n = in;
      prodℝ1.multiplicativeIdentity();
      k.set(c1);
      endIndexℤ1.set(p);

      do {
         prodℝ1.mul(factorℝ2.evaluate(k, bits, valueℝ2), bits);
      } while(k.increment().compareTo(endIndexℤ1) <= 0);

      Real var5 = var10000.mul(prodℝ1, bits, ℝ1);
      Integer var10001 = in.factorial(bits, ℤ2);
      factorℝ3.n = in;
      prodℝ2.multiplicativeIdentity();
      k.set(c1);
      endIndexℤ2.set(q);

      do {
         prodℝ2.mul(factorℝ3.evaluate(k, bits, valueℝ3), bits);
      } while(k.increment().compareTo(endIndexℤ2) <= 0);

      return var5.div(var10001.mul(prodℝ2, bits, ℝ2), bits, result);
   }

   public factorℝ1() {
      c1 = new Integer("1");
      ℤ1 = new Integer();
      valueℝ2 = new Real();
      k = new Integer();
      prodℝ1 = new Real();
      endIndexℤ1 = new Integer();
      ℝ1 = new Real();
      ℤ2 = new Integer();
      valueℝ3 = new Real();
      prodℝ2 = new Real();
      endIndexℤ2 = new Integer();
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
         factorℝ2.N = N;
         factorℝ3.p = p;
         factorℝ3.q = q;
         factorℝ3.α = α;
         factorℝ3.β = β;
         factorℝ3.N = N;
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      ℤ1.close();
      valueℝ2.close();
      k.close();
      prodℝ1.close();
      endIndexℤ1.close();
      ℝ1.close();
      ℤ2.close();
      valueℝ3.close();
      prodℝ2.close();
      endIndexℤ2.close();
      ℝ2.close();
   }
}
