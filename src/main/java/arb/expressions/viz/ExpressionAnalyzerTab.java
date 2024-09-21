package arb.expressions.viz;

import static arb.utensils.Utensils.wrapOrThrow;
import static java.lang.System.out;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;

import arb.Complex;
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
import javafx.animation.PauseTransition;
import javafx.application.Platform;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.geometry.Insets;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.control.TreeTableView;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.util.Duration;

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
  HashMap<String, Boolean>          nodeExpansionStates;
  MiniSymbolPalette                 symbolPalette;

  public Context getContext()
  {
    return context;
  }

  public ExpressionAnalyzerTab(ExpressionAnalyzer<D, C, F> expressionAnalyzer)
  {
    super(10);
    this.expressionAnalyzer = expressionAnalyzer;
    this.context            = new Context(Complex.named("input").set(3),
                                          Real.named("v").set(RealConstants.half));

    setupExpressionInput();

    // Create the MiniSymbolPalette
    MiniSymbolPalette symbolPalette = new MiniSymbolPalette(expressionInput);

    // Create an HBox to hold the expressionInput and symbolPalette
    HBox              inputRow      = new HBox(10);
    inputRow.getChildren().addAll(expressionInput, symbolPalette);
    HBox.setHgrow(expressionInput, Priority.ALWAYS);

    setupTreeTableView();

    VBox.setVgrow(treeTableView, Priority.ALWAYS);
    HBox.setHgrow(treeTableView, Priority.ALWAYS);

    this.getChildren().addAll(inputRow, treeTableView);
    this.setPadding(new Insets(10));
    VBox.setVgrow(this, Priority.ALWAYS);
  }

  public void setupExpressionInput()
  {
    expressionInput = new TextField();
    expressionInput.setPromptText("Enter expression here");
    expressionInput.setText("1+(-((lnΓ(1/4 + t*I/2) - lnΓ(1/4 - t*I/2))*I)/2 - ln(π)*t/2)/π + 1 - I*((ln(ζ(1/2 + I*t)) - ln(ζ(1/2 - I*t))))/(2*π)");

    expressionInput.setMaxWidth(1200);
    expressionInput.setOnKeyPressed(event ->
    {
      if (event.getCode() == KeyCode.ENTER)
      {
        evaluateExpression();
      }
    });
    symbolPalette = new MiniSymbolPalette(expressionInput);
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

  public void resizeColumnsToFitContent()
  {
    out.println("resizeColumnsToFitContent");
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
    return nodeCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeTypeCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeTypeCol = new TreeTableColumn<>("Node Type");
    nodeTypeCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                            .getValue()
                                                                            .getClass()
                                                                            .getSimpleName()));
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
    return typesetCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newFieldCol()
  {
    TreeTableColumn<Node<D, C, F>, String> fieldCol = new TreeTableColumn<>("Field");
    fieldCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                         .getValue()
                                                                         .getIntermediateValueFieldName()));

    return fieldCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newValueCol()
  {
    TreeTableColumn<Node<D, C, F>, String> valueCol = new TreeTableColumn<>("Value");
    valueCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(evaluateNode(param.getValue()
                                                                                      .getValue())));

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
        // FIXME; support these types of embedded expressions by accessing the evaluated
        // alpha and beta params instead
        // of printing the formulas for alpha and beta which are already displayed
        // HypergeometricFunctionNode<D, C, F> hyp = (HypergeometricFunctionNode<D, C,
        // F>) node;
        return "...";
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
    // Add a short delay before resizing
    PauseTransition pause = new PauseTransition(Duration.millis(250));
    pause.setOnFinished(event -> resizeColumnsToFitContent());
    pause.play();
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
    nodeExpansionStates = enumerateNodeExpansionStates();

    compileExpression();

    try
    {

      D input = getContext().getVariable("input");
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
          Object inputClass = input == null ? Object.class : input.getClass();
          assert expr.domainType.equals(inputClass) : String.format("input should be of type %s not %s",
                                                                    expr.domainType,
                                                                    input.getClass());
          result = instance.evaluate(input, 128);

        }
        System.out.println(expr + "(" + input + ")=" + result);

        var rootItem = updateTreeTableView();

        if (nodeExpansionStates != null)
        {
          out.println("restoring nodeExpansionStates " + nodeExpansionStates);
          applyNodeExpansionStates(nodeExpansionStates, rootItem);
        }
        if (!anyExpanded(rootItem))
        {
          out.println("expandAllNodes");

          expandAllNodes();

        }

      }
    }
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
      this.expressionAnalyzer.showAlert("Evaluation Error",
                                        e.getClass().getName() + ": " + e.getMessage());
    }
  }

  public static <N extends Node<?, ?, ?>> boolean anyExpanded(TreeItem<N> rootItem)
  {
    if (rootItem.isExpanded())
    {
      return true;
    }
    for (var item : rootItem.getChildren())
    {
      if (anyExpanded(item))
      {
        return true;
      }
    }
    return false;
  }

}