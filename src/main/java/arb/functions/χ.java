package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;

public class χ implements ComplexFunctionSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public normSq normSq;
   public w w;
   public P P;
   public Real α;
   public Real β;
   public Real γ;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexFunction> coDomainType() {
      return ComplexFunction.class;
   }

   @Override
   public ComplexFunction evaluate(Integer i, int order, int bits, ComplexFunction result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         χfunc var10000 = new χfunc();
         if (var10000.i == null) {
            var10000.i = new Integer();
         }

         var10000.i.set(i);
         var10000.α = this.α;
         var10000.β = this.β;
         var10000.γ = this.γ;
         var10000.P = this.P;
         var10000.w = this.w;
         var10000.normSq = this.normSq;
         var10000.initialize();
         return var10000;
      }
   }

   @Override
   public ComplexFunctionSequence derivative() {
      return Function.express(
         Integer.class,
         ComplexFunction.class,
         ComplexFunctionSequence.class,
         "_diffχ",
         "diff(((∫((1^p)*w(1))*(P(i))d1)-(∫((-1^p)*w(-1))*(P(i))d-1))/normSq(i),i)",
         this.context
      );
   }

   @Override
   public ComplexFunctionSequence integral() {
      return Function.express(
         Integer.class,
         ComplexFunction.class,
         ComplexFunctionSequence.class,
         "_intχ",
         "int(((∫((1^p)*w(1))*(P(i))d1)-(∫((-1^p)*w(-1))*(P(i))d-1))/normSq(i),i)",
         this.context
      );
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         if (this.P == null) {
            this.P = new P();
         }

         if (this.w == null) {
            this.w = new w();
         }

         if (this.normSq == null) {
            this.normSq = new normSq();
         }

         if (this.normSq.α == null) {
            this.normSq.α = this.α;
         } else {
            this.normSq.α.set(this.α);
         }

         if (this.normSq.β == null) {
            this.normSq.β = this.β;
         } else {
            this.normSq.β.set(this.β);
         }

         if (this.normSq.γ == null) {
            this.normSq.γ = this.γ;
         } else {
            this.normSq.γ.set(this.γ);
         }

         if (this.w.α == null) {
            this.w.α = this.α;
         } else {
            this.w.α.set(this.α);
         }

         if (this.w.β == null) {
            this.w.β = this.β;
         } else {
            this.w.β.set(this.β);
         }

         if (this.P.α == null) {
            this.P.α = this.α;
         } else {
            this.P.α.set(this.α);
         }

         if (this.P.β == null) {
            this.P.β = this.β;
         } else {
            this.P.β.set(this.β);
         }

         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
   }

   @Override
   public String getName() {
      return "χ";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "χ:i➔((∫((1^p)*w(1))*(P(i))d1)-(∫((-1^p)*w(-1))*(P(i))d-1))/normSq(i)";
   }

   @Override
   public String typeset() {
      return "\\frac{\\left(\\int \\left({1}^{p} \\cdot \\w(1)\\right) \\cdot \\P(i)(1) d1-\\int \\left({-1}^{p} \\cdot \\w(-1)\\right) \\cdot \\P(i)(-1) d-1\\right)}{\\normSq(i)}";
   }
}
