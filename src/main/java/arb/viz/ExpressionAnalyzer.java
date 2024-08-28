package arb.viz;

import static arb.utensils.Utensils.wrapOrThrow;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Map;
import java.util.function.Consumer;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.utensils.Utensils;
import arb.utensils.text.trees.NodeTreeItem;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.geometry.Insets;
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

  private TabPane            tabPane;
  private ComboBox<Class<?>> domainTypeBox;
  private ComboBox<Class<?>> codomainTypeBox;
  private static Method      resizeMethod;
  private boolean            contextViewVisible = false;
  private VBox               contextBox;
  private SplitPane          splitPane;

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

    setupTypeBoxes();

    VBox mainLayout = new VBox(10);
    HBox typeBoxes  = new HBox(10,
                               new Label("Domain:"),
                               domainTypeBox,
                               new Label("Codomain:"),
                               codomainTypeBox);

    splitPane  = new SplitPane();
    contextBox = new VBox(10);
    contextBox.getChildren().addAll(new Label("Context Variables:"), new ListView<String>());

    VBox.setVgrow(splitPane, Priority.ALWAYS);
    splitPane.getItems().add(tabPane);

    mainLayout.getChildren().addAll(typeBoxes, splitPane, newButtonBox());
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

    domainTypeBox.setValue(Integer.class);
    codomainTypeBox.setValue(RationalFunction.class);
  }

  private void addNewExpressionTab()
  {
    Tab           tab           = new Tab("Expression " + (tabPane.getTabs().size() + 1));
    ExpressionTab expressionTab = new ExpressionTab();
    var           scrollpane    = new ScrollPane(expressionTab);
    scrollpane.setFitToWidth(true);
    scrollpane.setMinViewportWidth(1800);
    scrollpane.setFitToHeight(true);
    scrollpane.setPannable(true);

    tab.setContent(scrollpane);
    tabPane.getTabs().add(tab);
    tabPane.getSelectionModel().select(tab);
  }

  private HBox newButtonBox()
  {
    Button addTabButton = new Button("New Expression");
    addTabButton.setOnAction(e -> addNewExpressionTab());

    Button compileButton = new Button("Compile Expression");
    compileButton.setOnAction(e -> compileCurrentExpression());

    Button expandAllButton = new Button("Expand All");
    expandAllButton.setOnAction(e -> expandAllNodes());

    Button evaluateButton = new Button("Evaluate");
    evaluateButton.setOnAction(e -> evaluateExpression());

    Button toggleContextButton = new Button("Toggle Context View");
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
      splitPane.getItems().add(0, contextBox);
      splitPane.setDividerPositions(0.2);
    }
    contextViewVisible = !contextViewVisible;
  }

  @SuppressWarnings("unchecked")
  private void executeTabAction(Consumer<ExpressionTab> action)
  {
    Tab currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab != null)
    {
      javafx.scene.Node content       = currentTab.getContent();
      ScrollPane        scrollPane    = (ScrollPane) content;
      ExpressionTab     expressionTab = (ExpressionAnalyzer<D,
                    C,
                    F>.ExpressionTab) scrollPane.getContent();

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
  { Integer.class,
    Real.class,
    Complex.class,
    RealPolynomial.class,
    ComplexPolynomial.class,
    RationalFunction.class,
    ComplexRationalFunction.class,
    Fraction.class,
    ComplexFraction.class };

  private class ExpressionTab extends
                              VBox
  {
    private TextField                    expressionInput;
    private TreeTableView<Node<D, C, F>> treeTableView;
    private Expression<D, C, F>          expr;
    private F                            instance;
    private C                            result;
    private Context                      context;

    public ExpressionTab()
    {
      super(10);
      this.context    = new Context();

      expressionInput = new TextField();
      expressionInput.setPromptText("Enter expression here");
      expressionInput.setText("n➔(1/2)₍ₙ₎*(z/2)^(-n)*pFq([1/2-n/2,-n/2],[1/2,-n,1-1/2-n],-z^2)");
      ;
      expressionInput.setMaxWidth(1000);

      treeTableView = new TreeTableView<>();
      setupTreeTableView();

      VBox.setVgrow(treeTableView, Priority.ALWAYS);
      HBox.setHgrow(treeTableView, Priority.ALWAYS);

      this.getChildren().addAll(expressionInput, treeTableView);
      this.setPadding(new Insets(10));
      VBox.setVgrow(this, Priority.ALWAYS);
    }

    @SuppressWarnings("unchecked")
    private void setupTreeTableView()
    {
      treeTableView.setColumnResizePolicy(TreeTableView.UNCONSTRAINED_RESIZE_POLICY);

      var nodeCol           = newNodeCol();
      var nodeTypeCol       = newNodeTypeCol();
      var nodeTypeResultCol = newNodeTypeResultCol();
      var typesetCol        = newTypesetCol();
      var fieldCol          = newFieldCol();
      var valueCol          = newValueCol();

      treeTableView.getColumns()
                   .addAll(nodeCol, nodeTypeCol, nodeTypeResultCol, typesetCol, fieldCol, valueCol);
    }

    @SuppressWarnings("unchecked")
    public void compileExpression()
    {
      String expressionString = expressionInput.getText();
      try
      {
        Class<D> domainType   = (Class<D>) domainTypeBox.getValue();
        Class<C> codomainType = (Class<C>) codomainTypeBox.getValue();
        expr     = Function.compile(domainType,
                                    codomainType,
                                    (Class<F>) Function.class,
                                    expressionString,
                                    context);
        instance = expr.instantiate();
        updateTreeTableView();
        updateContextView();
      }
      catch (Throwable e)
      {
        showAlert("Compilation Error", e.getClass().getName() + ": " + e.getMessage());
      }
    }

    private void updateTreeTableView()
    {
      Node<D, C, F>           rootNode = expr.rootNode;
      TreeItem<Node<D, C, F>> rootItem = new NodeTreeItem<>(rootNode);
      treeTableView.setRoot(rootItem);
      treeTableView.setShowRoot(true);
      Platform.runLater(this::resizeColumnsToFitContent);
    }

    @SuppressWarnings("unchecked")
    private void updateContextView()
    {
      ListView<String> contextListView = (ListView<String>) contextBox.getChildren().get(1);
      contextListView.getItems().clear();
      for (Map.Entry<String, Object> entry : context.variables.map.entrySet())
      {
        contextListView.getItems().add(entry.getKey() + " = " + entry.getValue());
      }
    }

    private void resizeColumnsToFitContent()
    {
      for (TreeTableColumn<?, ?> column : treeTableView.getColumns())
      {
        resizeColumn(column);
      }
    }

    private void resizeColumn(TreeTableColumn<?, ?> column)
    {
      try
      {
        javafx.scene.Node node = column.getStyleableNode();
        if (node instanceof TableColumnHeader)
        {
          TableColumnHeader header = (TableColumnHeader) node;
          resizeMethod.invoke(header, -1);
        }
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }
    }

    protected TreeTableColumn<Node<D, C, F>, String> newNodeCol()
    {
      TreeTableColumn<Node<D, C, F>, String> nodeCol = new TreeTableColumn<>("Node");
      nodeCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                          .getValue()
                                                                          .toString()));
      nodeCol.setMinWidth(400);
      return nodeCol;
    }

    protected TreeTableColumn<Node<D, C, F>, String> newNodeTypeCol()
    {
      TreeTableColumn<Node<D, C, F>, String> nodeTypeCol = new TreeTableColumn<>("Node Type");
      nodeTypeCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                              .getValue()
                                                                              .getClass()
                                                                              .getSimpleName()));
      nodeTypeCol.setMinWidth(325);
      return nodeTypeCol;
    }

    protected TreeTableColumn<Node<D, C, F>, String> newNodeTypeResultCol()
    {
      TreeTableColumn<Node<D, C, F>, String> nodeTypeResultCol =
                                                               new TreeTableColumn<>("Result Type");
      nodeTypeResultCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                                    .getValue()
                                                                                    .type()
                                                                                    .getSimpleName()));
      return nodeTypeResultCol;
    }

    protected TreeTableColumn<Node<D, C, F>, String> newTypesetCol()
    {
      TreeTableColumn<Node<D, C, F>, String> typesetCol = new TreeTableColumn<>("Typeset");
      typesetCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                             .getValue()
                                                                             .typeset()));
      typesetCol.setCellFactory(new TypeSettingCellFactory<>());
      typesetCol.setMinWidth(400); // Adjust this value as needed
      return typesetCol;
    }

    protected TreeTableColumn<Node<D, C, F>, String> newFieldCol()
    {
      TreeTableColumn<Node<D, C, F>, String> fieldCol = new TreeTableColumn<>("Field");
      fieldCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                           .getValue()
                                                                           .getIntermediateValueFieldName()));
      fieldCol.setMinWidth(250);

      return fieldCol;
    }

    protected TreeTableColumn<Node<D, C, F>, String> newValueCol()
    {
      TreeTableColumn<Node<D, C, F>, String> valueCol = new TreeTableColumn<>("Value");
      valueCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(evaluateNode(param.getValue()
                                                                                        .getValue())));
      valueCol.setMinWidth(300);

      return valueCol;
    }

    private String evaluateNode(Node<D, C, F> node)
    {
      if (result == null)
      {
        return null;
      }
      try
      {
        String intermediateValueFieldName = node.getIntermediateValueFieldName();
        if (intermediateValueFieldName == null)
        {
          return "null";
        }
        if (intermediateValueFieldName == "result")
        {
          return result.toString();
        }
        if (intermediateValueFieldName.equals(expr.getInputName()))
        {
          return "input";
        }
        else
        {
          try
          {
            Field field = instance.getClass().getField(intermediateValueFieldName);
            return field == null ? String.format("missing %s in %s",
                                                 intermediateValueFieldName,
                                                 instance.getClass())
                                 : field.get(instance).toString();
          }
          catch (NoSuchFieldException nsfe)
          {
            return intermediateValueFieldName;
          }
        }
      }
      catch (Exception e)
      {
        wrapOrThrow(Arrays.asList(instance.getClass().getFields()).stream().toList().toString(), e);
      }
      return "see todo in assertion";
    }

    public void expandAllNodes()
    {
      expandTreeView(treeTableView.getRoot());
    }

    private void expandTreeView(TreeItem<?> item)
    {
      if (item != null && !item.isLeaf())
      {
        item.setExpanded(true);
        for (TreeItem<?> child : item.getChildren())
        {
          expandTreeView(child);
        }
      }
    }

    @SuppressWarnings("unchecked")
    public void evaluateExpression()
    {
      if (instance == null)
      {
        compileExpression();
      }
      try
      {
        // Assuming the input is an Integer for this example
        D var = (D) new Integer(3);
        result = instance.evaluate(var, 128);
        System.out.println(expr + "=" + result);
        updateTreeTableView();
      }
      catch (Throwable e)
      {
        e.printStackTrace(System.err);
        showAlert("Evaluation Error", e.getClass().getName() + ": " + e.getMessage());
      }
    }

  }

  private void showAlert(String title, String content)
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