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
import arb.functions.rational.ComplexRationalNullaryFunction;

public class GArg224591451 implements ComplexRationalNullaryFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public final Integer cℤ0000 = new Integer("1");
   public final Integer cℤ0001 = new Integer("2");
   public Fraction vq0002 = new Fraction();
   public Complex vℂ0002 = new Complex();
   public ComplexRationalFunction vℚℂ0003 = new ComplexRationalFunction();
   public Integer m;

   @Override
   public Class<Object> domainType() {
      return Object.class;
   }

   @Override
   public Class<ComplexRationalFunction> coDomainType() {
      return ComplexRationalFunction.class;
   }

   @Override
   public ComplexRationalFunction evaluate(Object in, int order, int bits, ComplexRationalFunction result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         return this.cℤ0000.div(this.cℤ0001, bits, this.vq0002).mul(ComplexConstants.ⅈ, bits, this.vℂ0002).div(this.vℚℂ0003.identity(), bits, result);
      }
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
      this.vq0002.close();
      this.vℂ0002.close();
      this.vℚℂ0003.close();
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
      return "((1/2)*ⅈ)/y";
   }

   @Override
   public String typeset() {
      return "\\frac{\\left(\\frac{1}{2} \\cdot ⅈ\\right)}{y}";
   }
}
