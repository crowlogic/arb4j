import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class Pn implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   public Real λ;
   public final P P = new P();

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }

      return P.evaluate(in, order, bits, result);
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         P.λ = λ;
         isInitialized = true;
      }
   }
}
