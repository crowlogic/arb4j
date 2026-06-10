package arb;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import arb.utensils.Utensils;

/**
 * Native-allocation leak detector that survives an OOM kill and separates real
 * leaks from work in flight.
 *
 * <p>
 * arb wrappers own native (arb/FLINT) memory and have no finalizer, so an owned
 * instance that is dropped without {@code close()} orphans its native block
 * forever. This tracker registers every owned allocation behind a
 * {@link WeakReference} stamped with the stack that created it, so it never pins
 * the object (no added heap pressure, it cannot cause the very OOM it is hunting)
 * and the garbage collector itself reports the verdict:
 *
 * <ul>
 * <li><b>Abandoned-without-close</b> — the object was garbage-collected while its
 * {@code close()} had never run. Its native memory is now unreclaimable: a
 * <em>definite</em> leak. The reference queue delivers these as they happen.</li>
 * <li><b>Live-unclosed</b> — still strongly reachable and not yet closed: either
 * legitimately in flight / pooled, or a retained leak (held in a cache and never
 * closed). Watch whether a site's live-unclosed count grows without bound.</li>
 * <li><b>Closed</b> — {@code close()} ran: not a leak, dropped from tracking.</li>
 * </ul>
 *
 * <p>
 * A daemon drains the reference queue and rewrites the full report to
 * {@code arb4j.leakFile} (default {@code /tmp/arb4j-leaks.txt}) every few seconds
 * and once more from a shutdown hook, so the last snapshot before a SIGKILL still
 * names the leak. Enable with {@code -Darb4j.trackLeaks=true}; when off every hook
 * is one volatile read.
 */
public final class LeakTracker
{
  public static volatile boolean ON = Boolean.getBoolean("arb4j.trackLeaks");

  private static final String                     FILE   = System.getProperty("arb4j.leakFile", "/tmp/arb4j-leaks.txt");
  private static final ReferenceQueue<Object>     QUEUE  = new ReferenceQueue<>();
  private static final java.util.Set<Tok>         ALIVE  = ConcurrentHashMap.newKeySet();
  private static final ConcurrentMap<String, long[]> LEAKED = new ConcurrentHashMap<>();
  private static final ConcurrentMap<String, String> SITES  = new ConcurrentHashMap<>();

  /** Weak handle to one owned instance, carrying its allocation site and close state. */
  public static final class Tok extends WeakReference<Object>
  {
    final String    site;
    volatile boolean closed;

    Tok(Object referent, String site)
    {
      super(referent, QUEUE);
      this.site = site;
    }
  }

  static
  {
    if (ON)
      start();
  }

  private LeakTracker()
  {
  }

  /** Begin tracking {@code owner}; returns the token the owner must hand back to {@link #closed}. */
  public static Object track(Object owner)
  {
    if (!ON)
      return null;
    Tok t = new Tok(owner, intern(site()));
    ALIVE.add(t);
    return t;
  }

  /** Mark the allocation behind {@code token} as properly closed (its native memory was freed). */
  public static void closed(Object token)
  {
    if (token instanceof Tok t)
    {
      t.closed = true;
      ALIVE.remove(t);
    }
  }

  public static int liveUnclosedCount()
  {
    int n = 0;
    for (Tok t : ALIVE)
      if (!t.closed)
        n++;
    return n;
  }

  /** Total owned arb objects garbage-collected so far WITHOUT close() — the definite-leak count. */
  public static long abandonedTotal()
  {
    long n = 0;
    for (long[] v : LEAKED.values())
      n += v[0];
    return n;
  }

  /**
   * Process every reference the garbage collector has already enqueued, now,
   * on the calling thread. A test that forces a GC then calls this gets a
   * deterministic {@link #abandonedTotal()} without depending on the background
   * daemon's timing.
   */
  public static void drain()
  {
    Reference<?> r;
    while ((r = QUEUE.poll()) != null)
      if (r instanceof Tok t)
      {
        ALIVE.remove(t);
        if (!t.closed)
          LEAKED.computeIfAbsent(t.site, k -> new long[1])[0]++;
      }
  }

