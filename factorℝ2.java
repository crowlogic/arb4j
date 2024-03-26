import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class factorℝ2 implements Function<Integer, Real> {
   private boolean isInitialized;
   public Integer n;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Real z;

   public Real evaluate(Integer in, int order, int bits, Real result) {
      if (!isInitialized) {
         initialize();
      }

      return β.get(in).ascendingFactorial(n, bits, result);
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

   public String toString() {
      return "factorℝ2:k➔β[k]₍ₙ₎";
   }
}
