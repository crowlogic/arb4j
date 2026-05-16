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
import arb.functions.integer.ComplexPolynomialSequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.TreeMap;

public class S implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private final TreeMap<Integer, ComplexPolynomial> cache = new TreeMap<>();
   public final Integer cℤ0000;
   public final Integer cℤ0001;
   public α α;
   public S S;
   public T T;
   public m m;
   public ComplexPolynomial p;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public ComplexPolynomial q;
   public ComplexPolynomial r;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public Integer cseℤ0005;
   public Integer cseℤ0006;
   public Integer cseℤ0007;
   public Integer cseℤ0008;
   public ComplexPolynomial vXℂ0013;
   public ComplexPolynomial vXℂ0014;
   public ComplexPolynomial vXℂ0015;
   public ComplexPolynomial vXℂ0016;
   public Integer vℤ0007;
   public Integer vℤ0008;
   public Integer vℤ0009;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Integer n, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         ComplexPolynomial var11 = (ComplexPolynomial)Function.peek(this.cache, n);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            TreeMap var9 = this.cache;
            Integer var10 = n;

            (switch (n.getSignedValue()) {
                  case 0 -> (ComplexPolynomial)this.m.evaluate(this.cℤ0000, order, bits, result);
                  case 1 -> (ComplexPolynomial)this.m.evaluate(this.cℤ0001, order, bits, result);
                  default -> ((ComplexPolynomial)this.T.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0007), order, bits, this.vXℂ0013))
                     .sub(
                        ((ComplexPolynomial)this.α.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0008), order, bits, this.vXℂ0014))
                           .mul((ComplexPolynomial)this.S.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0009), order, bits, this.vXℂ0015), bits, this.vXℂ0016),
                        bits,
                        result
                     );
               })
               .setIndependentVariableName("u");
            ComplexPolynomial var7 = new ComplexPolynomial();
            var7.set(result);
            Function.poke(var9, var10, var7);
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
            var10000.evaluate(n, 1, bits, var8);
            if (var5 >= 2) {
               ((Field)var8).div((int)var6, bits, (Field)var8);
            }
         }

         return result;
      }
   }

   public void invalidateCache(Set<Function<?, ?>> var1) {
      if (var1.add(this)) {
         this.cache.clear();
         if (this.α != null) {
            this.α.invalidateCache(var1);
         }

         if (this.S != null) {
            this.S.invalidateCache(var1);
         }

         if (this.T != null) {
            this.T.invalidateCache(var1);
         }

         if (this.m != null) {
            this.m.invalidateCache(var1);
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
         if (this.α == null) {
            this.α = new α();
            this.α.context = this.context;
         }

         if (this.T == null) {
            this.T = new T();
            this.T.context = this.context;
         }

         if (this.m == null) {
            this.m = new m();
            this.m.context = this.context;
         }

         this.α.T = this.T;
         this.α.S = this;
         this.T.m = this.m;
         if (this.α.p == null) {
            this.α.p = this.p;
         } else {
            this.α.p.set(this.p);
         }

         if (this.α.p0 == null) {
            this.α.p0 = this.p0;
         } else {
            this.α.p0.set(this.p0);
         }

         if (this.α.q == null) {
            this.α.q = this.q;
         } else {
            this.α.q.set(this.q);
         }

         if (this.α.p1 == null) {
            this.α.p1 = this.p1;
         } else {
            this.α.p1.set(this.p1);
         }

         if (this.α.r == null) {
            this.α.r = this.r;
         } else {
            this.α.r.set(this.r);
         }

         if (this.α.μ == null) {
            this.α.μ = this.μ;
         } else {
            this.α.μ.set(this.μ);
         }

         this.α.S = this.S;
         if (this.T.p == null) {
            this.T.p = this.p;
         } else {
            this.T.p.set(this.p);
         }

         if (this.T.p0 == null) {
            this.T.p0 = this.p0;
         } else {
            this.T.p0.set(this.p0);
         }

         if (this.T.q == null) {
            this.T.q = this.q;
         } else {
            this.T.q.set(this.q);
         }

         if (this.T.p1 == null) {
            this.T.p1 = this.p1;
         } else {
            this.T.p1.set(this.p1);
         }

         if (this.T.r == null) {
            this.T.r = this.r;
         } else {
            this.T.r.set(this.r);
         }

         if (this.T.μ == null) {
            this.T.μ = this.μ;
         } else {
            this.T.μ.set(this.μ);
         }

         this.α.T = this.T;
         if (this.m.p == null) {
            this.m.p = this.p;
         } else {
            this.m.p.set(this.p);
         }

         if (this.m.q == null) {
            this.m.q = this.q;
         } else {
            this.m.q.set(this.q);
         }

         if (this.m.r == null) {
            this.m.r = this.r;
         } else {
            this.m.r.set(this.r);
         }

         if (this.m.μ == null) {
            this.m.μ = this.μ;
         } else {
            this.m.μ.set(this.μ);
         }

         this.T.m = this.m;
         if (this.S == null) {
            this.S = new S();
         }

         if (this.S.p == null) {
            this.S.p = this.p;
         } else {
            this.S.p.set(this.p);
         }

         if (this.S.p0 == null) {
            this.S.p0 = this.p0;
         } else {
            this.S.p0.set(this.p0);
         }

         if (this.S.q == null) {
            this.S.q = this.q;
         } else {
            this.S.q.set(this.q);
         }

         if (this.S.p1 == null) {
            this.S.p1 = this.p1;
         } else {
            this.S.p1.set(this.p1);
         }

         if (this.S.r == null) {
            this.S.r = this.r;
         } else {
            this.S.r.set(this.r);
         }

         if (this.S.μ == null) {
            this.S.μ = this.μ;
         } else {
            this.S.μ.set(this.μ);
         }

         this.isInitialized = true;
      }
   }

   public S() {
      this.context = new Context();
      this.cℤ0000 = new Integer("0");
      this.cℤ0001 = new Integer("1");
      this.cseℤ0005 = new Integer();
      this.cseℤ0006 = new Integer();
      this.cseℤ0007 = new Integer();
      this.cseℤ0008 = new Integer();
      this.vXℂ0013 = new ComplexPolynomial();
      this.vXℂ0014 = new ComplexPolynomial();
      this.vXℂ0015 = new ComplexPolynomial();
      this.vXℂ0016 = new ComplexPolynomial();
      this.vℤ0007 = new Integer();
      this.vℤ0008 = new Integer();
      this.vℤ0009 = new Integer();
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.cℤ0001.close();
      this.cseℤ0005.close();
      this.cseℤ0006.close();
      this.cseℤ0007.close();
      this.cseℤ0008.close();
      this.vXℂ0013.close();
      this.vXℂ0014.close();
      this.vXℂ0015.close();
      this.vXℂ0016.close();
      this.vℤ0007.close();
      this.vℤ0008.close();
      this.vℤ0009.close();
      this.α.close();
      this.S.close();
      this.T.close();
      this.m.close();
   }

   @Override
   public String getName() {
      return "S";
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
      return "S:n➔when(n=0,m(0),n=1,m(1),else,T(n-1)-(α(n-1)*S(n-1)))";
   }

   @Override
   public String typeset() {
      return "\\\\left\\\\{\\\\begin{array}{ll}\\n\\m\\left(0\\right) & \\\\text{if } \\left(n = 0\\right)\\\\\\\\\\n\\m\\left(1\\right) & \\\\text{if } \\left(n = 1\\right)\\\\\\\\\\n\\left(\\T\\left(\\left(n-1\\right)\\right)-\\left(\\α\\left(\\left(n-1\\right)\\right) \\cdot \\S\\left(\\left(n-1\\right)\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
   }
}
