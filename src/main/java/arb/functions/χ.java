package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
import arb.utensils.Utensils;

public class χ implements ComplexFunctionSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public Real α;
   public Real β;
   public Real γ;

   public static void main(String args[])
   {
     try ( χ χ = new χ())
     {
       χ.α = χ.β = RealConstants.negHalf;

       ComplexFunction apply = χ.apply(4);
       Complex eval = apply.eval(4.3);
       System.out.format("χ(4,2.3)=%s\n%s\n", eval, Utensils.yamlString(apply));
       
     }

   }
   
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
         "diff(((∫((1^p)*w(1))*(P(i))d1)-(∫(((-1)^p)*w((-1)))*(P(i))d(-1)))/σ(i),i)",
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
         "int(((∫((1^p)*w(1))*(P(i))d1)-(∫(((-1)^p)*w((-1)))*(P(i))d(-1)))/σ(i),i)",
         this.context
      );
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         this.isInitialized = true;
      }
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
      return "χ:i➔((∫((1^p)*w(1))*(P(i))d1)-(∫(((-1)^p)*w((-1)))*(P(i))d(-1)))/σ(i)";
   }

   @Override
   public String typeset() {
      return "\\frac{\\left(\\int \\left({1}^{p} \\cdot \\w(1)\\right) \\cdot \\P(i)(1) d1-\\int \\left({-(1)}^{p} \\cdot \\w(-(1))\\right) \\cdot \\P(i)(-(1)) d-(1)\\right)}{\\σ(i)}";
   }
}
