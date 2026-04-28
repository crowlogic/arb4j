package arb.applications;

import java.util.Arrays;

import javafx.application.Application;

/**
 * Bypass the OpenJFX {@code LauncherImpl} "JavaFX runtime components are
 * missing" guard that fires whenever the configured main class extends
 * {@link Application}.
 *
 * The guard is the first thing the JDK executes when the configured main
 * class is an Application subclass; it then verifies that {@code javafx.graphics}
 * is a resolved JPMS module and refuses to start when it is not. Inside the
 * shaded fat jar JavaFX rides as classpath classes, not as a named module, so
 * that check fails even though every {@code javafx.*} class is loadable.
 *
 * Routing the JVM at this class -- which does <em>not</em> extend
 * {@code Application} -- skips the guard entirely; the guard only inspects
 * the class named on the command line. We then call
 * {@link Application#launch(Class, String...)} ourselves, which works fine
 * with the unnamed-module classpath layout.
 *
 * Usage:
 * <pre>
 *   java -cp arb4j.jar arb.applications.Launcher arb.applications.Expressor [app-args...]
 * </pre>
 */
public class Launcher
{
  public static void main(String[] args) throws ClassNotFoundException
  {
    if (args.length == 0)
    {
      System.err.println("Usage: arb.applications.Launcher <Application-FQCN> [args...]");
      System.exit(2);
    }
    Class<? extends Application> appClass = Class.forName(args[0]).asSubclass(Application.class);
    String[] tail = Arrays.copyOfRange(args, 1, args.length);
    Application.launch(appClass, tail);
  }
}
