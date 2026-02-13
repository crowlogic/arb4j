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

public class ωfunc implements ComplexSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context;
   public final Integer cℤ0000 = new Integer("1");
   public Complex vℂ0004 = new Complex();
   public Complex vℂ0005 = new Complex();
   public Complex vℂ0006 = new Complex();
   public Complex vℂ0007 = new Complex();
   public Complex vℂ0008 = new Complex();
   public Complex vℂ0009 = new Complex();
   public Complex vℂ0010 = new Complex();
   public Real vℝ0052 = new Real();
   public Real vℝ0053 = new Real();
   public Real vℝ0054 = new Real();
   public Real vℝ0055 = new Real();
   public Real vℝ0056 = new Real();
   public Real vℝ0057 = new Real();
   public Real vℝ0058 = new Real();
   public Real vℝ0059 = new Real();
   public Real vℝ0060 = new Real();
   public Real vℝ0061 = new Real();
   public Real vℝ0062 = new Real();
   public Real vℝ0063 = new Real();
   public Real vℝ0064 = new Real();
   public Real vℝ0065 = new Real();
   public Real vℝ0066 = new Real();
   public Integer vℤ0005 = new Integer();
   public Integer vℤ0006 = new Integer();
   public Integer vℤ0007 = new Integer();
   public Integer vℤ0008 = new Integer();
   public Integer j;
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
   public Complex evaluate(Integer k, int order, int bits, Complex result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         return this.cℤ0000
            .neg(this.vℤ0005)
            .pow(this.j.sub(k, bits, this.vℤ0006), bits, this.vℂ0004)
            .mul(this.j.add(this.β, bits, this.vℝ0052).add(this.cℤ0000, bits, this.vℝ0053).Γ(bits, this.vℝ0054), bits, this.vℂ0005)
            .mul(
               this.j
                  .add(k, bits, this.vℤ0007)
                  .add(this.α, bits, this.vℝ0055)
                  .add(this.β, bits, this.vℝ0056)
                  .add(this.cℤ0000, bits, this.vℝ0057)
                  .Γ(bits, this.vℝ0058),
               bits,
               this.vℂ0006
            )
            .div(
               k.add(this.β, bits, this.vℝ0059)
                  .add(this.cℤ0000, bits, this.vℝ0060)
                  .Γ(bits, this.vℝ0061)
                  .mul(
                     this.j.add(this.α, bits, this.vℝ0062).add(this.β, bits, this.vℝ0063).add(this.cℤ0000, bits, this.vℝ0064).Γ(bits, this.vℝ0065),
                     bits,
                     this.vℝ0066
                  )
                  .mul(this.j.sub(k, bits, this.vℤ0008).factorial(bits, this.vℂ0007), bits, this.vℂ0008)
                  .mul(k.factorial(bits, this.vℂ0009), bits, this.vℂ0010),
               bits,
               result
            );
      }
   }

   @Override
   public ComplexSequence derivative() {
      return Function.express(
         Integer.class,
         Complex.class,
         ComplexSequence.class,
         "_diffωfunc",
         "diff((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*(k)!),k)",
         this.context
      );
   }

   @Override
   public ComplexSequence integral() {
      return Function.express(
         Integer.class,
         Complex.class,
         ComplexSequence.class,
         "_intωfunc",
         "int((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*(k)!),k)",
         this.context
      );
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
      this.vℂ0004.close();
      this.vℂ0005.close();
      this.vℂ0006.close();
      this.vℂ0007.close();
      this.vℂ0008.close();
      this.vℂ0009.close();
      this.vℂ0010.close();
      this.vℝ0052.close();
      this.vℝ0053.close();
      this.vℝ0054.close();
      this.vℝ0055.close();
      this.vℝ0056.close();
      this.vℝ0057.close();
      this.vℝ0058.close();
      this.vℝ0059.close();
      this.vℝ0060.close();
      this.vℝ0061.close();
      this.vℝ0062.close();
      this.vℝ0063.close();
      this.vℝ0064.close();
      this.vℝ0065.close();
      this.vℝ0066.close();
      this.vℤ0005.close();
      this.vℤ0006.close();
      this.vℤ0007.close();
      this.vℤ0008.close();
   }

   @Override
   public String getName() {
      return "ωfunc";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "k➔(((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*(k)!)";
   }

   @Override
   public String typeset() {
      return "\\frac{\\left(\\left({-1}^{(\\left(j-k\\right))} \\cdot \\Γ(\\left(\\left(j + β\\right) + 1\\right))\\right) \\cdot \\Γ(\\left(\\left(\\left(\\left(j + k\\right) + α\\right) + β\\right) + 1\\right))\\right)}{\\left(\\left(\\left(\\Γ(\\left(\\left(k + β\\right) + 1\\right)) \\cdot \\Γ(\\left(\\left(\\left(j + α\\right) + β\\right) + 1\\right))\\right) \\cdot \\factorial(\\left(j-k\\right))\\right) \\cdot \\factorial(k)\\right)}";
   }
}
