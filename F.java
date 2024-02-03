import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class F implements Function<Integer, RealPolynomial> {
   Integer c1 = new Integer("0");
   Integer c2 = new Integer("1");
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Integer k;
   public Integer ℤ1 = new Integer();
   public RealPolynomial r̅1 = new RealPolynomial();
   public RealPolynomial r̅2 = new RealPolynomial();
   public Integer ℤ2 = new Integer();
   public Real ℝ1 = new Real();
   public RealPolynomial r̅3 = new RealPolynomial();
   public Integer ℤ3 = new Integer();
   public Real ℝ2 = new Real();
   public F F;

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      Object var10000;
      switch(in.getSignedValue()) {
         case 0:
            var10000 = result.set(c2);
            break;
         default:
            RealPolynomial var5 = result.identity();
            if (F == null) {
               F = new F(this);
            }

            var10000 = var5.mul(F.evaluate(in.sub(c2, bits, ℤ1), order, bits, r̅1), bits, r̅2).k.set(c2);
            α.mul(result.identity().risingFactorial(in.sub(c2, bits, ℤ2), bits, ℝ1), bits, r̅3).k.set(c2);
            β.div(result.identity().risingFactorial(in.sub(c2, bits, ℤ3), bits, ℝ2), bits, result);
      }

      return var10000;
   }

   public F() {
   }

   public F(F var1) {
      this();
      if (var1.p == null) {
         throw new AssertionError("p is null");
      } else if (var1.α == null) {
         throw new AssertionError("α is null");
      } else if (var1.q == null) {
         throw new AssertionError("q is null");
      } else if (var1.β == null) {
         throw new AssertionError("β is null");
      } else {
         p = var1.p;
         α = var1.α;
         q = var1.q;
         β = var1.β;
      }
   }

   public void close() {
      c1.close();
      c2.close();
      ℤ1.close();
      r̅1.close();
      r̅2.close();
      ℤ2.close();
      ℝ1.close();
      r̅3.close();
      ℤ3.close();
      ℝ2.close();
      F.close();
   }
}
