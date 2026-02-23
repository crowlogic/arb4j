package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.integer.ComplexSequence;
import arb.functions.integer.ComplexSequenceSequence;

public class ω implements ComplexSequenceSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public Real α;
   public Real β;
   public Real γ;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexSequence> coDomainType() {
      return ComplexSequence.class;
   }

   @Override
   public ComplexSequence evaluate(Integer j, int order, int bits, ComplexSequence result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         ωfunc var10000 = new ωfunc();
         if (var10000.j == null) {
            var10000.j = new Integer();
         }

         var10000.j.set(j);
         var10000.α = this.α;
         var10000.β = this.β;
         var10000.γ = this.γ;
         var10000.initialize();
         return var10000;
      }
   }

   @Override
   public ComplexSequenceSequence derivative() {
      return Function.express(
         Integer.class,
         ComplexSequence.class,
         ComplexSequenceSequence.class,
         "_diffω",
         "diff(((((-1)^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*Γ((j-k)+1))*Γ(k+1)),j)",
         this.context
      );
   }

   @Override
   public ComplexSequenceSequence integral() {
      return Function.express(
         Integer.class,
         ComplexSequence.class,
         ComplexSequenceSequence.class,
         "_intω",
         "int(((((-1)^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*Γ((j-k)+1))*Γ(k+1)),j)",
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
      return "ω";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "ω:j➔((((-1)^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*Γ((j-k)+1))*Γ(k+1))";
   }

   @Override
   public String typeset() {
      return "\\frac{\\left(\\left({-(1)}^{(\\left(j-k\\right))} \\cdot \\Gamma(\\left(\\left(j + β\\right) + 1\\right))\\right) \\cdot \\Gamma(\\left(\\left(\\left(\\left(j + k\\right) + α\\right) + β\\right) + 1\\right))\\right)}{\\left(\\left(\\left(\\Gamma(\\left(\\left(k + β\\right) + 1\\right)) \\cdot \\Gamma(\\left(\\left(\\left(j + α\\right) + β\\right) + 1\\right))\\right) \\cdot \\Γ(\\left(\\left(j-k\\right) + 1\\right))\\right) \\cdot \\Γ(\\left(k + 1\\right))\\right)}";
   }
}
