package arb.stochastic;

import java.lang.reflect.Method;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.viz.WindowManager;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

/**
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class GaussianProcessModeller extends
                                     Application
{
  boolean hasUnsavedChanges = false;
  
  @Override
  public void start(Stage primaryStage) throws Exception
  {
    FXMLLoader loader = new FXMLLoader(getClass().getResource("/GaussianProcessModeller.fxml"));
    Parent     root   = loader.load();
    Scene      scene  = new Scene(root);
    primaryStage.setTitle("Gaussian Process Modeller");
    primaryStage.setScene(scene);

    ComboBox<String> kernelComboBox          = (ComboBox<String>) loader.getNamespace().get("kernelComboBox");
    ComboBox<String> spectralDensityComboBox = (ComboBox<String>) loader.getNamespace().get("spectralDensityComboBox");
    Button           compileButton           = (Button) loader.getNamespace().get("compileButton");

    kernelComboBox.getItems().addAll("Random Wave", "Gaussian", "Matern", "Ornstein-Uhlenbeck", "Custom...");
    spectralDensityComboBox.getItems().addAll("0.1 * exp(-0.5 * x^2)", "0.5 * exp(-0.1 * x^2)", "Custom...");

    setupComboBox(kernelComboBox);
    setupComboBox(spectralDensityComboBox);
    WindowManager.setMoreConduciveStyle(scene);
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
      if (hasUnsavedChanges)
      {
        Alert alert = new Alert(AlertType.CONFIRMATION);
        alert.setTitle("Confirm Close");
        alert.setHeaderText("There are unsaved changes. Are you sure you want to close the program?");
        alert.showAndWait().filter(r -> r != ButtonType.OK).ifPresent(r -> evt.consume());
      }
    });

    scene.setOnKeyPressed(handler ->
    {
      if (handler.getCode() == KeyCode.F11)
      {
        primaryStage.setFullScreen(!primaryStage.isFullScreen());
      }
    });
    compileButton.setOnAction(e -> compileFunction(kernelComboBox, spectralDensityComboBox));

    WindowManager.setStageIcon(primaryStage, "GaussianProcessModeller.png");

    primaryStage.show();
  }

  private void setupComboBox(ComboBox<String> comboBox)
  {
    comboBox.valueProperty().addListener((obs, oldValue, newValue) ->
    {
      if ("Custom...".equals(newValue))
      {
        setComboBoxEditableWithFocus(comboBox);
      }
      else
      {
        comboBox.setEditable(false);
      }
    });

    comboBox.getEditor().setOnKeyPressed(event ->
    {
      if (event.getCode() == KeyCode.ENTER)
      {
        String text = comboBox.getEditor().getText();
        if (!text.isEmpty() && !"Custom...".equals(text))
        {
          if (!comboBox.getItems().contains(text))
          {
            comboBox.getItems().add(text);
          }
          comboBox.getSelectionModel().select(text);
        }
      }
    });
  }

  private void setComboBoxEditableWithFocus(ComboBox<String> comboBox)
  {
    Platform.runLater(() ->
    {
      comboBox.setEditable(true);
      TextField editor = comboBox.getEditor();
      WindowManager.addEmacsKeybindings(editor);
      try
      {
        Method setFakeFocus = editor.getClass().getMethod("setFakeFocus", boolean.class);
        setFakeFocus.invoke(editor, true);
      }
      catch (Exception e)
      {
        e.printStackTrace();
        editor.requestFocus();
      }
    });
  }

  private void compileFunction(ComboBox<String> kernelComboBox, ComboBox<String> spectralDensityComboBox)
  {
    System.out.println("Kernel: " + kernelComboBox.getValue());
    System.out.println("Spectral Density: " + spectralDensityComboBox.getValue());
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
