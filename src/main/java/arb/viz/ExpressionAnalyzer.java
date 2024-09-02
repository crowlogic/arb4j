package arb.viz;

import java.lang.reflect.Method;
import java.util.Optional;
import java.util.function.Consumer;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.rational.ComplexRationalNullaryFunction;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.real.RealFunction;
import arb.utensils.Utensils;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.cell.TextFieldListCell;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.StringConverter;

/**
 * TODO: save/restore/copy/paste/drag&drop context variables TODO: confirm
 * before exiting or closing a tab
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionAnalyzer<D, C, F extends Function<D, C>> extends
                               Application
{

  public static final Class<?>[] INTERFACES = new Class<?>[]
  { Function.class,
    RealFunction.class,
    ComplexFunction.class,
    RationalFunctionSequence.class,
    ComplexRationalNullaryFunction.class };

  static Method                  resizeMethod;

  public static final Class<?>[] TYPES      = new Class[]
  { Object.class,
    Integer.class,
    GaussianInteger.class,
    Real.class,
    Complex.class,
    IntegerPolynomial.class,
    RealPolynomial.class,
    ComplexPolynomial.class,
    RationalFunction.class,
    ComplexRationalFunction.class,
    Fraction.class,
    ComplexFraction.class,
    RealMatrix.class,
    ComplexMatrix.class };

  static
  {
    try
    {
      resizeMethod =
                   TableColumnHeader.class.getDeclaredMethod("resizeColumnToFitContent", int.class);
      resizeMethod.setAccessible(true);
    }
    catch (NoSuchMethodException | SecurityException e)
    {
      Utensils.throwOrWrap(e);
    }
  }

  public static void main(String[] args)
  {
    launch(args);
  }

  public int                      bits                 = 128;

  public final ComboBox<Class<?>> codomainTypeBox      = new ComboBox<Class<?>>();

  VBox                            contextBox;

  public ListView<Named>          contextListView;

  private boolean                 contextViewVisible   = false;

  public final ComboBox<Class<?>> domainTypeBox        = new ComboBox<Class<?>>();

  public final ComboBox<Class<?>> functionTypeBox      = new ComboBox<Class<?>>();

  private SplitPane               splitPane;

  private TabPane                 tabPane;

  private double[]                lastDividerPositions = null;

  private void addNewExpressionTab()
  {
    Tab                            tab           =
                                       new Tab("Expression " + (tabPane.getTabs().size() + 1));
    ExpressionAnalyzerTab<D, C, F> expressionTab = new ExpressionAnalyzerTab<D, C, F>(this);
    tab.setContent(expressionTab);
    tabPane.getTabs().add(tab);
    tabPane.getSelectionModel().select(tab);

    updateContextListView();

    tab.setOnSelectionChanged(event ->
    {
      if (tab.isSelected())
      {
        updateContextListView();
      }
    });
  }

  private void updateContextListView()
  {
    Context currentContext = getCurrentContext();
    if (currentContext != null && contextListView != null)
    {
      contextListView.setItems(currentContext.variables);
    }
  }

  private void compileCurrentExpression()
  {
    executeTabAction(ExpressionAnalyzerTab::compileExpression);
  }

  public VBox createMainLayout()
  {
    tabPane = new TabPane();

    setupTypeBoxes();

    var mainLayout = new VBox(10);

    var typeBoxes  = createTypeBoxes();

    var buttonBox  = new HBox(10,
                              newButtonBox());

    var scrollpane = createScrollPane();

    mainLayout.getChildren().addAll(typeBoxes, buttonBox, scrollpane);

    return mainLayout;
  }

  protected ScrollPane createScrollPane()
  {
    var scrollpane = new ScrollPane(createSplitPane());
    VBox.setVgrow(scrollpane, Priority.ALWAYS);

    scrollpane.setFitToWidth(true);
    scrollpane.setMinViewportWidth(1800);
    scrollpane.setFitToHeight(true);
    scrollpane.setPannable(true);
    return scrollpane;
  }

  protected SplitPane createSplitPane()
  {
    splitPane       = new SplitPane();
    contextBox      = new VBox(10);
    contextListView = new ListView<Named>();
    var         converter   = new ContextVariableStringConverter<D, C, F>(this);
    ContextMenu contextMenu = newContextMenu(converter);
    contextListView.setContextMenu(contextMenu);
    contextBox.getChildren().addAll(new Label("Context Variables:"), contextListView);
    VBox.setVgrow(splitPane, Priority.ALWAYS);
    splitPane.getItems().add(tabPane);
    return splitPane;
  }

  private Optional<String> showVariableNameDialog(boolean rename)
  {
    TextInputDialog dialog = new TextInputDialog();
    dialog.setTitle("New Variable");
    dialog.setHeaderText(rename ? "Enter the new name for the variable:"
                                : "Enter the name for the new variable:");
    dialog.setContentText("Variable name:");

    // Set the owner to the primary stage
    dialog.initOwner(tabPane.getScene().getWindow());

    return dialog.showAndWait();
  }

  protected ContextMenu newContextMenu(StringConverter<Named> converter)
  {

    ContextMenu contextMenu = new ContextMenu(newDeleteVariableMenuItem(),
                                              newInsertNewRealVariable(),
                                              newRenameRealVariableMenuItem());

    contextListView.setCellFactory(ContextMenuListCell.<
                  Named>forListView(contextMenu, param -> new TextFieldListCell<Named>(converter)));

    contextListView.setEditable(true);
    return contextMenu;
  }

  public MenuItem newRenameRealVariableMenuItem()
  {
    MenuItem renameVariable = new MenuItem("Rename Variable");
    renameVariable.setOnAction(e ->
    {
      Named selectedItem = contextListView.getSelectionModel().getSelectedItem();
      if (selectedItem == null)
      {
        showAlert("Error", "No variable selected. Please select a variable to rename.");
        return;
      }

      Optional<String> result = showVariableNameDialog(true);
      result.ifPresent(newName ->
      {
        Context currentContext = getCurrentContext();
        if (currentContext != null)
        {
          String oldName = selectedItem.getName();
          currentContext.variables.rename(oldName, newName);
          updateContextListView();
        }
      });
    });
    return renameVariable;
  }

  public MenuItem newInsertNewRealVariable()
  {
    MenuItem insertNewRealVariable = new MenuItem("New Real Variable");
    insertNewRealVariable.setOnAction(e ->
    {
      Optional<String> result = showVariableNameDialog(false);
      result.ifPresent(name ->
      {
        Context currentContext = getCurrentContext();
        if (currentContext != null)
        {
          Real newVar = Real.named(name);
          currentContext.variables.add(newVar);
          updateContextListView();
        }
      });
    });
    return insertNewRealVariable;
  }

  public MenuItem newDeleteVariableMenuItem()
  {
    MenuItem deleteVariableMenuItem = new MenuItem("Delete Variable");
    deleteVariableMenuItem.setOnAction(e ->
    {
      Named selectedItem = contextListView.getSelectionModel().getSelectedItem();
      if (selectedItem != null)
      {
        Context currentContext = getCurrentContext();
        if (currentContext != null)
        {
          currentContext.variables.remove(selectedItem.getName());
          contextListView.getItems().remove(selectedItem);
        }
      }
    });
    return deleteVariableMenuItem;
  }

  protected HBox createTypeBoxes()
  {
    HBox typeBoxes = new HBox(10,
                              new Label("Domain:"),
                              domainTypeBox,
                              new Label("Codomain:"),
                              codomainTypeBox,
                              new Label("Function:"),
                              functionTypeBox);
    return typeBoxes;
  }

  private void evaluateExpression()
  {
    executeTabAction(ExpressionAnalyzerTab::evaluateExpression);
  }

  @SuppressWarnings("unchecked")
  private void executeTabAction(Consumer<ExpressionAnalyzerTab<D, C, F>> action)
  {
    Tab currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab != null)
    {
      javafx.scene.Node              content       = currentTab.getContent();

      ExpressionAnalyzerTab<D, C, F> expressionTab = (ExpressionAnalyzerTab<D, C, F>) content;

      action.accept(expressionTab);
    }
  }

  private void expandAllNodes()
  {
    executeTabAction(ExpressionAnalyzerTab::expandAllNodes);
  }

  @SuppressWarnings("unchecked")
  public Context getCurrentContext()
  {
    Tab currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab != null)
    {
      javafx.scene.Node              content       = currentTab.getContent();
      ExpressionAnalyzerTab<D, C, F> expressionTab = (ExpressionAnalyzerTab<D, C, F>) content;
      return expressionTab.context;
    }
    return null;
  }

  private HBox newButtonBox()
  {
    Button addTabButton = new Button("New");
    addTabButton.setOnAction(e -> addNewExpressionTab());

    Button compileButton = new Button("Compile");
    compileButton.setOnAction(e -> compileCurrentExpression());

    Button expandAllButton = new Button("Expand All");
    expandAllButton.setOnAction(e -> expandAllNodes());

    Button evaluateButton = new Button("Evaluate");
    evaluateButton.setOnAction(e -> evaluateExpression());

    Button toggleContextButton = new Button("Toggle Context");
    toggleContextButton.setOnAction(e -> toggleContextView());

    return new HBox(10,
                    addTabButton,
                    compileButton,
                    expandAllButton,
                    evaluateButton,
                    toggleContextButton);
  }

  private void setupTypeBoxes()
  {

    domainTypeBox.getItems().addAll(TYPES);
    codomainTypeBox.getItems().addAll(TYPES);
    functionTypeBox.getItems().addAll(INTERFACES);
    domainTypeBox.setValue(Integer.class);
    codomainTypeBox.setValue(RationalFunction.class);
    functionTypeBox.setValue(Function.class);
  }

  void showAlert(String title, String content)
  {
    Alert alert = new Alert(AlertType.ERROR);
    alert.setTitle(title);
    alert.setHeaderText(null);
    alert.setContentText(content);
    alert.setWidth(800);
    alert.showAndWait();
  }

  @Override
  public void start(Stage primaryStage)
  {
    primaryStage.setWidth(1900);
    primaryStage.setHeight(950);

    Scene scene = new Scene(createMainLayout());

    scene.getStylesheets().add(TODO.convertStylesheetToDataURI(TODO.EASIER_ON_THE_EYES_STYLESHEET));

    scene.addEventFilter(KeyEvent.KEY_PRESSED, event ->
    {
      if (event.getCode() == KeyCode.ESCAPE)
      {
        primaryStage.fireEvent(new WindowEvent(primaryStage,
                                               WindowEvent.WINDOW_CLOSE_REQUEST));
      }
    });

    primaryStage.setOnCloseRequest(evt ->
    {
      Alert alert = new Alert(AlertType.CONFIRMATION);
      alert.setTitle("Confirm Close");
      alert.setHeaderText("Close program?");
      alert.showAndWait().filter(r -> r != ButtonType.OK).ifPresent(r -> evt.consume());
    });

    primaryStage.setScene(scene);
    primaryStage.setTitle("Expression Analyzer");
    primaryStage.show();

    addNewExpressionTab();
  }

  private void toggleContextView()
  {
    if (contextViewVisible)
    {
      lastDividerPositions = splitPane.getDividerPositions();
      splitPane.getItems().remove(contextBox);
    }
    else
    {
      contextListView.setItems(getCurrentContext().variables);
      splitPane.getItems().add(0, contextBox);
      if (lastDividerPositions == null)
      {
        splitPane.setDividerPositions(0.2);
      }
      else
      {
        splitPane.setDividerPositions(lastDividerPositions);
      }
    }
    contextViewVisible = !contextViewVisible;
  }
}