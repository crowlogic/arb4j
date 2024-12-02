package arb.expressions.viz;

import java.io.Closeable;
import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;

import arb.Named;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.viz.context.ContextFieldListCell;
import arb.expressions.viz.context.ContextMenuListCell;
import arb.expressions.viz.context.ContextVariableStringConverter;
import arb.functions.Function;
import arb.utensils.Utensils;
import arb.viz.WindowManager;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.FileChooser.ExtensionFilter;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.StringConverter;

/**
 * TODO: save/restore/copy/paste/drag&drop context variables
 * 
 * TODO: add Parse button that only parses the AST but does not call generate
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
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

  public int             bits                 = 128;

  VBox                   contextBox;

  public ListView<Named> contextListView;

  private boolean        contextViewVisible   = false;

  private SplitPane      splitPane;

  private TabPane        tabPane;

  private double[]       lastDividerPositions = null;

  ExpressionTreeView<D, C, F> addNewExpressionTab()
  {
    Tab tab            = new Tab("Expression " + (tabPane.getTabs().size() + 1));
    var expressionTree = new ExpressionTreeView<D, C, F>(this,
                                                     tab);
    tab.setContent(expressionTree);
    tabPane.getTabs().add(tab);
    tabPane.getSelectionModel().select(tab);

    updateContextListView();

    tab.setOnSelectionChanged(event ->
    {
      if (tab.isSelected())
      {
        updateContextListView();
      }
    });

    return expressionTree;
  }

  void updateContextListView()
  {
    Context currentContext = getCurrentContext();
    if (currentContext != null && contextListView != null)
    {
      contextListView.setItems(currentContext.variables);
    }
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
    constructContextListView();

    var         converter   = new ContextVariableStringConverter<D, C, F>(this);
    ContextMenu contextMenu = newContextMenu(converter);
    contextListView.setContextMenu(contextMenu);
    contextBox.getChildren().addAll(new Label("Context Variables:"), contextListView);
    VBox.setVgrow(splitPane, Priority.ALWAYS);
    splitPane.getItems().add(tabPane);
    return splitPane;
  }

  public void constructContextListView()
  {
    contextListView = new ListView<Named>();

    contextListView.setOnEditCommit(new ContextVariableEditCommitHandler<D, C, F>(this));

  }

  public record NewVariable(String name, Class<?> type)
  {
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
      NewVariable newVar = new NewVariable(newVarName,
                                           type);
      return newVar;
    }
    else
    {
      return null;
    }
  }

  public String showVariableNameDialog(boolean rename)
  {
    TextInputDialog dialog = new TextInputDialog();
    dialog.setTitle("New Variable");
    dialog.setHeaderText(rename ? "Enter the new name for the variable:" : "Enter the name for the new variable:");
    dialog.setContentText("Variable name:");
    dialog.initOwner(tabPane.getScene().getWindow());
    Optional<String> newVarName = dialog.showAndWait();
    if (newVarName.isEmpty())
    {
      return null;
    }
    return newVarName.get();
  }

  public Optional<Class<?>> showVariableTypeDialog()
  {
    ChoiceDialog<Class<?>> choiceDialog = new ChoiceDialog<>(Real.class,
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

  protected ContextMenu newContextMenu(StringConverter<Named> converter)
  {
    ContextMenu contextMenu = new ContextMenu(newDeleteVariableMenuItem(),
                                              newNewVariableMenuItem(),
                                              newRenameVariableMenuItem());

    contextListView.setCellFactory(ContextMenuListCell.forListView(contextMenu,
                                                                   param -> new ContextFieldListCell<D, C, F>(this,
                                                                                                              converter)));

    contextListView.setEditable(true);
    return contextMenu;
  }

  public MenuItem newRenameVariableMenuItem()
  {
    MenuItem renameVariable = new MenuItem("Rename Variable");
    renameVariable.setOnAction(e ->
    {
      Named selectedItem = contextListView.getSelectionModel().getSelectedItem();
      if (selectedItem == null)
      {
        WindowManager.showAlert("Error", "The variable to rename must be selected.");
        return;
      }

      var newVar = showVariableNameDialog(true);
      if (newVar != null)
      {
        Context currentContext = getCurrentContext();
        if (currentContext != null)
        {
          String oldName = selectedItem.getName();
          currentContext.variables.rename(oldName, newVar);
          updateContextListView();
        }
      }
    });
    return renameVariable;
  }

  public MenuItem newNewVariableMenuItem()
  {
    MenuItem insertNewRealVariable = new MenuItem("New Variable");
    insertNewRealVariable.setOnAction(e ->
    {
      NewVariable newVar = showNewVariableDialogs(false);
      if (newVar != null)
      {
        Context currentContext = getCurrentContext();
        if (currentContext != null)
        {
          Named newInstance;
          try
          {
            newInstance = (Named) newVar.type.getConstructor().newInstance();
            newInstance.setName(newVar.name);
            if (!currentContext.variables.map.containsKey(newVar.name))
            {
              currentContext.variables.add(newInstance);
              updateContextListView();
            }
            else
            {
              WindowManager.showAlert("Variable Name Conflict", "A variable named " + newVar.name + " already exists");
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

  @SuppressWarnings("unlikely-arg-type")
  public MenuItem newDeleteVariableMenuItem()
  {
    MenuItem deleteVariableMenuItem = new MenuItem("Delete Variable");
    deleteVariableMenuItem.setOnAction(e ->
    {
      Named selectedItem = contextListView.getSelectionModel().getSelectedItem();
      if (selectedItem != null)
      {
        Context currentContext = getCurrentContext();
        if (currentContext != null)
        {
          currentContext.variables.remove(selectedItem.getName());
          contextListView.getItems().remove(selectedItem);
        }
      }
    });
    return deleteVariableMenuItem;
  }

  private void executeTabAction(Consumer<ExpressionTreeView<D, C, F>> action)
  {
    var expressionTab = getCurrentExpressionTree();
    action.accept(expressionTab);
  }

  @SuppressWarnings("unchecked")
  public ExpressionTreeView<D, C, F> getCurrentExpressionTree()
  {
    Tab currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab == null)
    {
      addNewExpressionTab();
    }
    var content       = currentTab.getContent();
    var expressionTab = (ExpressionTreeView<D, C, F>) content;
    return expressionTab;
  }

  @SuppressWarnings("unchecked")
  public Context getCurrentContext()
  {
    if (tabPane == null)
    {
      return null;
    }
    Tab currentTab = tabPane.getSelectionModel().getSelectedItem();
    if (currentTab != null)
    {
      var content       = currentTab.getContent();
      var expressionTab = (ExpressionTreeView<D, C, F>) content;
      return expressionTab.context;
    }
    return null;
  }

  private HBox newButtonBox()
  {
    Button addTabButton = new Button("New");
    addTabButton.setOnAction(e -> addNewExpressionTab());

    Button compileButton = new Button("Compile");
    compileButton.setOnAction(e -> executeTabAction(ExpressionTreeView::compileExpression));

    Button expandAllButton = new Button("Expand All");
    expandAllButton.setOnAction(e -> executeTabAction(ExpressionTreeView::expandAllNodes));

    Button evaluateButton = new Button("Evaluate");
    evaluateButton.setOnAction(e -> evaluate());

    Button toggleContextButton = new Button("Toggle Context");
    toggleContextButton.setOnAction(e -> toggleContextView());

    Button saveButton = new Button("Save");
    saveButton.setOnAction(e -> executeTabAction(ExpressionTreeView::save));

    Button loadButton = new Button("Load");
    loadButton.setOnAction(e ->
    {
      FileChooser fileChooser = new FileChooser();
      fileChooser.getExtensionFilters()
                 .add(new ExtensionFilter("Expressions serialized in YAML Format",
                                          List.of("*.yaml")));
      File file = fileChooser.showOpenDialog(null);
      if (file != null)
      {
        addNewExpressionTab();

        getCurrentExpressionTree().load(file);
      }
    });

    Button graphButton = new Button("Graph");
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

  public void evaluate()
  {
    executeTabAction(ExpressionTreeView::evaluateExpression);
  }

  @Override
  public void start(Stage primaryStage)
  {
    setStageIcon(primaryStage);

    primaryStage.setWidth(2000);
    primaryStage.setHeight(950);

    Scene scene = new Scene(createMainLayout());

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
        Alert alert = new Alert(AlertType.CONFIRMATION);
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

    addNewExpressionTab();

  }

  boolean shouldConfirmClose()
  {
    return false;
  }

  public void setStageIcon(Stage primaryStage)
  {
    WindowManager.setStageIcon(primaryStage, "ExpressionAnalyzer.png");
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
      contextListView.setItems(getCurrentContext().variables);
      splitPane.getItems().add(0, contextBox);
      splitPane.setDividerPositions(lastDividerPositions == null ? new double[]
      { 0.19 } : lastDividerPositions);

    }
    contextViewVisible = !contextViewVisible;
  }

}