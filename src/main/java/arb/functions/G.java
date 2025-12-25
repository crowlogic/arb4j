package arb.functions;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.real.RealNullaryFunction;

public class G implements RealNullaryFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public final Integer cℤ0000 = new Integer("2");
   public Real vℝ0007 = new Real();
   public Real vℝ0008 = new Real();
   public Real α;
   public Real β;

   @Override
   public Class<Object> domainType() {
      return Object.class;
   }

   @Override
   public Class<Real> coDomainType() {
      return Real.class;
   }

   @Override
   public Real evaluate(Object in, int order, int bits, Real result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         return this.α.pow(this.cℤ0000, bits, this.vℝ0007).sub(this.β.pow(this.cℤ0000, bits, this.vℝ0008), bits, result);
      }
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (this.α == null) {
         throw new AssertionError("α is null");
      } else if (this.β == null) {
         throw new AssertionError("β is null");
      } else {
         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.vℝ0007.close();
      this.vℝ0008.close();
   }

   @Override
   public String getName() {
      return "G";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "G:(α^2)-(β^2)";
   }

   @Override
   public String typeset() {
      return "\\left({α}^{2}-{β}^{2}\\right)";
   }
}
