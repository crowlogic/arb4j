package arb.expressions.viz;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class GaussianProcessModeller extends
                                     Application
{

  private ComboBox<String>                           kernelComboBox;
  private ComboBox<String>                           spectralDensityComboBox;
  private Button                                     compileButton;

  private ExpressionEditor<Real, Real, RealFunction> kernelEditor;
  private ExpressionEditor<Real, Real, RealFunction> spectralDensityEditor;

  @Override
  public void start(Stage primaryStage)
  {
    VBox layout = new VBox(10);

    // Create the kernel selection
    layout.getChildren().add(new Label("Kernel Selection:"));
    layout.getChildren().addAll(createKernelControls());

    // Create the spectral density selection
    layout.getChildren().add(new Label("Spectral Density Selection:"));
    layout.getChildren().addAll(createSpectralDensityControls());

    // Compile button
    compileButton = new Button("Compile Function");
    compileButton.setOnAction(e -> compileFunction());

    layout.getChildren().add(compileButton);

    Scene scene = new Scene(layout,
                            600,
                            400);
    primaryStage.setTitle("Gaussian Process Modeller");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  private VBox createKernelControls()
  {
    VBox box = new VBox(5);
    kernelComboBox = new ComboBox<>();
    kernelComboBox.getItems().addAll("Gaussian", "Matern", "Ornstein-Uhlenbeck", "Custom...");

    // ExpressionEditor for custom kernel input
    kernelEditor = new ExpressionEditor<>();
    kernelEditor.setDomainTypes(Real.class);
    kernelEditor.setCodomainTypes(Real.class);
    kernelEditor.setFunctionTypes(RealFunction.class);

    kernelComboBox.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) ->
    {
      if ("Custom...".equals(newVal))
      {
        kernelEditor.setVisible(true);
      }
      else
      {
        kernelEditor.setVisible(false);
        // Set predefined kernel expression based on the selection
        kernelEditor.setExpression(getPredefinedKernelExpression(newVal));
        // Update spectral density based on kernel selection
        updateSpectralDensityFromKernel(newVal);
      }
    });

    kernelEditor.setVisible(false); // Initially hidden

    box.getChildren().addAll(kernelComboBox, kernelEditor);
    return box;
  }

  private VBox createSpectralDensityControls()
  {
    VBox box = new VBox(5);
    spectralDensityComboBox = new ComboBox<>();
    spectralDensityComboBox.getItems().addAll("0.1 * exp(-0.5 * x^2)", "0.5 * exp(-0.1 * x^2)", "Custom...");

    // ExpressionEditor for custom spectral density input
    spectralDensityEditor = new ExpressionEditor<>();
    spectralDensityEditor.setDomainTypes(Real.class);
    spectralDensityEditor.setCodomainTypes(Real.class);
    spectralDensityEditor.setFunctionTypes(RealFunction.class);

    spectralDensityComboBox.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) ->
    {
      if ("Custom...".equals(newVal))
      {
        spectralDensityEditor.setVisible(true);
      }
      else
      {
        spectralDensityEditor.setVisible(false);
        // Set predefined spectral density expression based on selection
        spectralDensityEditor.setExpression(getPredefinedSpectralDensityExpression(newVal));
        // Update kernel based on spectral density selection
        updateKernelFromSpectralDensity(newVal);
      }
    });

    spectralDensityEditor.setVisible(false); // Initially hidden

    box.getChildren().addAll(spectralDensityComboBox, spectralDensityEditor);
    return box;
  }

  private void compileFunction()
  {
    try
    {
      // Compile kernel expression
      Expression<Real, Real, RealFunction> kernelExpression          = kernelEditor.compileExpression();
      // Compile spectral density expression
      Expression<Real, Real, RealFunction> spectralDensityExpression = spectralDensityEditor.compileExpression();

      System.out.println("Kernel Expression compiled: " + kernelExpression);
      System.out.println("Spectral Density Expression compiled: " + spectralDensityExpression);

      // Here, you would pass these expressions into your Gaussian process modeller
      // logic
    }
    catch (Exception e)
    {
      System.err.println("Error during compilation: " + e.getMessage());
      e.printStackTrace();
    }
  }

  private String getPredefinedKernelExpression(String kernelType)
  {
    switch (kernelType)
    {
    case "Gaussian":
      return "exp(-0.5 * x^2)";
    case "Matern":
      return "exp(-0.1 * x^2)";
    case "Ornstein-Uhlenbeck":
      return "OU kernel function expression"; // Placeholder
    default:
      return "";
    }
  }

  private String getPredefinedSpectralDensityExpression(String densityType)
  {
    switch (densityType)
    {
    case "0.1 * exp(-0.5 * x^2)":
      return "0.1 * exp(-0.5 * x^2)";
    case "0.5 * exp(-0.1 * x^2)":
      return "0.5 * exp(-0.1 * x^2)";
    default:
      return "";
    }
  }

  private void updateSpectralDensityFromKernel(String kernelType)
  {
    switch (kernelType)
    {
    case "Gaussian":
      spectralDensityComboBox.setValue("0.1 * exp(-0.5 * x^2)");
      break;
    case "Matern":
      spectralDensityComboBox.setValue("0.5 * exp(-0.1 * x^2)");
      break;
    case "Ornstein-Uhlenbeck":
      spectralDensityComboBox.setValue("Custom...");
      spectralDensityEditor.setExpression("OU spectral density function"); // Placeholder
      spectralDensityEditor.setVisible(true);
      break;
    default:
      spectralDensityComboBox.setValue("Custom...");
      spectralDensityEditor.setExpression("");
      spectralDensityEditor.setVisible(false);
      break;
    }
  }

  private void updateKernelFromSpectralDensity(String spectralType)
  {
    switch (spectralType)
    {
    case "0.1 * exp(-0.5 * x^2)":
      kernelComboBox.setValue("Gaussian");
      break;
    case "0.5 * exp(-0.1 * x^2)":
      kernelComboBox.setValue("Matern");
      break;
    default:
      kernelComboBox.setValue("Custom...");
      kernelEditor.setExpression(spectralType);
      kernelEditor.setVisible(true);
      break;
    }
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
