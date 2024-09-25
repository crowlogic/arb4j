package arb.viz;

import java.lang.reflect.Method;

import arb.XDO;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.stage.Stage;
import javafx.stage.Window;

/**
 * Restore the crippled toFront() functionality in Javafx that was put there
 * because microsoft is a flaming heap of dung
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class WindowManager
{
  static
  {
    System.loadLibrary("arblib");
  }

  private static XDO    xdo;
  private static Method getPeerMethod;
  static
  {
    try
    {
      getPeerMethod = Window.class.getDeclaredMethod("getPeer");
      getPeerMethod.setAccessible(true);

    }
    catch (NoSuchMethodException | SecurityException e)
    {
      e.printStackTrace();
    }
  }

  static
  {
    xdo = arblib.xdo_new(":0");
  }

  public static void bringToFront(Stage stage)
  {
    long windowId = getX11WindowId(stage);
    if (windowId != 0)
    {
      bringWindowToTop(windowId);
    }
    else
    {
      System.err.println("Failed to get X11 window ID");
    }
  }

  private static Method getRawHandleMethod;

  public static long getX11WindowId(Stage stage)
  {
    try
    {
      Object tkStage = getPeerMethod.invoke(stage);

      if (getRawHandleMethod == null)
      {
        getRawHandleMethod = tkStage.getClass().getMethod("getRawHandle");
      }
      return (long) getRawHandleMethod.invoke(tkStage);
    }
    catch (Exception e)
    {
      e.printStackTrace();
      return 0;
    }
  }

  static void bringWindowToTop(long windowId)
  {
    if (xdo != null)
    {
      int result = arblib.xdo_activate_window(xdo, windowId);
      if (result == 0)
      {
        System.err.println("Failed to send _NET_ACTIVE_WINDOW event");
      }
    }
    else
    {
      System.err.println("XDO not initialized");
    }
  }

}