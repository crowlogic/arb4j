package arb.viz;

import arb.Integer;
import arb.RealPolynomial;
import arb.RealQuasiPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.sequences.RealPolynomialSequence;
import javafx.application.Application;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.control.TreeTableView;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrarys}
 */
public class ExpressionAnalyzer
                                extends
                                Application
{

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

  private Expression<?, ?, ?> expr;

  @SuppressWarnings("unchecked")
  @Override
  public void start(Stage primaryStage)
  {
    primaryStage.setWidth(1800);
    primaryStage.setHeight(900);

    Integer n = new Integer(0);
    Context context = new Context(n.setName("n"));
    
    expr = RealQuasiPolynomial.parseSequence("Ψ", "y➔½*√(2*(4*n+1)/y)*(-1)ⁿ*J(2*n+½,y)", context);
    
    var rootNode      = expr.rootNode;

    // node creation logic
    var rootItem      = new NodeTreeItem<>(rootNode);

    var treeTableView = new TreeTableView<>(rootItem);
    treeTableView.setShowRoot(true);
    expandTreeView(rootItem);
    // treeTableView.setRowFactory(tv -> new CustomTreeTableRow<>());

    TreeTableColumn<Node<Integer, RealPolynomial, RealPolynomialSequence>, String> nodeCol = new TreeTableColumn<>("Node");
    nodeCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue().getValue().toString()));
    nodeCol.setMinWidth(500);

    // Additional columns can be added here
    TreeTableColumn<Node<Integer, RealPolynomial, RealPolynomialSequence>, String> nodeTypeCol = new TreeTableColumn<>("nodeType");
    nodeTypeCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                            .getValue()
                                                                            .getClass()
                                                                            .getSimpleName()));
    nodeTypeCol.setMinWidth(425);

    TreeTableColumn<Node<Integer, RealPolynomial, RealPolynomialSequence>, String> isScalarCol = new TreeTableColumn<>("isScalar");
    isScalarCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(String.valueOf(param.getValue()
                                                                                           .getValue()
                                                                                           .isScalar())));
    isScalarCol.setMinWidth(100);

    // Additional columns can be added here
    TreeTableColumn<Node<Integer, RealPolynomial, RealPolynomialSequence>, String> nodeTypeResultCol = new TreeTableColumn<>("result.type()");
    nodeTypeResultCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                                  .getValue()
                                                                                  .type()
                                                                                  .getSimpleName()));

    TreeTableColumn<Node<Integer, RealPolynomial, RealPolynomialSequence>, String> typesetCol = new TreeTableColumn<>("typeset()");
    typesetCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue().getValue().typeset()));

    treeTableView.getColumns().addAll(nodeCol, isScalarCol, nodeTypeCol, nodeTypeResultCol, typesetCol);

    // Create the HBox for buttons
    HBox   buttonBox = new HBox();
    Button button1   = new Button("Button 1");
    Button button2   = new Button("Button 2");
    buttonBox.getChildren().addAll(button1, button2);

    // Create a VBox and add both the treeTableView and buttonBox
    VBox vbox = new VBox();
    vbox.getChildren().addAll(treeTableView, buttonBox);

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

    scene.getStylesheets().add(getClass().getResource("/style.css").toExternalForm());
    primaryStage.setScene(scene);
    primaryStage.setTitle("Expression Viewer");
    primaryStage.centerOnScreen();
    primaryStage.show();
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
