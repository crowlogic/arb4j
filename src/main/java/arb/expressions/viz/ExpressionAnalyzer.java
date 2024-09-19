package arb.expressions.viz;

import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Optional;
import java.util.function.Consumer;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.*;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.integer.*;
import arb.functions.polynomials.RealPolynomialFunction;
import arb.functions.rational.ComplexRationalFunctionSequence;
import arb.functions.rational.ComplexRationalNullaryFunction;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import arb.utensils.Utensils;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.cell.TextFieldListCell;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.image.Image;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.StringConverter;

/**
 * TODO: save/restore/copy/paste/drag&drop context variables
 * 
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

  static Method            resizeMethod;

  public static Class<?>[] TYPES = new Class[]
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

  void functionTypeSelected(Class<?> functionType)
  {
    if (functionType.equals(Function.class))
    {
    }
    else if (functionType.equals(NullaryFunction.class))
    {
      domainTypeBox.getSelectionModel().select(Object.class);
    }
    else if (functionType.equals(IntegerFunction.class))
    {
      selectTypes(Integer.class, Integer.class);
    }
    else if (functionType.equals(IntegerPolynomialSequence.class))
    {
      selectTypes(Integer.class, IntegerPolynomial.class);
    }
    else if (functionType.equals(IntegerPolynomialNullaryFunction.class))
    {
      selectTypes(Object.class, IntegerPolynomial.class);
    }
    else if (functionType.equals(RealFunction.class))
    {
      selectTypes(Real.class, Real.class);
    }
    else if (functionType.equals(RealPolynomialFunction.class))
    {
      selectTypes(RealPolynomial.class, RealPolynomial.class);
    }
    else if (functionType.equals(ComplexFunction.class))
    {
      selectTypes(Complex.class, Complex.class);
    }
    else if (functionType.equals(ComplexPolynomialSequence.class))
    {
      selectTypes(Integer.class, ComplexPolynomial.class);
    }
    else if (functionType.equals(ComplexNullaryFunction.class))
    {
      selectTypes(Object.class, Complex.class);
    }
    else if (functionType.equals(RationalFunctionSequence.class))
    {
      selectTypes(Integer.class, RationalFunction.class);
    }
    else if (functionType.equals(RationalNullaryFunction.class))
    {
      selectTypes(Object.class, RationalFunction.class);
    }
    else if (functionType.equals(ComplexToRealFunction.class))
    {
      selectTypes(Complex.class, Real.class);
    }
    else if (functionType.equals(ComplexRationalFunctionSequence.class))
    {
      selectTypes(Integer.class, ComplexRationalFunction.class);
    }
    else if (functionType.equals(ComplexRationalNullaryFunction.class))
    {
      selectTypes(Object.class, ComplexRationalFunction.class);
    }
    else if (functionType.equals(RealNullaryFunction.class))
    {
      selectTypes(Object.class, Real.class);
    }
    else if (functionType.equals(ComplexPolynomialNullaryFunction.class))
    {
      selectTypes(Object.class, ComplexPolynomial.class);
    }
    else if (functionType.equals(RealPolynomialFunction.class))
    {
      selectTypes(RealPolynomial.class, RealPolynomial.class);
    }
    else if (functionType.equals(RealToComplexFunction.class))
    {
      selectTypes(Real.class, Complex.class);
    }
    else if (functionType.equals(ComplexSequence.class))
    {
      selectTypes(Integer.class, Complex.class);
    }
    else if (functionType.equals(IntegerPolynomialSequence.class))
    {
      selectTypes(Integer.class, IntegerPolynomial.class);
    }
    else if (functionType.equals(IntegerSequence.class))
    {
      selectTypes(Integer.class, Integer.class);
    }
    else if (functionType.equals(RealPolynomialSequence.class))
    {
      selectTypes(Integer.class, RealPolynomial.class);
    }
    else if (functionType.equals(RationalFunctionSequence.class))
    {
      selectTypes(Integer.class, RationalFunction.class);
    }
    else if (functionType.equals(RealSequence.class))
    {
      selectTypes(Integer.class, Real.class);
    }
    else
    {
      System.err.println("functionTypeSelected: TODO: handle " + functionType);
    }
  }

  public void selectTypes(Class<?> aclass, Class<?> bclass)
  {
    domainTypeBox.getSelectionModel().select(aclass);
    codomainTypeBox.getSelectionModel().select(bclass);
  }

  public static Class<?>[] INTERFACES = new Class<?>[]
  { IntegerSequence.class,
    RealSequence.class,
    IntegerPolynomialSequence.class,
    RationalFunctionSequence.class,
    Function.class,
    NullaryFunction.class,
    IntegerFunction.class,
    IntegerPolynomialSequence.class,
    IntegerPolynomialNullaryFunction.class,
    RealFunction.class,
    RealPolynomialFunction.class,
    ComplexFunction.class,
    ComplexSequence.class,
    ComplexPolynomialSequence.class,
    ComplexNullaryFunction.class,
    RationalFunctionSequence.class,
    RationalNullaryFunction.class,
    RealPolynomialSequence.class,
    RealToComplexFunction.class,
    RealNullaryFunction.class,
    ComplexToRealFunction.class,
    ComplexRationalFunctionSequence.class,
    ComplexRationalNullaryFunction.class };

  static
  {
    Comparator<? super Class<?>> comparator = (a, b) ->
    {
      Class<?> classA = (Class<?>) a;
      Class<?> classB = (Class<?>) b;
      return classA.getSimpleName().compareTo(classB.getSimpleName());
    };
    Arrays.sort(INTERFACES, comparator);
    Arrays.sort(TYPES, comparator);

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

  public int                            bits                 = 128;

  public final ComboBox<Class<?>>       codomainTypeBox      = new ComboBox<Class<?>>();

  VBox                                  contextBox;

  public ListView<Named>                contextListView;

  private boolean                       contextViewVisible   = false;

  public final ComboBox<Class<?>>       domainTypeBox        = new ComboBox<Class<?>>();

  public final ComboBox<Class<?>>       functionTypeBox      = new ComboBox<Class<?>>();

  private SplitPane                     splitPane;

  private TabPane                       tabPane;

  private double[]                      lastDividerPositions = null;

  private ClassStringConverter<D, C, F> classStringConverter = new ClassStringConverter<D, C, F>();

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

  @SuppressWarnings("unlikely-arg-type")
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
                              new Label("Interface:"),
                              functionTypeBox);
    return typeBoxes;
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
    compileButton.setOnAction(e -> executeTabAction(ExpressionAnalyzerTab::compileExpression));

    Button expandAllButton = new Button("Expand All");
    expandAllButton.setOnAction(e -> executeTabAction(ExpressionAnalyzerTab::expandAllNodes));

    Button evaluateButton = new Button("Evaluate");
    evaluateButton.setOnAction(e ->
    {
      executeTabAction(ExpressionAnalyzerTab::evaluateExpression);
    });

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
    domainTypeBox.setConverter(classStringConverter);

    codomainTypeBox.getItems().addAll(TYPES);
    codomainTypeBox.setConverter(classStringConverter);

    functionTypeBox.getItems().addAll(INTERFACES);
    functionTypeBox.setConverter(classStringConverter);
    domainTypeBox.setValue(Integer.class);
    codomainTypeBox.setValue(RationalFunction.class);
    functionTypeBox.setValue(Function.class);
    functionTypeBox.setOnAction(e ->
    {
      functionTypeSelected(functionTypeBox.getValue());
    });
  }

  void showAlert(String title, String header, String content)
  {
    Alert alert = new Alert(AlertType.ERROR);
    alert.setWidth(1400);
    alert.setResizable(true);
    alert.setTitle(title);
    alert.setHeaderText(header);
    alert.setContentText(content);
    alert.showAndWait();
  }

  @Override
  public void start(Stage primaryStage)
  {
    setStageIcon(primaryStage);

    primaryStage.setWidth(2000);
    primaryStage.setHeight(950);

    Scene scene = new Scene(createMainLayout());

    scene.getStylesheets().add(Stylesheet.convertStylesheetToDataURI(Stylesheet.EASIER_ON_THE_EYES_STYLESHEET));

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

  public void setStageIcon(Stage primaryStage)
  {
    try
    {
      InputStream resource = ClassLoader.getSystemResourceAsStream("ExpressionAnalyzer.png");
      primaryStage.getIcons().add(new Image(resource));
    }
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
    }
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
      splitPane.setDividerPositions(lastDividerPositions == null ? new double[]
      { 0.15 } : lastDividerPositions);

    }
    contextViewVisible = !contextViewVisible;
  }

  public void showAlert(String string, String msg)
  {
    showAlert(string, msg, msg);
  }
}