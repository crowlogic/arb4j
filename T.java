import arb.Integer;
import arb.RealPolynomial;
import arb.functions.Function;

public class T implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   Integer c1 = new Integer("0");
   Integer c2 = new Integer("1");
   Integer c3 = new Integer("2");
   public RealPolynomial r̅1 = new RealPolynomial();
   public Integer ℤ1 = new Integer();
   public RealPolynomial r̅2 = new RealPolynomial();
   public RealPolynomial r̅3 = new RealPolynomial();
   public Integer ℤ2 = new Integer();
   public RealPolynomial r̅4 = new RealPolynomial();
   public T T;

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }
      return switch(in.getSignedValue()) {
         case 0 -> result.set(c2);
         case 1 -> result.set(result.identity());
         default -> c3
         .mul(result.identity(), bits, r̅1)
         .mul(T.evaluate(in.sub(c2, bits, ℤ1), order, bits, r̅2), bits, r̅3)
         .sub(T.evaluate(in.sub(c3, bits, ℤ2), order, bits, r̅4), bits, result);
      };
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         T = new T();
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      c2.close();
      c3.close();
      r̅1.close();
      ℤ1.close();
      r̅2.close();
      r̅3.close();
      ℤ2.close();
      r̅4.close();
      T.close();
   }
}
