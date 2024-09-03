package arb.expressions.viz;

import static arb.utensils.Utensils.wrapOrThrow;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;

import arb.Integer;
import arb.Named;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.unary.HypergeometricFunctionNode;
import arb.functions.Function;
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
    treeTableView = new TreeTableView<>();
    treeTableView.setColumnResizePolicy(TreeTableView.UNCONSTRAINED_RESIZE_POLICY);
    var nodeCol           = newNodeCol();
    var nodeTypeCol       = newNodeTypeCol();
    var nodeTypeResultCol = newNodeTypeResultCol();
    var typesetCol        = newTypesetCol();
    var fieldCol          = newFieldCol();
    var valueCol          = newValueCol();
    treeTableView.setTableMenuButtonVisible(true);
    treeTableView.getColumns()
                 .addAll(nodeCol, nodeTypeCol, nodeTypeResultCol, typesetCol, valueCol, fieldCol);
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

      expr     = Function.compile(domainType,
                                  codomainType,
                                  functionType,
                                  expressionString,
                                  context.resetClassLoader());

      instance = expr.instantiate();
      updateTreeTableView();
      updateContextView();
    }
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
      this.expressionAnalyzer.showAlert("Compilation Error",
                                        e.getClass().getName(),
                                        e.getMessage());
    }
  }

  private TreeItem<Node<D, C, F>> updateTreeTableView()
  {
    Node<D, C, F>           rootNode = expr.rootNode;
    TreeItem<Node<D, C, F>> rootItem = new NodeTreeItem<>(rootNode);
    treeTableView.setRoot(rootItem);
    treeTableView.setShowRoot(true);
    Platform.runLater(this::resizeColumnsToFitContent);
    return rootItem;
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
    // nodeCol.setMinWidth(400);
    return nodeCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeTypeCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeTypeCol = new TreeTableColumn<>("Node Type");
    nodeTypeCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                            .getValue()
                                                                            .getClass()
                                                                            .getSimpleName()));
    // nodeTypeCol.setMinWidth(325);
    return nodeTypeCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeTypeResultCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeTypeResultCol = new TreeTableColumn<>("Result Type");
    nodeTypeResultCol.setCellValueFactory(param ->
    {
      Class<?> generatedType = param.getValue().getValue().getGeneratedType();
      return new ReadOnlyStringWrapper(generatedType == null ? "null"
                                                             : generatedType.getSimpleName());
    });
    return nodeTypeResultCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newTypesetCol()
  {
    TreeTableColumn<Node<D, C, F>, String> typesetCol = new TreeTableColumn<>("Typeset");
    typesetCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                           .getValue()
                                                                           .typeset()));
    typesetCol.setCellFactory(new TypeSettingCellFactory<>());
    // typesetCol.setMinWidth(400); // Adjust this value as needed
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
      return "null";
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
      if (node instanceof VariableNode)
      {
        VariableNode<D, C, F> variableNode = (VariableNode<D, C, F>) node;
        if (variableNode.isIndeterminate)
        {
          return variableNode.getName();
        }
      }
      else if (node instanceof HypergeometricFunctionNode)
      {
        // FIXME; support these types of embedded expressions by accessing the evaluated alpha and beta params instead
        // of printing the formulas for alpha and beta which are already displayed
        HypergeometricFunctionNode<D, C, F> hyp = (HypergeometricFunctionNode<D, C, F>) node;
        return String.format("%s/%s arg=%s\n", hyp.α, hyp.β, hyp.arg );
      }
      if (intermediateValueFieldName.equals(expr.getInputName()))
      {
        Object inputVariable = getContext().getVariable("input");
        return inputVariable != null ? inputVariable.toString() : "null";
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

  public HashMap<String, Boolean> enumerateNodeExpansionStates()
  {
    return enumerateNodeExpansionStates(new HashMap<String, Boolean>(), treeTableView.getRoot());
  }

  public HashMap<String, Boolean> applyNodeExpansionStates(HashMap<String, Boolean> states,
                                                           TreeItem<?> item)
  {
    if (item != null && !item.isLeaf())
    {
      Boolean value = states.get(item.getValue().toString());
      if (value != null)
      {
        item.setExpanded(value);
      }

      for (TreeItem<?> child : item.getChildren())
      {
        applyNodeExpansionStates(states, child);
      }
    }
    return states;
  }

  public HashMap<String, Boolean> enumerateNodeExpansionStates(HashMap<String, Boolean> states,
                                                               TreeItem<?> item)
  {
    if (item != null && !item.isLeaf())
    {
      states.put(item.getValue().toString(), item.isExpanded());

      for (TreeItem<?> child : item.getChildren())
      {
        enumerateNodeExpansionStates(states, child);
      }
    }
    return states;
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

  public void evaluateExpression()
  {
    if (instance == null)
    {
      compileExpression();
    }
    try
    {
      var nodeExpansionStates = enumerateNodeExpansionStates();

      D   input               = getContext().getVariable("input");
      if (input == null && !expr.domainType.equals(Object.class))
      {
        expressionAnalyzer.showAlert("Input Required",
                                     "variable named input must be defined in the context");
      }
      else
      {
        getContext().injectReferences(instance = expr.instantiate());
        if (result != null)
        {
          result = instance.evaluate(input, 128, result);
        }
        else
        {
          result = instance.evaluate(input, 128);

        }
        System.out.println(expr + "(" + input + ")=" + result);

        var rootItem = updateTreeTableView();
        expandAllNodes();
        
        applyNodeExpansionStates(nodeExpansionStates, rootItem);
      }
    }
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
      this.expressionAnalyzer.showAlert("Evaluation Error",
                                        e.getClass().getName() + ": " + e.getMessage());
    }
  }

}