package arb.functions;

import arb.ComplexRationalFunction;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.rational.ComplexRationalNullaryFunction;

public class RtooArg implements ComplexRationalNullaryFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context;
   public final Integer cℤ0000 = new Integer("2");
   public ComplexRationalFunction vℚℂ0008 = new ComplexRationalFunction();
   public ComplexRationalFunction vℚℂ0009 = new ComplexRationalFunction();
   public Integer n;
   public Real v;

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
      if (!this.isInitialized) {
         this.initialize();
      }

      return this.vℚℂ0008.identity().pow(this.cℤ0000, bits, this.vℚℂ0009).neg(result);
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
      this.vℚℂ0008.close();
      this.vℚℂ0009.close();
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
      return "-z^2";
   }

   @Override
   public String typeset() {
      return "-({z}^{2})";
   }
}
