package arb.viz;

import static arb.utensils.Utensils.wrapOrThrow;

import java.util.Map;

import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.real.RealFunction;
import javafx.application.Application;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class ExpressionAnalyzer extends
                                Application
{

  Context             context;
  Expression<?, ?, ?> expr;
  Function<?, ?>      instance;
  Object              result;

  @SuppressWarnings("resource")
  public Expression<?, ?, ?> getExpression()
  {

    context = new Context(Integer.named("n").set(3));
    return RealFunction.compile("Ψₖ:√((4*n+1)/π)*(-1)ⁿ*j(2*n,x)", context);
  }

  // return RationalFunctionSequence.compile("n➔(R(n,½;x)*sin(x) -
  // R(n-1,3⁄2;x)*cos(x))/x");

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

  @SuppressWarnings("unchecked")
  @Override
  public void start(Stage primaryStage)
  {
    primaryStage.setWidth(1800);
    primaryStage.setHeight(900);

    expr = getExpression();
    System.out.println("expr=" + expr.syntaxTextTree());
    instance = expr.instantiate();
//    instance = new     Ψₖ(); // expr.instantiate();
//    instance.n = n;
//    instance.eva

    Node<?, ?, ?>                rootNode      = expr.rootNode;
    TreeItem<Node<?, ?, ?>>      rootItem      = new NodeTreeItem(rootNode);

    TreeTableView<Node<?, ?, ?>> treeTableView = new TreeTableView<>(rootItem);
    treeTableView.setShowRoot(true);

    TreeTableColumn<Node<?, ?, ?>, String> nodeCol = new TreeTableColumn<>("Node");
    nodeCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                        .getValue()
                                                                        .toString()));
    nodeCol.setMinWidth(400);

    TreeTableColumn<Node<?, ?, ?>, String> nodeTypeCol = new TreeTableColumn<>("Node Type");
    nodeTypeCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                            .getValue()
                                                                            .getClass()
                                                                            .getSimpleName()));
    nodeTypeCol.setMinWidth(325);

    TreeTableColumn<Node<?, ?, ?>, String> nodeTypeResultCol = new TreeTableColumn<>("Result Type");
    nodeTypeResultCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                                  .getValue()
                                                                                  .type()
                                                                                  .getSimpleName()));

    TreeTableColumn<Node<?, ?, ?>, String> typesetCol = new TreeTableColumn<>("Typeset");
    typesetCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                           .getValue()
                                                                           .typeset()));

    TreeTableColumn<Node<?, ?, ?>, String> fieldCol = new TreeTableColumn<>("Field");
    fieldCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                         .getValue()
                                                                         .getIntermediateValueFieldName()));

    TreeTableColumn<Node<?, ?, ?>, String> valueCol = new TreeTableColumn<>("Value");
    valueCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(evaluateNode(param.getValue()
                                                                                      .getValue())));

    typesetCol.setCellFactory(new TypeSettingCellFactory());

    treeTableView.getColumns()
                 .addAll(nodeCol, nodeTypeCol, nodeTypeResultCol, typesetCol, fieldCol, valueCol);

    // Context variables display
    ListView<String> contextListView = new ListView<>();
    for (Map.Entry<String, Object> entry : context.variables.map.entrySet())
    {
      contextListView.getItems().add(entry.getKey() + " = " + entry.getValue());
    }

    // Evaluate button
    Button evaluateButton = new Button("Evaluate Expression");
    evaluateButton.setOnAction(e -> evaluateExpression());

    // Create the HBox for buttons
    HBox buttonBox = new HBox(10);
    buttonBox.getChildren().addAll(evaluateButton);

    // Create a VBox and add components
    VBox vbox = new VBox(10);
    vbox.getChildren()
        .addAll(new Label("Context Variables:"), contextListView, treeTableView, buttonBox);

    // Set the treeTableView to grow with the VBox
    VBox.setVgrow(treeTableView, javafx.scene.layout.Priority.ALWAYS);

    // ScrollPane
    ScrollPane scrollPane = new ScrollPane(vbox);
    scrollPane.setFitToHeight(true);
    scrollPane.setFitToWidth(true);
    Scene scene = new Scene(scrollPane);
    scene.addEventFilter(KeyEvent.KEY_PRESSED, event ->
    {
      if (event.getCode() == KeyCode.ESCAPE)
      {
        primaryStage.close();
      }
    });

    scene.getStylesheets().add(TODO.convertStylesheetToDataURI(TODO.EASIER_ON_THE_EYES_STYLESHEET));
    primaryStage.setScene(scene);
    primaryStage.setTitle("Expression Analyzer");
    primaryStage.centerOnScreen();
    primaryStage.show();
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
        return result != null ? "null" : result.toString();
      }
      return instance.getClass()
                     .getField(intermediateValueFieldName)
                     .get(node.getIntermediateValueFieldName())
                     .toString();
    }
    catch (Exception e)
    {
      wrapOrThrow(e);
    }
    return "see todo in assertion";
  }

  private void evaluateExpression()
  {
    result = instance.evaluate(null, 128);
    System.out.println(expr + "=" + result);

  }

  public static void main(String[] args)
  {
    launch(args);
  }
}