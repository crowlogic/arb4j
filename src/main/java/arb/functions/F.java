package arb.functions;

import arb.Complex;
import arb.ComplexRationalFunction;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.rational.ComplexRationalNullaryFunction;

public class F implements ComplexRationalNullaryFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public final Integer cℤ0000 = new Integer("0");
   public Integer n = new Integer();
   public ComplexRationalFunction sumℚℂ0001 = new ComplexRationalFunction();
   public Integer upperLimitℤ0001 = new Integer();
   public ComplexRationalFunction valueℚℂ0001 = new ComplexRationalFunction();
   public operandF0001 operandF0001;
   public Integer N;
   public Integer p;
   public Integer q;
   public ComplexRationalFunction z;
   public Complex α;
   public Complex β;

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
         if (!this.isInitialized) {
            this.initialize();
         }

         this.sumℚℂ0001.additiveIdentity();
         this.n.set(this.cℤ0000);
         Integer var10000 = this.n;
         this.upperLimitℤ0001.set(this.N);

         while (var10000.compareTo(this.upperLimitℤ0001) <= 0) {
            this.sumℚℂ0001.add((ComplexRationalFunction)this.operandF0001.evaluate(this.n, bits, this.valueℚℂ0001), bits);
            var10000 = this.n.increment();
         }

         return result.set(this.sumℚℂ0001);
      }
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (this.N == null) {
         throw new AssertionError("N is null");
      } else {
         if (this.operandF0001 == null) {
            this.operandF0001 = new operandF0001();
         }

         if (this.operandF0001.p == null) {
            this.operandF0001.p = new Integer();
         }

         this.operandF0001.p.set(this.p);
         if (this.operandF0001.q == null) {
            this.operandF0001.q = new Integer();
         }

         this.operandF0001.q.set(this.q);
         if (this.operandF0001.α == null) {
            this.operandF0001.α = new Complex();
         }

         this.operandF0001.α.set(this.α);
         if (this.operandF0001.β == null) {
            this.operandF0001.β = new Complex();
         }

         this.operandF0001.β.set(this.β);
         if (this.operandF0001.z == null) {
            this.operandF0001.z = new ComplexRationalFunction();
         }

         this.operandF0001.z.set(this.z);
         if (this.operandF0001.N == null) {
            this.operandF0001.N = new Integer();
         }

         this.operandF0001.N.set(this.N);
         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.n.close();
      this.sumℚℂ0001.close();
      this.upperLimitℤ0001.close();
      this.valueℚℂ0001.close();
      this.operandF0001.close();
   }

   @Override
   public String getName() {
      return "F";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "F:Σn➔((z^n)*Πk➔α[k]⋰n{k=1…p})/(n!*Πk➔β[k]⋰n{k=1…q}){n=0…N}";
   }

   @Override
   public String typeset() {
      return "\\sum_{n = 0}^{N}{\\frac{\\left({z}^{n} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}}";
   }
}
