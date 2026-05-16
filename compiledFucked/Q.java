import arb.ComplexPolynomial;
import arb.Field;
import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Typesettable;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import java.util.ArrayList;

public class Q implements ComplexPolynomialNullaryFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context = new Context();
   public Expression expression;
   public final Fraction cq0000;
   public final Integer cℤ0000;
   public final Integer cℤ0001;
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
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (order <= 1) {
         return this.cq0000.neg(result);
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

   public Q() {
      Fraction var10001 = new Fraction();
      var10001.set("1⁄2");
      this.cq0000 = var10001;
      this.cℤ0000 = new Integer("1");
      this.cℤ0001 = new Integer("2");
   }

   @Override
   public void close() {
      this.cq0000.close();
      this.cℤ0000.close();
      this.cℤ0001.close();
   }

   @Override
   public String getName() {
      return "Q";
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
      return "Q:-1⁄2";
   }

   @Override
   public String typeset() {
      return "-(\\frac{1}{2})";
   }
}
