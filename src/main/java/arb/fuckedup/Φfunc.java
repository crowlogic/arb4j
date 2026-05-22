package arb.fuckedup;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Field;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class Φfunc implements ComplexFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private Complex lastV;
   private Complex cachedResult;
   public Φden Φden;
   public Φnum Φnum;
   public Integer M;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Complex, Complex>> derivativeCache;
   public ComplexPolynomial vXℂ0032 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0033 = new ComplexPolynomial();
   public Complex vℂ0004 = new Complex();
   public Complex vℂ0005 = new Complex();

   @Override
   public Class<Complex> domainType() {
      return Complex.class;
   }

   @Override
   public Class<Complex> coDomainType() {
      return Complex.class;
   }

   @Override
   public Complex evaluate(Complex z, int order, int bits, Complex result) {
      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         if (this.lastV != null && this.lastV.equals(z) && this.cachedResult != null) {
            return result.set(this.cachedResult);
         } else {
            if (this.lastV == null) {
               this.lastV = new Complex();
            }

            this.lastV.set(z);
            ((Complex)((ComplexPolynomial)this.Φnum.evaluate(this.M, order, bits, this.vXℂ0032)).evaluate(z, order, bits, this.vℂ0004))
               .div((Complex)((ComplexPolynomial)this.Φden.evaluate(this.M, order, bits, this.vXℂ0033)).evaluate(z, order, bits, this.vℂ0005), bits, result);
            if (this.cachedResult == null) {
               this.cachedResult = new Complex();
            }

            this.cachedResult.set(result);
            return result;
         }
      } else {
         if (this.derivativeCache == null) {
            this.derivativeCache = new ArrayList<>();
         }

         if (this.derivativeCache.size() == 0) {
            this.derivativeCache.add(this);
         }

         long var6 = 1L;

         for (int var5 = 0; var5 < order; var5++) {
            if (var5 > 0) {
               var6 *= var5;
            }

            while (this.derivativeCache.size() <= var5) {
               this.derivativeCache.add(this.derivativeCache.get(this.derivativeCache.size() - 1).derivative());
            }

            Function var10000 = this.derivativeCache.get(var5);
            Object var8 = ((Field)result).get(var5);
            var10000.evaluate(z, 1, bits, var8);
            if (var5 >= 2) {
               ((Field)var8).div((int)var6, bits, (Field)var8);
            }
         }

         return result;
      }
   }

   public void invalidateCache(Set<Function<?, ?>> var1) {
      if (var1.add(this)) {
         this.lastV = null;
         if (this.Φnum != null) {
            this.Φnum.invalidateCache(var1);
         }

         if (this.Φden != null) {
            this.Φden.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public ComplexFunction derivative() {
      return Function.express(Complex.class, Complex.class, ComplexFunction.class, "diffΦfunc", "diff((Φnum(M)(z))/(Φden(M)(z)),z)", this.context);
   }

   @Override
   public ComplexFunction integral() {
      return Function.express(Complex.class, Complex.class, ComplexFunction.class, "intΦfunc", "int((Φnum(M)(z))/(Φden(M)(z)),z)", this.context);
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         this.derivativeCache = new ArrayList<>();
         if (this.Φnum == null) {
            Function var10001 = this.context.lookupFunctionInstance("Φnum");
            if (var10001 != null) {
               this.Φnum = (Φnum)var10001;
            } else {
               this.Φnum = new Φnum();
               this.Φnum.context = this.context;
            }
         }

         if (this.Φden == null) {
            Function var1 = this.context.lookupFunctionInstance("Φden");
            if (var1 != null) {
               this.Φden = (Φden)var1;
            } else {
               this.Φden = new Φden();
               this.Φden.context = this.context;
            }
         }

         if (this.Φden.p0 == null) {
            this.Φden.p0 = this.p0;
         } else {
            this.Φden.p0.set(this.p0);
         }

         if (this.Φden.p1 == null) {
            this.Φden.p1 = this.p1;
         } else {
            this.Φden.p1.set(this.p1);
         }

         if (this.Φden.v == null) {
            this.Φden.v = this.v;
         } else {
            this.Φden.v.set(this.v);
         }

         if (this.Φden.μ == null) {
            this.Φden.μ = this.μ;
         } else {
            this.Φden.μ.set(this.μ);
         }

         if (this.Φnum.p0 == null) {
            this.Φnum.p0 = this.p0;
         } else {
            this.Φnum.p0.set(this.p0);
         }

         if (this.Φnum.p1 == null) {
            this.Φnum.p1 = this.p1;
         } else {
            this.Φnum.p1.set(this.p1);
         }

         if (this.Φnum.v == null) {
            this.Φnum.v = this.v;
         } else {
            this.Φnum.v.set(this.v);
         }

         if (this.Φnum.μ == null) {
            this.Φnum.μ = this.μ;
         } else {
            this.Φnum.μ.set(this.μ);
         }

         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.vXℂ0032.close();
      this.vXℂ0033.close();
      this.vℂ0004.close();
      this.vℂ0005.close();
      this.Φnum.close();
      this.Φden.close();
   }

   @Override
   public String getName() {
      return "Φfunc";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public Expression getExpression() {
      return this.expression;
   }

   @Override
   public String toString() {
      return String.format("Φfunc:z➔(Φnum(%1$s)(z))/(Φden(%1$s)(z))", String.valueOf(this.M));
   }

   @Override
   public String typeset() {
      return "\\frac{\\Φnum\\left(M\\right)\\left(z\\right)}{\\Φden\\left(M\\right)\\left(z\\right)}";
   }
}
