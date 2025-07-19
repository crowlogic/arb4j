package arb.utensils;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NamedThreadFactory implements
                                ThreadFactory
{
  private final String        namePrefix;
  private final AtomicInteger threadNumber = new AtomicInteger(1);

  public NamedThreadFactory(String prefix)
  {
    this.namePrefix = prefix;
  }

  @Override
  public Thread newThread(Runnable r)
  {
    Thread thread = new Thread(r,
                               namePrefix + "-" + threadNumber.getAndIncrement());
    thread.setDaemon(true);
    return thread;
  }
}
