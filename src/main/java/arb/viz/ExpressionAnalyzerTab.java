package arb.viz;

import static arb.utensils.Utensils.wrapOrThrow;

import java.lang.reflect.Field;
import java.util.Arrays;

import arb.Integer;
import arb.Named;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.utensils.text.trees.NodeTreeItem;
import javafx.application.Platform;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.geometry.Insets;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.control.TreeTableView;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionAnalyzerTab<D, C, F extends Function<D, C>> extends
                                  VBox
{

  final ExpressionAnalyzer<D, C, F> expressionAnalyzer;
  TextField                         expressionInput;
  TreeTableView<Node<D, C, F>>      treeTableView;
  Expression<D, C, F>               expr;
  F                                 instance;
  C                                 result;
  Context                           context;

  public Context getContext()
  {
    return context;
  }

  public ExpressionAnalyzerTab(ExpressionAnalyzer<D, C, F> expressionAnalyzer)
  {
    super(10);
    this.expressionAnalyzer = expressionAnalyzer;
    this.context            = new Context(Integer.named("n").set(3),

                                          Real.named("v").set(RealConstants.half));

    expressionInput         = new TextField();
    expressionInput.setPromptText("Enter expression here");
    expressionInput.setText("v₍ₙ₎*(z/2)^(-n)*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)");

    expressionInput.setMaxWidth(1200);

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
      Class<D> domainType   = (Class<D>) this.expressionAnalyzer.domainTypeBox.getValue();
      Class<C> codomainType = (Class<C>) this.expressionAnalyzer.codomainTypeBox.getValue();
      Class<F> functionType = (Class<F>) this.expressionAnalyzer.functionTypeBox.getValue();

      expr     =
           Function.compile(domainType, codomainType, functionType, expressionString, context);
      instance = expr.instantiate();
      updateTreeTableView();
      updateContextView();
    }
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
      this.expressionAnalyzer.showAlert("Compilation Error",
                                        e.getClass().getName() + ": " + e.getMessage());
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
    ListView<Named> contextListView = (ListView<
                  Named>) this.expressionAnalyzer.contextBox.getChildren().get(1);
    contextListView.refresh();
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
        ExpressionAnalyzer.resizeMethod.invoke(header, -1);
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
    TreeTableColumn<Node<D, C, F>, String> nodeTypeResultCol = new TreeTableColumn<>("Result Type");
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
    fieldCol.setMinWidth(100);

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
      // TODO: make this editable via the Context ListView
      // Assuming the input is an Integer for this example
      D var = (D) new Integer(7);
      result = instance.evaluate(var, 128);
      System.out.println(expr + "=" + result);
      updateTreeTableView();
    }
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
      this.expressionAnalyzer.showAlert("Evaluation Error",
                                        e.getClass().getName() + ": " + e.getMessage());
    }
  }

}