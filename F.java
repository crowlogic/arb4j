import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class F implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   Integer c1 = new Integer("0");
   Integer c2 = new Integer("1");
   public Real α;
   public Real β;
   public Integer ℤ1 = new Integer();
   public RealPolynomial r̅1 = new RealPolynomial();
   public F F;

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }
      return switch(in.getSignedValue()) {
         case 0 -> result.set(c2);
         default -> {
            RealPolynomial var5 = result.identity();
            if (F == null) {
               F = new F(this);
            }

            yield var5.mul(F.evaluate(in.sub(c2, bits, ℤ1), order, bits, r̅1), bits, result);
         }
      };
   }

   public F() {
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         isInitialized = true;
      }
   }

   public F(F var1) {
      this();
      if (var1.α == null) {
         throw new AssertionError("α is null");
      } else if (var1.β == null) {
         throw new AssertionError("β is null");
      }
   }

   public void close() {
      c1.close();
      c2.close();
      ℤ1.close();
      r̅1.close();
      F.close();
   }
}
