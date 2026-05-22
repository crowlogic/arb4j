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
import arb.functions.polynomials.PolynomialSequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.TreeMap;

public class P implements PolynomialSequence<Integer, ComplexPolynomial>, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private TreeMap<Integer, ComplexPolynomial> cache = new TreeMap<>();
   public final Integer cℤ0000;
   public final Integer cℤ0001;
   public final Integer cℤ0002;
   public P P;
   public β C;
   public Bops B;
   public A A;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public Integer cseℤ0013;
   public Integer cseℤ0014;
   public Integer cseℤ0015;
   public Integer cseℤ0016;
   public Integer cseℤ0017;
   public ComplexPolynomial vXℂ0035;
   public ComplexPolynomial vXℂ0036;
   public ComplexPolynomial vXℂ0037;
   public ComplexPolynomial vXℂ0038;
   public ComplexPolynomial vXℂ0039;
   public ComplexPolynomial vXℂ0040;
   public ComplexPolynomial vXℂ0041;
   public ComplexPolynomial vXℂ0042;
   public ComplexPolynomial vXℂ0043;
   public ComplexPolynomial vXℂ0044;
   public Integer vℤ0017;
   public Integer vℤ0018;
   public Integer vℤ0019;
   public Integer vℤ0020;
   public Integer vℤ0021;

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
                  case 0 -> result.set(this.p0);
                  case 1 -> result.set(this.p1);
                  default -> ((ComplexPolynomial)this.A.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0017), order, bits, this.vXℂ0035))
                     .mul(this.vXℂ0036.identity(), bits, this.vXℂ0037)
                     .add((ComplexPolynomial)this.B.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0018), order, bits, this.vXℂ0038), bits, this.vXℂ0039)
                     .mul((ComplexPolynomial)this.P.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0019), order, bits, this.vXℂ0040), bits, this.vXℂ0041)
                     .sub(
                        ((ComplexPolynomial)this.C.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0020), order, bits, this.vXℂ0042))
                           .mul((ComplexPolynomial)this.P.evaluate(n.sub(this.cℤ0002, bits, this.vℤ0021), order, bits, this.vXℂ0043), bits, this.vXℂ0044),
                        bits,
                        result
                     );
               })
               .setIndependentVariableName("x");
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
         if (this.P != null) {
            this.P.invalidateCache(var1);
         }

         if (this.A != null) {
            this.A.invalidateCache(var1);
         }

         if (this.B != null) {
            this.B.invalidateCache(var1);
         }

         if (this.C != null) {
            this.C.invalidateCache(var1);
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
         if (this.p0 == null) {
            throw new AssertionError("p0 is null");
         } else if (this.p1 == null) {
            throw new AssertionError("p1 is null");
         } else {
            if (this.P == null) {
               this.P = new P();
               this.P.context = this.context;
               this.P.cache = this.cache;
            }

            if (this.P.p0 == null) {
               this.P.p0 = this.p0;
            } else {
               this.P.p0.set(this.p0);
            }

            if (this.P.p1 == null) {
               this.P.p1 = this.p1;
            } else {
               this.P.p1.set(this.p1);
            }

            if (this.P.v == null) {
               this.P.v = this.v;
            } else {
               this.P.v.set(this.v);
            }

            if (this.P.μ == null) {
               this.P.μ = this.μ;
            } else {
               this.P.μ.set(this.μ);
            }

            if (this.A == null) {
               Function var10002 = this.context.lookupFunctionInstance("A");
               if (var10002 != null) {
                  this.A = (A)var10002;
               } else {
                  this.A = new A();
                  this.A.context = this.context;
               }
            }

            if (this.B == null) {
               Function var1 = this.context.lookupFunctionInstance("B");
               if (var1 != null) {
                  this.B = (Bops)var1;
               } else {
                  this.B = new Bops();
                  this.B.context = this.context;
               }
            }

            if (this.C == null) {
               Function var2 = this.context.lookupFunctionInstance("C");
               if (var2 != null) {
                  this.C = (β)var2;
               } else {
                  this.C = new β();
                  this.C.context = this.context;
               }
            }

            if (this.A.p0 == null) {
               this.A.p0 = this.p0;
            } else {
               this.A.p0.set(this.p0);
            }

            if (this.A.p1 == null) {
               this.A.p1 = this.p1;
            } else {
               this.A.p1.set(this.p1);
            }

            if (this.A.v == null) {
               this.A.v = this.v;
            } else {
               this.A.v.set(this.v);
            }

            if (this.A.μ == null) {
               this.A.μ = this.μ;
            } else {
               this.A.μ.set(this.μ);
            }

            this.isInitialized = true;
         }
      }
   }

   public P() {
      this.context = new Context();
      this.cℤ0000 = new Integer("0");
      this.cℤ0001 = new Integer("1");
      this.cℤ0002 = new Integer("2");
      this.cseℤ0013 = new Integer();
      this.cseℤ0014 = new Integer();
      this.cseℤ0015 = new Integer();
      this.cseℤ0016 = new Integer();
      this.cseℤ0017 = new Integer();
      this.vXℂ0035 = new ComplexPolynomial();
      this.vXℂ0036 = new ComplexPolynomial();
      this.vXℂ0037 = new ComplexPolynomial();
      this.vXℂ0038 = new ComplexPolynomial();
      this.vXℂ0039 = new ComplexPolynomial();
      this.vXℂ0040 = new ComplexPolynomial();
      this.vXℂ0041 = new ComplexPolynomial();
      this.vXℂ0042 = new ComplexPolynomial();
      this.vXℂ0043 = new ComplexPolynomial();
      this.vXℂ0044 = new ComplexPolynomial();
      this.vℤ0017 = new Integer();
      this.vℤ0018 = new Integer();
      this.vℤ0019 = new Integer();
      this.vℤ0020 = new Integer();
      this.vℤ0021 = new Integer();
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.cℤ0001.close();
      this.cℤ0002.close();
      this.cseℤ0013.close();
      this.cseℤ0014.close();
      this.cseℤ0015.close();
      this.cseℤ0016.close();
      this.cseℤ0017.close();
      this.vXℂ0035.close();
      this.vXℂ0036.close();
      this.vXℂ0037.close();
      this.vXℂ0038.close();
      this.vXℂ0039.close();
      this.vXℂ0040.close();
      this.vXℂ0041.close();
      this.vXℂ0042.close();
      this.vXℂ0043.close();
      this.vXℂ0044.close();
      this.vℤ0017.close();
      this.vℤ0018.close();
      this.vℤ0019.close();
      this.vℤ0020.close();
      this.vℤ0021.close();
      this.P.close();
      this.A.close();
      this.B.close();
      this.C.close();
   }

   @Override
   public String getName() {
      return "P";
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
      return "P:n➔when(n=0,p0,n=1,p1,else,(((A(n-1)*x)+B(n-1))*P(n-1))-(C(n-1)*P(n-2)))";
   }

   @Override
   public String typeset() {
      return "\\\\left\\\\{\\\\begin{array}{ll}\\np0 & \\\\text{if } \\left(n = 0\\right)\\\\\\\\\\np1 & \\\\text{if } \\left(n = 1\\right)\\\\\\\\\\n\\left(\\left(\\left(\\left(\\A\\left(\\left(n-1\\right)\\right) \\cdot x\\right) + \\B\\left(\\left(n-1\\right)\\right)\\right) \\cdot \\P\\left(\\left(n-1\\right)\\right)\\right)-\\left(\\C\\left(\\left(n-1\\right)\\right) \\cdot \\P\\left(\\left(n-2\\right)\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
   }
}
