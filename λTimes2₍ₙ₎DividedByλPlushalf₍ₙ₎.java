import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.functions.Function;

public class λTimes2₍ₙ₎DividedByλPlushalf₍ₙ₎ implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   Integer c1 = new Integer("2");
   public Real λ;
   public Real ℝ1 = new Real();
   public Real ℝ2 = new Real();
   public Real ℝ3 = new Real();
   public Real ℝ4 = new Real();

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }

      return λ
         .mul(c1, bits, ℝ1)
         .risingFactorial(in, bits, ℝ2)
         .div(λ.add(RealConstants.half, bits, ℝ3).risingFactorial(in, bits, ℝ4), bits, result);
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (λ == null) {
         throw new AssertionError("λ is null");
      } else {
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      ℝ1.close();
      ℝ2.close();
      ℝ3.close();
      ℝ4.close();
   }
}
