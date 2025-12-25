package arb.functions;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.integer.RealSequence;

public class B implements RealSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public final Integer cℤ0000 = new Integer("1");
   public Real vℝ0019 = new Real();
   public Real vℝ0020 = new Real();
   public Real vℝ0021 = new Real();
   public Real vℝ0022 = new Real();
   public Real vℝ0023 = new Real();
   public Real vℝ0024 = new Real();
   public Real vℝ0025 = new Real();
   public C C;
   public Real α;
   public Real β;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<Real> coDomainType() {
      return Real.class;
   }

   @Override
   public Real evaluate(Integer n, int order, int bits, Real result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         return n.add(this.α, bits, this.vℝ0019)
            .sub(this.cℤ0000, bits, this.vℝ0020)
            .mul(n.add(this.β, bits, this.vℝ0021).sub(this.cℤ0000, bits, this.vℝ0022), bits, this.vℝ0023)
            .mul((Real)this.C.evaluate(this.vℝ0024.set(n), order, bits, this.vℝ0025), bits, result);
      }
   }

   @Override
   public RealSequence derivative() {
      return Function.express(Integer.class, Real.class, RealSequence.class, "_diffB", "diff((((n+α)-1)*((n+β)-1))*C(n),n)", this.context);
   }

   @Override
   public RealSequence integral() {
      return Function.express(Integer.class, Real.class, RealSequence.class, "_intB", "int((((n+α)-1)*((n+β)-1))*C(n),n)", this.context);
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
         if (this.C == null) {
            this.C = new C();
         }

         if (this.C.α == null) {
            this.C.α = new Real();
            this.C.α.set(this.α);
         } else {
            this.C.α = this.α;
         }

         if (this.C.β == null) {
            this.C.β = new Real();
            this.C.β.set(this.β);
         } else {
            this.C.β = this.β;
         }

         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.vℝ0019.close();
      this.vℝ0020.close();
      this.vℝ0021.close();
      this.vℝ0022.close();
      this.vℝ0023.close();
      this.vℝ0024.close();
      this.vℝ0025.close();
      this.C.close();
   }

   @Override
   public String getName() {
      return "B";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "B:n➔(((n+α)-1)*((n+β)-1))*C(n)";
   }

   @Override
   public String typeset() {
      return "\\left(\\left(\\left(\\left(n + α\\right)-1\\right) \\cdot \\left(\\left(n + β\\right)-1\\right)\\right) \\cdot \\C(n)\\right)";
   }
}
