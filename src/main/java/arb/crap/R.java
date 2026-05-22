package arb.crap;

import arb.ComplexPolynomial;
import arb.Field;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Typesettable;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import java.util.ArrayList;

public class R implements ComplexPolynomialNullaryFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context = new Context();
   public Expression expression;
   private boolean evaluating;
   public final Integer cℤ0000 = new Integer("1");
   public final Integer cℤ0001 = new Integer("-1");
   public ArrayList<Function<Object, ComplexPolynomial>> derivativeCache;

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

   private Object evaluate_body(Object in, int order, int bits, Object result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (order <= 1) {
         return result.set(this.cℤ0001);
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
   }

   @Override
   public String getName() {
      return "R";
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
      return "R:-1";
   }

   @Override
   public String typeset() {
      return "-1";
   }
}
