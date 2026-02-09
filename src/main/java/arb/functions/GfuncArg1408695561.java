package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.ComplexRationalFunction;
import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;

public class GfuncArg1408695561 implements Function<ComplexRationalFunction, ComplexRationalFunction>, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public final Integer cℤ0000 = new Integer("1");
   public final Integer cℤ0001 = new Integer("2");
   public Fraction vq0003 = new Fraction();
   public Complex vℂ0003 = new Complex();
   public ComplexRationalFunction vℚℂ0004 = new ComplexRationalFunction();
   public Complex y;

   @Override
   public Class<ComplexRationalFunction> domainType() {
      return ComplexRationalFunction.class;
   }

   @Override
   public Class<ComplexRationalFunction> coDomainType() {
      return ComplexRationalFunction.class;
   }

   @Override
   public ComplexRationalFunction evaluate(ComplexRationalFunction y, int order, int bits, ComplexRationalFunction result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         return this.cℤ0000.div(this.cℤ0001, bits, this.vq0003).mul(ComplexConstants.ⅈ, bits, this.vℂ0003).div(y, bits, this.vℚℂ0004).neg(result);
      }
   }

   @Override
   public Function derivative() {
      return Function.express(
         ComplexRationalFunction.class, ComplexRationalFunction.class, Function.class, "_diffGfuncArg1408695561", "diff(-((1/2)*ⅈ)/y,y)", this.context
      );
   }

   @Override
   public Function integral() {
      return Function.express(ComplexRationalFunction.class, ComplexRationalFunction.class, Function.class, "_intnull", "int(-((1/2)*ⅈ)/y,y)", this.context);
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
   public void close() {
      this.cℤ0000.close();
      this.cℤ0001.close();
      this.vq0003.close();
      this.vℂ0003.close();
      this.vℚℂ0004.close();
   }

   @Override
   public String getName() {
      return null;
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "y➔-((1/2)*ⅈ)/y";
   }

   @Override
   public String typeset() {
      return "-\\frac{\\left(\\frac{1}{2} \\cdot ⅈ\\right)}{y}";
   }
}
