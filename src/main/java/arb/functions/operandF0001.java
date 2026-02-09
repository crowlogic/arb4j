package arb.functions;

import arb.Complex;
import arb.ComplexRationalFunction;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.rational.ComplexRationalFunctionSequence;

public class operandF0001 implements Function<Integer, ComplexRationalFunction>, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public Context context = new Context();
   public final Integer cℤ0000 = new Integer("1");
   public Integer k = new Integer();
   public ComplexRationalFunction prodℚℂ0001 = new ComplexRationalFunction();
   public ComplexRationalFunction prodℚℂ0002 = new ComplexRationalFunction();
   public Integer upperLimitℤ0002 = new Integer();
   public Integer upperLimitℤ0003 = new Integer();
   public ComplexRationalFunction valueℚℂ0002 = new ComplexRationalFunction();
   public ComplexRationalFunction valueℚℂ0003 = new ComplexRationalFunction();
   public ComplexRationalFunction vℚℂ0001 = new ComplexRationalFunction();
   public ComplexRationalFunction vℚℂ0002 = new ComplexRationalFunction();
   public ComplexRationalFunction vℚℂ0003 = new ComplexRationalFunction();
   public Integer vℤ0001 = new Integer();
   public operandF0003 operandF0003;
   public operandF0002 operandF0002;
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
   public ComplexRationalFunction evaluate(Integer n, int order, int bits, ComplexRationalFunction result) {
      if (order > 1) {
         throw new AssertionError("TODO: implement order=" + order + ">1");
      } else {
         if (!this.isInitialized) {
            this.initialize();
         }

         ComplexRationalFunction var10000 = this.z.pow(n, bits, this.vℚℂ0001);
         if (this.operandF0002.n == null) {
            this.operandF0002.n = new Integer();
         }

         this.operandF0002.n.set(n);
         this.prodℚℂ0001.multiplicativeIdentity();
         this.k.set(this.cℤ0000);
         Integer var10001 = this.k;
         this.upperLimitℤ0002.set(this.p);

         while (var10001.compareTo(this.upperLimitℤ0002) <= 0) {
            this.prodℚℂ0001.mul((ComplexRationalFunction)this.operandF0002.evaluate(this.k, bits, this.valueℚℂ0002), bits);
            var10001 = this.k.increment();
         }

         var10000 = var10000.mul(this.prodℚℂ0001, bits, this.vℚℂ0002);
         var10001 = n.factorial(bits, this.vℤ0001);
         if (this.operandF0003.n == null) {
            this.operandF0003.n = new Integer();
         }

         this.operandF0003.n.set(n);
         this.prodℚℂ0002.multiplicativeIdentity();
         this.k.set(this.cℤ0000);
         Integer var10002 = this.k;
         this.upperLimitℤ0003.set(this.q);

         while (var10002.compareTo(this.upperLimitℤ0003) <= 0) {
            this.prodℚℂ0002.mul((ComplexRationalFunction)this.operandF0003.evaluate(this.k, bits, this.valueℚℂ0003), bits);
            var10002 = this.k.increment();
         }

         return var10000.div(var10001.mul(this.prodℚℂ0002, bits, this.vℚℂ0003), bits, result);
      }
   }

   @Override
   public ComplexRationalFunctionSequence derivative() {
      return Function.express(
         Integer.class,
         ComplexRationalFunction.class,
         ComplexRationalFunctionSequence.class,
         "_diffoperandF0001",
         "diff(((z^n)*Πk➔α[k]⋰n{k=1…p})/(n!*Πk➔β[k]⋰n{k=1…q}),n)",
         this.context
      );
   }

   @Override
   public Function integral() {
      return Function.express(
         Integer.class,
         ComplexRationalFunction.class,
         Function.class,
         "_intoperandF0001",
         "int(((z^n)*Πk➔α[k]⋰n{k=1…p})/(n!*Πk➔β[k]⋰n{k=1…q}),n)",
         this.context
      );
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (this.p == null) {
         throw new AssertionError("p is null");
      } else if (this.q == null) {
         throw new AssertionError("q is null");
      } else if (this.z == null) {
         throw new AssertionError("z is null");
      } else {
         if (this.operandF0003 == null) {
            this.operandF0003 = new operandF0003();
         }

         if (this.operandF0002 == null) {
            this.operandF0002 = new operandF0002();
         }

         if (this.operandF0002.p == null) {
            this.operandF0002.p = new Integer();
         }

         this.operandF0002.p.set(this.p);
         if (this.operandF0002.q == null) {
            this.operandF0002.q = new Integer();
         }

         this.operandF0002.q.set(this.q);
         if (this.operandF0002.α == null) {
            this.operandF0002.α = new Complex();
         }

         this.operandF0002.α.set(this.α);
         if (this.operandF0002.β == null) {
            this.operandF0002.β = new Complex();
         }

         this.operandF0002.β.set(this.β);
         if (this.operandF0002.z == null) {
            this.operandF0002.z = new ComplexRationalFunction();
         }

         this.operandF0002.z.set(this.z);
         if (this.operandF0002.N == null) {
            this.operandF0002.N = new Integer();
         }

         this.operandF0002.N.set(this.N);
         if (this.operandF0003.p == null) {
            this.operandF0003.p = new Integer();
         }

         this.operandF0003.p.set(this.p);
         if (this.operandF0003.q == null) {
            this.operandF0003.q = new Integer();
         }

         this.operandF0003.q.set(this.q);
         if (this.operandF0003.α == null) {
            this.operandF0003.α = new Complex();
         }

         this.operandF0003.α.set(this.α);
         if (this.operandF0003.β == null) {
            this.operandF0003.β = new Complex();
         }

         this.operandF0003.β.set(this.β);
         if (this.operandF0003.z == null) {
            this.operandF0003.z = new ComplexRationalFunction();
         }

         this.operandF0003.z.set(this.z);
         if (this.operandF0003.N == null) {
            this.operandF0003.N = new Integer();
         }

         this.operandF0003.N.set(this.N);
         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.k.close();
      this.prodℚℂ0001.close();
      this.prodℚℂ0002.close();
      this.upperLimitℤ0002.close();
      this.upperLimitℤ0003.close();
      this.valueℚℂ0002.close();
      this.valueℚℂ0003.close();
      this.vℚℂ0001.close();
      this.vℚℂ0002.close();
      this.vℚℂ0003.close();
      this.vℤ0001.close();
      this.operandF0002.close();
      this.operandF0003.close();
   }

   @Override
   public String getName() {
      return "operandF0001";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public String toString() {
      return "operandF0001:n➔((z^n)*Πk➔α[k]⋰n{k=1…p})/(n!*Πk➔β[k]⋰n{k=1…q})";
   }

   @Override
   public String typeset() {
      return "\\frac{\\left({z}^{n} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}";
   }
}
