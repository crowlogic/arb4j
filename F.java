import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class F implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   Integer c1;
   Integer c2;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Integer ℤ1;
   public RealPolynomial r̅1;
   public RealPolynomial r̅2;
   public Real valueℝ1;
   public Integer k;
   public Real productℝ1;
   public Integer endIndexℤ1;
   public RealPolynomial r̅3;
   public RealPolynomial r̅4;
   public Integer ℤ2;
   public Real valueℝ2;
   public Real productℝ2;
   public Integer endIndexℤ2;
   public Real ℝ1;
   public F F;
   public final factorℝ2 factorℝ2 = new factorℝ2();
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }
      return switch(in.getSignedValue()) {
         case 0 -> result.set(c2);
         default -> {
            RealPolynomial var5 = result.identity().mul(F.evaluate(in.sub(c2, bits, ℤ1), order, bits, r̅1), bits, r̅2);
            factorℝ1.n = in;
            productℝ1.multiplicativeIdentity();
            k.set(c2);
            endIndexℤ1.set(p);

            do {
               productℝ1.mul(factorℝ1.evaluate(k, bits, valueℝ1), bits);
            } while(k.increment().compareTo(endIndexℤ1) <= 0);

            var5 = var5.mul(productℝ1, bits, r̅3);
            RealPolynomial var10001 = result.set(in.sub(c2, bits, r̅4).factorial(bits, ℤ2));
            factorℝ2.n = in;
            productℝ2.multiplicativeIdentity();
            k.set(c2);
            endIndexℤ2.set(q);

            do {
               productℝ2.mul(factorℝ2.evaluate(k, bits, valueℝ2), bits);
            } while(k.increment().compareTo(endIndexℤ2) <= 0);

            yield var5.div(var10001.mul(productℝ2, bits, ℝ1), bits, result);
         }
      };
   }

   public F() {
      c1 = new Integer("0");
      c2 = new Integer("1");
      ℤ1 = new Integer();
      r̅1 = new RealPolynomial();
      r̅2 = new RealPolynomial();
      valueℝ1 = new Real();
      k = new Integer();
      productℝ1 = new Real();
      endIndexℤ1 = new Integer();
      r̅3 = new RealPolynomial();
      r̅4 = new RealPolynomial();
      ℤ2 = new Integer();
      valueℝ2 = new Real();
      productℝ2 = new Real();
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
         factorℝ1.p = p;
         factorℝ1.q = q;
         factorℝ1.α = α;
         factorℝ1.β = β;
         F = new F();
         F.p = p;
         F.q = q;
         F.α = α;
         F.β = β;
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      c2.close();
      ℤ1.close();
      r̅1.close();
      r̅2.close();
      valueℝ1.close();
      k.close();
      productℝ1.close();
      endIndexℤ1.close();
      r̅3.close();
      r̅4.close();
      ℤ2.close();
      valueℝ2.close();
      productℝ2.close();
      endIndexℤ2.close();
      ℝ1.close();
      F.close();
   }
}
