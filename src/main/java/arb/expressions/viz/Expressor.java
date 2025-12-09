package arb.expressions.viz;

import java.io.Closeable;
import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Optional;
import java.util.function.Consumer;

import arb.Named;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.polynomials.orthogonal.real.JacobiPolynomialSequence;
import arb.utensils.Utensils;
import arb.viz.WindowManager;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.MapChangeListener;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ChoiceDialog;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.Label;
import javafx.scene.control.MenuItem;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.SplitPane;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextInputDialog;
import javafx.scene.control.TreeItem;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

/**
 * TODO: save/restore/copy/paste/drag&drop context variables
 * 
 * TODO: add Parse button that only parses the AST but does not call generate
 * 
 * TODO: make Expressor have only a single global Context, that will make it
 * easier to cross-reference all functions within the global context to debug
 * sets of equations like is used in {@link JacobiPolynomialSequence}
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("unused")
public class Expressor<D, C extends Closeable, F extends Function<D, C>> extends
                      Application
{

  static
  {
    Arrays.sort(ExpressionTreeView.INTERFACES, Utensils.classNameComparator);
    Arrays.sort(ExpressionTreeView.TYPES, Utensils.classNameComparator);
  }

  public static void main(String[] args)
  {
    launch(args);
  }

  public int              bits                 = 128;

  VBox                    contextBox;

  public TableView<Named> contextTableView;

  private boolean         contextViewVisible   = false;

  private double[]        lastDividerPositions = null;

  private SplitPane       splitPane;

  private TabPane         tabPane;

  ExpressionTreeView<D, C, F> addNewExpressionTab()
  {
    Tab tab            = new Tab("Expression " + (tabPane.getTabs().size() + 1));
    var expressionTree = new ExpressionTreeView<D, C, F>(this,
                                                         tab);
    tab.setContent(expressionTree);
    tabPane.getTabs().add(tab);
    tabPane.getSelectionModel().select(tab);

    updateContextTableView();

    tab.setOnSelectionChanged(event ->
    {
      if (tab.isSelected())
      {
        updateContextTableView();
      }
    });

    return expressionTree;
  }

  @SuppressWarnings("resource")
  public void constructContextTableView()
  {
    contextTableView = new TableView<Named>();

    // ==================== Name Column ====================
    TableColumn<Named, String> nameColumn = new TableColumn<>("Name");
    nameColumn.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue()
                                                                                .getName()));
    nameColumn.setPrefWidth(150);
    nameColumn.setCellFactory(TextFieldTableCell.forTableColumn());
    nameColumn.setOnEditCommit(event ->
    {
      Named   item           = event.getRowValue();
      String  oldName        = item.getName();
      String  newName        = event.getNewValue();

      Context currentContext = getCurrentContext();
      if (currentContext != null && !oldName.equals(newName))
      {
        if (!currentContext.variables.containsKey(newName))
        {
          currentContext.rename(oldName, newName);
          item.setName(newName);
          contextTableView.refresh();
        }
        else
        {
          WindowManager.showAlert("Name Conflict",
                                  "A variable named '" + newName + "' already exists");
          contextTableView.refresh();
        }
      }
    });

    // ==================== Type Column ====================
    TableColumn<Named, String> typeColumn = new TableColumn<>("Type");
    typeColumn.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue()
                                                                                .getClass()
                                                                                .getSimpleName()));
    typeColumn.setPrefWidth(120);
    typeColumn.setCellFactory(column -> new TableCell<Named, String>()
    {
      private ChoiceBox<Class<?>> choiceBox;

      @Override
      protected void updateItem(String item, boolean empty)
      {
        super.updateItem(item, empty);

        if (empty || getTableRow() == null || getTableRow().getItem() == null)
        {
          setText(null);
          setGraphic(null);
        }
        else
        {
          Named variable = getTableRow().getItem();

          if (isEditing())
          {
            if (choiceBox == null)
            {
              choiceBox =
                        new ChoiceBox<>(FXCollections.observableArrayList(ExpressionTreeView.TYPES));
              choiceBox.setConverter(new javafx.util.StringConverter<Class<?>>()
              {
                @Override
                public String toString(Class<?> clazz)
                {
                  return clazz == null ? "" : clazz.getSimpleName();
                }

                @Override
                public Class<?> fromString(String string)
                {
                  return null;
                }
              });
              choiceBox.setOnAction(e ->
              {
                Class<?> selectedType = choiceBox.getValue();
                if (selectedType != null)
                {
                  commitEdit(selectedType.getSimpleName());
                }
              });
            }
            choiceBox.setValue(variable.getClass());
            setGraphic(choiceBox);
            setText(null);
          }
          else
          {
            setText(variable.getClass().getSimpleName());
            setGraphic(null);
          }
        }
      }

      @Override
      public void startEdit()
      {
        super.startEdit();
        Named variable = getTableRow().getItem();
        if (variable != null)
        {
          if (choiceBox == null)
          {
            choiceBox =
                      new ChoiceBox<>(FXCollections.observableArrayList(ExpressionTreeView.TYPES));
            choiceBox.setConverter(new javafx.util.StringConverter<Class<?>>()
            {
              @Override
              public String toString(Class<?> clazz)
              {
                return clazz == null ? "" : clazz.getSimpleName();
              }

              @Override
              public Class<?> fromString(String string)
              {
                return null;
              }
            });
            choiceBox.setOnAction(e ->
            {
              Class<?> selectedType = choiceBox.getValue();
              if (selectedType != null)
              {
                commitEdit(selectedType.getSimpleName());
              }
            });
          }
          choiceBox.setValue(variable.getClass());
          setGraphic(choiceBox);
          setText(null);
        }
      }

      @Override
      public void cancelEdit()
      {
        super.cancelEdit();
        Named variable = getTableRow().getItem();
        setText(variable == null ? null : variable.getClass().getSimpleName());
        setGraphic(null);
      }

      @Override
      public void commitEdit(String newValue)
      {
        super.commitEdit(newValue);

        Named oldVariable = getTableRow().getItem();
        if (oldVariable != null)
        {
          Context currentContext = getCurrentContext();
          if (currentContext != null)
          {
            try
            {
              // Find the selected class
              Class<?> newType = null;
              for (Class<?> type : ExpressionTreeView.TYPES)
              {
                if (type.getSimpleName().equals(newValue))
                {
                  newType = type;
                  break;
                }
              }

              if (newType != null && !newType.equals(oldVariable.getClass()))
              {
                // Create new instance of the new type
                Named newVariable = (Named) newType.getConstructor().newInstance();
                newVariable.setName(oldVariable.getName());

                // Replace in context
                currentContext.variables.put(oldVariable.getName(), newVariable);
                contextTableView.refresh();
              }
            }
            catch (Exception e)
            {
              WindowManager.showAlert("Type Change Error",
                                      "Could not change type: " + e.getMessage());
              Utensils.wrapOrThrow(e);
            }
          }
        }
      }
    });

    // ==================== Value Column ====================
    TableColumn<Named, String> valueColumn = new TableColumn<>("Value");
    valueColumn.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue()
                                                                                 .toString()));
    valueColumn.setPrefWidth(200);
    valueColumn.setCellFactory(TextFieldTableCell.forTableColumn());
    valueColumn.setOnEditCommit(event ->
    {
      Named  item        = event.getRowValue();
      String newValueStr = event.getNewValue();

      try
      {
        // Handle different types
        if (item instanceof Real)
        {
          Real real = (Real) item;
          real.set(newValueStr, real.bits());
        }
        else if (item instanceof arb.Integer)
        {
          arb.Integer integer = (arb.Integer) item;
          integer.set(newValueStr);
        }
        else if (item instanceof arb.Complex)
        {
          arb.Complex complex = (arb.Complex) item;
          complex.set(newValueStr, complex.bits());
        }
        else
        {
          // Try to use reflection to find a suitable setter
          try
          {
            var method = item.getClass().getMethod("set", String.class);
            method.invoke(item, newValueStr);
          }
          catch (NoSuchMethodException e)
          {
            try
            {
              var method = item.getClass().getMethod("set", String.class, int.class);
              method.invoke(item, newValueStr, 128); // default precision
            }
            catch (NoSuchMethodException e2)
            {
              WindowManager.showAlert("Value Update Error",
                                      "Type "
                                                            + item.getClass().getSimpleName()
                                                            + " does not support value editing");
            }
          }
        }
        contextTableView.refresh();
      }
      catch (Exception e)
      {
        WindowManager.showAlert("Value Parse Error", "Could not parse value: " + e.getMessage());
        contextTableView.refresh();
      }
    });

    contextTableView.getColumns().addAll(nameColumn, typeColumn, valueColumn);
    contextTableView.setEditable(true);
  }

  public VBox createMainLayout()
  {
    tabPane = new TabPane();

    var mainLayout = new VBox(10);

    var buttonBox  = new HBox(10,
                              newButtonBox());

    var scrollpane = createScrollPane();

    mainLayout.getChildren().addAll(buttonBox, scrollpane);

    return mainLayout;
  }

  protected ScrollPane createScrollPane()
  {
    var scrollpane = new ScrollPane(createSplitPane());
    VBox.setVgrow(scrollpane, Priority.ALWAYS);

    scrollpane.setFitToWidth(true);
    scrollpane.setMinViewportWidth(1800);
    scrollpane.setFitToHeight(true);
    scrollpane.setPannable(true);
    return scrollpane;
  }

  protected SplitPane createSplitPane()
  {
    splitPane  = new SplitPane();
    contextBox = new VBox(10);
    constructContextTableView();

    var contextMenu = newContextMenu();
    contextTableView.setContextMenu(contextMenu);
    contextBox.getChildren().addAll(new Label("Context Variables:"), contextTableView);
    VBox.setVgrow(splitPane, Priority.ALWAYS);
    splitPane.getItems().add(tabPane);
    return splitPane;
  }

  public void evaluate()
  {
    executeTabAction(ExpressionTreeView::evaluateExpression);
  }

  private void executeTabAction(Consumer<ExpressionTreeView<D, C, F>> action)
  {
    var expressionTab = getCurrentExpressionTree();
    if (expressionTab != null)
    {
      action.accept(expressionTab);
    }
  }

  @SuppressWarnings("unchecked")
  public Context getCurrentContext()
  {
    if (tabPane == null)
    {
      return null;
    }
    var currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab != null)
    {
      var content       = currentTab.getContent();
      var expressionTab = (ExpressionTreeView<D, C, F>) content;
      return expressionTab.context;
    }
    return null;
  }

  @SuppressWarnings("unchecked")
  public ExpressionTreeView<D, C, F> getCurrentExpressionTree()
  {
    var currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab == null)
    {
      addNewExpressionTab();
      currentTab = tabPane.getSelectionModel().getSelectedItem();
    }
    var content       = currentTab.getContent();
    var expressionTab = (ExpressionTreeView<D, C, F>) content;
    return expressionTab;
  }

  private HBox newButtonBox()
  {
    var addTabButton = new Button("New");
    addTabButton.setOnAction(e -> addNewExpressionTab());

    var compileButton = new Button("Compile");
    compileButton.setOnAction(e -> executeTabAction(ExpressionTreeView::compileExpression));

    var expandAllButton = new Button("Expand All");
    expandAllButton.setOnAction(e -> executeTabAction(ExpressionTreeView::expandAllNodes));

    var evaluateButton = new Button("Evaluate");
    evaluateButton.setOnAction(e -> evaluate());

    var toggleContextButton = new Button("Toggle Context");
    toggleContextButton.setOnAction(e -> toggleContextView());

    var saveButton = new Button("Save");
    saveButton.setOnAction(e -> executeTabAction(ExpressionTreeView::save));

    var loadButton = new Button("Load");
    loadButton.setOnAction(e -> executeTabAction(ExpressionTreeView::load));

    var graphButton = new Button("Graph");
    graphButton.setOnAction(e -> executeTabAction(ExpressionTreeView::graph));

    return new HBox(10,
                    addTabButton,
                    compileButton,
                    expandAllButton,
                    evaluateButton,
                    toggleContextButton,
                    saveButton,
                    loadButton,
                    graphButton);
  }

  protected ContextMenu newContextMenu()
  {
    var contextMenu = new ContextMenu(newDeleteVariableMenuItem(),
                                      newNewVariableMenuItem(),
                                      newRenameVariableMenuItem());
    return contextMenu;
  }

  public MenuItem newDeleteVariableMenuItem()
  {
    var deleteVariableMenuItem = new MenuItem("Delete Variable");
    deleteVariableMenuItem.setOnAction(e ->
    {
      var selectedItem = contextTableView.getSelectionModel().getSelectedItem();
      if (selectedItem != null)
      {
        var currentContext = getCurrentContext();
        if (currentContext != null)
        {
          currentContext.variables.remove(selectedItem.getName());
        }
      }
    });
    return deleteVariableMenuItem;
  }

  public MenuItem newNewVariableMenuItem()
  {
    var insertNewRealVariable = new MenuItem("New Variable");
    insertNewRealVariable.setOnAction(e ->
    {
      NewVariable newVar = showNewVariableDialogs(false);
      if (newVar != null)
      {
        var currentContext = getCurrentContext();
        if (currentContext != null)
        {
          Named newInstance;
          try
          {
            newInstance = (Named) newVar.getType().getConstructor().newInstance();
            newInstance.setName(newVar.getName());
            if (!currentContext.variables.containsKey(newVar.getName()))
            {
              currentContext.variables.put(newVar.getName(), newInstance);
            }
            else
            {
              WindowManager.showAlert("Variable Name Conflict",
                                      "A variable named " + newVar.getName() + " already exists");
            }
          }
          catch (Throwable t)
          {
            Utensils.wrapOrThrow(t);
          }
        }
      }
    });
    return insertNewRealVariable;
  }

  public MenuItem newRenameVariableMenuItem()
  {
    var renameVariable = new MenuItem("Rename Variable");
    renameVariable.setOnAction(e ->
    {
      Named selectedItem = contextTableView.getSelectionModel().getSelectedItem();
      if (selectedItem == null)
      {
        WindowManager.showAlert("Error", "The variable to rename must be selected.");
        return;
      }

      var newVarName = showVariableNameDialog(true);
      if (newVarName != null)
      {
        var currentContext = getCurrentContext();
        if (currentContext != null)
        {
          var oldName = selectedItem.getName();
          currentContext.rename(oldName, newVarName);
          updateContextTableView();
        }
      }
    });
    return renameVariable;
  }

  public void setStageIcon(Stage primaryStage)
  {
    WindowManager.setStageIcon(primaryStage, "ExpressionAnalyzer.png");
  }

  boolean shouldConfirmClose()
  {
    return false;
  }

  private NewVariable showNewVariableDialogs(boolean rename)
  {
    var typeChoice = showVariableTypeDialog();
    if (typeChoice.isEmpty())
    {
      return null;
    }
    var type       = typeChoice.get();
    var newVarName = showVariableNameDialog(rename);
    if (newVarName != null)
    {
      return new NewVariable(newVarName,
                             type);
    }
    else
    {
      return null;
    }
  }

  public String showVariableNameDialog(boolean rename)
  {
    var dialog = new TextInputDialog();
    dialog.setTitle("New Variable");
    dialog.setHeaderText(rename ? "Enter the new name for the variable:"
                                : "Enter the name for the new variable:");
    dialog.setContentText("Variable name:");
    dialog.initOwner(tabPane.getScene().getWindow());
    var newVarName = dialog.showAndWait();
    if (newVarName.isEmpty())
    {
      return null;
    }
    return newVarName.get();
  }

  public Optional<Class<?>> showVariableTypeDialog()
  {
    var choiceDialog = new ChoiceDialog<>(Real.class,
                                          ExpressionTreeView.TYPES);
    choiceDialog.setTitle("Select Type");
    choiceDialog.setContentText("What's the new variable type?");
    choiceDialog.initOwner(tabPane.getScene().getWindow());
    var typeChoice = choiceDialog.showAndWait();
    if (typeChoice.isEmpty())
    {
      return null;
    }
    return typeChoice;
  }

  @Override
  public void start(Stage primaryStage)
  {
    setStageIcon(primaryStage);

    primaryStage.setWidth(2000);
    primaryStage.setHeight(950);

    var scene = new Scene(createMainLayout());

    scene.getStylesheets().add(Stylesheet.convertStylesheetToDataURI(Stylesheet.DarkerStyle));

    scene.addEventFilter(KeyEvent.KEY_PRESSED, event ->
    {
      if (event.getCode() == KeyCode.ESCAPE)
      {
        primaryStage.fireEvent(new WindowEvent(primaryStage,
                                               WindowEvent.WINDOW_CLOSE_REQUEST));
      }
    });

    primaryStage.setOnCloseRequest(evt ->
    {
      if (shouldConfirmClose())
      {
        var alert = new Alert(AlertType.CONFIRMATION);
        alert.setTitle("Confirm Close");
        alert.setHeaderText("Close program?");
        alert.showAndWait().filter(r -> r != ButtonType.OK).ifPresent(r -> evt.consume());
      }
    });

    primaryStage.setScene(scene);
    primaryStage.setTitle("Expressor");
    primaryStage.show();

    scene.setOnKeyPressed(handler ->
    {
      if (handler.getCode() == KeyCode.F11)
      {
        primaryStage.setFullScreen(!primaryStage.isFullScreen());
      }
    });

    Parameters params = getParameters();
    if (params.getRaw().isEmpty())
    {
      addNewExpressionTab();
    }
    else
    {
      Platform.runLater(() ->
      {
        for (String param : params.getRaw())
        {
          var newTab = addNewExpressionTab();
          newTab.load(new File(param));
        }
      });
    }

  }

  private void toggleContextView()
  {
    if (contextViewVisible)
    {
      lastDividerPositions = splitPane.getDividerPositions();
      splitPane.getItems().remove(contextBox);
    }
    else
    {
      updateContextTableView();
      splitPane.getItems().add(0, contextBox);
      splitPane.setDividerPositions(lastDividerPositions == null ? new double[]
      { 0.19 } : lastDividerPositions);

    }
    contextViewVisible = !contextViewVisible;
  }

  void updateContextTableView()
  {
    Context currentContext = getCurrentContext();
    if (currentContext != null && contextTableView != null)
    {
      // Create ObservableList from map values
      ObservableList<
                    Named> list =
                                FXCollections.observableArrayList(currentContext.variables.values());

      // Add listener to keep synchronized with map changes
      currentContext.variables.addListener((MapChangeListener<String, Named>) change ->
      {
        if (change.wasRemoved())
        {
          list.remove(change.getValueRemoved());
        }
        if (change.wasAdded())
        {
          list.add(change.getValueAdded());
        }
      });

      contextTableView.setItems(list);
      contextTableView.refresh();
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

  public static HashMap<String, Boolean> applyNodeExpansionStates(HashMap<String, Boolean> states,
                                                                  TreeItem<?> item)
  {
    if (item != null && !item.isLeaf())
    {
      Boolean value = states.get(item.getValue().toString());
      if (value != null)
      {
        item.setExpanded(value);
      }

      for (var child : item.getChildren())
      {
        applyNodeExpansionStates(states, child);
      }
    }
    return states;
  }

  public static HashMap<String, Boolean>
         enumerateNodeExpansionStates(HashMap<String, Boolean> states, TreeItem<?> item)
  {
    if (item != null && !item.isLeaf())
    {
      states.put(item.getValue().toString(), item.isExpanded());

      for (var child : item.getChildren())
      {
        enumerateNodeExpansionStates(states, child);
      }
    }
    return states;
  }

}
