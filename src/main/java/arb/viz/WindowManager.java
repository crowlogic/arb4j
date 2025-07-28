package arb.viz;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import arb.XDO;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.viz.EmacsKeybindingsEventHandler;
import arb.utensils.ShellFunctions;
import arb.utensils.Utensils;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.plugins.CrosshairIndicator;
import io.fair_acc.chartfx.plugins.EditAxis;
import io.fair_acc.chartfx.plugins.TableViewer;
import io.fair_acc.chartfx.plugins.Zoomer;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Control;
import javafx.scene.control.IndexedCell;
import javafx.scene.control.Skin;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.control.TreeTableView;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.control.skin.TableViewSkinBase;
import javafx.scene.control.skin.VirtualFlow;
import javafx.scene.image.Image;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.RowConstraints;
import javafx.stage.Stage;
import javafx.stage.Window;
import javafx.stage.WindowEvent;

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
    Thread.setDefaultUncaughtExceptionHandler(WindowManager::showError);
  }
  static
  {
    System.loadLibrary("arblib");
  }

  public static final String MORE_CONDUCIVE_STYLESHEET = ".scroll-bar .thumb {\n"
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
    String encoded =
                   Base64.getEncoder().encodeToString(CSS_CONTENT.getBytes(StandardCharsets.UTF_8));
    return "data:text/css;base64," + encoded;
  }

  public static void setMoreConduciveStyle(Scene scene)
  {
    Platform.runLater(() ->
    {
      scene.getStylesheets().add(convertStylesheetToDataURI(MORE_CONDUCIVE_STYLESHEET));
    });
  }

  private static XDO    xdo;

  private static Method peerGetter;

  private static Field  tableViewSkinBaseFlowField;

  private static Method resizeMethod;

  static
  {
    try
    {
      peerGetter = Window.class.getDeclaredMethod("getPeer");
      peerGetter.setAccessible(true);
      tableViewSkinBaseFlowField = TableViewSkinBase.class.getDeclaredField("flow");
      tableViewSkinBaseFlowField.setAccessible(true);
      resizeMethod =
                   TableColumnHeader.class.getDeclaredMethod("resizeColumnToFitContent", int.class);
      resizeMethod.setAccessible(true);
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  static
  {
    xdo = arblib.xdo_new(System.getenv("DISPLAY"));
  }

  protected static void bringToFront(Stage stage)
  {
    assert stage != null && stage.isShowing() : "stage is null or not showing";
    long windowId = getX11WindowId(stage);
    assert windowId != 0 : "No X11 Window ID Found For " + stage;
    bringWindowToTop(windowId);
  }

  private static Method rawHandleGetter;

  public static long getX11WindowId(Stage stage)
  {
    try
    {
      Object tkStage = peerGetter.invoke(stage);
      if (tkStage == null)
      {
        return 0;
      }
      if (rawHandleGetter == null)
      {
        rawHandleGetter = tkStage.getClass().getMethod("getRawHandle");
      }
      return (long) rawHandleGetter.invoke(tkStage);
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

  public static Field getVirtualFlowField(String fieldName) throws NoSuchFieldException
  {
    Field hbarField = VirtualFlow.class.getDeclaredField(fieldName);
    hbarField.setAccessible(true);
    return hbarField;
  }

  @SuppressWarnings("unchecked")
  public static <Y, T extends IndexedCell<? extends Y>> VirtualFlow<T> getVirtualFlow(Skin<?> skin)
  {
    try
    {
      assert skin != null : "skin is null";
      return (VirtualFlow<T>) tableViewSkinBaseFlowField.get(skin);
    }
    catch (IllegalArgumentException | IllegalAccessException e)
    {
      Utensils.throwOrWrap(e);
      return null;
    }
  }

  public static <Y, T extends IndexedCell<? extends Y>>
         VirtualFlow<T>
         getVirtualFlow(TreeTableView<?> control)
  {
    return getVirtualFlow(control.getSkin());
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

    if ((t instanceof RuntimeException) && t.getCause() != null)
    {
      System.err.format("Not showing RuntimeException wrapper: ");
      t.printStackTrace(System.err);
      t = t.getCause();
    }
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

  public static boolean shouldShowErrors = true;

  public static void showError(Thread t, Throwable e)
  {
    e.printStackTrace(System.err);
    if (shouldShowErrors)
    {
      Platform.runLater(() -> showAlert("Exception in " + t.getName(), e.getClass().toString(), e));
    }
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

  public static void makeTableViewPannable(Control tableView)
  {
    tableView.skinProperty().addListener(listener ->
    {
      try
      {
        VirtualFlow<IndexedCell<? extends Object>> flow = getVirtualFlow(tableView.getSkin());
        if (flow != null)
        {
          flow.setPannable(true);
        }
      }
      catch (Throwable e)
      {
        e.printStackTrace();
      }

    });
  }

  public static void installEscapeKeyCloseHandler(Stage stage)
  {
    stage.getScene().addEventFilter(KeyEvent.KEY_PRESSED, event ->
    {
      if (event.getCode() == KeyCode.ESCAPE)
      {
        stage.fireEvent(new WindowEvent(stage,
                                        WindowEvent.WINDOW_CLOSE_REQUEST));
      }
    });
  }

  public static GridPane createGridPane(XYChart[] charts)
  {
    GridPane gridPane = new GridPane();
    gridPane.setHgap(10);
    gridPane.setVgap(10);
  
    var col1 = new ColumnConstraints();
    col1.setPercentWidth(50);
    var col2 = new ColumnConstraints();
    col2.setPercentWidth(50);
    gridPane.getColumnConstraints().addAll(col1, col2);
  
    var row1 = new RowConstraints();
    row1.setPercentHeight(50);
    var row2 = new RowConstraints();
    row2.setPercentHeight(50);
    gridPane.getRowConstraints().addAll(row1, row2);
  
    for (XYChart chart : charts)
    {
      chart.setPrefSize(10000, 10000);
      GridPane.setHgrow(chart, Priority.ALWAYS);
      GridPane.setVgrow(chart, Priority.ALWAYS);
    }
  
    gridPane.add(charts[0], 0, 0);
    gridPane.add(charts[1], 1, 0);
    gridPane.add(charts[2], 0, 1);
    gridPane.add(charts[3], 1, 1);
  
    return gridPane;
  }

  /**
   * TODO: see if there is a way to make the crosshair path and label render with
   * an XOR mask instead of a fixed color so it would work on all backgrounds
   * 
   * @param chart
   */
  public static void configureChart(XYChart chart, boolean light)
  {
    chart.getPlugins()
         .addAll(new EditAxis(AxisMode.XY),
                 new Zoomer(),
                 new TableViewer(),
                 new CrosshairIndicator());
    chart.getRenderers().forEach(renderer -> renderer.getAxes().addAll(chart.getAxes()));
    chart.getStylesheets()
         .add(String.format("data:text/css,.chart-crosshair-path { -fx-stroke: %s; -fx-stroke-width: 2; }",
                            light ? "black" : "white"));
    chart.getStylesheets()
         .add(String.format("data:text/css,.chart-crosshair-label { -fx-fill: %s; -fx-font-size: 16px; }",
                            light ? "orange" : "yellow"));
  }

}