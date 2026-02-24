package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;
import arb.functions.integer.ComplexSequenceSequence;
import arb.utensils.Utensils;

public class μ implements ComplexSequenceSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public Real α;
   public Real β;
   public Real γ;

   public static void main(String args[])
   {
     try ( μ μ = new μ())
     {
       μ.α = μ.β = RealConstants.negHalf;
       μ.γ = RealConstants.half;
       ComplexSequence apply = μ.apply(3);
       Complex apply2 = apply.apply(4);
       
       System.out.format("μ(4,3)=%s\n%s\n", apply2, Utensils.yamlString(apply2));
       
     }

   }

   
   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexSequence> coDomainType() {
      return ComplexSequence.class;
   }

   @Override
   public ComplexSequence evaluate(Integer i, int order, int bits, ComplexSequence result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         μfunc var10000 = new μfunc();
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
   public ComplexSequenceSequence derivative() {
      return Function.express(
         Integer.class, ComplexSequence.class, ComplexSequenceSequence.class, "_diffμ", "diff(Σk➔(ω(j)(k)*Đ^(γ)(t^(k))*χ(i)(k-γ)){k=0…j},i)", this.context
      );
   }

   @Override
   public ComplexSequenceSequence integral() {
      return Function.express(
         Integer.class, ComplexSequence.class, ComplexSequenceSequence.class, "_intμ", "int(Σk➔(ω(j)(k)*Đ^(γ)(t^(k))*χ(i)(k-γ)){k=0…j},i)", this.context
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
      return "μ";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "μ:i➔Σk➔(ω(j)(k)*Đ^(γ)(t^(k))*χ(i)(k-γ)){k=0…j}";
   }

   @Override
   public String typeset() {
      return "\\sum_{k = 0}^{j}{null}";
   }
}
