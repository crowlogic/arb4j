package arb.viz;

import java.lang.reflect.Method;
import java.util.function.Consumer;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.rational.ComplexRationalNullaryFunction;
import arb.utensils.Utensils;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class ExpressionAnalyzer<D, C, F extends Function<D, C>> extends
                               Application
{

  private TabPane    tabPane;
  ComboBox<Class<?>> domainTypeBox;
  ComboBox<Class<?>> codomainTypeBox;
  ComboBox<Class<?>> functionTypeBox;

  static Method      resizeMethod;
  private boolean    contextViewVisible = false;
  VBox               contextBox;
  private SplitPane  splitPane;

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

  public VBox createMainLayout()
  {
    tabPane         = new TabPane();
    domainTypeBox   = new ComboBox<>();
    codomainTypeBox = new ComboBox<>();
    functionTypeBox = new ComboBox<>();

    setupTypeBoxes();

    VBox mainLayout = new VBox(10);
    HBox typeBoxes  = new HBox(10,
                               new Label("Domain:"),
                               domainTypeBox,
                               new Label("Codomain:"),
                               codomainTypeBox,
                               new Label("Function:"),
                               functionTypeBox);
    HBox buttonBox  = new HBox(10,
                               newButtonBox());
    splitPane       = new SplitPane();
    contextBox      = new VBox(10);
    contextListView = new ListView<String>();
    contextBox.getChildren().addAll(new Label("Context Variables:"), contextListView);

    VBox.setVgrow(splitPane, Priority.ALWAYS);
    splitPane.getItems().add(tabPane);

    var scrollpane = new ScrollPane(splitPane);
    VBox.setVgrow(scrollpane, Priority.ALWAYS);

    scrollpane.setFitToWidth(true);
    scrollpane.setMinViewportWidth(1800);
    scrollpane.setFitToHeight(true);
    scrollpane.setPannable(true);

    mainLayout.getChildren().addAll(typeBoxes, buttonBox, scrollpane);
    return mainLayout;
  }

  @Override
  public void start(Stage primaryStage)
  {
    primaryStage.setWidth(1800);
    primaryStage.setHeight(900);

    Scene scene = new Scene(createMainLayout());

    scene.getStylesheets().add(TODO.convertStylesheetToDataURI(TODO.EASIER_ON_THE_EYES_STYLESHEET));

    scene.addEventFilter(KeyEvent.KEY_PRESSED, event ->
    {
      if (event.getCode() == KeyCode.ESCAPE)
      {
        primaryStage.close();
      }
    });

    primaryStage.setScene(scene);
    primaryStage.setTitle("Expression Analyzer");
    primaryStage.show();

    addNewExpressionTab();
  }

  private void setupTypeBoxes()
  {
    domainTypeBox.getItems().addAll(TYPES);
    codomainTypeBox.getItems().addAll(TYPES);
    functionTypeBox.getItems().addAll(Function.class, ComplexRationalNullaryFunction.class);
    domainTypeBox.setValue(Integer.class);
    codomainTypeBox.setValue(RationalFunction.class);
    functionTypeBox.setValue(Function.class);
  }

  private void addNewExpressionTab()
  {
    Tab                    tab           = new Tab("Expression " + (tabPane.getTabs().size() + 1));
    ExpressionTab<D, C, F> expressionTab = new ExpressionTab<D, C, F>(this);
    tab.setContent(expressionTab);
    tabPane.getTabs().add(tab);
    tabPane.getSelectionModel().select(tab);
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

    HBox buttonBox = new HBox(10,
                              addTabButton,
                              compileButton,
                              expandAllButton,
                              evaluateButton,
                              toggleContextButton);
    return buttonBox;
  }

  private void toggleContextView()
  {
    if (contextViewVisible)
    {
      splitPane.getItems().remove(contextBox);
    }
    else
    {
      contextListView.setItems(getContext().variables);
      splitPane.getItems().add(0, contextBox);
      splitPane.setDividerPositions(0.2);
    }
    contextViewVisible = !contextViewVisible;
  }

  @SuppressWarnings("unchecked")
  public Context getContext()
  {
    Tab currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab != null)
    {
      javafx.scene.Node      content       = currentTab.getContent();
      ExpressionTab<D, C, F> expressionTab = (ExpressionTab<D, C, F>) content;
      return expressionTab.context;
    }
    return null;
  }

  @SuppressWarnings("unchecked")
  private void executeTabAction(Consumer<ExpressionTab<D, C, F>> action)
  {
    Tab currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab != null)
    {
      javafx.scene.Node      content       = currentTab.getContent();

      ExpressionTab<D, C, F> expressionTab = (ExpressionTab<D, C, F>) content;

      action.accept(expressionTab);
    }
  }

  private void compileCurrentExpression()
  {
    executeTabAction(ExpressionTab::compileExpression);
  }

  private void expandAllNodes()
  {
    executeTabAction(ExpressionTab::expandAllNodes);
  }

  private void evaluateExpression()
  {
    executeTabAction(ExpressionTab::evaluateExpression);
  }

  public static final Class<?>[] TYPES = new Class[]
  { Object.class,
    Integer.class,
    Real.class,
    Complex.class,
    RealPolynomial.class,
    ComplexPolynomial.class,
    RationalFunction.class,
    ComplexRationalFunction.class,
    Fraction.class,
    ComplexFraction.class };
  public ListView<String>        contextListView;

  void showAlert(String title, String content)
  {
    Alert alert = new Alert(AlertType.ERROR);
    alert.setTitle(title);
    alert.setHeaderText(null);
    alert.setContentText(content);
    alert.setWidth(800);
    alert.showAndWait();
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}