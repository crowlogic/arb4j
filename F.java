import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.real.RealPolynomialNullaryFunction;

public class F implements RealPolynomialNullaryFunction {
   private boolean isInitialized;
   Integer c1;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Integer N;
   public Real valueℝ1;
   public Integer n;
   public Real sumℝ1;
   public Integer endIndexℤ3;
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public RealPolynomial evaluate(Void in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }

      sumℝ1.additiveIdentity();
      n.set(c1);
      endIndexℤ3.set(N);

      do {
         sumℝ1.add(factorℝ1.evaluate(n, bits, valueℝ1), bits);
      } while(n.increment().compareTo(endIndexℤ3) <= 0);

      return (result).set(sumℝ1);
   }

   public F() {
      c1 = new Integer("0");
      valueℝ1 = new Real();
      n = new Integer();
      sumℝ1 = new Real();
      endIndexℤ3 = new Integer();
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (N == null) {
         throw new AssertionError("N is null");
      } else {
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
      valueℝ1.close();
      n.close();
      sumℝ1.close();
      endIndexℤ3.close();
   }
}
