package arb.viz;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.application.Application;
import javafx.beans.binding.Bindings;
import javafx.beans.property.DoubleProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DynamicFontSizeExampleApplication
                                               extends
                                               Application
{
  private DoubleProperty fontSize = new SimpleDoubleProperty(12); // Initial font size

  @Override
  public void start(Stage primaryStage)
  {
    var       root         = new VBox(10);
    TextField textField    = createBoundTextField();
    TextArea  textArea     = createBoundTextArea();

    var       buttonBox    = new HBox(5);

    // Zoom controls
    Button    zoomInButton = new Button("+");
    zoomInButton.setOnAction(e -> fontSize.set(fontSize.get() + 1));

    Button zoomOutButton = new Button("-");
    zoomOutButton.setOnAction(e -> fontSize.set(fontSize.get() - 1));

    buttonBox.getChildren().addAll(zoomInButton, zoomOutButton);

    root.getChildren().addAll(textField, textArea, buttonBox);

    Scene scene = new Scene(root,
                            300,
                            200);
    primaryStage.setTitle("Dynamic Font Size Example");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  private TextField createBoundTextField()
  {
    TextField textField = new TextField("Type here...");
    textField.styleProperty().bind(Bindings.concat("-fx-font-size: ", fontSize.asString(), "px;"));
    return textField;
  }

  private TextArea createBoundTextArea()
  {
    TextArea textArea = new TextArea("Results display here...");
    textArea.styleProperty().bind(Bindings.concat("-fx-font-size: ", fontSize.asString(), "px;"));
    return textArea;
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
