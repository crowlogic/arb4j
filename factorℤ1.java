import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class factorℤ1 implements Function<Integer, Integer> {
   private boolean isInitialized;
   Integer c1 = new Integer("1");
   public Integer n;
   public Integer p;
   public Real α;
   public Integer ℤ1 = new Integer();

   public Integer evaluate(Integer in, int order, int bits, Integer result) {
      if (!isInitialized) {
         initialize();
      }

      return α.get(in).risingFactorial(n.sub(c1, bits, ℤ1), bits, result);
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

   public void close() {
      c1.close();
      ℤ1.close();
   }
}
