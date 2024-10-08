package arb.expressions.viz;

import java.io.Closeable;
import java.util.Arrays;
import java.util.Optional;
import java.util.function.Consumer;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.viz.context.ContextFieldListCell;
import arb.expressions.viz.context.ContextMenuListCell;
import arb.expressions.viz.context.ContextVariableStringConverter;
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
import arb.viz.WindowManager;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
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
public class ExpressionEvaluator<D, C extends Closeable, F extends Function<D, C>> extends
                     Application
{

  public static Class<?>[] TYPES = new Class[]

  { AlgebraicNumber.class,
    Object.class,
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
    else if (functionType.equals(Sequence.class))
    {
      domainTypeBox.getSelectionModel().select(Integer.class);
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

  public static Class<?>[]            INTERFACES = new Class<?>[]
  { IntegerSequence.class,
    RealSequence.class,
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
    ComplexRationalNullaryFunction.class,
    Sequence.class };

  static
  {
    Arrays.sort(INTERFACES, Utensils.classNameComparator);
    Arrays.sort(TYPES, Utensils.classNameComparator);
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

  /**
   * TODO: these need to be moved to the {@link ExpressionTree}
   */
  public final ComboBox<Class<?>>       domainTypeBox        = new ComboBox<Class<?>>();

  public final ComboBox<Class<?>>       functionTypeBox      = new ComboBox<Class<?>>();

  private SplitPane                     splitPane;

  private TabPane                       tabPane;

  private double[]                      lastDividerPositions = null;

  private ClassStringConverter<D, C, F> classStringConverter = new ClassStringConverter<D, C, F>();

  private void addNewExpressionTab()
  {
    Tab tab           = new Tab("Expression " + (tabPane.getTabs().size() + 1));
    var expressionTab = new ExpressionTree<D, C, F>(this);
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
    splitPane  = new SplitPane();
    contextBox = new VBox(10);
    constructContextListView();

    var         converter   = new ContextVariableStringConverter<D, C, F>(this);
    ContextMenu contextMenu = newContextMenu(converter);
    contextListView.setContextMenu(contextMenu);
    contextBox.getChildren().addAll(new Label("Context Variables:"), contextListView);
    VBox.setVgrow(splitPane, Priority.ALWAYS);
    splitPane.getItems().add(tabPane);
    return splitPane;
  }

  public void constructContextListView()
  {
    contextListView = new ListView<Named>();

    contextListView.setOnEditCommit(new ContextVariableEditCommitHandler<D, C, F>(this));

  }

  public void addEmacsKeybindings(TextField textField)
  {
    textField.addEventFilter(KeyEvent.KEY_PRESSED, new EmacsKeybindingsEventHandler(textField));
  }

  private Optional<String> showVariableNameDialog(boolean rename)
  {
    ChoiceDialog<Class<?>> choiceDialog = new ChoiceDialog<>(Real.class,
                                                             TYPES);
    choiceDialog.setTitle("Select Type");
    choiceDialog.setContentText("What's the new variable type?");
    choiceDialog.initOwner(tabPane.getScene().getWindow());
    var typeChoice = choiceDialog.showAndWait();
    if (typeChoice.isEmpty())
    {
      return Optional.empty();
    }
    System.err.println("TODO: refactor this for type=" + typeChoice.get());
    // Set the owner to the primary stage
    TextInputDialog dialog = new TextInputDialog();
    dialog.setTitle("New Variable");
    dialog.setHeaderText(rename ? "Enter the new name for the variable:" : "Enter the name for the new variable:");
    dialog.setContentText("Variable name:");
    dialog.initOwner(tabPane.getScene().getWindow());

    return dialog.showAndWait();
  }

  protected ContextMenu newContextMenu(StringConverter<Named> converter)
  {
    ContextMenu contextMenu = new ContextMenu(newDeleteVariableMenuItem(),
                                              newNewVariableMenuItem(),
                                              newRenameRealVariableMenuItem());

    contextListView.setCellFactory(ContextMenuListCell.forListView(contextMenu,
                                                                   param -> new ContextFieldListCell<D, C, F>(this,
                                                                                                              converter)));

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
        WindowManager.showAlert("Error", "The variable to rename must be selected.");
        return;
      }

      showVariableNameDialog(true).ifPresent(newName ->
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

  public MenuItem newNewVariableMenuItem()
  {
    MenuItem insertNewRealVariable = new MenuItem("New Variable");
    insertNewRealVariable.setOnAction(e -> showVariableNameDialog(false).ifPresent(name ->
    {
      Context currentContext = getCurrentContext();
      if (currentContext != null)
      {
        Real newVar = Real.named(name);
        currentContext.variables.add(newVar);
        updateContextListView();
      }
    }));

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
  private void executeTabAction(Consumer<ExpressionTree<D, C, F>> action)
  {
    Tab currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab != null)
    {
      var content       = currentTab.getContent();
      var expressionTab = (ExpressionTree<D, C, F>) content;
      action.accept(expressionTab);
    }
  }

  @SuppressWarnings("unchecked")
  public Context getCurrentContext()
  {
    Tab currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab != null)
    {
      var content       = currentTab.getContent();
      var expressionTab = (ExpressionTree<D, C, F>) content;
      return expressionTab.context;
    }
    return null;
  }

  private HBox newButtonBox()
  {
    Button addTabButton = new Button("New");
    addTabButton.setOnAction(e -> addNewExpressionTab());

    Button compileButton = new Button("Compile");
    compileButton.setOnAction(e -> executeTabAction(ExpressionTree::compileExpression));

    Button expandAllButton = new Button("Expand All");
    expandAllButton.setOnAction(e -> executeTabAction(ExpressionTree::expandAllNodes));

    Button evaluateButton = new Button("Evaluate");
    evaluateButton.setOnAction(e -> evaluate());

    Button toggleContextButton = new Button("Toggle Context");
    toggleContextButton.setOnAction(e -> toggleContextView());

    Button saveButton = new Button("Save");
    saveButton.setOnAction(e -> executeTabAction(ExpressionTree::save));

    Button loadButton = new Button("Load");
    loadButton.setOnAction(e -> executeTabAction(ExpressionTree::load));

    Button graphButton = new Button("Graph");
    graphButton.setOnAction(e -> executeTabAction(ExpressionTree::graph));

    return new HBox(10,
                    addTabButton,
                    compileButton,
                    expandAllButton,
                    evaluateButton,
                    toggleContextButton,
                    saveButton,
                    loadButton,
                    graphButton);
  }

  public void evaluate()
  {
    executeTabAction(ExpressionTree::evaluateExpression);
  }

  private void setupTypeBoxes()
  {
    domainTypeBox.getItems().addAll(TYPES);
    domainTypeBox.setConverter(classStringConverter);

    codomainTypeBox.getItems().addAll(TYPES);
    codomainTypeBox.setConverter(classStringConverter);

    functionTypeBox.getItems().addAll(INTERFACES);
    functionTypeBox.setConverter(classStringConverter);
    domainTypeBox.setValue(Complex.class);
    codomainTypeBox.setValue(Complex.class);
    functionTypeBox.setOnAction(e ->
    {
      functionTypeSelected(functionTypeBox.getValue());
    });
    functionTypeBox.setValue(ComplexFunction.class);
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
      if (shouldConfirmClose())
      {
        Alert alert = new Alert(AlertType.CONFIRMATION);
        alert.setTitle("Confirm Close");
        alert.setHeaderText("Close program?");
        alert.showAndWait().filter(r -> r != ButtonType.OK).ifPresent(r -> evt.consume());
      }
    });

    primaryStage.setScene(scene);
    primaryStage.setTitle("Expression Analyzer");
    primaryStage.show();

    addNewExpressionTab();

  }

  boolean shouldConfirmClose()
  {
    return false;
  }

  public void setStageIcon(Stage primaryStage)
  {
    WindowManager.setStageIcon(primaryStage, "ExpressionAnalyzer.png");
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
      { 0.19 } : lastDividerPositions);

    }
    contextViewVisible = !contextViewVisible;
  }

}