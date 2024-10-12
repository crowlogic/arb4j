package arb.viz;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.HashMap;

import arb.XDO;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.Node;
import arb.expressions.viz.EmacsKeybindingsEventHandler;
import arb.utensils.Utensils;
import javafx.application.Platform;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.control.skin.TableViewSkinBase;
import javafx.scene.control.skin.VirtualFlow;
import javafx.scene.image.Image;
import javafx.scene.input.KeyEvent;
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

  static
  {
    Thread.setDefaultUncaughtExceptionHandler(WindowManager::showError);
  }

  private static XDO    xdo;

  private static Method getPeerMethod;

  public static Field   flowField;

  static
  {
    try
    {
      getPeerMethod = Window.class.getDeclaredMethod("getPeer");
      getPeerMethod.setAccessible(true);
      flowField = TableViewSkinBase.class.getDeclaredField("flow");
      flowField.setAccessible(true);
    }
    catch (NoSuchMethodException | SecurityException | NoSuchFieldException e)
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

  public static void setStageIcon(Stage primaryStage, String path)
  {
    try
    {
      URL resourceUrl = ClassLoader.getSystemResource(path);

      if (resourceUrl != null)
      {
        primaryStage.getIcons().add(new Image(resourceUrl.toExternalForm()));
      }
      else
      {
        informOfMissingIconAndPrintClassAndModulePaths(null, path);
      }
    }
    catch (Throwable e)
    {
      informOfMissingIconAndPrintClassAndModulePaths(e, path);
    }
  }

  public static void informOfMissingIconAndPrintClassAndModulePaths(Throwable e, String filename)
  {
    if (e != null)
    {
      e.printStackTrace(System.err);
    }
    System.err.format("Could not find resource: %s\n");
    System.out.println("Classpath: " + System.getProperty("java.class.path"));
    System.out.println("Module path: " + System.getProperty("jdk.module.path"));
  }

  public static ScrollBar getTableVirtualFlowScrollbar(VirtualFlow<?> tableVirtualFlow,
                                                       boolean horizontal) throws IllegalAccessException,
                                                                           NoSuchFieldException
  {
    var scrollbar = horizontal ? "hbar" : "vbar";
    return (ScrollBar) getVirtualFlowField(scrollbar).get(tableVirtualFlow);
  }

  public static Field getVirtualFlowField(String fieldName) throws NoSuchFieldException
  {
    Field hbarField = VirtualFlow.class.getDeclaredField(fieldName);
    hbarField.setAccessible(true);
    return hbarField;
  }

  @SuppressWarnings("unchecked")
  public static <Y,T extends IndexedCell<? extends Y>>

         VirtualFlow<T>
         getVirtualFlow(Control treeTableView2)
  {
    try
    {
      return (VirtualFlow<T>) flowField.get(treeTableView2.getSkin());
    }
    catch (IllegalArgumentException | IllegalAccessException e)
    {
      Utensils.throwOrWrap(e);
      return null;
    }
  }

  public static void showAlert(String title, String header, String content)
  {
    Alert alert = new Alert(AlertType.ERROR);
    alert.setWidth(1400);
    alert.setResizable(true);
    alert.setTitle(title);
    alert.setHeaderText(header);
    alert.setContentText(content);
    alert.showAndWait();
  }

  public static void showAlert(String title, String msg)
  {
    showAlert(title, msg, msg);
  }

  public static void showAlert(String title, String msg, Throwable t)
  {
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PrintWriter           s    = new PrintWriter(baos);
    t.printStackTrace(s);
    s.flush();

    showAlert(title, msg, baos.toString());
  }

  public static void resizeColumn(TreeTableColumn<?, ?> column)
  {
    try
    {
      javafx.scene.Node node = column.getStyleableNode();
      if (node instanceof TableColumnHeader)
      {
        TableColumnHeader header = (TableColumnHeader) node;
        resizeMethod.invoke(header, -1);
      }
      else
      {
        System.err.format("wtf %s\n", Utensils.stackTraceToString(new Throwable()));
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  static
  {
    try
    {
      WindowManager.resizeMethod = TableColumnHeader.class.getDeclaredMethod("resizeColumnToFitContent", int.class);
      WindowManager.resizeMethod.setAccessible(true);
    }
    catch (NoSuchMethodException | SecurityException e)
    {
      Utensils.throwOrWrap(e);
    }
  }

  public static Method resizeMethod;

  public static void showError(Thread t, Throwable e)
  {
    Platform.runLater(() -> showAlert("Exception in " + t.getName(), e.getMessage(), e));
  }

  public static <N extends Node<?, ?, ?>> boolean anyExpanded(TreeItem<N> rootItem)
  {
    if (rootItem.isExpanded())
    {
      return true;
    }
    for (var item : rootItem.getChildren())
    {
      if (anyExpanded(item))
      {
        return true;
      }
    }
    return false;
  }

  public static HashMap<String, Boolean> enumerateNodeExpansionStates(HashMap<String, Boolean> states, TreeItem<?> item)
  {
    if (item != null && !item.isLeaf())
    {
      states.put(item.getValue().toString(), item.isExpanded());

      for (var child : item.getChildren())
      {
        enumerateNodeExpansionStates(states, child);
      }
    }
    return states;
  }

  public static HashMap<String, Boolean> applyNodeExpansionStates(HashMap<String, Boolean> states, TreeItem<?> item)
  {
    if (item != null && !item.isLeaf())
    {
      Boolean value = states.get(item.getValue().toString());
      if (value != null)
      {
        item.setExpanded(value);
      }

      for (var child : item.getChildren())
      {
        applyNodeExpansionStates(states, child);
      }
    }
    return states;
  }

  public static void addEmacsKeybindings(TextField textField)
  {
    textField.addEventFilter(KeyEvent.KEY_PRESSED, new EmacsKeybindingsEventHandler(textField));
  }

}