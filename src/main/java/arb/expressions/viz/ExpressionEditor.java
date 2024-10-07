package arb.expressions.viz;

import java.io.Closeable;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("unchecked")
public class ExpressionEditor<D, C extends Closeable, F extends Function<D, C>> extends
                             VBox
{

  // Updated ComboBox declarations to be type-safe
  private ComboBox<Class<? extends D>> domainTypeBox;
  private ComboBox<Class<? extends C>> codomainTypeBox;
  private ComboBox<Class<? extends F>> functionTypeBox;
  private TextField                    expressionInput;
  private Button                       compileButton;
  private String                       compiledResult;
  private Expression<D, C, F>          expression;
  private F                            instance;
  private C                            result;

  public ExpressionEditor()
  {
    setupUI();
  }

  private void setupUI()
  {
    // Correcting the ComboBox declarations to use the proper types
    domainTypeBox   = new ComboBox<>();
    codomainTypeBox = new ComboBox<>();
    functionTypeBox = new ComboBox<>();

    expressionInput = new TextField();
    expressionInput.setPromptText("Enter an expression, e.g., 'sin(x)'");

    compileButton = new Button("Compile");
    compileButton.setOnAction(e -> compileExpression());

    HBox typeBoxes = createTypeBoxes(); // Referenced correctly here
    this.getChildren()
        .addAll(typeBoxes, // Added this to the layout
                new Label("Expression Input:"),
                expressionInput,
                compileButton);
  }

  private HBox createTypeBoxes()
  {
    HBox box = new HBox(10,
                        new Label("Domain:"),
                        domainTypeBox,
                        new Label("Codomain:"),
                        codomainTypeBox,
                        new Label("Function Type:"),
                        functionTypeBox);
    return box;
  }

  @SafeVarargs
  public final void setDomainTypes(Class<? extends D>... types)
  {
    domainTypeBox.getItems().addAll(types);
  }

  @SafeVarargs
  public final  void setCodomainTypes(Class<? extends C>... types)
  {
    codomainTypeBox.getItems().addAll(types);
  }

  @SafeVarargs
  public final void setFunctionTypes(Class<? extends F>... functionTypes)
  {
    functionTypeBox.getItems().addAll(functionTypes);
  }

  public void setExpression(String expression)
  {
    expressionInput.setText(expression);
  }

  public String getExpression()
  {
    return expressionInput.getText();
  }

  /**
   * Compiles the expression and instantiates the function.
   * @return 
   */
  Expression<D, C, F> compileExpression()
  {
    String expressionStr = getExpression();
    if (expressionStr == null || expressionStr.isEmpty())
    {
      showAlert("Error", "No expression to compile.");
      return null;
    }

    try
    {
      // Fetch the selected types from the type-safe ComboBoxes
      Class<? extends D> domainType   = domainTypeBox.getValue();
      Class<? extends C> codomainType = codomainTypeBox.getValue();
      Class<? extends F> functionType = functionTypeBox.getValue();

      // Pass the necessary parameters to the compile method
      expression     = Function.compile(domainType, codomainType, functionType, expressionStr, new Context());

      // Instantiate the compiled function
      instance       = expression.instantiate();

      // Evaluate using the specified precision and a default Real input
      result         = instance.evaluate((D) new Real(128), 128);

      compiledResult = result.toString();
      showAlert("Success", "Compiled and evaluated successfully: " + compiledResult);

    }
    catch (CompilerException e)
    {
      showAlert("Compile Error", "Failed to compile the expression: " + e.getMessage());
    }
    catch (Exception e)
    {
      showAlert("Evaluation Error", "Failed to evaluate the expression: " + e.getMessage());
    }
    
    return expression;
  }

  private void showAlert(String title, String message)
  {
    Alert alert = new Alert(Alert.AlertType.INFORMATION);
    alert.setTitle(title);
    alert.setContentText(message);
    alert.showAndWait();
  }

  public String getCompiledResult()
  {
    return compiledResult;
  }
}
