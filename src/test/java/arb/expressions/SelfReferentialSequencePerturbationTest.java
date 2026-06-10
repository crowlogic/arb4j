package arb.expressions;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.integer.ComplexPolynomialSequence;
import junit.framework.TestCase;

/**
 * Differential reproducer for the bonanzai
 * {@code RiccatiParameterDerivativeTest} a(4)-fd-wrong failure.
 * Adds bonanzai-specific features one at a time until a variant
 * reproduces the bug, identifying the cause by elimination.
 */
public class SelfReferentialSequencePerturbationTest extends
                                                     TestCase
{
  static final int bits = 192;

  /**
   * Closest mirror of bonanzai's setup: three polynomial coefficients
   * p/q/r populated by P/Q/R nullary functions, a Complex evaluation
   * point, Γ-ratio statics, curried a(k)(v), AND a parallel da
   * recurrence whose cache is populated before the fd loop. If THIS
   * fails the bug is reproduced at the arb4j level.
   */
  public void testFullBonanzaiShape()
  {
    Real    ν   = new Real("0.4", bits).setName("ν");
    Real    μ   = new Real("0.6", bits).setName("μ");
    Real    h   = new Real("1e-6", bits);
    Context ctx = new Context(ν, μ);

    ComplexPolynomial p   = ComplexPolynomial.named("p");
    ComplexPolynomial q   = ComplexPolynomial.named("q");
    ComplexPolynomial r   = ComplexPolynomial.named("r");
    ComplexPolynomial pdv = ComplexPolynomial.named("pdv");
    ComplexPolynomial qdv = ComplexPolynomial.named("qdv");
    ComplexPolynomial rdv = ComplexPolynomial.named("rdv");
    ctx.registerVariable(p);
    ctx.registerVariable(q);
    ctx.registerVariable(r);
    ctx.registerVariable(pdv);
    ctx.registerVariable(qdv);
    ctx.registerVariable(rdv);

    // P,Q,R use ν as a coefficient. Their derivatives w.r.t. ν are
    // constants. The shape mirrors bonanzai's typical Riccati
    // coefficient choice (linear in ν, in v).
    ComplexPolynomialNullaryFunction P   = ComplexPolynomialNullaryFunction.express("P",   "ν·v + 1",        ctx);
    ComplexPolynomialNullaryFunction Q   = ComplexPolynomialNullaryFunction.express("Q",   "ν",              ctx);
    ComplexPolynomialNullaryFunction R   = ComplexPolynomialNullaryFunction.express("R",   "-1",             ctx);
    ComplexPolynomialNullaryFunction Pdv = ComplexPolynomialNullaryFunction.express("Pdv", "v",              ctx);
    ComplexPolynomialNullaryFunction Qdv = ComplexPolynomialNullaryFunction.express("Qdv", "1",              ctx);
    ComplexPolynomialNullaryFunction Rdv = ComplexPolynomialNullaryFunction.express("Rdv", "0",              ctx);
    P.evaluate(bits, p);
    Q.evaluate(bits, q);
    R.evaluate(bits, r);
    Pdv.evaluate(bits, pdv);
    Qdv.evaluate(bits, qdv);
    Rdv.evaluate(bits, rdv);

    ComplexPolynomialSequence.declare("a", ctx);
    ComplexPolynomialSequence.declare("da", ctx);

    @SuppressWarnings("unchecked")
    ComplexPolynomialSequence a = (ComplexPolynomialSequence) arb.functions.Function.express(
        "a",
        arb.Integer.class,
        arb.ComplexPolynomial.class,
        ComplexPolynomialSequence.class,
        "a:k➔v➔when(k=1, p(v)/Γ(μ+1), else, (Γ((k-1)·μ+1)/Γ(k·μ+1))·(q(v)·a(k-1)(v) + r(v)·∑j➔a(j)(v)·a(k-1-j)(v){j=1..k-2}))",
        ctx);

    @SuppressWarnings("unchecked")
    ComplexPolynomialSequence da = (ComplexPolynomialSequence) arb.functions.Function.express(
        "da",
        arb.Integer.class,
        arb.ComplexPolynomial.class,
        ComplexPolynomialSequence.class,
        "da:k➔v➔when(k=1, pdv(v)/Γ(μ+1), else, (Γ((k-1)·μ+1)/Γ(k·μ+1))·(qdv(v)·a(k-1)(v) + q(v)·da(k-1)(v) + rdv(v)·∑j➔a(j)(v)·a(k-1-j)(v){j=1..k-2} + r(v)·∑j➔(da(j)(v)·a(k-1-j)(v)+a(j)(v)·da(k-1-j)(v)){j=1..k-2}))",
        ctx);

    // Pre-populate da's cache at base ν (mirrors bonanzai's analytic loop).
    try (Integer k = new Integer())
    {
      for (int kk = 2; kk <= 4; kk++)
      {
        k.set(kk);
        da.evaluate(k, 1, bits, null);
      }
    }

    runPerturbScenarioComplexV("Full bonanzai shape", ν, h, a,
                               () -> { P.evaluate(bits, p); Q.evaluate(bits, q); R.evaluate(bits, r); });

    ν.close();
    μ.close();
    h.close();
    ctx.close();
  }

  /**
   * Evaluate a(k)(v) at v=(0.5, 0.3) before and after perturbing ν.
   * Returns the Complex value of the polynomial applied at v.
   */
  private void runPerturbScenarioComplexV(String label, Real ν, Real h, ComplexPolynomialSequence a,
                                          Runnable beforeInvalidate)
  {
    System.out.println("=== " + label + " ===");
    try (Integer k = new Integer();
         Complex v = new Complex();
         Complex base2 = new Complex();
         Complex base3 = new Complex();
         Complex base4 = new Complex();
         Complex pert2 = new Complex();
         Complex pert3 = new Complex();
         Complex pert4 = new Complex();
         Complex diff = new Complex();
         Real mag = new Real();
         Real tol = new Real("1e-3", bits))
    {
      v.set(0.5, 0.3);

      // base: a(k)@v at base ν
      for (int kk = 2; kk <= 4; kk++)
      {
        k.set(kk);
        ComplexPolynomial poly = a.evaluate(k, 1, bits, null);
        Complex into = kk == 2 ? base2 : kk == 3 ? base3 : base4;
        poly.evaluate(v, 1, bits, into);
      }

      ν.add(h, bits, ν);
      beforeInvalidate.run();
      a.invalidateCache();

      for (int kk = 2; kk <= 4; kk++)
      {
        k.set(kk);
        ComplexPolynomial poly = a.evaluate(k, 1, bits, null);
        Complex into = kk == 2 ? pert2 : kk == 3 ? pert3 : pert4;
        poly.evaluate(v, 1, bits, into);
      }

      String[] names = { "a(2)(v)", "a(3)(v)", "a(4)(v)" };
      Complex[] bases = { base2, base3, base4 };
      Complex[] perts = { pert2, pert3, pert4 };
      for (int idx = 0; idx < 3; idx++)
      {
        bases[idx].sub(perts[idx], bits, diff);
        diff.abs(bits, mag);
        System.out.println("  " + names[idx] + " base=" + bases[idx]
                           + "  pert=" + perts[idx] + "  |Δ|=" + mag);
        assertTrue(label + ": " + names[idx] + " |Δ|=" + mag
                   + " after ν += " + h + " — expected O(h).",
                   mag.compareTo(tol) < 0);
      }
    }
    ν.sub(h, bits, ν);
  }
}
