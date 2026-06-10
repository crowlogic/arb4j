package arb.expressions.regressions.npe1046;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * Regression reproducer for crowlogic/arb4j#1046.
 *
 * Decompiled generated classes ({@code dΦ}, {@code dΦoperandF0001}, {@code dd},
 * {@code da}, {@code daoperandF0001}, {@code daoperandF0002}, {@code a},
 * {@code aoperandF0001}, {@code u}, {@code w}) in this package are copied
 * verbatim from a bonanzai {@code -Darb4j.saveClasses=true
 * -Darb4j.decompileClasses=true} dump.
 *
 * Original failure stack:
 *
 * <pre>
 * java.lang.NullPointerException: Cannot read field "dim" because "real" is null
 *     at arb4j/arb.Real.set(Real.java:2566)
 *     at da.initialize(Unknown Source)
 *     at da.evaluate(Unknown Source)
 *     at dd.evaluate(Unknown Source)
 *     at dΦoperandF0001.evaluate(Unknown Source)
 *     at dΦ.evaluate(Unknown Source)
 *     ...
 * </pre>
 *
 * Reproduction strategy: build a {@link Context}, register every variable the
 * expression compiler would normally bind, instantiate each nested function
 * class as a Java object and register it, call
 * {@link Context#injectReferences} on each so its variable fields are wired,
 * then invoke {@code dΦ.evaluate} directly on the decompiled bytecode — no
 * expression compilation involved.
 */
public class Npe1046Test extends TestCase
{
  public void testEvaluateDΦReproducesNpe1046()
  {
    int     bits = 128;
    Context ctx  = new Context();

    Integer J  = (Integer) new Integer(3).setName("J");
    Integer N  = (Integer) new Integer(48).setName("N");
    Real    S0 = new Real("1", bits).setName("S0");
    Real    rr = new Real("0", bits).setName("rr");
    Real    T  = new Real("1", bits).setName("T");
    Real    μ  = new Real("0.6", bits).setName("μ");
    Real    ε  = new Real("0", bits).setName("ε");
    Real    λ  = new Real("1", bits).setName("λ");
    Real    θ  = new Real("0.04", bits).setName("θ");
    Real    ν  = new Real("0.3", bits).setName("ν");
    Real    V0 = new Real("0.04", bits).setName("V0");
    Real    ρ  = new Real("-0.7", bits).setName("ρ");

    ctx.registerVariables(J, N, S0, rr, T, μ, ε, λ, θ, ν, V0, ρ);

    // Riccati coefficient polynomials and their ν-derivatives. Values don't
    // need to be meaningful — they just need to be non-null so the generated
    // initialize() guards pass.
    ComplexPolynomial p   = new ComplexPolynomial(); p.setName("p");   p.set(new Complex().one());
    ComplexPolynomial pdv = new ComplexPolynomial(); pdv.setName("pdv"); pdv.set(new Complex().zero());
    ComplexPolynomial q   = new ComplexPolynomial(); q.setName("q");   q.set(new Complex().one());
    ComplexPolynomial qdv = new ComplexPolynomial(); qdv.setName("qdv"); qdv.set(new Complex().zero());
    ComplexPolynomial r   = new ComplexPolynomial(); r.setName("r");   r.set(new Complex().one());
    ComplexPolynomial rdv = new ComplexPolynomial(); rdv.setName("rdv"); rdv.set(new Complex().zero());
    ctx.registerVariables(p, pdv, q, qdv, r, rdv);

    // Instantiate every generated class in the dΦ closure and register it
    // under its expression-compiler name so that lookupFunctionInstance(name)
    // returns the same instance everywhere it's referenced.
    a                fa                = new a();
    aoperandF0001    faoperandF0001    = new aoperandF0001();
    da               fda               = new da();
    daoperandF0001   fdaoperandF0001   = new daoperandF0001();
    daoperandF0002   fdaoperandF0002   = new daoperandF0002();
    u                fu                = new u();
    w                fw                = new w();
    dd               fdd               = new dd();
    dΦoperandF0001   fdΦoperandF0001   = new dΦoperandF0001();
    dΦ               fdΦ               = new dΦ();

    ctx.registerFunction("a",              fa);
    ctx.registerFunction("aoperandF0001",  faoperandF0001);
    ctx.registerFunction("da",             fda);
    ctx.registerFunction("daoperandF0001", fdaoperandF0001);
    ctx.registerFunction("daoperandF0002", fdaoperandF0002);
    ctx.registerFunction("u",              fu);
    ctx.registerFunction("w",              fw);
    ctx.registerFunction("dd",             fdd);
    ctx.registerFunction("dΦoperandF0001", fdΦoperandF0001);

    // Inject the context's variables AND function references into every
    // instance, so each one's own field-typed slots (Real μ, V0, …, da, w, …)
    // are populated before any initialize() runs.
    ctx.injectReferences(fa);
    ctx.injectReferences(faoperandF0001);
    ctx.injectReferences(fda);
    ctx.injectReferences(fdaoperandF0001);
    ctx.injectReferences(fdaoperandF0002);
    ctx.injectReferences(fu);
    ctx.injectReferences(fw);
    ctx.injectReferences(fdd);
    ctx.injectReferences(fdΦoperandF0001);
    ctx.injectReferences(fdΦ);

    try ( ComplexPolynomial result = new ComplexPolynomial())
    {
      try
      {
        fdΦ.evaluate(null, 1, bits, result);
      }
      catch (NullPointerException npe)
      {
        StringBuilder sb = new StringBuilder();
        sb.append("crowlogic/arb4j#1046 reproduced (NPE): ").append(npe.getMessage()).append('\n');
        for (StackTraceElement frame : npe.getStackTrace())
        {
          sb.append("    at ").append(frame).append('\n');
        }
        throw new AssertionError(sb.toString(), npe);
      }
      catch (AssertionError ae)
      {
        StringBuilder sb = new StringBuilder();
        sb.append("crowlogic/arb4j#1046 reproduced (named guard): ").append(ae.getMessage()).append('\n');
        for (StackTraceElement frame : ae.getStackTrace())
        {
          sb.append("    at ").append(frame).append('\n');
        }
        throw new AssertionError(sb.toString(), ae);
      }
    }
  }
}