  /** Clear all accumulated state so a test can measure leaks over a bounded window in isolation. */
  public static void reset()
  {
    ALIVE.clear();
    LEAKED.clear();
  }

  private static String intern(String s)
  {
    String c = SITES.putIfAbsent(s, s);
    return c == null ? s : c;
  }

  private static void start()
  {
    Thread d = new Thread(() ->
    {
      while (true)
      {
        try
        {
          Reference<?> r = QUEUE.remove(3000);
          if (r instanceof Tok t)
          {
            ALIVE.remove(t);
            if (!t.closed)
              LEAKED.computeIfAbsent(t.site, k -> new long[1])[0]++;
          }
        }
        catch (InterruptedException e)
        {
          return;
        }
        catch (Throwable ignored)
        {
          Utensils.wrapOrThrow(ignored);

        }
        try
        {
          dump();
        }
        catch (Throwable ignored)
        {
          Utensils.wrapOrThrow(ignored);
        }
      }
    }, "arb4j-leak-detector");
    d.setDaemon(true);
    d.start();
    Runtime.getRuntime().addShutdownHook(new Thread(() ->
    {
      try
      {
        dump();
      }
      catch (Throwable ignored)
      {
        Utensils.wrapOrThrow(ignored);

      }
    }, "arb4j-leak-dump"));
  }

  /** Rewrite the full leak report to {@link #FILE}: abandoned-without-close first, then live-unclosed, both grouped by site. */
  public static synchronized void dump()
  {
    Map<String, int[]> live = new HashMap<>();
    int                liveTotal = 0;
    for (Tok t : ALIVE)
    {
      if (!t.closed)
      {
        live.computeIfAbsent(t.site, k -> new int[1])[0]++;
        liveTotal++;
      }
    }
    long leakedTotal = 0;
    for (long[] v : LEAKED.values())
      leakedTotal += v[0];

    try ( PrintWriter w = new PrintWriter(new FileWriter(FILE)) )
    {
      w.println("==================== arb4j LeakTracker ====================");
      w.println(leakedTotal + " owned arb objects were GARBAGE-COLLECTED WITHOUT close() (definite leaks).");
      w.println(liveTotal + " owned arb objects are currently un-closed (in-flight OR retained).");

      w.println("\n#### DEFINITE LEAKS — collected without close(), by allocation site ####");
      LEAKED.entrySet()
            .stream()
            .sorted((a, b) -> Long.compare(b.getValue()[0], a.getValue()[0]))
            .limit(25)
            .forEach(e -> w.println("\n==== " + e.getValue()[0] + " abandoned-without-close, allocated at:\n" + e.getKey()));

      w.println("\n#### LIVE UN-CLOSED — still reachable (a site that grows unbounded is a retained leak), by site ####");
      List<Map.Entry<String, int[]>> sorted = new ArrayList<>(live.entrySet());
      sorted.sort((a, b) -> b.getValue()[0] - a.getValue()[0]);
      sorted.stream()
            .limit(25)
            .forEach(e -> w.println("\n==== " + e.getValue()[0] + " live-unclosed, allocated at:\n" + e.getKey()));
      w.println("===========================================================");
      w.flush();
    }
    catch (Throwable ignored)
    {
      Utensils.wrapOrThrow(ignored);

    }
  }

  private static String site()
  {
    StackTraceElement[] st   = Thread.currentThread().getStackTrace();
    StringBuilder       sb   = new StringBuilder();
    int                 kept = 0;
    for (int i = 2; i < st.length && kept < 16; i++)
    {
      String cn = st[i].getClassName();
      if (cn.equals("arb.LeakTracker"))
        continue;
      sb.append("    ").append(st[i]).append('\n');
      kept++;
    }
    return sb.toString();
  }
}
