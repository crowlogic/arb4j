import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class factorP1 implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   Integer c1;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Integer N;
   public RealPolynomial P1;
   public Real valueℝ1;
   public Integer k;
   public Real prodℝ1;
   public Integer endIndexℤ1;
   public RealPolynomial P2;
   public Integer ℤ1;
   public Real valueℝ2;
   public Real prodℝ2;
   public Integer endIndexℤ2;
   public Real ℝ1;
   public final factorℝ2 factorℝ2 = new factorℝ2();
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }

      RealPolynomial var10000 = result.identity().pow(in, bits, P1);
      factorℝ1.n = in;
      prodℝ1.multiplicativeIdentity();
      k.set(c1);
      endIndexℤ1.set(p);

      do {
         prodℝ1.mul(factorℝ1.evaluate(k, bits, valueℝ1), bits);
      } while(k.increment().compareTo(endIndexℤ1) <= 0);

      var10000 = var10000.mul(prodℝ1, bits, P2);
      Integer var10001 = in.factorial(bits, ℤ1);
      factorℝ2.n = in;
      prodℝ2.multiplicativeIdentity();
      k.set(c1);
      endIndexℤ2.set(q);

      do {
         prodℝ2.mul(factorℝ2.evaluate(k, bits, valueℝ2), bits);
      } while(k.increment().compareTo(endIndexℤ2) <= 0);

      return var10000.div(var10001.mul(prodℝ2, bits, ℝ1), bits, result);
   }

   public factorP1() {
      c1 = new Integer("1");
      P1 = new RealPolynomial();
      valueℝ1 = new Real();
      k = new Integer();
      prodℝ1 = new Real();
      endIndexℤ1 = new Integer();
      P2 = new RealPolynomial();
      ℤ1 = new Integer();
      valueℝ2 = new Real();
      prodℝ2 = new Real();
      endIndexℤ2 = new Integer();
      ℝ1 = new Real();
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
         factorℝ1.p = p;
         factorℝ1.q = q;
         factorℝ1.α = α;
         factorℝ1.β = β;
         factorℝ1.N = N;
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      P1.close();
      valueℝ1.close();
      k.close();
      prodℝ1.close();
      endIndexℤ1.close();
      P2.close();
      ℤ1.close();
      valueℝ2.close();
      prodℝ2.close();
      endIndexℤ2.close();
      ℝ1.close();
   }
}
