package arb.expressions.viz;

import static arb.utensils.Utensils.wrapOrThrow;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Optional;

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
import arb.functions.Function;
import javafx.application.Platform;
import javafx.beans.Observable;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.geometry.Insets;
import javafx.geometry.Orientation;
import javafx.scene.control.*;
import javafx.scene.control.skin.TableColumnHeader;
import javafx.scene.control.skin.TableViewSkinBase;
import javafx.scene.control.skin.VirtualFlow;
import javafx.scene.input.KeyCode;
import javafx.scene.input.ScrollEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionTree<D, C, F extends Function<D, C>> extends
                           VBox
{

  final ExpressionAnalyzer<D, C, F> analyzer;
  TextField                         expressionInput;
  TreeTableView<Node<D, C, F>>      treeTableView;
  Expression<D, C, F>               expr;
  F                                 instance;
  C                                 result;
  Context                           context;
  HashMap<String, Boolean>          nodeExpansionStates;
  MiniSymbolPalette                 symbolPalette;
  private StackPane                 stackPane;
  VirtualFlow<?>                    tableVirtualFlow;
  private ScrollBar                 hbar;
  private ScrollBar                 vbar;

  public Context getContext()
  {
    return context;
  }

  public ExpressionTree(ExpressionAnalyzer<D, C, F> expressionAnalyzer)
  {
    super(10);
    this.analyzer = expressionAnalyzer;
    this.context  = new Context(Complex.named("input").set(3),
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
    analyzer.addEmacsKeybindings(expressionInput);

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
      var flow = getVirtualFlow();
      flow.setPannable(true);
      hbar = getTableVirtualFlowScrollbar(flow, true);
      vbar = getTableVirtualFlowScrollbar(flow, false);

      System.err.format("treeTableVirtualFlow=%s\nhbar=%s\nvbar=%s\npannable=%s\n",
                        tableVirtualFlow,
                        hbar,
                        vbar,
                        tableVirtualFlow.isPannable());
    }
    catch (Throwable e)
    {
      e.printStackTrace();
    }

  };

  public static ScrollBar getTableVirtualFlowScrollbar(VirtualFlow<?> tableVirtualFlow,
                                                       boolean horizontal) throws IllegalAccessException,
                                                                           NoSuchFieldException
  {
    var scrollbar = horizontal ? "hbar" : "vbar";
    return (ScrollBar) getVirtualFlowField(scrollbar).get(tableVirtualFlow);
  }

  public static Field getVirtualFlowField(String fieldName) throws NoSuchFieldException
  {
    Field hbarField = VirtualFlow.class.getDeclaredField(fieldName);
    hbarField.setAccessible(true);
    return hbarField;
  }

  public VirtualFlow<?> getVirtualFlow() throws NoSuchFieldException, IllegalAccessException
  {
    var   skin      = treeTableView.getSkin();
    Field flowField = TableViewSkinBase.class.getDeclaredField("flow");
    flowField.setAccessible(true);
    return tableVirtualFlow = (VirtualFlow<?>) flowField.get(skin);
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
    treeTableView.skinProperty().addListener(this::virtualFlowListener);
    treeTableView.getColumns().addAll(typesetCol, valueCol, nodeTypeCol, nodeTypeResultCol, nodeCol, fieldCol);
  }

  ScrollBar getScrollBar(VirtualFlow<?> treeTableVirtualFlow2, Orientation horizontal)
  {
    assert false : "TODO: also get this via reflection. I fucking hate this about java. The audicity of some neckbeard somewhere thinking that they are going to prevent me from accessing stuff on  my own computer is absurd.";
    return null;
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
      this.analyzer.showAlert("Compilation Error", e.getClass().getName(), e.getMessage());
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
    treeTableView.getColumns().forEach(column -> resizeColumn(column));
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
    nodeCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue().getValue().toString()));
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
      return new ReadOnlyStringWrapper(generatedType == null ? "null" : generatedType.getSimpleName());
    });
    return nodeTypeResultCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newTypesetCol()
  {
    TreeTableColumn<Node<D, C, F>, String> typesetCol = new TreeTableColumn<>("Expression");
    typesetCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue().getValue().typeset()));
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
    valueCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(evaluateNode(param.getValue().getValue())));
    return valueCol;
  }

  public void graph()
  {
    analyzer.showAlert("TODO", "TODO: graph.. ask for range.. 1d for real");
  }

  public void load()
  {
    analyzer.showAlert("TODO", "TODO: load");
  }

  private Optional<String> askWhatToSaveAs()
  {
    TextInputDialog dialog = new TextInputDialog();
    dialog.setTitle("New Variable");
    dialog.setHeaderText("Designation");
    dialog.setContentText("What shall this expression be designated as?");

    dialog.initOwner(getScene().getWindow());

    return dialog.showAndWait();
  }

  public void save()
  {
    Optional<String> filename = askWhatToSaveAs();
    if (filename.isPresent())
    {
      analyzer.showAlert("TODO", "TODO: save expression and context to " + filename);
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
    return enumerateNodeExpansionStates(new HashMap<String, Boolean>(), treeTableView.getRoot());
  }

  public HashMap<String, Boolean> applyNodeExpansionStates(HashMap<String, Boolean> states, TreeItem<?> item)
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

  public HashMap<String, Boolean> enumerateNodeExpansionStates(HashMap<String, Boolean> states, TreeItem<?> item)
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
    Platform.runLater(this::resizeColumnsToFitContent);
//    PauseTransition pause = new PauseTransition(Duration.millis(250));
//    pause.setOnFinished(event -> resizeColumnsToFitContent());
//    pause.play();
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
        analyzer.showAlert("Input Required", "variable named input must be defined in the context");
      }
      else
      {
        if ( expr == null )
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
          result = instance.evaluate(input, 128, result);
        }
        else
        {
          result = instance.evaluate(input, 128);
        }

        var rootItem = updateTreeTableView();

        if (nodeExpansionStates != null)
        {
          applyNodeExpansionStates(nodeExpansionStates, rootItem);
        }
        if (!anyExpanded(rootItem))
        {
          expandAllNodes();
        }

      }
    }
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
      Platform.runLater(() -> analyzer.showAlert("Evaluation Error", e.getClass().getName() + ": " + e.getMessage()));
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