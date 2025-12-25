package arb.functions;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.real.RealFunction;

public class w implements RealFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public final Integer cℤ0000 = new Integer("1");
   public Real vℝ0030 = new Real();
   public Real vℝ0031 = new Real();
   public Real vℝ0032 = new Real();
   public Real vℝ0033 = new Real();
   public Real α;
   public Real β;

   @Override
   public Class<Real> domainType() {
      return Real.class;
   }

   @Override
   public Class<Real> coDomainType() {
      return Real.class;
   }

   @Override
   public Real evaluate(Real x, int order, int bits, Real result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         return this.cℤ0000
            .sub(x, bits, this.vℝ0030)
            .pow(this.α, bits, this.vℝ0031)
            .mul(this.cℤ0000.add(x, bits, this.vℝ0032).pow(this.β, bits, this.vℝ0033), bits, result);
      }
   }

   @Override
   public RealFunction derivative() {
      return Function.express(Real.class, Real.class, RealFunction.class, "_diffw", "diff(((1-x)^α)*((1+x)^β),x)", this.context);
   }

   @Override
   public RealFunction integral() {
      return Function.express(Real.class, Real.class, RealFunction.class, "_intw", "int(((1-x)^α)*((1+x)^β),x)", this.context);
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
      this.vℝ0030.close();
      this.vℝ0031.close();
      this.vℝ0032.close();
      this.vℝ0033.close();
   }

   @Override
   public String getName() {
      return "w";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "w:x➔((1-x)^α)*((1+x)^β)";
   }

   @Override
   public String typeset() {
      return "\\left({(\\left(1-x\\right))}^{α} \\cdot {(\\left(1 + x\\right))}^{β}\\right)";
   }
}
