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
import arb.functions.integer.Sequence;
import arb.functions.polynomials.orthogonal.complex.OrthogonalPolynomialMomentFunctionalSequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class ΦdenoperandF0001 implements Sequence<ComplexPolynomial>, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   public OrthogonalPolynomialMomentFunctionalSequence Q;
   public Integer M;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public ComplexPolynomial vXℂ0026 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0027 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0028 = new ComplexPolynomial();
   public Integer vℤ0015 = new Integer();

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Integer j, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         ComplexPolynomial var9 = ((ComplexPolynomial)this.Q.evaluate(this.M, order, bits, this.vXℂ0026))
            .get(this.M.sub(j, bits, this.vℤ0015))
            .mul(this.vXℂ0027.identity().pow(j, bits, this.vXℂ0028), bits, result);
         var9.setIndependentVariableName("z");
         return var9;
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
            var10000.evaluate(j, 1, bits, var8);
            if (var5 >= 2) {
               ((Field)var8).div((int)var6, bits, (Field)var8);
            }
         }

         return result;
      }
   }

   public void invalidateCache(Set<Function<?, ?>> var1) {
      if (var1.add(this)) {
         if (this.Q != null) {
            this.Q.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         this.derivativeCache = new ArrayList<>();
         if (this.Q == null) {
            Function var10001 = this.context.lookupFunctionInstance("Q");
            if (var10001 != null) {
               this.Q = (OrthogonalPolynomialMomentFunctionalSequence)var10001;
            } 
         }

         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.vXℂ0026.close();
      this.vXℂ0027.close();
      this.vXℂ0028.close();
      this.vℤ0015.close();
      this.Q.close();
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
   public Expression getExpression() {
      return this.expression;
   }

   @Override
   public String toString() {
      return String.format("j➔(Q(%1$s)[%1$s-j])*(z^j)", String.valueOf(this.M));
   }

   @Override
   public String typeset() {
      return "\\left(\\Q\\left(M\\right)_{\\left(M-j\\right)} \\cdot {z}^{j}\\right)";
   }
}
