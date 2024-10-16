package arb.viz;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;

import arb.XDO;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.Node;
import arb.expressions.viz.EmacsKeybindingsEventHandler;
import arb.utensils.ShellFunctions;
import arb.utensils.Utensils;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.control.skin.TableViewSkinBase;
import javafx.scene.control.skin.VirtualFlow;
import javafx.scene.image.Image;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.stage.Stage;
import javafx.stage.Window;

/**
 * Restore the completely broken toFront() functionality in Javafx that was put
 * there because microsoft is a flaming heap of dung
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

  public static final String EASIER_ON_THE_EYES_STYLESHEET = ".scroll-bar .thumb {\n"
                                                             + "    -fx-background-color: #808080; /* Change this to your desired thumb color */\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".scroll-bar .increment-button, .scroll-bar .decrement-button {\n"
                                                             + "    -fx-background-color: #a9a9a9; /* Change this to your desired button color */\n"
                                                             + "}\n"
                                                             + ".tree-table-view .column-resize-line {\n"
                                                             + "    -fx-background-color: #ff0000; /* Change this to your desired color */\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".tree-table-view .tree-table-row-cell .tree-table-cell .text {\n"
                                                             + "    -fx-font-size: 18px; /* This specifically targets TreeTableView cells */\n"
                                                             + "    -fx-fill: #ffff00; /* Change this to your desired color */\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".root {\n"
                                                             + "    -fx-font-weight: bold; /* Make font bold */\n"
                                                             + "  -fx-font-size: 18px; /* Change this value to increase/decrease the font size */\n"
                                                             + "  -fx-base: #1f273f;\n"
                                                             + "  -fx-default-button: #7f878f;\n"
                                                             + "  -fx-focus-color: #efefef;\n"
                                                             + "  -fx-focused-text-base-color: ladder(-fx-selection-bar, -fx-light-text-color 45%, -fx-dark-text-color\n"
                                                             + "    46%, -fx-dark-text-color 59%, -fx-mid-text-color 60%);\n"
                                                             + "  -fx-focused-mark-color: -fx-focused-text-base-color;\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".text-input:focused {\n"
                                                             + "  -fx-highlight-text-fill: ladder(-fx-highlight-fill, -fx-light-text-color 45%, -fx-dark-text-color\n"
                                                             + "    46%, -fx-dark-text-color 59%, -fx-mid-text-color 60%);\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".chart-legend-item {\n"
                                                             + "  -fx-font-size: 20px;\n"
                                                             + "  font-size: 20px;\n"
                                                             + "}\n"
                                                             + "\n"
                                                             + ".chart-datapoint-tooltip-label {\n"
                                                             + "  -fx-font-size: 20px;\n"
                                                             + "  font-size: 20px;}\n"
                                                             + ".tree-table-row-cell { -fx-border-color: #CCCCCC; -fx-border-width: 0 0 1 0; }\n";

  public static String convertStylesheetToDataURI(String CSS_CONTENT)
  {
    String encoded = Base64.getEncoder().encodeToString(CSS_CONTENT.getBytes(StandardCharsets.UTF_8));
    return "data:text/css;base64," + encoded;
  }

  public static void setDarkStyle(Scene scene)
  {
    scene.getStylesheets().add(convertStylesheetToDataURI(EASIER_ON_THE_EYES_STYLESHEET));
  }

  private static XDO    xdo;

  private static Method windowGetPeerMethod;

  private static Field  tableViewSkinBaseFlowField;

  private static Method resizeMethod;

  static
  {
    try
    {
      windowGetPeerMethod = Window.class.getDeclaredMethod("getPeer");
      windowGetPeerMethod.setAccessible(true);
      tableViewSkinBaseFlowField = TableViewSkinBase.class.getDeclaredField("flow");
      tableViewSkinBaseFlowField.setAccessible(true);
      resizeMethod = TableColumnHeader.class.getDeclaredMethod("resizeColumnToFitContent", int.class);
      resizeMethod.setAccessible(true);
    }
    catch (NoSuchMethodException | SecurityException | NoSuchFieldException e)
    {
      e.printStackTrace();
    }
  }

  static
  {
    xdo = arblib.xdo_new(System.getenv("DISPLAY"));
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
      Object tkStage = windowGetPeerMethod.invoke(stage);

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
  public static <Y, T extends IndexedCell<? extends Y>> VirtualFlow<T> getVirtualFlow(Control treeTableView2)
  {
    try
    {
      return (VirtualFlow<T>) tableViewSkinBaseFlowField.get(treeTableView2.getSkin());
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
    alert.setHeight(1000);
    alert.setResizable(true);
    alert.setTitle(title);
    alert.setHeaderText(header);

    TextArea textArea = new TextArea(content);
    textArea.setEditable(false);
    textArea.setWrapText(true);
    textArea.setMinHeight(600);
    textArea.setPrefHeight(800);
    textArea.setPrefWidth(1300);
    ;
    textArea.setMaxWidth(Double.MAX_VALUE);
    textArea.setMaxHeight(Double.MAX_VALUE);
    GridPane.setVgrow(textArea, Priority.ALWAYS);
    GridPane.setHgrow(textArea, Priority.ALWAYS);

    GridPane expContent = new GridPane();
    expContent.setMaxWidth(Double.MAX_VALUE);
    expContent.add(textArea, 0, 1);

    // Set expandable Exception into the dialog pane.
    alert.getDialogPane().setExpandableContent(expContent);
    alert.getDialogPane().setExpanded(true);

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
      javafx.scene.Node node   = column.getStyleableNode();
      TableColumnHeader header = (TableColumnHeader) node;
      if (header != null)
      {
        resizeMethod.invoke(header, -1);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

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

  public static void initializeJavaFxIfNecessary()
  {
    if (!ShellFunctions.javaFxInitialized)
    {
      ShellFunctions.javaFxInitialized = true;
      try
      {
        Platform.startup(() ->
        {
          Platform.setImplicitExit(false);
        });
      }
      catch (Exception e)
      {
        e.printStackTrace(System.err);
      }
    }
  }

}