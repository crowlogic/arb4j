package arb.expressions;

import arb.Real;
import arb.exceptions.CyclicFunctionReferenceException;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Coverage for the runtime field-graph cycle detector wired into
 * {@link Expression#instantiate()} via
 * {@code Expression.verifyFieldGraphAcyclic}.
 *
 * <p>The verifier is exercised directly on hand-built instance graphs that
 * model the postcondition it asserts:
 *
 * <ul>
 *   <li>The negative case wires two compiled-class stand-ins {@code f} and
 *   {@code g} so that exactly one instance of each {@link FunctionMapping}
 *   is reachable from the root via the cycle {@code f → g → f → …}. The
 *   verifier must accept this.</li>
 *   <li>The positive case wires a second, distinct instance of the same
 *   {@code FunctionMapping} into the cycle (the failure mode described in
 *   issue #1000 point #3 — {@code if (peer == null) peer = new Peer()}
 *   inside {@code initialize()} producing a fresh cycle member per frame).
 *   The verifier must throw
 *   {@link CyclicFunctionReferenceException} with a message naming the
 *   FunctionMapping and the field-path breadcrumb to the duplicate.</li>
 * </ul>
 *
 * <p>Hand-built graphs are used in preference to driving the bytecode
 * generator end-to-end because the underlying defect that produces the
 * duplicate-instance condition is explicitly out of scope for this commit
 * (per issue #1000 the fix is the two-phase {@code allocate-all-then-wire-
 * all} runtime change). The verifier's contract — postcondition on the live
 * field graph — is independent of whether or not codegen is currently
 * emitting graphs that satisfy it.
 *
 * @see arb4j issue #1000
 */
public class CyclicFunctionReferenceTest extends
                                         TestCase
{

  /**
   * Stand-in for a generated function class. Has a single public field
   * named after the peer it references in the cycle. Its {@code evaluate}
   * implementation throws if invoked — the test asserts that the verifier
   * fires before any {@code evaluate} call can happen.
   */
  public static class FunctionF implements
                                RealFunction
  {
    public FunctionG g;

    @Override
    public Real evaluate(Real t, int order, int bits, Real res)
    {
      throw new AssertionError("evaluate must not be called: verifier is supposed to fire on construction");
    }
  }

  public static class FunctionG implements
                                RealFunction
  {
    public FunctionF f;

    @Override
    public Real evaluate(Real t, int order, int bits, Real res)
    {
      throw new AssertionError("evaluate must not be called: verifier is supposed to fire on construction");
    }
  }

  /**
   * Acyclic-instance-graph: registry holds canonical {@code f0} and {@code
   * g0}; the field graph wires {@code f0.g = g0} and {@code g0.f = f0}.
   * Only one identity per {@link FunctionMapping} is reachable.
   */
  public static void testAcceptsSingleInstancePerMapping()
  {
    Context                                   ctx = new Context();
    FunctionMapping<Real, Real, RealFunction> fm  = ctx.registerFunctionMapping("f", null, Real.class, Real.class, FunctionF.class, true, null, null);
    FunctionMapping<Real, Real, RealFunction> gm  = ctx.registerFunctionMapping("g", null, Real.class, Real.class, FunctionG.class, true, null, null);

    FunctionF f0 = new FunctionF();
    FunctionG g0 = new FunctionG();
    fm.instance = f0;
    gm.instance = g0;
    f0.g        = g0;
    g0.f        = f0;

    Expression<Real, Real, RealFunction> expr = stubExpressionWithContext(ctx);

    // Should return cleanly: each FunctionMapping has exactly one
    // reachable instance.
    expr.verifyFieldGraphAcyclic(f0);
  }

  /**
   * Cyclic-instance-graph: root {@code f0}'s {@code g}-field points at
   * {@code g0} (canonical), but {@code g0.f} points at a second, distinct
   * {@code FunctionF} instance — the broken {@code if (peer == null) peer
   * = new Peer()} pattern. The verifier must throw with a message that
   * names the FunctionMapping and the path.
   */
  public static void testRejectsTwoInstancesOfSameMapping()
  {
    Context                                   ctx = new Context();
    FunctionMapping<Real, Real, RealFunction> fm  = ctx.registerFunctionMapping("f", null, Real.class, Real.class, FunctionF.class, true, null, null);
    FunctionMapping<Real, Real, RealFunction> gm  = ctx.registerFunctionMapping("g", null, Real.class, Real.class, FunctionG.class, true, null, null);

    FunctionF f0     = new FunctionF();
    FunctionG g0     = new FunctionG();
    FunctionF fGhost = new FunctionF(); // the spurious fresh instance produced by `if (this.f == null) this.f = new f()`
    fm.instance = f0;
    gm.instance = g0;
    f0.g        = g0;
    g0.f        = fGhost;               // wired to the ghost, not the canonical
    fGhost.g    = g0;

    Expression<Real, Real, RealFunction> expr = stubExpressionWithContext(ctx);

    try
    {
      expr.verifyFieldGraphAcyclic(f0);
      fail("expected CyclicFunctionReferenceException");
    }
    catch (CyclicFunctionReferenceException expected)
    {
      String msg = expected.getMessage();
      assertNotNull(msg);
      assertTrue("message names FunctionMapping 'f': " + msg, msg.contains("'f'"));
      assertTrue("message includes path breadcrumb '<root>.g.f': " + msg, msg.contains("<root>.g.f"));
      assertTrue("message references issue #1000: " + msg, msg.contains("#1000"));
    }
  }

  /**
   * Construct a minimal {@link Expression} whose only configured state is a
   * back-pointer to {@code ctx} so the verifier's
   * {@code context.functions.get(fieldName)} lookup works. The Expression
   * is never compiled or instantiated; the verifier is invoked directly on
   * a hand-built field graph.
   */
  private static Expression<Real, Real, RealFunction> stubExpressionWithContext(Context ctx)
  {
    Expression<Real, Real, RealFunction> expression = new Expression<>(Real.class,
                                                                       Real.class,
                                                                       RealFunction.class);
    try
    {
      java.lang.reflect.Field contextField = Expression.class.getDeclaredField("context");
      contextField.setAccessible(true);
      contextField.set(expression, ctx);
    }
    catch (ReflectiveOperationException roe)
    {
      throw new AssertionError(roe);
    }
    return expression;
  }
}
