package arb.expressions.viz;

import static arb.utensils.Utensils.wrapOrThrow;

import java.io.Closeable;
import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.SerializedContextVariable;
import arb.expressions.SerializedExpression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.*;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.integer.*;
import arb.functions.polynomials.RealPolynomialFunction;
import arb.functions.rational.ComplexRationalFunctionSequence;
import arb.functions.rational.ComplexRationalNullaryFunction;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import arb.utensils.Utensils;
import arb.viz.WindowManager;
import javafx.application.Platform;
import javafx.beans.Observable;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.control.*;
import javafx.scene.control.skin.VirtualFlow;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.FileChooser.ExtensionFilter;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionTree<D, C extends Closeable, F extends Function<D, C>> extends
                           VBox
{

  public static final int bits = 128;

  public void save(File yamlFile)
  {
    var x = new SerializedExpression();
    x.coDomain   = codomainTypeBox.getValue().getName();
    x.domain     = domainTypeBox.getValue().getName();
    x.function   = functionTypeBox.getValue().getName();
    x.expression = this.expressionInput.getText();
    x.context    = new HashMap<>();
    context.variables.forEach(variable -> x.context.put(variable.getName(), new SerializedContextVariable(variable)));
    System.out.println("Saving " + yamlFile);
    Utensils.saveToYamlFormat(yamlFile, x);
    tab.setText(yamlFile.getName().split("\\.")[0]);
  }

  final Expressor<D, C, F>     expressor;
  TreeTableView<Node<D, C, F>> treeTableView;
  public TextField             expressionInput;
  public Expression<D, C, F>   expr;
  F                            instance;
  C                            result;
  Context                      context;
  HashMap<String, Boolean>     nodeExpansionStates;
  MiniSymbolPalette            symbolPalette;
  private StackPane            stackPane;
  VirtualFlow<?>               tableVirtualFlow;

  IndexedCell<?>               pointer;
  private Tab                  tab;

  public Context getContext()
  {
    return context;
  }

  public final ComboBox<Class<?>> codomainTypeBox = new ComboBox<Class<?>>();

  public final ComboBox<Class<?>> domainTypeBox   = new ComboBox<Class<?>>();

  public final ComboBox<Class<?>> functionTypeBox = new ComboBox<Class<?>>();

  public ExpressionTree(Expressor<D, C, F> expressionAnalyzer, Tab tab)
  {
    super(10);
    this.tab       = tab;
    this.expressor = expressionAnalyzer;
    this.context   = new Context();

    setupExpressionInput();

    MiniSymbolPalette symbolPalette = new MiniSymbolPalette(expressionInput);

    VBox              inputRow      = new VBox();
    HBox              rhs           = new HBox();
    inputRow.getChildren().addAll(setupTypeBoxes(), expressionInput, symbolPalette);
    rhs.getChildren().addAll(inputRow);
    VBox.setVgrow(expressionInput, Priority.ALWAYS);

    setupTreeTableView();

    stackPane = new StackPane(treeTableView);
    getChildren().addAll(rhs, stackPane);
    setPadding(new Insets(10));

    VBox.setVgrow(stackPane, Priority.ALWAYS);
    HBox.setHgrow(stackPane, Priority.ALWAYS);
    VBox.setVgrow(this, Priority.ALWAYS);
  }

  public void setupExpressionInput()
  {
    expressionInput = new TextField();
    expressionInput.setPromptText("Enter expression:");

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

  public VirtualFlow<?>    flow;
  public static Class<?>[] TYPES = new Class[]

  { AlgebraicNumber.class,
    Object.class,
    Integer.class,
    GaussianInteger.class,
    Real.class,
    Complex.class,
    IntegerPolynomial.class,
    RealPolynomial.class,
    ComplexPolynomial.class,
    RationalFunction.class,
    ComplexRationalFunction.class,
    Fraction.class,
    ComplexFraction.class,
    RealMatrix.class,
    ComplexMatrix.class };

  public VirtualFlow<?> getVirtualFlow()
  {
    return (flow == null) ? flow = WindowManager.getVirtualFlow(treeTableView) : flow;
  }

  @SuppressWarnings("unchecked")
  private void setupTreeTableView()
  {
    treeTableView = new TreeTableView<>();
    treeTableView.setColumnResizePolicy(TreeTableView.UNCONSTRAINED_RESIZE_POLICY);
    var      nodeCol           = newNodeCol();
    var      nodeTypeCol       = newNodeTypeCol();
    var      nodeTypeResultCol = newNodeTypeResultCol();
    var      typesetCol        = newTypesetCol();
    var      fieldCol          = newFieldColumn();
    var      valueCol          = newValueColumn();
    MenuItem copyMenuItem      = new MenuItem("copy");

    copyMenuItem.setOnAction(event ->
    {
      ObservableList<TreeTablePosition<Node<D, C, F>, ?>> item   = treeTableView.getSelectionModel().getSelectedCells();
      MenuItem                                            source = (MenuItem) event.getSource();
      System.err.println("onAction "
                         + source.getText()
                         + " item="
                         + item.getFirst().getRow()
                         + ","
                         + item.getFirst().getColumn());

    });
    treeTableView.setContextMenu(new ContextMenu(copyMenuItem));
    treeTableView.setTableMenuButtonVisible(true);
    treeTableView.skinProperty().addListener(this::virtualFlowListener);
    treeTableView.getColumns().addAll(typesetCol, valueCol, nodeTypeCol, nodeTypeResultCol, nodeCol, fieldCol);
  }

  @SuppressWarnings("unchecked")
  public void compileExpression()
  {
    String expressionString = expressionInput.getText();
    if (expressionString.trim().isEmpty())
    {
      return;
    }
    try
    {
      Class<D> domainType   = (Class<D>) this.domainTypeBox.getValue();
      Class<C> codomainType = (Class<C>) this.codomainTypeBox.getValue();
      Class<F> functionType = (Class<F>) this.functionTypeBox.getValue();

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
    ListView<Named> contextListView = (ListView<Named>) this.expressor.contextBox.getChildren().get(1);
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

  public void load(File file)
  {

    if (file != null)
    {
      try
      {
        SerializedExpression serializedExpression = Utensils.loadFromYamlFormat(file);
        context.variables.clear();

        for (Map.Entry<String, SerializedContextVariable> k : serializedExpression.context.entrySet())
        {
          SerializedContextVariable serializedContextVariable = k.getValue();
          String                    name                      = k.getKey();
          String                    type                      = serializedContextVariable.type;

          String                    serializedValueString     = serializedContextVariable.value;
          Class<?>                  typeClass                 = Class.forName(type);
          boolean                   isInteger                 = typeClass.equals(Integer.class);
          boolean                   needsBits                 = !isInteger;
          Constructor<?>            constructor               =
                                                !needsBits ? typeClass.getConstructor(String.class)
                                                           : typeClass.getConstructor(String.class, int.class);
          Named                     variable                  =
                                             !needsBits ? (Named) constructor.newInstance(serializedValueString)
                                                        : (Named) constructor.newInstance(serializedValueString, bits);
          variable.setName(name);

          context.variables.add(variable);

        }

        expressor.updateContextListView();

        if (serializedExpression.coDomain != null)
        {
          codomainTypeBox.setValue(Class.forName(serializedExpression.coDomain));
        }
        if (serializedExpression.domain != null)
        {
          domainTypeBox.setValue(Class.forName(serializedExpression.domain));
        }
        if (serializedExpression.function != null)
        {
          functionTypeBox.setValue(Class.forName(serializedExpression.function));
        }
        tab.setText(file.getName().split("\\.")[0]);
        String expression = serializedExpression.expression;
        expressionInput.setText(expression);
        evaluateExpression();
        expandAllNodes();
      }
      catch (Throwable e)
      {
        Utensils.throwOrWrap(e);
      }
    }
  }

  private ClassStringConverter<D, C, F> classStringConverter = new ClassStringConverter<D, C, F>();
  public static Class<?>[]              INTERFACES           = new Class<?>[]
  { IntegerSequence.class,
    RealSequence.class,
    Function.class,
    NullaryFunction.class,
    IntegerFunction.class,
    IntegerPolynomialSequence.class,
    IntegerPolynomialNullaryFunction.class,
    RealFunction.class,
    RealPolynomialFunction.class,
    ComplexFunction.class,
    ComplexSequence.class,
    ComplexPolynomialSequence.class,
    ComplexNullaryFunction.class,
    RationalFunctionSequence.class,
    RationalNullaryFunction.class,
    RealPolynomialSequence.class,
    RealToComplexFunction.class,
    RealNullaryFunction.class,
    ComplexToRealFunction.class,
    ComplexRationalFunctionSequence.class,
    ComplexRationalNullaryFunction.class,
    Sequence.class };

  private HBox setupTypeBoxes()
  {
    HBox typeBox = new HBox();

    domainTypeBox.getItems().addAll(TYPES);
    domainTypeBox.setConverter(classStringConverter);

    codomainTypeBox.getItems().addAll(TYPES);
    codomainTypeBox.setConverter(classStringConverter);

    functionTypeBox.getItems().addAll(INTERFACES);
    functionTypeBox.setConverter(classStringConverter);
    domainTypeBox.setValue(Complex.class);
    codomainTypeBox.setValue(Complex.class);
    functionTypeBox.setOnAction(e ->
    {
      functionTypeSelected(functionTypeBox.getValue());
    });
    functionTypeBox.setValue(ComplexFunction.class);

    HBox domainBox   = new HBox(new Label("Domain:"),
                                domainTypeBox);
    HBox codomainBox = new HBox(new Label("Codomain:"),
                                codomainTypeBox);
    HBox functionBox = new HBox(new Label("Function:"),
                                functionTypeBox);
    typeBox.getChildren().addAll(domainBox, codomainBox, functionBox);
    return typeBox;
  }

  void functionTypeSelected(Class<?> functionType)
  {
    if (functionType.equals(Function.class))
    {
    }
    else if (functionType.equals(NullaryFunction.class))
    {
      domainTypeBox.getSelectionModel().select(Object.class);
    }
    else if (functionType.equals(IntegerFunction.class))
    {
      selectTypes(Integer.class, Integer.class);
    }
    else if (functionType.equals(IntegerPolynomialSequence.class))
    {
      selectTypes(Integer.class, IntegerPolynomial.class);
    }
    else if (functionType.equals(IntegerPolynomialNullaryFunction.class))
    {
      selectTypes(Object.class, IntegerPolynomial.class);
    }
    else if (functionType.equals(RealFunction.class))
    {
      selectTypes(Real.class, Real.class);
    }
    else if (functionType.equals(RealPolynomialFunction.class))
    {
      selectTypes(RealPolynomial.class, RealPolynomial.class);
    }
    else if (functionType.equals(ComplexFunction.class))
    {
      selectTypes(Complex.class, Complex.class);
    }
    else if (functionType.equals(ComplexPolynomialSequence.class))
    {
      selectTypes(Integer.class, ComplexPolynomial.class);
    }
    else if (functionType.equals(ComplexNullaryFunction.class))
    {
      selectTypes(Object.class, Complex.class);
    }
    else if (functionType.equals(RationalFunctionSequence.class))
    {
      selectTypes(Integer.class, RationalFunction.class);
    }
    else if (functionType.equals(RationalNullaryFunction.class))
    {
      selectTypes(Object.class, RationalFunction.class);
    }
    else if (functionType.equals(ComplexToRealFunction.class))
    {
      selectTypes(Complex.class, Real.class);
    }
    else if (functionType.equals(ComplexRationalFunctionSequence.class))
    {
      selectTypes(Integer.class, ComplexRationalFunction.class);
    }
    else if (functionType.equals(ComplexRationalNullaryFunction.class))
    {
      selectTypes(Object.class, ComplexRationalFunction.class);
    }
    else if (functionType.equals(RealNullaryFunction.class))
    {
      selectTypes(Object.class, Real.class);
    }
    else if (functionType.equals(ComplexPolynomialNullaryFunction.class))
    {
      selectTypes(Object.class, ComplexPolynomial.class);
    }
    else if (functionType.equals(RealPolynomialFunction.class))
    {
      selectTypes(RealPolynomial.class, RealPolynomial.class);
    }
    else if (functionType.equals(RealToComplexFunction.class))
    {
      selectTypes(Real.class, Complex.class);
    }
    else if (functionType.equals(ComplexSequence.class))
    {
      selectTypes(Integer.class, Complex.class);
    }
    else if (functionType.equals(IntegerPolynomialSequence.class))
    {
      selectTypes(Integer.class, IntegerPolynomial.class);
    }
    else if (functionType.equals(IntegerSequence.class))
    {
      selectTypes(Integer.class, Integer.class);
    }
    else if (functionType.equals(RealPolynomialSequence.class))
    {
      selectTypes(Integer.class, RealPolynomial.class);
    }
    else if (functionType.equals(RationalFunctionSequence.class))
    {
      selectTypes(Integer.class, RationalFunction.class);
    }
    else if (functionType.equals(RealSequence.class))
    {
      selectTypes(Integer.class, Real.class);
    }
    else if (functionType.equals(Sequence.class))
    {
      domainTypeBox.getSelectionModel().select(Integer.class);
    }
    else
    {
      System.err.println("functionTypeSelected: TODO: handle " + functionType);
    }
  }

  public void selectTypes(Class<?> aclass, Class<?> bclass)
  {
    domainTypeBox.getSelectionModel().select(aclass);
    codomainTypeBox.getSelectionModel().select(bclass);
  }

  public void save()
  {
    FileChooser fileChooser = new FileChooser();
    fileChooser.getExtensionFilters()
               .add(new ExtensionFilter("Expressions serialized in YAML Format",
                                        List.of("*.yaml")));
    File file = fileChooser.showSaveDialog(null);
    if (file != null)
    {
      save(file);
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
    if (expr != null && !expr.expression.equals(expressionInput.getText()) || expr == null)
    {
      compileExpression();
    }

    if (expr == null)
    {
      return;
    }
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
      Utensils.throwOrWrap(e);
      //e.printStackTrace(System.err);
      //Platform.runLater(() -> WindowManager.showAlert("Evaluation Error",
      // e.getClass().getName(), e));
    }
  }

}
