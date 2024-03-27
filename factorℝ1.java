import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class factorℝ1 implements Function<Integer, Real> {
   private boolean isInitialized;
   public Integer n;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Integer N;

   public Real evaluate(Integer in, int order, int bits, Real result) {
      if (!isInitialized) {
         initialize();
      }

      return α.get(in).ascendingFactorial(n, bits, result);
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (α == null) {
         throw new AssertionError("α is null");
      } else {
         isInitialized = true;
      }
   }

   public String toString() {
      return "factorℝ1:k➔α[k]₍ₙ₎";
   }
}
