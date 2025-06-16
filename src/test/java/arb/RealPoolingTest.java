package arb;

import junit.framework.TestCase;

public class RealPoolingTest extends
                             TestCase
{

  public static void testBasicBorrowAndReturn()
  {
    Real poolOwner = new Real();
    Real tempReal1 = poolOwner.borrowVariable();

    assert tempReal1 != null : "Borrowed object should not be null";
    assert poolOwner == tempReal1.poolOwner : "poolOwner should be set correctly";

    tempReal1.close(); // Should return to pool

    Real tempReal2 = poolOwner.borrowVariable();
    assert tempReal1 == tempReal2 : "Second borrow should reuse first object";

    poolOwner.close();
  }

  public static void testMultipleBorrowsCreateNewObjects()
  {
    Real poolOwner = new Real();
    Real tempReal1 = poolOwner.borrowVariable();
    Real tempReal2 = poolOwner.borrowVariable();

    assert tempReal1 != tempReal2 : "Multiple borrows should create different objects";
    assert tempReal1.poolOwner == tempReal2.poolOwner : "Both should have same pool owner";

    poolOwner.close();
  }

  public static void testPoolReuseAfterMultipleReturns()
  {
    Real poolOwner = new Real();
    Real tempReal1 = poolOwner.borrowVariable();
    Real tempReal2 = poolOwner.borrowVariable();

    tempReal1.close();
    tempReal2.close();

    Real reused1 = poolOwner.borrowVariable();
    Real reused2 = poolOwner.borrowVariable();

    assert reused1 == tempReal1 || reused1 == tempReal2 : "Should reuse one of the returned objects";
    assert reused2 == tempReal1 || reused2 == tempReal2 : "Should reuse the other returned object";
    assert reused1 != reused2 : "Should not reuse same object twice";

    reused1.close();
    reused2.close();
    poolOwner.close();
  }

  public static void testNestedPooling()
  {
    Real poolOwner  = new Real();
    Real tempReal1  = poolOwner.borrowVariable();
    Real nestedTemp = tempReal1.borrowVariable();

    assert nestedTemp != null : "Nested borrow should work";
    assert tempReal1 == nestedTemp.poolOwner : "Nested temp should have tempReal1 as pool owner";

    nestedTemp.close();

    Real reusedNested = tempReal1.borrowVariable();
    assert nestedTemp == reusedNested : "Should reuse nested pooled object";

    reusedNested.close();
    tempReal1.close();
    poolOwner.close();
  }

  public static void testNestedPoolCleanupWhenParentCloses()
  {
    Real poolOwner = new Real();
    Real tempReal1 = poolOwner.borrowVariable();
    Real nested1   = tempReal1.borrowVariable();
    Real nested2   = tempReal1.borrowVariable();

    nested1.close();
    nested2.close();
    tempReal1.close();

    Real reused = poolOwner.borrowVariable();
    assert tempReal1 == reused : "tempReal1 should be reused from main pool";

    reused.close();
    poolOwner.close();
  }

  public static void testDeepNestedPoolingCloseOriginalOnly()
  {
    Real poolOwner = new Real();
    Real tempReal1 = poolOwner.borrowVariable();
    Real level2    = tempReal1.borrowVariable();
    Real level3    = level2.borrowVariable();

    assertEquals( poolOwner, tempReal1.poolOwner );
    poolOwner.close();

    assert tempReal1.poolOwner == null : "tempReal1 should be freed";
    assert level2.poolOwner == null : "level2 should be freed";
    assert level3.poolOwner == null : "level3 should be freed";

  }

  public static void testPoolOwnerIsNullForRootObjects()
  {
    Real poolOwner = new Real();
    assert poolOwner.poolOwner == null : "Root pool owner should have null poolOwner";
    poolOwner.close();
  }

  public static void testReturnVariableAssertion()
  {
    Real    poolOwner       = new Real();
    Real    tempReal1       = poolOwner.borrowVariable();
    Real    wrongOwner      = new Real();

    boolean assertionThrown = false;
    try
    {
      wrongOwner.returnVariable(tempReal1);
    }
    catch (AssertionError e)
    {
      assertionThrown = e.getMessage().contains("owned by");
    }
    assert assertionThrown : "Should throw AssertionError for wrong pool owner";

    tempReal1.close();
    wrongOwner.close();
    poolOwner.close();
  }

  public static void testEmptyPoolReturnsNewObject()
  {
    Real poolOwner = new Real();
    Real tempReal1 = poolOwner.borrowVariable();
    assert tempReal1 != null : "Should create new object when pool empty";
    assert poolOwner == tempReal1.poolOwner : "New object should have correct pool owner";
    tempReal1.close();
    poolOwner.close();
  }

  public static void testPoolOwnerCloseEmptiesAllPools()
  {
    Real poolOwner = new Real();
    Real tempReal1 = poolOwner.borrowVariable();
    Real tempReal2 = poolOwner.borrowVariable();
    Real nested1   = tempReal1.borrowVariable();
    Real nested2   = tempReal2.borrowVariable();

    nested1.close();
    nested2.close();
    tempReal1.close();
    tempReal2.close();

    poolOwner.close();
  }
}
