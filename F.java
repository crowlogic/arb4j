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
   public Integer ℤ1 = new Integer();
   public RealPolynomial r̅1 = new RealPolynomial();
   public RealPolynomial r̅2 = new RealPolynomial();
   public Real ℝ1 = new Real();
   public Integer ℤ2 = new Integer();
   public Real ℝ2 = new Real();
   public RealPolynomial r̅3 = new RealPolynomial();
   public Integer ℤ3 = new Integer();
   public Integer ℤ4 = new Integer();
   public Real ℝ3 = new Real();
   public Integer ℤ5 = new Integer();
   public Real ℝ4 = new Real();
   public Real ℝ5 = new Real();
   public F F;

   public RealPolynomial evaluate(Integer var1, int var2, int var3, RealPolynomial result) {
      return switch(in.getSignedValue()) {
         case 0 -> result.set(c2);
         default -> {
            RealPolynomial result = result.identity();
            if (result.F == null) {
               result.F = new F(result);
            }

            RealPolynomial var5 = result.mul(result.F.evaluate(in.sub(result.c2, bits, result.ℤ1), order, bits, result.r̅1), bits, result.r̅2);
            Real var10001 = result.ℝ1;
            result.ℝ1.one();
            result.k.set(result.startIndex);

            while(result.k.compareTo(result.endIndex) <= 0) {
               result.α.mul(result.identity().risingFactorial((var5).sub(result.c2, bits, result.ℤ2), bits, result.ℝ2), (int)var5, result.ℝ1);
               result.k.increment();
            }

            RealPolynomial var6 = var5.mul(var10001, bits, result.r̅3);
            Integer var7 = result.set((var5).sub(result.c2, bits, result.ℤ3).factorial(bits, result.ℤ4));
            Real var10002 = result.ℝ3;
            result.ℝ3.one();
            result.k.set(result.startIndex);

            while(result.k.compareTo(result.endIndex) <= 0) {
               result.β
                  .mul(result.identity().risingFactorial((var5).sub(result.c2, (int)var7, result.ℤ5), (int)var7, result.ℝ4), (int)var5, result.ℝ3);
               result.k.increment();
            }

            yield var6.div(var7.mul(var10002, (int)var7, result.ℝ5), (int)var7, result);
         }
      };
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
      ℝ1.close();
      ℤ2.close();
      ℝ2.close();
      r̅3.close();
      ℤ3.close();
      ℤ4.close();
      ℝ3.close();
      ℤ5.close();
      ℝ4.close();
      ℝ5.close();
      F.close();
   }
}
