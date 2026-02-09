package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.ComplexRationalFunction;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.rational.ComplexRationalHypergeometricFunction;

public class Gfunc implements ComplexFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public final Integer cℤ0000 = new Integer("1");
   public final Integer cℤ0001 = new Integer("2");
   public final Integer cℤ0002 = new Integer("4");
   public ComplexRationalFunction elementℚℂ0003 = new ComplexRationalFunction();
   public ComplexRationalFunction elementℚℂ0004 = new ComplexRationalFunction();
   public ComplexRationalHypergeometricFunction hypℚℂF0003 = new ComplexRationalHypergeometricFunction();
   public ComplexRationalHypergeometricFunction hypℚℂF0004 = new ComplexRationalHypergeometricFunction();
   public ComplexRationalFunction indeterminateℚℂ0001 = new ComplexRationalFunction();
   public ComplexRationalFunction indeterminateℚℂ0002 = new ComplexRationalFunction();
   public Complex vℂ0005 = new Complex();
   public Complex vℂ0006 = new Complex();
   public Complex vℂ0007 = new Complex();
   public Complex vℂ0008 = new Complex();
   public Complex vℂ0009 = new Complex();
   public Complex vℂ0010 = new Complex();
   public Complex vℂ0011 = new Complex();
   public Complex vℂ0012 = new Complex();
   public Complex vℂ0013 = new Complex();
   public Complex vℂ0014 = new Complex();
   public Complex vℂ0015 = new Complex();
   public Complex vℂ0016 = new Complex();
   public Complex vℂ0017 = new Complex();
   public Complex vℂ0018 = new Complex();
   public Complex vℂ0019 = new Complex();
   public Complex vℂ0020 = new Complex();
   public Complex vℂ0021 = new Complex();
   public Complex vℂ0022 = new Complex();
   public Complex vℂ0023 = new Complex();
   public Complex vℂ0024 = new Complex();
   public Complex vℂ0025 = new Complex();
   public Complex vℂ0026 = new Complex();
   public Complex vℂ0027 = new Complex();
   public Complex vℂ0028 = new Complex();
   public Complex vℂ0029 = new Complex();
   public Real vℝ0001;
   public Real vℝ0002;
   public Real vℝ0003;
   public Integer vℤ0001;
   public Integer vℤ0002;
   public GfuncArg1408695561 GfuncArg1408695561;
   public GfuncArg1543043602 GfuncArg1543043602;
   public Integer m;
   public Complex vℂ0030 = new Complex();
   public Complex vℂ0031 = new Complex();
   public Complex vℂ0032 = new Complex();
   public Complex vℂ0033 = new Complex();
   public Complex vℂ0034 = new Complex();
   public Complex vℂ0035 = new Complex();
   public Complex vℂ0036 = new Complex();
   public Complex vℂ0037 = new Complex();
   public Complex vℂ0038 = new Complex();
   public Complex vℂ0039 = new Complex();
   public Complex vℂ0040 = new Complex();
   public Complex vℂ0041 = new Complex();

   @Override
   public Class<Complex> domainType() {
      return Complex.class;
   }

   @Override
   public Class<Complex> coDomainType() {
      return Complex.class;
   }

   @Override
   public Complex evaluate(Complex y, int order, int bits, Complex result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         return this.elementℚℂ0003
            .evaluate(y, order, bits, this.vℂ0006)
            .mul(
               ComplexConstants.ⅈ.mul(RealConstants.π.mul(this.m, bits, this.vℝ0001).add(y, bits, this.vℂ0007), bits, this.vℂ0008).exp(bits, this.vℂ0009),
               bits,
               this.vℂ0010
            )
            .mul(
               this.vℂ0011
                  .sub(
                     this.elementℚℂ0004
                        .evaluate(y, order, bits, this.vℂ0012)
                        .mul(
                           ComplexConstants.ⅈ
                              .mul(
                                 this.cℤ0001.mul(RealConstants.π, bits, this.vℝ0002).mul(this.m, bits, this.vℝ0003).sub(y, bits, this.vℂ0013),
                                 bits,
                                 this.vℂ0014
                              )
                              .exp(bits, this.vℂ0015),
                           bits,
                           this.vℂ0016
                        ),
                     bits,
                     this.vℂ0017
                  ),
               bits,
               this.vℂ0018
            )
            .mul(this.cℤ0002.mul(this.m.pow(this.cℤ0001, bits, this.vℂ0019), bits, this.vℂ0020).sub(this.cℤ0000, bits, this.vℂ0021), bits, this.vℂ0022)
            .mul(this.cℤ0000.neg(this.vℤ0001).pow(this.m.neg(this.vℤ0002), bits, this.vℂ0023), bits, this.vℂ0024)
            .div(
               this.cℤ0002
                  .mul(this.vℂ0019, bits, this.vℂ0025)
                  .sub(this.cℤ0001, bits, this.vℂ0026)
                  .mul(y, bits, this.vℂ0027)
                  .mul(RealConstants.π, bits, this.vℂ0028),
               bits,
               this.vℂ0029
            )
            .neg(result);
      }
   }

   @Override
   public ComplexFunction derivative() {
      return Function.express(
         Complex.class,
         Complex.class,
         ComplexFunction.class,
         "_diffGfunc",
         "diff(-(((ⅈ*((pFq([1,m,-m],[1/2];-((1/2)*ⅈ)/y)*exp(ⅈ*((π*m)+y)))-(pFq([1,m,-m],[1/2];((1/2)*ⅈ)/y)*exp(ⅈ*(((2*π)*m)-y)))))*((4*(m^2))-1))*(-1^-m))/((((4*(m^2))-2)*y)*π),y)",
         this.context
      );
   }

   @Override
   public ComplexFunction integral() {
      return Function.express(
         Complex.class,
         Complex.class,
         ComplexFunction.class,
         "_intGfunc",
         "int(-(((ⅈ*((pFq([1,m,-m],[1/2];-((1/2)*ⅈ)/y)*exp(ⅈ*((π*m)+y)))-(pFq([1,m,-m],[1/2];((1/2)*ⅈ)/y)*exp(ⅈ*(((2*π)*m)-y)))))*((4*(m^2))-1))*(-1^-m))/((((4*(m^2))-2)*y)*π),y)",
         this.context
      );
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         if (this.GfuncArg1408695561 == null) {
            this.GfuncArg1408695561 = new GfuncArg1408695561();
         }

         if (this.GfuncArg1543043602 == null) {
            this.GfuncArg1543043602 = new GfuncArg1543043602();
         }

         this.indeterminateℚℂ0001.identity();
         this.hypℚℂF0003
            .init(
               this.vℂ0033.set(new Complex[]{this.vℂ0030.set(this.cℤ0000), this.vℂ0031.set(this.m), this.m.neg(this.vℂ0032)}),
               this.vℂ0035.set(new Complex[]{this.cℤ0000.div(this.cℤ0001, 128, this.vℂ0034)}),
               this.GfuncArg1408695561
            );
         this.hypℚℂF0003.evaluate(this.indeterminateℚℂ0001, 1, 128, this.elementℚℂ0003);
         this.indeterminateℚℂ0002.identity();
         this.hypℚℂF0004
            .init(
               this.vℂ0039.set(new Complex[]{this.vℂ0036.set(this.cℤ0000), this.vℂ0037.set(this.m), this.m.neg(this.vℂ0038)}),
               this.vℂ0041.set(new Complex[]{this.cℤ0000.div(this.cℤ0001, 128, this.vℂ0040)}),
               this.GfuncArg1543043602
            );
         this.hypℚℂF0004.evaluate(this.indeterminateℚℂ0002, 1, 128, this.elementℚℂ0004);
         this.isInitialized = true;
      }
   }

   public Gfunc() {
      this.vℝ0001 = new Real();
      this.vℝ0002 = new Real();
      this.vℝ0003 = new Real();
      this.vℤ0001 = new Integer();
      this.vℤ0002 = new Integer();
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.cℤ0001.close();
      this.cℤ0002.close();
      this.elementℚℂ0003.close();
      this.elementℚℂ0004.close();
      this.hypℚℂF0003.close();
      this.hypℚℂF0004.close();
      this.indeterminateℚℂ0001.close();
      this.indeterminateℚℂ0002.close();
      this.vℂ0005.close();
      this.vℂ0006.close();
      this.vℂ0007.close();
      this.vℂ0008.close();
      this.vℂ0009.close();
      this.vℂ0010.close();
      this.vℂ0011.close();
      this.vℂ0012.close();
      this.vℂ0013.close();
      this.vℂ0014.close();
      this.vℂ0015.close();
      this.vℂ0016.close();
      this.vℂ0017.close();
      this.vℂ0018.close();
      this.vℂ0019.close();
      this.vℂ0020.close();
      this.vℂ0021.close();
      this.vℂ0022.close();
      this.vℂ0023.close();
      this.vℂ0024.close();
      this.vℂ0025.close();
      this.vℂ0026.close();
      this.vℂ0027.close();
      this.vℂ0028.close();
      this.vℂ0029.close();
      this.vℂ0030.close();
      this.vℂ0031.close();
      this.vℂ0032.close();
      this.vℂ0033.close();
      this.vℂ0034.close();
      this.vℂ0035.close();
      this.vℂ0036.close();
      this.vℂ0037.close();
      this.vℂ0038.close();
      this.vℂ0039.close();
      this.vℂ0040.close();
      this.vℂ0041.close();
      this.vℝ0001.close();
      this.vℝ0002.close();
      this.vℝ0003.close();
      this.vℤ0001.close();
      this.vℤ0002.close();
      this.GfuncArg1543043602.close();
      this.GfuncArg1408695561.close();
   }

   @Override
   public String getName() {
      return "Gfunc";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "y➔-(((ⅈ*((pFq([1,m,-m],[1/2];-((1/2)*ⅈ)/y)*exp(ⅈ*((π*m)+y)))-(pFq([1,m,-m],[1/2];((1/2)*ⅈ)/y)*exp(ⅈ*(((2*π)*m)-y)))))*((4*(m^2))-1))*(-1^-m))/((((4*(m^2))-2)*y)*π)";
   }

   @Override
   public String typeset() {
      return "-\\frac{\\left(\\left(\\left(ⅈ \\cdot \\left(\\left({_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; -\\frac{\\left(\\frac{1}{2} \\cdot ⅈ\\right)}{y}\\right) \\cdot \\exp(\\left(ⅈ \\cdot \\left(\\left(\\pi \\cdot m\\right) + y\\right)\\right))\\right)-\\left({_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; \\frac{\\left(\\frac{1}{2} \\cdot ⅈ\\right)}{y}\\right) \\cdot \\exp(\\left(ⅈ \\cdot \\left(\\left(\\left(2 \\cdot \\pi\\right) \\cdot m\\right)-y\\right)\\right))\\right)\\right)\\right) \\cdot \\left(\\left(4 \\cdot {m}^{2}\\right)-1\\right)\\right) \\cdot {-1}^{-m}\\right)}{\\left(\\left(\\left(\\left(4 \\cdot {m}^{2}\\right)-2\\right) \\cdot y\\right) \\cdot \\pi\\right)}";
   }
}
