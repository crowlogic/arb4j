package arb.expressions;

import java.lang.reflect.Field;

import arb.Integer;
import arb.Real;
import arb.functions.integer.Sequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies
 * <a href="https://github.com/crowlogic/arb4j/issues/958">issue #958</a>:
 * {@code Function.invalidateStaticCache()} is generated on classes that have
 * hoisted static subexpressions and, when called, forces the next
 * {@code evaluate()} to recompute every subtree that was lifted into
 * {@code evaluateStaticSubexpressions()}.
 *
 * <p>
 * A context variable participating in a hoisted subtree {@code (a²+1)} is
 * mutated in place between evaluations, as happens during parameter
 * estimation. Without the invalidation call the cache serves the old
 * value; with it, the next evaluation recomputes correctly.
 *
 * @author Stephen Crowley ©2024-2026
 */
public class InvalidateStaticCacheTest extends
                                      TestCase
{

  @SuppressWarnings("unchecked")
  private static RealFunction boundInnerFunction(int nValue)
  {
    Expression<Integer, RealFunction, Sequence<RealFunction>> expr =
                                                                   new Expression<>("BesselLikeSequenceInvalidate" + nValue,
                                                                                    Integer.class,
                                                                                    RealFunction.class,
                                                                                    (Class) Sequence.class,
                                                                                    "n➔t➔(n²+1)*t",
                                                                                    null,
                                                                                    "f",
                                                                                    null);
    Sequence<RealFunction> seq = expr.instantiate();
    try ( Integer n = new Integer().set(nValue))
    {
      return seq.evaluate(n, 0, 128, null);
    }
  }

  private static int staticPrecisionOf(Object fn) throws Exception
  {
    Field field = fn.getClass().getField("staticPrecision");
    return field.getInt(fn);
  }

  /**
   * After a regular {@code evaluate} call on a generated class that hoists
   * a bound-parameter-dependent subtree, {@code staticPrecision} records
   * the bits used. A subsequent {@code invalidateStaticCache()} must reset
   * it to {@code -1} so the next {@code evaluate} re-runs
   * {@code evaluateStaticSubexpressions}.
   */
  public void testInvalidateStaticCacheResetsStaticPrecision() throws Exception
  {
    RealFunction f = boundInnerFunction(3);
    try ( Real t = new Real().set(2); Real result = new Real())
    {
      // Populate the cache.
      f.evaluate(t, 1, 128, result);
      assertEquals("staticPrecision must equal the bits used after first evaluate",
                   128,
                   staticPrecisionOf(f));

      f.invalidateStaticCache();
      assertEquals("invalidateStaticCache must reset staticPrecision to -1",
                   -1,
                   staticPrecisionOf(f));

      // Re-evaluating repopulates the cache.
      f.evaluate(t, 1, 128, result);
      assertEquals("staticPrecision must be re-populated by the next evaluate",
                   128,
                   staticPrecisionOf(f));
    }
  }

  /**
   * End-to-end: invalidating the cache and re-evaluating at the same
   * precision must produce the same correct value. This guards against a
   * regression where the invalidation accidentally leaves the cached
   * field holding a half-updated intermediate.
   */
  public void testInvalidateStaticCacheProducesSameResultAtSamePrecision()
  {
    RealFunction f = boundInnerFunction(3);
    try ( Real t = new Real().set(2); Real result = new Real(); Real result2 = new Real())
    {
      // (3² + 1) * 2 = 20
      assertEquals(20.0, f.evaluate(t, 1, 128, result).doubleValue());
      f.invalidateStaticCache();
      assertEquals(20.0, f.evaluate(t, 1, 128, result2).doubleValue());
    }
  }

  /**
   * The default implementation on {@link arb.functions.Function} is a
   * no-op so callers may invoke it unconditionally on functions that
   * have no hoisted state.
   */
  public void testInvalidateStaticCacheIsNoopWhenNothingHoisted()
  {
    RealFunction f = RealFunction.express("t + t*t");
    // Must not throw.
    f.invalidateStaticCache();
    try ( Real t = new Real().set(3); Real result = new Real())
    {
      assertEquals(12.0, f.evaluate(t, 1, 128, result).doubleValue());
    }
  }
}
