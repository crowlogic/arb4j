package arb.crap;

import java.util.*;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;

public class D implements ComplexPolynomialNullaryFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context = new Context();
   public Expression expression;
   private boolean evaluating;
   public final Integer cℤ0000 = new Integer("2");
   public final Integer cℤ0001 = new Integer("4");
   public R R;
   public Q Q;
   public P P;
   public ComplexPolynomial p;
   public ComplexPolynomial q;
   public ComplexPolynomial r;
   public Real μ;
   public ArrayList<Function<Object, ComplexPolynomial>> derivativeCache;
   public ComplexPolynomial vXℂ0001 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0002 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0003 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0004 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0005 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0006 = new ComplexPolynomial();

   @Override
   public Class<Object> domainType() {
      return Object.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Object in, int order, int bits, ComplexPolynomial result) {
      if (this.evaluating) {
         throw new CompilerException("re-entrant evaluate() call on same instance");
      } else {
         this.evaluating = true;

         Object var10000;
         try {
            var10000 = this.evaluate_body(in, order, bits, result);
         } finally {
            this.evaluating = false;
         }

         return (ComplexPolynomial)var10000;
      }
   }

   private Object evaluate_body(Object in, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         return ((ComplexPolynomial)this.Q.evaluate(null, order, bits, this.vXℂ0001))
            .pow(this.cℤ0000, bits, this.vXℂ0002)
            .sub(
               this.cℤ0001
                  .mul((ComplexPolynomial)this.P.evaluate(null, order, bits, this.vXℂ0003), bits, this.vXℂ0004)
                  .mul((ComplexPolynomial)this.R.evaluate(null, order, bits, this.vXℂ0005), bits, this.vXℂ0006),
               bits,
               result
            );
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
            var10000.evaluate(in, 1, bits, var8);
            if (var5 >= 2) {
               ((Field)var8).div((int)var6, bits, (Field)var8);
            }
         }

         return result;
      }
   }

   public void invalidateCache(Set<Function<?, ?>> var1) {
      if (var1.add(this)) {
         if (this.P != null) {
            this.P.invalidateCache(var1);
         }

         if (this.Q != null) {
            this.Q.invalidateCache(var1);
         }

         if (this.R != null) {
            this.R.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public Function integral() {
      return ((ComplexPolynomial)this.evaluate()).integral();
   }

   @Override
   public Function derivative() {
      return ((ComplexPolynomial)this.evaluate()).derivative();
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         this.derivativeCache = new ArrayList<>();
         if (this.P == null) {
            Function var10001 = this.context.lookupFunctionInstance("P");
            if (var10001 != null) {
               this.P = (P)var10001;
            } else {
               this.P = new P();
               this.P.context = this.context;
            }
         }

         if (this.Q == null) {
            Function var1 = this.context.lookupFunctionInstance("Q");
            if (var1 != null) {
               this.Q = (Q)var1;
            } else {
               this.Q = new Q();
               this.Q.context = this.context;
            }
         }

         if (this.R == null) {
            Function var2 = this.context.lookupFunctionInstance("R");
            if (var2 != null) {
               this.R = (R)var2;
            } else {
               this.R = new R();
               this.R.context = this.context;
            }
         }

         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      if (this.cℤ0000 != this) {
         this.cℤ0000.close();
      }

      if (this.cℤ0001 != this) {
         this.cℤ0001.close();
      }

      if (this.vXℂ0001 != this) {
         this.vXℂ0001.close();
      }

      if (this.vXℂ0002 != this) {
         this.vXℂ0002.close();
      }

      if (this.vXℂ0003 != this) {
         this.vXℂ0003.close();
      }

      if (this.vXℂ0004 != this) {
         this.vXℂ0004.close();
      }

      if (this.vXℂ0005 != this) {
         this.vXℂ0005.close();
      }

      if (this.vXℂ0006 != this) {
         this.vXℂ0006.close();
      }

      if (this.P != null) {
         AutoCloseable var10008 = (AutoCloseable)this.P;
         this.P = null;
         var10008.close();
      }

      if (this.Q != null) {
         AutoCloseable var1 = (AutoCloseable)this.Q;
         this.Q = null;
         var1.close();
      }

      if (this.R != null) {
         AutoCloseable var2 = (AutoCloseable)this.R;
         this.R = null;
         var2.close();
      }
   }

   @Override
   public String getName() {
      return "D";
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
      return "D:(Q()^2)-((4*P())*R())";
   }

   @Override
   public String typeset() {
      return "\\left({\\Q\\left(\\right)}^{2}-\\left(\\left(4 \\cdot \\P\\left(\\right)\\right) \\cdot \\R\\left(\\right)\\right)\\right)";
   }
}
