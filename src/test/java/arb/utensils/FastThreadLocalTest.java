package arb.utensils;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import junit.framework.TestCase;

/**
 * Test case for FastThreadLocal.
 */
public class FastThreadLocalTest extends
                                 TestCase
{

  private FastThreadLocal<String> fastThreadLocal;

  /**
   * Sets up the test fixture. (Called before every test case method.)
   */
  @Override
  public void setUp()
  {
    fastThreadLocal = new FastThreadLocal<>(1024);
  }

  /**
   * Tears down the test fixture. (Called after every test case method.)
   */
  @Override
  public void tearDown()
  {
    fastThreadLocal = null;
  }

  public void testSetAndGet()
  {
    String testData = "Thread data";
    long   threadId = Thread.currentThread().threadId();

    // Set thread-specific data.
    fastThreadLocal.set(testData);

    // Get thread-specific data and check.
    assertEquals(testData, fastThreadLocal.get());
  }

  public void testReleaseIndex()
  {
    String testData = "Thread data";
    long   threadId = Thread.currentThread().threadId();

    // Set thread-specific data.
    fastThreadLocal.set(testData);

    // Release the cache index associated with the current thread.
    int index = (int) (threadId % 1024);
    fastThreadLocal.releaseIndex(index);

    // After releasing, the data should be null.
    assertNull(fastThreadLocal.get());
  }

  public void testCacheFullException() throws InterruptedException
  {
    FastThreadLocal<String> smallFastThreadLocal = new FastThreadLocal<>(1);

    // This should not throw any exception.
    smallFastThreadLocal.set("data");

    AtomicBoolean threw  = new AtomicBoolean();
    // Starting new thread which should cause the FastThreadLocal cache to overflow.
    Thread        thread = new Thread(() ->
                         {
                           try
                           {
                             smallFastThreadLocal.set("data");
                           }
                           catch (Exception e)
                           {
                             threw.set(true);
                           }
                         });
    thread.start();
    thread.join();
    assertTrue(threw.get());
  }

  public void testConcurrentAccess() throws InterruptedException
  {
    int           threadCount = 50;
    AtomicInteger failedCount = new AtomicInteger();

    Runnable      task        = () ->
                              {
                                try
                                {
                                  String threadName = Thread.currentThread().getName();
                                  for (int i = 0; i < 10; i++)
                                  {
                                    fastThreadLocal.set(threadName);
                                    Thread.sleep((long) (150 * Math.random()));
                                    String result = fastThreadLocal.get();
                                    if (!threadName.equals(result))
                                    {
                                      failedCount.incrementAndGet();
                                    }
                                  }
                                }
                                catch (InterruptedException e)
                                {
                                  e.printStackTrace();
                                  fail("Exception during concurrent access test: " + e.getMessage());
                                }
                              };

    Thread[]      threads     = new Thread[threadCount];
    for (int i = 0; i < threadCount; i++)
    {
      threads[i] = new Thread(task);
      threads[i].start();
    }

    // Wait for all threads to finish
    for (Thread thread : threads)
    {
      thread.join();
    }

    assertEquals("Concurrent access test failed", 0, failedCount.get());
  }

}
