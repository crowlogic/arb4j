package arb.expressions.viz;

import static arb.utensils.Utensils.wrapOrThrow;

import java.awt.image.BufferedImage;
import java.io.Closeable;
import java.io.File;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import arb.AlgebraicNumber;
import arb.Complex;
import arb.ComplexFraction;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.ComplexRationalFunction;
import arb.Fraction;
import arb.GaussianInteger;
import arb.Integer;
import arb.IntegerPolynomial;
import arb.Named;
import arb.Quaternion;
import arb.RationalFunction;
import arb.Real;
import arb.RealMatrix;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.SerializedExpression;
import arb.expressions.context.SerializedContextVariable;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.*;
import arb.functions.algebraic.AlgebraicNumberFunction;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;
import arb.functions.integer.IntegerPolynomialNullaryFunction;
import arb.functions.integer.IntegerPolynomialSequence;
import arb.functions.integer.IntegerSequence;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.integer.RealPolynomialSequence;
import arb.functions.integer.RealSequence;
import arb.functions.integer.Sequence;
import arb.functions.polynomials.RealPolynomialFunction;
import arb.functions.rational.ComplexRationalFunctionSequence;
import arb.functions.rational.ComplexRationalNullaryFunction;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.*;
import arb.utensils.ImageViewer;
import arb.utensils.Utensils;
import arb.viz.WindowManager;
import javafx.application.Platform;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.IndexedCell;
import javafx.scene.control.Label;
import javafx.scene.control.MenuItem;
import javafx.scene.control.Tab;
import javafx.scene.control.TextField;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.control.TreeTablePosition;
import javafx.scene.control.TreeTableView;
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
public class ExpressionTreeView<D, C extends Closeable, F extends Function<D, C>> extends
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
    context.variables.forEach((name,
                               variable) -> x.context.put(variable.getName(),
                                                          new SerializedContextVariable(variable)));
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

  public ComboBox<Class<?>> codomainTypeBox;

  public ComboBox<Class<?>> domainTypeBox;

  public ComboBox<Class<?>> functionTypeBox;

  public ExpressionTreeView(Expressor<D, C, F> expressionAnalyzer, Tab tab)
  {
    super(10);
    this.tab       = tab;
    this.expressor = expressionAnalyzer;
    this.context   = new Context();
    try
    {
      codomainTypeBox = new ComboBox<Class<?>>();
      domainTypeBox   = new ComboBox<Class<?>>();
      functionTypeBox = new ComboBox<Class<?>>();
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
    catch (Throwable e)
    {
      e.printStackTrace(System.err);
    }
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
      ObservableList<TreeTablePosition<Node<D, C, F>, ?>> item   = treeTableView.getSelectionModel()
                                                                                .getSelectedCells();
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
    treeTableView.getColumns()
                 .addAll(typesetCol, valueCol, nodeTypeCol, nodeTypeResultCol, nodeCol, fieldCol);
    WindowManager.makeTableViewPannable(treeTableView);
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
    expressor.updateContextTableView();
  }

  public void resizeColumnsToFitContent()
  {
    treeTableView.getColumns().forEach(WindowManager::resizeColumn);
  }

  protected TreeTableColumn<Node<D, C, F>, String> newNodeCol()
  {
    TreeTableColumn<Node<D, C, F>, String> nodeColumn = new TreeTableColumn<>("Node");
    nodeColumn.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                           .getValue()
                                                                           .toString()));
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
    TreeTableColumn<Node<D, C, F>,
                  String> nodeTypeResultColumn = new TreeTableColumn<>("Result Type");
    nodeTypeResultColumn.setCellValueFactory(param ->
    {

      TreeItem<Node<D, C, F>> treeItem      = param.getValue();
      Node<D, C, F>           node          = treeItem.getValue();
      Class<?>                generatedType = node.getGeneratedType();
      return new ReadOnlyStringWrapper(generatedType == null ? String.format("null for %s", node)
                                                             : generatedType.getSimpleName());
    });
    return nodeTypeResultColumn;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newTypesetCol()
  {
    TreeTableColumn<Node<D, C, F>, String> typesetColumn = new TreeTableColumn<>("Expression");
    typesetColumn.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                              .getValue()
                                                                              .typeset()));
    typesetColumn.setCellFactory(new TypeSettingCellFactory<>());
    return typesetColumn;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newFieldColumn()
  {
    TreeTableColumn<Node<D, C, F>, String> fieldCol = new TreeTableColumn<>("Field");
    fieldCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()
                                                                         .getValue()
                                                                         .getFieldName()));

    return fieldCol;
  }

  protected TreeTableColumn<Node<D, C, F>, String> newValueColumn()
  {
    TreeTableColumn<Node<D, C, F>, String> valueCol = new TreeTableColumn<>("Value");
    valueCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(evaluateNode(param.getValue()
                                                                                      .getValue())));
    return valueCol;
  }

  public ImageViewer graph()
  {
    // this needs to create the graph of the AST, not the functions within a Context
    BufferedImage graphImage =
                             Utensils.createDependencyGraphBufferedImage(expr.context.functionReferenceGraph);
    ImageViewer   view       = new ImageViewer(expr.className,
                                               graphImage);
    view.setVisible(true);
    return view;
  }

  public void load()
  {
    FileChooser fileChooser = new FileChooser();
    fileChooser.getExtensionFilters()
               .add(new ExtensionFilter("Expressions serialized in YAML Format",
                                        List.of("*.yaml")));
    File file = fileChooser.showOpenDialog(null);
    if (file != null)
    {
      expressor.addNewExpressionTab();

      expressor.getCurrentExpressionTree().load(file);
    }
  }

  public Context load(File file)
  {

    if (file != null)
    {
      try
      {
        SerializedExpression serializedExpression = Utensils.loadFromYamlFormat(file);
        context.variables.clear();

        var ctx = serializedExpression.context;
        System.err.println("serialized context: " + ctx);
        for (var k : ctx.entrySet())
        {
          var serializedContextVariable = k.getValue();
          var name                      = k.getKey();
          var type                      = serializedContextVariable.type;

          var serializedValueString     = serializedContextVariable.value;
          var typeClass                 = Class.forName(type);
          var isInteger                 = typeClass.equals(Integer.class);
          var needsBits                 = !isInteger;
          var constructor               =
                          !needsBits ? typeClass.getConstructor(String.class)
                                     : typeClass.getConstructor(String.class, int.class);
          var variable                  =
                       !needsBits ? (Named) constructor.newInstance(serializedValueString)
                                  : (Named) constructor.newInstance(serializedValueString, bits);
          variable.setName(name);

          if (!context.variables.containsKey(variable.getName()))
          {
            context.variables.put(variable.getName(), variable);
          }
          else
          {
            System.err.format("Ignored duplicated variable '%s' whilst loading %s", variable, file);
          }

        }

        expressor.updateContextTableView();

        if (serializedExpression.coDomain != null && codomainTypeBox != null)
        {
          codomainTypeBox.setValue(Class.forName(serializedExpression.coDomain));
        }
        if (serializedExpression.domain != null && domainTypeBox != null)
        {
          domainTypeBox.setValue(Class.forName(serializedExpression.domain));
        }
        if (serializedExpression.function != null && functionTypeBox != null)
        {
          functionTypeBox.setValue(Class.forName(serializedExpression.function));
        }
        if (tab != null)
        {
          tab.setText(file.getName().split("\\.")[0]);
        }
        if (expressionInput != null)
        {
          String expression = serializedExpression.expression;
          expressionInput.setText(expression);
        }
        evaluateExpression();
        expandAllNodes();
      }
      catch (Throwable e)
      {
        Utensils.throwOrWrap(e);
      }
    }

    return context;
  }

  private ClassStringConverter<D, C, F> classStringConverter = new ClassStringConverter<D, C, F>();

  public static Class<?>[]              TYPES                = new Class[]
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
    ComplexMatrix.class,
    RealFunction.class,
    ComplexFunction.class,
    Quaternion.class };

  public static Class<?>[]              INTERFACES           = new Class<?>[]
  { AlgebraicNumberFunction.class,
    IntegerSequence.class,
    RealSequence.class,
    Function.class,
    NullaryFunction.class,
    IntegerFunction.class,
    IntegerPolynomialSequence.class,
    IntegerNullaryFunction.class,
    IntegerPolynomialNullaryFunction.class,
    RealFunction.class,
    RealPolynomialFunction.class,
    ComplexFunction.class,
    ComplexSequence.class,
    ComplexPolynomialSequence.class,
    ComplexNullaryFunction.class,
    RationalFunctionSequence.class,
    RealPolynomialSequence.class,
    RealToComplexFunction.class,
    RealNullaryFunction.class,
    ComplexToRealFunction.class,
    ComplexRationalFunctionSequence.class,
    RationalNullaryFunction.class,
    ComplexRationalNullaryFunction.class,
    Sequence.class,
    RealFunctionSequence.class,
    ComplexFunctionSequence.class,
    RealBivariateFunction.class,
    FractionFunction.class };

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
    else if (functionType.equals(RealFunctionSequence.class))
    {
      selectTypes(Integer.class, RealFunction.class);
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
    else if (functionType.equals(RealToComplexFunction.class))
    {
      selectTypes(Real.class, Complex.class);
    }
    else if (functionType.equals(ComplexPolynomialNullaryFunction.class))
    {
      selectTypes(Object.class, ComplexPolynomial.class);
    }
    else if (functionType.equals(RealPolynomialFunction.class))
    {
      selectTypes(RealPolynomial.class, RealPolynomial.class);
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
    else if (functionType.equals(ComplexFunctionSequence.class))
    {
      selectTypes(Integer.class, ComplexFunction.class);
    }
    else if (functionType.equals(RealSequence.class))
    {
      selectTypes(Integer.class, Real.class);
    }
    else if (functionType.equals(FractionFunction.class))
    {
      selectTypes(Fraction.class, Fraction.class);
    }
    else if (functionType.equals(AlgebraicNumberFunction.class))
    {
      selectTypes(AlgebraicNumber.class, AlgebraicNumber.class);
    }
    else if (functionType.equals(Sequence.class))
    {
      domainTypeBox.getSelectionModel().select(Integer.class);
    }
    else if (functionType.equals(RealBivariateFunction.class))
    {
      selectTypes(Real.class, RealFunction.class);
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
      String intermediateValueFieldName = node.getFieldName();
      if (intermediateValueFieldName == null)
      {
        return "zilch";
      }
      if ("result".equals(intermediateValueFieldName))
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
    catch (Exception e)
    {
      wrapOrThrow(Arrays.asList(instance.getClass().getFields()).stream().toList().toString(), e);
    }
    return "see todo in assertion";
  }

  public HashMap<String, Boolean> enumerateNodeExpansionStates()
  {
    if (treeTableView == null)
    {
      return null;
    }
    return Expressor.enumerateNodeExpansionStates(new HashMap<String, Boolean>(),
                                                  treeTableView.getRoot());
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
        WindowManager.showAlert("Input Required",
                                "variable named input must be defined in the context");
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
            if (!expr.isFunctional())
            {
              result = expr.newCoDomainInstance();
            }

          }
          result = instance.evaluate(input, 128, result);
        }
        else
        {
          result = instance.evaluate(input, 128);
        }
        if (result instanceof Named namedResult)
        {
          namedResult.setName("result");
        }

        var rootItem = updateTreeTableView();

        if (nodeExpansionStates != null)
        {
          Expressor.applyNodeExpansionStates(nodeExpansionStates, rootItem);
        }

        if (!Expressor.anyExpanded(rootItem))
        {
          expandAllNodes();
        }

      }
    }
    catch (Throwable e)
    {
      Utensils.throwOrWrap(e);
    }
  }

}
