package arb.fuckedup;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Field;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.integer.ComplexPolynomialSequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class σfunc implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private boolean evaluating;
   public final Integer cℤ0000 = new Integer("0");
   public final Integer cℤ0001 = new Integer("1");
   public final Integer cℤ0002 = new Integer("2");
   public α α;
   public σ σ;
   public m m;
   public β β;
   public Integer j;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public Integer cseℤ0006 = new Integer();
   public Integer cseℤ0007 = new Integer();
   public Integer cseℤ0008 = new Integer();
   public ComplexPolynomialSequence vSXℂ0002;
   public ComplexPolynomialSequence vSXℂ0003;
   public ComplexPolynomialSequence vSXℂ0004;
   public ComplexPolynomialSequence vSXℂ0005;
   public ComplexPolynomialSequence vSXℂ0006;
   public ComplexPolynomial vXℂ0003 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0004 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0005 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0006 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0007 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0008 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0009 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0010 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0011 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0012 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0013 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0014 = new ComplexPolynomial();
   public Integer vℤ0003 = new Integer();
   public Integer vℤ0004 = new Integer();
   public Integer vℤ0005 = new Integer();
   public Integer vℤ0006 = new Integer();
   public Integer vℤ0007 = new Integer();
   public Integer vℤ0008 = new Integer();
   public Integer vℤ0009 = new Integer();

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Integer k, int order, int bits, ComplexPolynomial result) {
      if (this.evaluating) {
         throw new CompilerException("re-entrant evaluate() call on same instance");
      } else {
         this.evaluating = true;

         Object var10000;
         try {
            var10000 = this.evaluate_body(k, order, bits, result);
         } finally {
            this.evaluating = false;
         }

         return (ComplexPolynomial)var10000;
      }
   }

   private ComplexPolynomial evaluate_body(Integer k, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         return switch (this.j.getSignedValue()) {
            case 0 -> (ComplexPolynomial)this.m.evaluate(k, order, bits, result);
            case 1 -> ((ComplexPolynomial)((ComplexPolynomialSequence)this.σ.evaluate(this.cℤ0000, order, bits, this.vSXℂ0002))
                  .evaluate(k.add(this.cℤ0001, bits, this.vℤ0003), order, bits, this.vXℂ0003))
               .sub(
                  ((ComplexPolynomial)this.α.evaluate(this.cℤ0000, order, bits, this.vXℂ0004))
                     .mul(
                        (ComplexPolynomial)((ComplexPolynomialSequence)this.σ.evaluate(this.cℤ0000, order, bits, this.vSXℂ0003))
                           .evaluate(k, order, bits, this.vXℂ0005),
                        bits,
                        this.vXℂ0006
                     ),
                  bits,
                  result
               );
            default -> ((ComplexPolynomial)((ComplexPolynomialSequence)this.σ.evaluate(this.j.sub(this.cℤ0001, bits, this.vℤ0004), order, bits, this.vSXℂ0004))
                  .evaluate(k.add(this.cℤ0001, bits, this.vℤ0005), order, bits, this.vXℂ0007))
               .sub(
                  ((ComplexPolynomial)this.α.evaluate(this.j.sub(this.cℤ0001, bits, this.vℤ0006), order, bits, this.vXℂ0008))
                     .mul(
                        (ComplexPolynomial)((ComplexPolynomialSequence)this.σ.evaluate(this.j.sub(this.cℤ0001, bits, this.vℤ0007), order, bits, this.vSXℂ0005))
                           .evaluate(k, order, bits, this.vXℂ0009),
                        bits,
                        this.vXℂ0010
                     ),
                  bits,
                  this.vXℂ0011
               )
               .sub(
                  ((ComplexPolynomial)this.β.evaluate(this.j.sub(this.cℤ0001, bits, this.vℤ0008), order, bits, this.vXℂ0012))
                     .mul(
                        (ComplexPolynomial)((ComplexPolynomialSequence)this.σ.evaluate(this.j.sub(this.cℤ0002, bits, this.vℤ0009), order, bits, this.vSXℂ0006))
                           .evaluate(k, order, bits, this.vXℂ0013),
                        bits,
                        this.vXℂ0014
                     ),
                  bits,
                  result
               );
         };
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
            var10000.evaluate(k, 1, bits, var8);
            if (var5 >= 2) {
               ((Field)var8).div((int)var6, bits, (Field)var8);
            }
         }

         return result;
      }
   }

   public void invalidateCache(Set<Function<?, ?>> var1) {
      if (var1.add(this)) {
         if (this.α != null) {
            this.α.invalidateCache(var1);
         }

         if (this.β != null) {
            this.β.invalidateCache(var1);
         }

         if (this.σ != null) {
            this.σ.invalidateCache(var1);
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
            Function var10001 = this.context.lookupFunctionInstance("α");
            if (var10001 != null) {
               this.α = (α)var10001;
            } else {
               this.α = new α();
               this.α.context = this.context;
            }
         }

         if (this.β == null) {
            Function var1 = this.context.lookupFunctionInstance("β");
            if (var1 != null) {
               this.β = (β)var1;
            } else {
               this.β = new β();
               this.β.context = this.context;
            }
         }

         if (this.σ == null) {
            Function var2 = this.context.lookupFunctionInstance("σ");
            if (var2 != null) {
               this.σ = (σ)var2;
            } else {
               this.σ = new σ();
               this.σ.context = this.context;
            }
         }

         if (this.m == null) {
            Function var3 = this.context.lookupFunctionInstance("m");
            if (var3 != null) {
               this.m = (m)var3;
            } else {
               this.m = new m();
               this.m.context = this.context;
            }
         }

         if (this.α.p0 == null) {
            this.α.p0 = this.p0;
         } else {
            this.α.p0.set(this.p0);
         }

         if (this.α.p1 == null) {
            this.α.p1 = this.p1;
         } else {
            this.α.p1.set(this.p1);
         }

         if (this.α.v == null) {
            this.α.v = this.v;
         } else {
            this.α.v.set(this.v);
         }

         if (this.α.μ == null) {
            this.α.μ = this.μ;
         } else {
            this.α.μ.set(this.μ);
         }

         this.σ.α = this.α;
         if (this.σ.p0 == null) {
            this.σ.p0 = this.p0;
         } else {
            this.σ.p0.set(this.p0);
         }

         if (this.σ.p1 == null) {
            this.σ.p1 = this.p1;
         } else {
            this.σ.p1.set(this.p1);
         }

         if (this.σ.v == null) {
            this.σ.v = this.v;
         } else {
            this.σ.v.set(this.v);
         }

         if (this.σ.μ == null) {
            this.σ.μ = this.μ;
         } else {
            this.σ.μ.set(this.μ);
         }

         this.α.σ = this.σ;
         if (this.m.v == null) {
            this.m.v = this.v;
         } else {
            this.m.v.set(this.v);
         }

         if (this.m.μ == null) {
            this.m.μ = this.μ;
         } else {
            this.m.μ.set(this.μ);
         }

         this.σ.m = this.m;
         if (this.β.p0 == null) {
            this.β.p0 = this.p0;
         } else {
            this.β.p0.set(this.p0);
         }

         if (this.β.p1 == null) {
            this.β.p1 = this.p1;
         } else {
            this.β.p1.set(this.p1);
         }

         if (this.β.v == null) {
            this.β.v = this.v;
         } else {
            this.β.v.set(this.v);
         }

         if (this.β.μ == null) {
            this.β.μ = this.μ;
         } else {
            this.β.μ.set(this.μ);
         }

         this.σ.β = this.β;
         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.cℤ0001.close();
      this.cℤ0002.close();
      this.cseℤ0006.close();
      this.cseℤ0007.close();
      this.cseℤ0008.close();
      this.vSXℂ0002.close();
      this.vSXℂ0003.close();
      this.vSXℂ0004.close();
      this.vSXℂ0005.close();
      this.vSXℂ0006.close();
      this.vXℂ0003.close();
      this.vXℂ0004.close();
      this.vXℂ0005.close();
      this.vXℂ0006.close();
      this.vXℂ0007.close();
      this.vXℂ0008.close();
      this.vXℂ0009.close();
      this.vXℂ0010.close();
      this.vXℂ0011.close();
      this.vXℂ0012.close();
      this.vXℂ0013.close();
      this.vXℂ0014.close();
      this.vℤ0003.close();
      this.vℤ0004.close();
      this.vℤ0005.close();
      this.vℤ0006.close();
      this.vℤ0007.close();
      this.vℤ0008.close();
      this.vℤ0009.close();
      if (this.α != null) {
         this.α.close();
      }

      if (this.β != null) {
         this.β.close();
      }

      if (this.σ != null) {
         this.σ.close();
      }

      if (this.m != null) {
         this.m.close();
      }
   }

   @Override
   public String getName() {
      return "σfunc";
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
      return String.format(
         "σfunc:k➔when(%1$s=0,m(k),%1$s=1,(σ(0)(k+1))-(α(0)*(σ(0)(k))),else,((σ(%1$s-1)(k+1))-(α(%1$s-1)*(σ(%1$s-1)(k))))-(β(%1$s-1)*(σ(%1$s-2)(k))))",
         String.valueOf(this.j)
      );
   }

   @Override
   public String typeset() {
      return "\\\\left\\\\{\\\\begin{array}{ll}\\n\\m\\left(k\\right) & \\\\text{if } \\left(j = 0\\right)\\\\\\\\\\n\\left(\\σ\\left(0\\right)\\left(\\left(k + 1\\right)\\right)-\\left(\\α\\left(0\\right) \\cdot \\σ\\left(0\\right)\\left(k\\right)\\right)\\right) & \\\\text{if } \\left(j = 1\\right)\\\\\\\\\\n\\left(\\left(\\σ\\left(\\left(j-1\\right)\\right)\\left(\\left(k + 1\\right)\\right)-\\left(\\α\\left(\\left(j-1\\right)\\right) \\cdot \\σ\\left(\\left(j-1\\right)\\right)\\left(k\\right)\\right)\\right)-\\left(\\β\\left(\\left(j-1\\right)\\right) \\cdot \\σ\\left(\\left(j-2\\right)\\right)\\left(k\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
   }
}
