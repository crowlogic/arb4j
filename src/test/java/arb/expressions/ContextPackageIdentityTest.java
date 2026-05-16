package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies the {@link Context#packageName} prerequisite from #1024:
 *
 * <ol>
 * <li>An unpackaged {@link Context} (no-arg ctor or {@code new Context(null)})
 *     produces a generated class with no package — its
 *     {@link Class#getName()} equals the short {@code className} (e.g.
 *     {@code "P"}).
 * <li>A packaged {@link Context} (e.g. {@code new Context("arb.jacobi")})
 *     produces a generated class whose {@link Class#getName()} equals
 *     {@code "arb.jacobi.P"} \u2014 a JVM-distinct class from the unpackaged
 *     {@code "P"}.
 * <li>Two contexts with different package names can coexist and produce
 *     classes that are different JVM types even though they share the
 *     same short {@code className}.
 * </ol>
 */
public class ContextPackageIdentityTest extends
                                       TestCase
{
  public void testUnpackagedContextProducesShortNameClass()
  {
    Context ctx = new Context();
    assertNull("default Context has no packageName", ctx.packageName);
    RealFunction f = RealFunction.express("f:x\u2794x+1", ctx);
    assertEquals("class name has no package qualifier",
                 "f",
                 f.getClass().getName());
  }

  public void testPackagedContextProducesQualifiedClass()
  {
    Context ctx = new Context("arb.test.jacobi");
    assertEquals("arb.test.jacobi", ctx.packageName);
    RealFunction f = RealFunction.express("g:x\u2794x*x", ctx);
    assertEquals("class name carries the Context package",
                 "arb.test.jacobi.g",
                 f.getClass().getName());
  }

  public void testTwoPackagedContextsCoexistWithSameShortName()
  {
    Context a = new Context("arb.test.jacobi");
    Context b = new Context("arb.test.riccati");
    RealFunction fa = RealFunction.express("h:x\u2794x", a);
    RealFunction fb = RealFunction.express("h:x\u2794x+x", b);

    assertEquals("arb.test.jacobi.h", fa.getClass().getName());
    assertEquals("arb.test.riccati.h", fb.getClass().getName());

    assertNotSame("different packages \u21d2 different JVM Class objects for h",
                  fa.getClass(), fb.getClass());

    Real x = new Real();
    x.set("3", 128);
    Real ya = fa.evaluate(x, 128, new Real());
    Real yb = fb.evaluate(x, 128, new Real());
    assertEquals("h@jacobi(3) = 3", "3", ya.toString());
    assertEquals("h@riccati(3) = 6", "6", yb.toString());
  }
}
