package arb.functions;

import arb.Complex;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.integer.ComplexSequence;

public class μfunc implements ComplexSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context;
   public final Integer cℤ0000 = new Integer("0");
   public Integer k = new Integer();
   public Complex sumℂ0001 = new Complex();
   public Integer upperLimitℤ0001 = new Integer();
   public Complex valueℂ0001 = new Complex();
   public operandF0001 operandF0001;
   public Integer i;
   public Real α;
   public Real β;
   public Real γ;

   
   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<Complex> coDomainType() {
      return Complex.class;
   }

   @Override
   public Complex evaluate(Integer j, int order, int bits, Complex result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         if (this.operandF0001.j == null) {
            this.operandF0001.j = new Integer();
         }

         this.operandF0001.j.set(j);
         if (this.operandF0001.i == null) {
            this.operandF0001.i = new Integer();
         }

         this.operandF0001.i.set(this.i);
         this.sumℂ0001.additiveIdentity();
         this.k.set(this.cℤ0000);
         Integer var10000 = this.k;
         this.upperLimitℤ0001.set(j);

         while (var10000.compareTo(this.upperLimitℤ0001) <= 0) {
            this.sumℂ0001.add((Complex)this.operandF0001.evaluate(this.k, bits, this.valueℂ0001), bits);
            var10000 = this.k.increment();
         }

         return result.set(this.sumℂ0001);
      }
   }

   @Override
   public ComplexSequence derivative() {
      return Function.express(
         Integer.class, Complex.class, ComplexSequence.class, "_diffμfunc", "diff(Σk➔(ω(j)(k)*Đ^(γ)(t^(k))*χ(i)(k-γ)){k=0…j},j)", this.context
      );
   }

   @Override
   public ComplexSequence integral() {
      return Function.express(
         Integer.class, Complex.class, ComplexSequence.class, "_intμfunc", "int(Σk➔(ω(j)(k)*Đ^(γ)(t^(k))*χ(i)(k-γ)){k=0…j},j)", this.context
      );
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         if (this.operandF0001 == null) {
            this.operandF0001 = new operandF0001();
         }

         this.operandF0001.context = this.context;
         if (this.operandF0001.α == null) {
            this.operandF0001.α = new Real();
         }

         this.operandF0001.α.set(this.α);
         if (this.operandF0001.β == null) {
            this.operandF0001.β = new Real();
         }

         this.operandF0001.β.set(this.β);
         if (this.operandF0001.γ == null) {
            this.operandF0001.γ = new Real();
         }

         this.operandF0001.γ.set(this.γ);
         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.k.close();
      this.sumℂ0001.close();
      this.upperLimitℤ0001.close();
      this.valueℂ0001.close();
      this.operandF0001.close();
   }

   @Override
   public String getName() {
      return "μfunc";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "μfunc:j➔Σk➔(ω(j)(k)*Đ^(γ)(t^(k))*χ(i)(k-γ)){k=0…j}";
   }

   @Override
   public String typeset() {
      return "\\sum_{k = 0}^{j}{\\frac{\\left(\\left(\\ω(j)\\left(k\\right) \\cdot \\left(\\Γ(\\left(k + 1\\right)) \\cdot {t}^{(\\left(k-γ\\right))}\\right)\\right) \\cdot \\χ(i)\\left(\\left(k-γ\\right)\\right)\\right)}{\\Γ(\\left(\\left(k + 1\\right)-γ\\right))}}";
   }
}
