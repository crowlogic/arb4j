package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class factorℝ3 implements Function<Integer, Real> {
   private boolean isInitialized;
   Integer c1 = new Integer("1");
   public Integer n;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Integer ℤ3 = new Integer();

   public Real evaluate(Integer in, int order, int bits, Real result) {
      if (!isInitialized) {
         initialize();
      }

      return β.get(in).ascendingFactorial(n.sub(c1, bits, ℤ3), bits, result);
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (β == null) {
         throw new AssertionError("β is null");
      } else {
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      ℤ3.close();
   }

   public String toString() {
      return "factorℝ3:k➔β[k]₍ₙ₋₁₎";
   }
}
