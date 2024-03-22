import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class factorℝ2 implements Function<Integer, Real> {
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

      return α.get(in).ascendingFactorial((result).identity(), bits, result);
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
}
