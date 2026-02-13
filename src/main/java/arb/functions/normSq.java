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

public class normSq implements ComplexSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public final Integer cℤ0000 = new Integer("2");
   public final Integer cℤ0001 = new Integer("1");
   public Complex vℂ0001 = new Complex();
   public Complex vℂ0002 = new Complex();
   public Complex vℂ0003 = new Complex();
   public Real vℝ0034 = new Real();
   public Real vℝ0035 = new Real();
   public Real vℝ0036 = new Real();
   public Real vℝ0037 = new Real();
   public Real vℝ0038 = new Real();
   public Real vℝ0039 = new Real();
   public Real vℝ0040 = new Real();
   public Real vℝ0041 = new Real();
   public Real vℝ0042 = new Real();
   public Real vℝ0043 = new Real();
   public Real vℝ0044 = new Real();
   public Real vℝ0045 = new Real();
   public Real vℝ0046 = new Real();
   public Real vℝ0047 = new Real();
   public Real vℝ0048 = new Real();
   public Real vℝ0049 = new Real();
   public Real vℝ0050 = new Real();
   public Real vℝ0051 = new Real();
   public Integer vℤ0003 = new Integer();
   public Integer vℤ0004 = new Integer();
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
   public Complex evaluate(Integer i, int order, int bits, Complex result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         return this.cℤ0000
            .pow(this.α.add(this.β, bits, this.vℝ0034).add(this.cℤ0001, bits, this.vℝ0035), bits, this.vℂ0001)
            .mul(i.add(this.α, bits, this.vℝ0036).add(this.cℤ0001, bits, this.vℝ0037).Γ(bits, this.vℝ0038), bits, this.vℂ0002)
            .mul(i.add(this.β, bits, this.vℝ0039).add(this.cℤ0001, bits, this.vℝ0040).Γ(bits, this.vℝ0041), bits, this.vℂ0003)
            .div(
               this.cℤ0000
                  .mul(i, bits, this.vℤ0003)
                  .add(this.α, bits, this.vℝ0042)
                  .add(this.β, bits, this.vℝ0043)
                  .add(this.cℤ0001, bits, this.vℝ0044)
                  .mul(i.add(this.cℤ0001, bits, this.vℤ0004).Γ(bits, this.vℝ0045), bits, this.vℝ0046)
                  .mul(
                     i.add(this.α, bits, this.vℝ0047).add(this.β, bits, this.vℝ0048).add(this.cℤ0001, bits, this.vℝ0049).Γ(bits, this.vℝ0050),
                     bits,
                     this.vℝ0051
                  ),
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
         "_diffnormSq",
         "diff((((2^((α+β)+1))*Γ((i+α)+1))*Γ((i+β)+1))/((((((2*i)+α)+β)+1)*Γ(i+1))*Γ(((i+α)+β)+1)),i)",
         this.context
      );
   }

   @Override
   public ComplexSequence integral() {
      return Function.express(
         Integer.class,
         Complex.class,
         ComplexSequence.class,
         "_intnormSq",
         "int((((2^((α+β)+1))*Γ((i+α)+1))*Γ((i+β)+1))/((((((2*i)+α)+β)+1)*Γ(i+1))*Γ(((i+α)+β)+1)),i)",
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
      this.cℤ0001.close();
      this.vℂ0001.close();
      this.vℂ0002.close();
      this.vℂ0003.close();
      this.vℝ0034.close();
      this.vℝ0035.close();
      this.vℝ0036.close();
      this.vℝ0037.close();
      this.vℝ0038.close();
      this.vℝ0039.close();
      this.vℝ0040.close();
      this.vℝ0041.close();
      this.vℝ0042.close();
      this.vℝ0043.close();
      this.vℝ0044.close();
      this.vℝ0045.close();
      this.vℝ0046.close();
      this.vℝ0047.close();
      this.vℝ0048.close();
      this.vℝ0049.close();
      this.vℝ0050.close();
      this.vℝ0051.close();
      this.vℤ0003.close();
      this.vℤ0004.close();
   }

   @Override
   public String getName() {
      return "normSq";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "normSq:i➔(((2^((α+β)+1))*Γ((i+α)+1))*Γ((i+β)+1))/((((((2*i)+α)+β)+1)*Γ(i+1))*Γ(((i+α)+β)+1))";
   }

   @Override
   public String typeset() {
      return "\\frac{\\left(\\left({2}^{(\\left(\\left(α + β\\right) + 1\\right))} \\cdot \\Gamma(\\left(\\left(i + α\\right) + 1\\right))\\right) \\cdot \\Gamma(\\left(\\left(i + β\\right) + 1\\right))\\right)}{\\left(\\left(\\left(\\left(\\left(\\left(2 \\cdot i\\right) + α\\right) + β\\right) + 1\\right) \\cdot \\Gamma(\\left(i + 1\\right))\\right) \\cdot \\Gamma(\\left(\\left(\\left(i + α\\right) + β\\right) + 1\\right))\\right)}";
   }
}
