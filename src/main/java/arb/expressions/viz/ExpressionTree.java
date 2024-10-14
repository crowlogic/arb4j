package arb.expressions.viz;

import static arb.utensils.Utensils.wrapOrThrow;

import java.io.Closeable;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Optional;

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
import arb.functions.Function;
import arb.utensils.Utensils;
import arb.viz.WindowManager;
import javafx.application.Platform;
import javafx.beans.Observable;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.geometry.Insets;
import javafx.scene.control.*;
import javafx.scene.control.skin.VirtualFlow;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionTree<D, C extends Closeable, F extends Function<D, C>> extends
                           VBox
{

  public void save(String yamlFile)
  {
    Utensils.persistInYamlFormat(this, yamlFile);
  }

  final Expressor<D, C, F>     analyzer;
  TextField                    expressionInput;
  TreeTableView<Node<D, C, F>> treeTableView;
  public Expression<D, C, F>   expr;
  F                            instance;
  C                            result;
  Context                      context;
  HashMap<String, Boolean>     nodeExpansionStates;
  MiniSymbolPalette            symbolPalette;
  private StackPane            stackPane;
  VirtualFlow<?>               tableVirtualFlow;

  IndexedCell<?>               pointer;

  public Context getContext()
  {
    return context;
  }

  public ExpressionTree(Expressor<D, C, F> expressionAnalyzer)
  {
    super(10);
    this.analyzer = expressionAnalyzer;
    this.context  = new Context(Integer.named("input").set(3),
                                Real.named("v").set(RealConstants.half));

    setupExpressionInput();

    MiniSymbolPalette symbolPalette = new MiniSymbolPalette(expressionInput);

    HBox              inputRow      = new HBox(10);
    inputRow.getChildren().addAll(expressionInput, symbolPalette);
    HBox.setHgrow(expressionInput, Priority.ALWAYS);

    setupTreeTableView();

    stackPane = new StackPane(treeTableView);
    getChildren().addAll(inputRow, stackPane);
    setPadding(new Insets(10));

    VBox.setVgrow(stackPane, Priority.ALWAYS);
    HBox.setHgrow(stackPane, Priority.ALWAYS);
    VBox.setVgrow(this, Priority.ALWAYS);
  }

  public void setupExpressionInput()
  {
    expressionInput = new TextField();
    expressionInput.setPromptText("Enter expression here");
    expressionInput.setText("1+(-((lnΓ(1/4 + t*I/2) - lnΓ(1/4 - t*I/2))*I)/2 - ln(π)*t/2)/π + 1 - I*((ln(ζ(1/2 + I*t)) - ln(ζ(1/2 - I*t))))/(2*π)");
    WindowManager.addEmacsKeybindings(expressionInput);

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

  void virtualFlowListener(Observable skinEvent)
  {
    try
    {
      flow = getVirtualFlow();
      flow.setPannable(true);
    }
    catch (Throwable e)
    {
      e.printStackTrace();
    }

  };

  public VirtualFlow<?> flow;

  public VirtualFlow<?> getVirtualFlow()
  {
    return (flow == null) ? flow = WindowManager.getVirtualFlow(treeTableView) : flow;
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
    var fieldCol          = newFieldColumn();
    var valueCol          = newValueColumn();
    treeTableView.setTableMenuButtonVisible(true);
    treeTableView.skinProperty().addListener(this::virtualFlowListener);
    treeTableView.getColumns().addAll(typesetCol, valueCol, nodeTypeCol, nodeTypeResultCol, nodeCol, fieldCol);
  }

  @SuppressWarnings("unchecked")
  public void compileExpression()
  {
    String expressionString = expressionInput.getText();
    try
    {
      Class<D> domainType   = (Class<D>) this.analyzer.domainTypeBox.getValue();
      Class<C> codomainType = (Class<C>) this.analyzer.codomainTypeBox.getValue();
      Class<F> functionType = (Class<F>) this.analyzer.functionTypeBox.getValue();

      expr     = Function.compile(domainType, codomainType, functionType, expressionString, context.resetClassLoader());

      instance = expr.instantiate();
      updateTreeTableView();
      updateContextView();
    }
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
      Platform.runLater(() ->
      {
        WindowManager.showAlert("Compilation Error", e.getClass().getName(), e);
      });
    }
  }

  private TreeItem<Node<D, C, F>> updateTreeTableView()
  {
    var rootNode = expr.rootNode;
    var rootItem = new NodeTreeItem<>(rootNode);
    treeTableView.setRoot(rootItem);
    treeTableView.setShowRoot(true);
    Platform.runLater(this::resizeColumnsToFitContent);
    return rootItem;
  }

  @SuppressWarnings("unchecked")
  private void updateContextView()
  {
    ListView<Named> contextListView = (ListView<Named>) this.analyzer.contextBox.getChildren().get(1);
    contextListView.refresh();
  }

  public void resizeColumnsToFitContent()
  {
    treeTableView.getColumns().forEach(WindowManager::resizeColumn);
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeColumn = new TreeTableColumn<>("Node");
    nodeColumn.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue().getValue().toString()));
    return nodeColumn;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeTypeCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeTypeColumn = new TreeTableColumn<>("Node Type");
    nodeTypeColumn.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                               .getValue()
                                                                               .getClass()
                                                                               .getSimpleName()));
    return nodeTypeColumn;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeTypeResultCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeTypeResultColumn = new TreeTableColumn<>("Result Type");
    nodeTypeResultColumn.setCellValueFactory(param ->
    {
      Class<?> generatedType = param.getValue().getValue().getGeneratedType();
      return new ReadOnlyStringWrapper(generatedType == null ? "null" : generatedType.getSimpleName());
    });
    return nodeTypeResultColumn;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newTypesetCol()
  {
    TreeTableColumn<Node<D, C, F>, String> typesetColumn = new TreeTableColumn<>("Expression");
    typesetColumn.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue().getValue().typeset()));
    typesetColumn.setCellFactory(new TypeSettingCellFactory<>());
    return typesetColumn;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newFieldColumn()
  {
    TreeTableColumn<Node<D, C, F>, String> fieldCol = new TreeTableColumn<>("Field");
    fieldCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                         .getValue()
                                                                         .getIntermediateValueFieldName()));

    return fieldCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newValueColumn()
  {
    TreeTableColumn<Node<D, C, F>, String> valueCol = new TreeTableColumn<>("Value");
    valueCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(evaluateNode(param.getValue().getValue())));
    return valueCol;
  }

  public void graph()
  {
    WindowManager.showAlert("TODO", "TODO: graph.. ask for range.. 1d for real");
  }

  public void load()
  {
    WindowManager.showAlert("TODO", "TODO: load");
  }

  private Optional<String> askWhatToSaveAs()
  {
    TextInputDialog dialog = new TextInputDialog();
    dialog.setTitle("New Variable");
    dialog.setHeaderText("Designation");
    dialog.setContentText("Enter the name of the new variable: ");

    dialog.initOwner(getScene().getWindow());

    return dialog.showAndWait();
  }

  public void save()
  {
    Optional<String> filename = askWhatToSaveAs();
    if (filename.isPresent())
    {
      save(filename.get());
    }
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
      if (intermediateValueFieldName.equals("result"))
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
        else if (variableNode.isIndependent)
        {
          Object inputVariable = getContext().getVariable("input");
          return inputVariable != null ? inputVariable.toString() : "null";
        }
      }

      try
      {
        Field field = instance.getClass().getField(intermediateValueFieldName);
        return field == null ? String.format("missing %s in %s", intermediateValueFieldName, instance.getClass())
                             : field.get(instance).toString();
      }
      catch (NoSuchFieldException nsfe)
      {
        return intermediateValueFieldName;
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
    return WindowManager.enumerateNodeExpansionStates(new HashMap<String, Boolean>(), treeTableView.getRoot());
  }

  public void expandAllNodes()
  {
    expandTreeView(treeTableView.getRoot());
    Platform.runLater(this::resizeColumnsToFitContent);
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
        WindowManager.showAlert("Input Required", "variable named input must be defined in the context");
      }
      else
      {
        if (expr == null)
        {
          return;
        }
        getContext().injectReferences(instance = expr.instantiate());
        Class<?> inputClass = input == null ? Object.class : input.getClass();
        if (!expr.domainType.equals(inputClass) && !Object.class.equals(expr.domainType))
        {
          input      = expr.domainType.getConstructor(inputClass).newInstance(input);
          inputClass = input.getClass();
        }

        if (result != null)
        {
          if (!result.getClass().equals(expr.coDomainType))
          {
            result.close();
            result = expr.coDomainType.getConstructor().newInstance();
          }
          result = instance.evaluate(input, 128, result);
        }
        else
        {
          result = instance.evaluate(input, 128);
        }

        var rootItem = updateTreeTableView();

        if (nodeExpansionStates != null)
        {
          WindowManager.applyNodeExpansionStates(nodeExpansionStates, rootItem);
        }

        if (!WindowManager.anyExpanded(rootItem))
        {
          expandAllNodes();
        }

      }
    }
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
      Platform.runLater(() -> WindowManager.showAlert("Evaluation Error",
                                                      e.getClass().getName() + ": " + e.getMessage(),
                                                      e));
    }
  }

}
