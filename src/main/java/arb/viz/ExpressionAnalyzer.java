
package arb.viz;

import static arb.utensils.Utensils.wrapOrThrow;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Map;

import arb.Integer;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.rational.ComplexRationalFunctionSequence;
import arb.utensils.Utensils;
import arb.utensils.text.trees.NodeTreeItem;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.beans.value.ObservableValue;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.TreeTableColumn.CellDataFeatures;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.Callback;

/**
 * be sure to run this with "--add-modules arb4j --add-opens
 * javafx.controls/javafx.scene.control.skin=arb4j" passed to the JVM
 * 
 * 
 * TODO: add a tabbed pane so multiple expressions can be opened in the same
 * program
 * 
 * @author StΣνε
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionAnalyzer<D, C, F extends Function<? extends D, ? extends C>> extends
                               Application
{

  Context                      context;
  Expression<?, ?, ?>          expr;
  Function<D, C>               instance;
  Object                       result;
  TreeTableView<Node<D, C, F>> treeTableView;

  public Expression<?, ?, ?> getExpression()
  {
    var context = new Context();
    context.registerVariable("v", RealConstants.half);

    var R    =
          ComplexRationalFunctionSequence.compile("R:n➔(v₍ₙ₎*1/((z/2)^(n)))*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                                  context);
    return R;
//    var Rtoo =
//             ComplexRationalFunctionSequence.compile("Rtoo:n➔v₍ₙ₎*(z/2)^(-n)*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
//                                                     context);
//    return Rtoo;
    // return
    // ComplexRationalNullaryFunction.compile(null,"(1+2*ⅈ)/(3/(4+x^2-ⅈ*x^3))+ⅈ*((5/6)*(ⅈ*(x^2-x)*7/8))",
    // null);
    // return RealSequence.compile("k➔√((2*k+½)/π)*((k+1)⋰-½)²");
    // return J0IntegralCovarianceOperator.Ψ;
    // ₖ;
    // context = new Context(Integer.named("n").set(3));
    // return RealFunction.compile("Ψₖ:√((4*n+1)/π)*(-1)ⁿ*j(2*n,x)", context);
  }

  public void expandTreeView(TreeItem<?> item)
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

  private void toggleContextView(SplitPane splitPane, VBox contextBox)
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

  public HBox newButtonBox(SplitPane splitPane, VBox contextBox)
  {
    Button evaluateButton = new Button("Evaluate Expression");
    evaluateButton.setOnAction(e -> evaluateExpression());

    Button expandAllButton = new Button("Expand All");
    expandAllButton.setOnAction(e -> expandTreeView(treeTableView.getRoot()));

    Button toggleContextButton = new Button("Toggle Context View");
    toggleContextButton.setOnAction(e -> toggleContextView(splitPane, contextBox));

    HBox buttonBox = new HBox(10);
    buttonBox.getChildren().addAll(evaluateButton, expandAllButton, toggleContextButton);
    return buttonBox;
  }

  private boolean       contextViewVisible = false;
  private static Method resizeMethod;

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

  @SuppressWarnings("unchecked")
  @Override
  public void start(Stage primaryStage)
  {
    primaryStage.setWidth(1800);
    primaryStage.setHeight(900);

    expr = getExpression();
    System.out.println("expr=" + expr.syntaxTextTree());
    instance = (Function<D, C>) expr.instantiate();

    newTreeTableView();

    VBox             contextBox      = new VBox(10);
    ListView<String> contextListView = newContextView();
    contextBox.getChildren().addAll(new Label("Context Variables:"), contextListView);

    SplitPane splitPane  = new SplitPane();
    HBox      buttonBox  = newButtonBox(splitPane, contextBox);

    VBox      mainLayout = new VBox(10);
    mainLayout.getChildren().addAll(splitPane, buttonBox);
    VBox.setVgrow(splitPane, javafx.scene.layout.Priority.ALWAYS);

    splitPane.getItems().add(treeTableView);

    primaryStage.setScene(newScene(primaryStage, newScrollPane(mainLayout)));
    primaryStage.setTitle("Expression Analyzer");
    primaryStage.centerOnScreen();
    primaryStage.show();
  }

  public Scene newScene(Stage primaryStage, ScrollPane scrollPane)
  {
    Scene scene = new Scene(scrollPane);
    scene.addEventFilter(KeyEvent.KEY_PRESSED, event ->
    {
      if (event.getCode() == KeyCode.ESCAPE)
      {
        primaryStage.close();
      }
    });

    scene.getStylesheets().add(TODO.convertStylesheetToDataURI(TODO.EASIER_ON_THE_EYES_STYLESHEET));
    return scene;
  }

  public ScrollPane newScrollPane(VBox mainLayout)
  {
    ScrollPane scrollPane = new ScrollPane(mainLayout);
    scrollPane.setFitToHeight(true);
    scrollPane.setFitToWidth(true);
    return scrollPane;
  }

  public void resizeColumn(TreeTableColumn<?, ?> column)
  {
    try
    {
      javafx.scene.Node node = column.getStyleableNode();
      if (node instanceof TableColumnHeader)
      {
        TableColumnHeader header = (TableColumnHeader) node;
        resizeMethod.invoke(header, -1); // -1 means consider all rows
      }
      else
      {
        System.err.println("failed to invoke the hidden resize method, got a "
                           + node.getClass()
                           + " instead of a TableColumnHeader as expected");
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  private void resizeColumnsToFitContent()
  {
    for (TreeTableColumn<?, ?> column : treeTableView.getColumns())
    {
      resizeColumn(column);
    }
  }

  public HBox newButtonBox()
  {
    // Evaluate button
    Button evaluateButton = new Button("Evaluate Expression");
    evaluateButton.setOnAction(e -> evaluateExpression());

    // Expand All button
    Button expandAllButton = new Button("Expand All");
    expandAllButton.setOnAction(e -> expandTreeView(treeTableView.getRoot()));

    // Create the HBox for buttons
    HBox buttonBox = new HBox(10);
    buttonBox.getChildren().addAll(evaluateButton, expandAllButton);
    return buttonBox;
  }

  public ListView<String> newContextView()
  {
    // Context variables display
    ListView<String> contextListView = new ListView<>();
    contextListView.setPrefHeight(100); // Set preferred height
    if (context != null)
    {
      for (Map.Entry<String, Object> entry : context.variables.map.entrySet())
      {
        contextListView.getItems().add(entry.getKey() + " = " + entry.getValue());
      }
    }
    return contextListView;
  }

  @SuppressWarnings("unchecked")
  public void newTreeTableView()
  {
    Node<D, C, F>           rootNode = (Node<D, C, F>) expr.rootNode;
    TreeItem<Node<D, C, F>> rootItem = new NodeTreeItem<D, C, F>(rootNode);

    treeTableView = new TreeTableView<Node<D, C, F>>(rootItem);
    treeTableView.setShowRoot(true);

    var nodeCol           = newNodeCol();
    var nodeTypeCol       = newNodeTypeCol();
    var nodeTypeResultCol = newNodeTypeResultCol();
    var typesetCol        = newTypesetCol();
    var fieldCol          = newFieldCol();
    var valueCol          = newValueCol();

    treeTableView.getColumns()
                 .addAll(nodeCol, nodeTypeCol, nodeTypeResultCol, typesetCol, fieldCol, valueCol);

    Platform.runLater(() -> resizeColumnsToFitContent());

  }

  protected TreeTableColumn<Node<D, C, F>, String> newValueCol()
  {
    TreeTableColumn<Node<D, C, F>, String> valueCol = new TreeTableColumn<>("Value");
    valueCol.setCellValueFactory(newValueColCellValueFactory());
    return valueCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newFieldCol()
  {
    TreeTableColumn<Node<D, C, F>, String> fieldCol = new TreeTableColumn<>("Field");

    fieldCol.setCellValueFactory(newFieldColCellValueFactory());
    return fieldCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newTypesetCol()
  {
    TreeTableColumn<Node<D, C, F>, String> typesetCol = new TreeTableColumn<>("Typeset");
    typesetCol.setCellValueFactory(newTypesetColCellValueFactory());
    typesetCol.setCellFactory(new TypeSettingCellFactory<D, C, F>());
    return typesetCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeTypeResultCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeTypeResultCol = new TreeTableColumn<>("Result Type");
    nodeTypeResultCol.setCellValueFactory(newNodeTypeResultColCellValueFactory());
    return nodeTypeResultCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeTypeCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeTypeCol = new TreeTableColumn<>("Node Type");
    nodeTypeCol.setCellValueFactory(newNodeTypeColCellValueFactory());
    nodeTypeCol.setMinWidth(325);
    return nodeTypeCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeCol = new TreeTableColumn<>("Node");
    nodeCol.setCellValueFactory(newNodeColCellValueFactory());
    nodeCol.setMinWidth(400);
    return nodeCol;
  }

  protected Callback<CellDataFeatures<Node<D, C, F>, String>, ObservableValue<String>>
            newValueColCellValueFactory()
  {
    return param -> new ReadOnlyStringWrapper(evaluateNode(param.getValue().getValue()));
  }

  protected Callback<CellDataFeatures<Node<D, C, F>, String>, ObservableValue<String>>
            newFieldColCellValueFactory()
  {
    return param -> new ReadOnlyStringWrapper(param.getValue()
                                                   .getValue()
                                                   .getIntermediateValueFieldName());
  }

  protected Callback<CellDataFeatures<Node<D, C, F>, String>, ObservableValue<String>>
            newTypesetColCellValueFactory()
  {
    return param -> new ReadOnlyStringWrapper(param.getValue().getValue().typeset());
  }

  protected Callback<CellDataFeatures<Node<D, C, F>, String>, ObservableValue<String>>
            newNodeTypeResultColCellValueFactory()
  {
    return param -> new ReadOnlyStringWrapper(param.getValue().getValue().type().getSimpleName());
  }

  protected Callback<CellDataFeatures<Node<D, C, F>, String>, ObservableValue<String>>
            newNodeTypeColCellValueFactory()
  {
    return param -> new ReadOnlyStringWrapper(param.getValue()
                                                   .getValue()
                                                   .getClass()
                                                   .getSimpleName());
  }

  protected Callback<CellDataFeatures<Node<D, C, F>, String>, ObservableValue<String>>
            newNodeColCellValueFactory()
  {
    return param -> new ReadOnlyStringWrapper(param.getValue().getValue().toString());
  }

  private String evaluateNode(Node<?, ?, ?> node)
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

  @SuppressWarnings("unchecked")
  private void evaluateExpression()
  {

    // Integer index = new Integer();
    // index.set(3);
//    new Context(Integer.named("k").set(3)).injectReferences(instance);
//    Real point = new Real("2.3",
//                          128);
//    result = instance.evaluate((D) point, 128);
    result = instance.evaluate((D) new Integer(3), 128);
    System.out.println(expr + "=" + result);
    resizeColumnsToFitContent();
    treeTableView.refresh();
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
