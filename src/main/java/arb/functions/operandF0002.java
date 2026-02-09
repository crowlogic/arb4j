package arb.functions;

import arb.Complex;
import arb.ComplexRationalFunction;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;

public class operandF0002 implements Function<Integer, ComplexRationalFunction>, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public Integer n;
   public Integer N;
   public Integer p;
   public Integer q;
   public ComplexRationalFunction z;
   public Complex α;
   public Complex β;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexRationalFunction> coDomainType() {
      return ComplexRationalFunction.class;
   }

   @Override
   public ComplexRationalFunction evaluate(Integer k, int order, int bits, ComplexRationalFunction result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         return this.α.get(k).ascendingFactorial(this.n, bits, result);
      }
   }

   @Override
   public Function derivative() {
      return Function.express(Integer.class, ComplexRationalFunction.class, Function.class, "_diffoperandF0002", "diff(α[k]⋰n,k)", this.context);
   }

   @Override
   public Function integral() {
      return Function.express(Integer.class, ComplexRationalFunction.class, Function.class, "_intoperandF0002", "int(α[k]⋰n,k)", this.context);
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (this.α == null) {
         throw new AssertionError("α is null");
      } else {
         this.isInitialized = true;
      }
   }

   @Override
   public String getName() {
      return "operandF0002";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "operandF0002:k➔α[k]⋰n";
   }

   @Override
   public String typeset() {
      return "(α_{k})_{n}";
   }
}
