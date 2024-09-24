package arb.viz;

import java.lang.foreign.*;
import java.lang.invoke.MethodHandle;
import java.lang.reflect.Method;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.stage.Stage;
import javafx.stage.Window;

public class WindowManagerApp extends
                              Application
{

  @Override
  public void start(Stage primaryStage)
  {
    primaryStage.setTitle("Window Manager Test");
    primaryStage.show();

    long x11WindowId = getX11WindowId(primaryStage);
    System.out.println("X11 Window ID: " + x11WindowId);

    Platform.runLater(() ->
    {
      while (true)
      {
        try
        {
          System.err.println("Sleeping two seconds before raising " + x11WindowId);
          Thread.sleep(2000);
        }
        catch (InterruptedException e)
        {
          e.printStackTrace();
        }
        System.err.println("Bringing to front " + x11WindowId);
        bringWindowToTop(x11WindowId);
      }
    });
  }

  private long getX11WindowId(Stage stage)
  {
    try
    {
      Method method = Window.class.getDeclaredMethod("getPeer");
      method.setAccessible(true);
      Object tkStage = method.invoke(stage);
      return (long) tkStage.getClass().getMethod("getRawHandle").invoke(tkStage);
    }
    catch (Exception e)
    {
      e.printStackTrace();
      return 0;
    }
  }

  private void bringWindowToTop(long windowId)
  {
    try ( Arena arena = Arena.ofConfined())
    {
      SymbolLookup  x11           = SymbolLookup.libraryLookup("libX11.so", arena);

      MethodHandle  XOpenDisplay  =
                                 Linker.nativeLinker()
                                       .downcallHandle(x11.find("XOpenDisplay").orElseThrow(),
                                                       FunctionDescriptor.of(ValueLayout.ADDRESS,
                                                                             ValueLayout.ADDRESS));

      MethodHandle  XInternAtom   =
                                Linker.nativeLinker()
                                      .downcallHandle(x11.find("XInternAtom").orElseThrow(),
                                                      FunctionDescriptor.of(ValueLayout.JAVA_LONG,
                                                                            ValueLayout.ADDRESS,
                                                                            ValueLayout.ADDRESS,
                                                                            ValueLayout.JAVA_INT));

      MethodHandle  XSendEvent    =
                               Linker.nativeLinker()
                                     .downcallHandle(x11.find("XSendEvent").orElseThrow(),
                                                     FunctionDescriptor.of(ValueLayout.JAVA_INT,
                                                                           ValueLayout.ADDRESS,
                                                                           ValueLayout.JAVA_LONG,
                                                                           ValueLayout.JAVA_INT,
                                                                           ValueLayout.JAVA_LONG,
                                                                           ValueLayout.ADDRESS));

      MethodHandle  XFlush        =
                           Linker.nativeLinker()
                                 .downcallHandle(x11.find("XFlush").orElseThrow(),
                                                 FunctionDescriptor.of(ValueLayout.JAVA_INT,
                                                                       ValueLayout.ADDRESS));

      MethodHandle  XCloseDisplay =
                                  Linker.nativeLinker()
                                        .downcallHandle(x11.find("XCloseDisplay").orElseThrow(),
                                                        FunctionDescriptor.ofVoid(ValueLayout.ADDRESS));

      MemorySegment display       = (MemorySegment) XOpenDisplay.invoke(MemorySegment.NULL);
      if (display.equals(MemorySegment.NULL))
      {
        System.err.println("Failed to open X11 display");
        return;
      }
      System.out.println("display=" + display );
      
      try
      {
        MemorySegment atomName        = arena.allocateFrom("_NET_ACTIVE_WINDOWfuck");
        long          netActiveWindow = (long) XInternAtom.invoke(display, atomName, 0);

        MemorySegment xev             = arena.allocate(192);                            // XEvent
                                                                                        // size
        xev.fill((byte) 0); // Initialize the entire structure to zero

        // Set the XEvent fields
        xev.setAtIndex(ValueLayout.JAVA_INT, 0, 33); // ClientMessage type
        xev.setAtIndex(ValueLayout.JAVA_LONG, 1, windowId); // window
        xev.setAtIndex(ValueLayout.JAVA_LONG, 2, netActiveWindow); // message_type
        xev.setAtIndex(ValueLayout.JAVA_INT, 3, 32); // format
        xev.setAtIndex(ValueLayout.JAVA_LONG, 4, 2L); // data.l[0] = 2 (pager)
        xev.setAtIndex(ValueLayout.JAVA_LONG, 5, 0L); // data.l[1] = CurrentTime

        MemorySegment rootReturn = arena.allocate(ValueLayout.JAVA_LONG);
        int           result     =
                             (int) XSendEvent.invoke(display,
                                                     (long) rootReturn.get(ValueLayout.JAVA_LONG,
                                                                           0),
                                                     0,
                                                     (SubstructureNotifyMask
                                                                   | SubstructureRedirectMask),
                                                     xev);

        if (result == 0)
        {
          System.err.println("Failed to send _NET_ACTIVE_WINDOW event");
        }

        XFlush.invoke(display);
      }
      finally
      {
        XCloseDisplay.invoke(display);
      }
    }
    catch (Throwable t)
    {
      t.printStackTrace();
    }
  }

  private static final long SubstructureNotifyMask   = 1L << 19;
  private static final long SubstructureRedirectMask = 1L << 20;

  public static void main(String[] args)
  {
    launch(args);
  }
}