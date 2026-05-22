package arb.functions;

import junit.framework.TestCase;

/**
 * Unit tests for {@link IndexCache}: the ArrayList-backed, grow-on-demand,
 * signed-index memoization cache that replaced the {@code TreeMap<Integer,C>}
 * in generated function classes.
 *
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class IndexCacheTest extends
                            TestCase
{
  public void testEmptyReturnsNull()
  {
    IndexCache<String> c = new IndexCache<>();
    assertTrue(c.isEmpty());
    assertNull(c.get(0));
    assertNull(c.get(7));
    assertNull(c.get(-1));
    assertNull(c.get(-99));
  }

  public void testNonNegativePutGet()
  {
    IndexCache<String> c = new IndexCache<>();
    assertEquals("zero", c.put(0, "zero"));   // put returns the value
    c.put(1, "one");
    c.put(5, "five");
    assertEquals("zero", c.get(0));
    assertEquals("one", c.get(1));
    assertEquals("five", c.get(5));
    assertFalse(c.isEmpty());
  }

  public void testNegativeIndicesSupported()
  {
    IndexCache<String> c = new IndexCache<>();
    c.put(-1, "neg1");
    c.put(-2, "neg2");
    c.put(-10, "neg10");
    assertEquals("neg1", c.get(-1));
    assertEquals("neg2", c.get(-2));
    assertEquals("neg10", c.get(-10));
    // negative and non-negative sides are independent
    assertNull(c.get(1));
    assertNull(c.get(2));
    assertNull(c.get(10));
  }

  public void testMixedSignsCoexist()
  {
    IndexCache<Integer> c = new IndexCache<>();
    for (int k = -5; k <= 5; k++)
      c.put(k, k * k);
    for (int k = -5; k <= 5; k++)
      assertEquals(Integer.valueOf(k * k), c.get(k));
  }

  public void testGrowsOnDemandSparse()
  {
    IndexCache<String> c = new IndexCache<>();
    // a sparse poke far out grows the backing list; intermediate slots read null
    c.put(100, "hundred");
    assertEquals("hundred", c.get(100));
    assertNull(c.get(50));
    assertNull(c.get(99));
    // reads beyond the grown extent are still null, not out-of-bounds
    assertNull(c.get(1000));
    // same on the negative side
    c.put(-100, "neg-hundred");
    assertEquals("neg-hundred", c.get(-100));
    assertNull(c.get(-50));
    assertNull(c.get(-1000));
  }

  public void testOverwriteSameIndex()
  {
    IndexCache<String> c = new IndexCache<>();
    c.put(3, "first");
    c.put(3, "second");
    assertEquals("second", c.get(3));
    c.put(-3, "negfirst");
    c.put(-3, "negsecond");
    assertEquals("negsecond", c.get(-3));
  }

  public void testClear()
  {
    IndexCache<String> c = new IndexCache<>();
    c.put(2, "two");
    c.put(-2, "negtwo");
    assertFalse(c.isEmpty());
    c.clear();
    assertTrue(c.isEmpty());
    assertNull(c.get(2));
    assertNull(c.get(-2));
    // cache is reusable after clear
    c.put(2, "again");
    assertEquals("again", c.get(2));
  }

  public void testBoundaryIndices()
  {
    IndexCache<String> c = new IndexCache<>();
    c.put(0, "zero");
    c.put(-1, "minus-one");
    // 0 lives on the non-negative side, -1 on the negative side at slot 0
    assertEquals("zero", c.get(0));
    assertEquals("minus-one", c.get(-1));
    assertNull(c.get(-2));
    assertNull(c.get(1));
  }
}
